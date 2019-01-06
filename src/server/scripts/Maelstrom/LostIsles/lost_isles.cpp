/*
 * Copyright (C) 2018 Hiriko-PPA.
 * Copyright (C) 2011 - 2012 ArkCORE <http://www.arkania.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */


#include "CellImpl.h"
#include "Creature.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Item.h"
#include "PhasingHandler.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"
#include "SpellAuraEffects.h"
#include "SpellAuras.h"
#include "SpellMgr.h"
#include "SpellScript.h"
#include "Vehicle.h"
#include "WorldSession.h"

enum DontGoIntoTheLight
{
    NPC_GIZMO                           = 36600,
    SPELL_DEAD_STILL                    = 69010,

    SPELL_DGITL_QUEST_COMPLETE          = 69013,
    SPELL_DGITL_SUMMON_DOC_ZAPNOZZLE    = 69018,
    SPELL_DGITL_JUMP_CABLES             = 69022,
    SPELL_DGITL_DESPAWN_DOC_ZAPNOZZLE   = 69043,
};

// 69010
class spell_lost_isles_near_death : public SpellScript
{
    PrepareSpellScript(spell_lost_isles_near_death);

    void HandleHit(SpellEffIndex /*effIndex*/)
    {
        GetCaster()->CastSpell(nullptr, SPELL_DGITL_SUMMON_DOC_ZAPNOZZLE, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_lost_isles_near_death::HandleHit, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
    }
};

// 36608
struct npc_zapnozzle : public ScriptedAI
{
    npc_zapnozzle(Creature* creature) : ScriptedAI(creature) { }

    Position const beachPosition = { 617.317383f, 3142.259277f, -0.114589f, 2.176555f };

    void Reset() override
    {
        me->SetFlying(true);
        me->SetSwim(true);
        me->GetMotionMaster()->MovePoint(1, 538.785034f, 3271.091797f, -1.082726f);
        me->RemoveFlag64(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    void IsSummonedBy(Unit* summoner) override
    {
        _playerGuid = summoner->GetGUID();
    }

    void MovementInform(uint32 /*type*/, uint32 id) override
    {
        switch (id)
        {
            case 1:
                me->SetFlying(false);
                me->SetSwim(false);
                me->GetMotionMaster()->MoveJump(537.296875f, 3272.306396f, 0.166942f, 3.011669f, 10.f, 10.f, 2);
                break;
            case 2:
                Talk(0, GetSummoner());
                InitFirstEventSchedulers();
                break;
            case 3:
                me->SetFlying(true);
                me->SetSwim(true);
                Talk(6, GetSummoner());
                me->GetMotionMaster()->MovePoint(4, beachPosition);
                me->DespawnOrUnsummon(5000);
                break;
            default:
                break;
        }
    }

    void InitFirstEventSchedulers()
    {
        me->GetScheduler().
            Schedule(5s, [this](TaskContext /*context*/)
            {
                Talk(1, GetSummoner());
            }).
            Schedule(9s, [this](TaskContext /*context*/)
            {
                if (Creature* gizmo = GetGizmo())
                    gizmo->AI()->Talk(0, GetSummoner());
            }).
            Schedule(15s, [this](TaskContext /*context*/)
            {
                Talk(2, GetSummoner());
            }).
            Schedule(21s, [this](TaskContext /*context*/)
            {
                me->CastSpell(GetSummoner(), SPELL_DGITL_JUMP_CABLES, false);
            }).
            Schedule(27s, [this](TaskContext /*context*/)
            {
                Talk(3, GetSummoner());
            }).
            Schedule(31s, [this](TaskContext /*context*/)
            {
                me->CastSpell(GetSummoner(), SPELL_DGITL_JUMP_CABLES, false);
            }).
            Schedule(37s, [this](TaskContext /*context*/)
            {
                Talk(4, GetSummoner());
                me->SetFlag64(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            });
    }

    void sQuestReward(Player* /*player*/, Quest const* quest, uint32 /*opt*/) override
    {
        if (quest->GetQuestId() == 14239)
            InitSecondEventSchedulers();
    }

    void InitSecondEventSchedulers()
    {
        me->GetScheduler().
            Schedule(1s, [this](TaskContext /*context*/)
            {
                Talk(5, GetSummoner());
            }).
            Schedule(4s, [this](TaskContext /*context*/)
            {
                me->GetMotionMaster()->MoveJump(539.637451f, 3266.728516f, -1.139869f, 5.053704f, 10.f, 10.f, 3);
            });
    }

private :
    ObjectGuid _playerGuid;

    Player* GetSummoner()
    {
        return ObjectAccessor::GetPlayer(*me, _playerGuid);
    }

    Creature* GetGizmo()
    {
        return me->FindNearestCreature(NPC_GIZMO, 10.f);
    }
};

enum GoblinEscapePod
{
    SPELL_SUMMON_LIVE_GOBLIN_SURVIVOR   = 66137,
    SPELL_TRADE_PRINCE_CONTROLLER_AURA  = 67433,
    SPELL_SUMMON_TRADE_PRINCE           = 67845,

    NCP_TRADE_PRINCE_GALLYWIX           = 35649
};

// 195188
class gob_goblin_escape_pod : public GameObjectAI
{
public:
    gob_goblin_escape_pod(GameObject* go) : GameObjectAI(go) { }

    void OnStateChanged(uint32 state, Unit* unit) override
    {
        if (unit && state == GO_ACTIVATED)
        {
            if (Player* player = unit->ToPlayer())
            {
                if (!player->HasAura(SPELL_TRADE_PRINCE_CONTROLLER_AURA))
                {
                    player->CastSpell(nullptr, SPELL_SUMMON_TRADE_PRINCE, true);
                    player->CastSpell(nullptr, SPELL_TRADE_PRINCE_CONTROLLER_AURA, true);
                }
                else
                {
                    player->CastSpell(nullptr, SPELL_SUMMON_LIVE_GOBLIN_SURVIVOR, true);
                }

                player->KilledMonsterCredit(34748);
                go->DestroyForPlayer(player);
            }
        }
    }
};

// 34748
// 35649
struct npc_goblin_espace_pod : public ScriptedAI
{
    npc_goblin_espace_pod(Creature* creature) : ScriptedAI(creature) {}

    Position const beachPosition = { 617.317383f, 3142.259277f, -0.114589f, 2.176555f };

    void Reset() override
    {
        me->SetFlying(true);
        me->SetSwim(true);

        me->GetScheduler().Schedule(1s, [this](TaskContext /*context*/)
        {
            Player* nearestPlayer = me->SelectNearestPlayer(20.f);

            if (me->GetEntry() == NCP_TRADE_PRINCE_GALLYWIX)
                Talk(0, nearestPlayer);
            else
                Talk(urand(0, 3), nearestPlayer);

        }).Schedule(2s, [this](TaskContext /*context*/)
        {
            me->GetMotionMaster()->MovePoint(1, beachPosition);
            me->DespawnOrUnsummon(3000);
        });
    }
};

enum BombMonkey
{
    SPELL_MONKEY_COSMETIC_THROW_BOMB= 66142,
    SPELL_NITRO_POTASSIUM_BANANAS   = 67917,
    SPELL_EXPLOSIVE_BANANA          = 67919,

    NPC_MONKEY_KILL_CREDIT          = 35760
};

// 34699
struct npc_bomb_monkey : public ScriptedAI
{
    npc_bomb_monkey(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->GetScheduler().Schedule(5s, 30s, [](TaskContext context)
        {
            GetContextUnit()->CastSpell(nullptr, SPELL_MONKEY_COSMETIC_THROW_BOMB, false);
            context.Repeat(5s, 30s);
        });
    }

    void SpellHit(Unit* caster, const SpellInfo* spell) override
    {
        if (Player* player = caster->ToPlayer())
        {
            if (spell->Id == SPELL_NITRO_POTASSIUM_BANANAS)
            {
                if (me->IsNonMeleeSpellCast(true))
                    me->InterruptNonMeleeSpells(true);

                player->KilledMonsterCredit(NPC_MONKEY_KILL_CREDIT);
                me->CastSpell(me, SPELL_EXPLOSIVE_BANANA, true);
                me->DespawnOrUnsummon(3000);
            }
        }
    }
};

enum MinerTroublesQuest
{
    QUEST_MINER_TROUBLES                = 14021,
    
    SPELL_MINER_TROUBLESQUEST_ACCEPT    = 68061,
    SPELL_MINER_TROUBLESQUEST_COMPLETE  = 68063,
    SPELL_SUMMON_ORE_CART               = 68064,
    SPELL_MINER_TROUBLES_CHAINS         = 68122,

    NPC_FRIGHTENED_MINER                = 35813,
    NPC_ORE_CART                        = 35814,
};

enum CapturingTheUnknown
{
    QUEST_CAPTURING_THE_UNKNOWN         = 14031,
    SPELL_CTU_FLASH                     = 68281,
    SPELL_CTU_BIND_SIGHT                = 70641,
    SPELL_CTU_SCREEN_EFFECT             = 70649,

    SPELL_CTU_SEE_INVIS_1               = 70661,
    SPELL_CTU_SEE_INVIS_2               = 70678,
    SPELL_CTU_SEE_INVIS_3               = 70680,
    SPELL_CTU_SEE_INVIS_4               = 70681,
    
    NPC_CTU_BUNNY_1                     = 37872,
    NPC_CTU_BUNNY_2                     = 37895,
    NPC_CTU_BUNNY_3                     = 37896,
    NPC_CTU_BUNNY_4                     = 37897,
};


// 35813
struct npc_frightened_miner_escort : public npc_escortAI
{
    npc_frightened_miner_escort(Creature* creature) : npc_escortAI(creature) {}

    void AttackStart(Unit* /*who*/) override {}
    void EnterCombat(Unit* /*who*/) override {}
    void EnterEvadeMode(EvadeReason /*why*/) override {}
    void JustDied(Unit* /*killer*/) override {}
    void OnCharmed(bool /*apply*/) override {}

    void WaypointReached(uint32 pointId) override
    {
        switch(pointId)
        {
            case 3:
                TalkToEscortPlayer(1);
                break;
            case 4:
            case 7:
            case 10:
            case 12:
                me->HandleEmoteCommand(467);
                break;
            default:
                break;
        }
    }

    void WaypointStart(uint32 pointId) override
    {
        me->HandleEmoteCommand(0);

        switch(pointId)
        {
            case 0:
                TalkToEscortPlayer(0);
                break;
            case 4:
                TalkToEscortPlayer(2);
                break;
            case 8:
                TalkToEscortPlayer(3);
                break;
            case 10:
                TalkToEscortPlayer(4);
                break;
            case 13:
                SetRun(true);
                TalkToEscortPlayer(5);
                if (Player *player = GetPlayerForEscort())
                    player->KilledMonsterCredit(35816);

                if (Creature* oreCart = me->GetSummonedCreatureByEntry(NPC_ORE_CART))
                    oreCart->DespawnOrUnsummon();
                break;
            default:
                break;
        }
    }
};

std::map<uint32, uint32> const ctuSpellByBunny
{
    { NPC_CTU_BUNNY_1,  SPELL_CTU_SEE_INVIS_1 },
    { NPC_CTU_BUNNY_2,  SPELL_CTU_SEE_INVIS_2 },
    { NPC_CTU_BUNNY_3,  SPELL_CTU_SEE_INVIS_3 },
    { NPC_CTU_BUNNY_4,  SPELL_CTU_SEE_INVIS_4 },
};

// 68280
class spell_ctu_snapflash : public SpellScript
{
    PrepareSpellScript(spell_ctu_snapflash);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* unit = GetHitUnit())
        {
            if (Player* casterPlayer = GetCaster()->ToPlayer())
            {
                casterPlayer->RemoveAurasDueToSpell(ctuSpellByBunny.at(unit->GetEntry()));

                casterPlayer->CastSpell(nullptr, SPELL_CTU_BIND_SIGHT, true);
                casterPlayer->CastSpell(nullptr, SPELL_CTU_SCREEN_EFFECT, true);

                casterPlayer->GetScheduler().Schedule(3s, [unit](TaskContext context)
                {
                    GetContextPlayer()->RemoveAurasDueToSpell(SPELL_CTU_SCREEN_EFFECT);
                    GetContextPlayer()->KilledMonsterCredit(unit->GetEntry(), unit->GetGUID());
                });
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_ctu_snapflash::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 70641
class spell_ctu_bind_sight : public SpellScript
{
    PrepareSpellScript(spell_ctu_bind_sight);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* unit = GetHitUnit())
            unit->CastSpell(unit, SPELL_CTU_FLASH, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_ctu_bind_sight::HandleDummy, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
    }
};

enum LostIslesWeed
{
    QUEST_WEED_WHAKER       = 14236,
    SPELL_WEED_WHACKER_AURA = 68212
};


class spell_weed_whacker : public SpellScript
{
    PrepareSpellScript(spell_weed_whacker);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (GetCastItem())
        {
            if (Unit* caster = GetCastItem()->GetOwner())
            {
                if (Player* player = caster->ToPlayer())
                {
                    if (player->HasAura(SPELL_WEED_WHACKER_AURA))
                        player->RemoveAura(SPELL_WEED_WHACKER_AURA);
                    else if (player->GetQuestStatus(QUEST_WEED_WHAKER) == QUEST_STATUS_INCOMPLETE)
                        player->CastSpell(player, SPELL_WEED_WHACKER_AURA, true);
                }
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_weed_whacker::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

enum Infrared
{
    QUEST_INFRARED_INFRADEAD        = 14238,
    QUEST_TO_THE_CLIFFS             = 14240,

    NPC_ORC_SCOUT                   = 36100,
    NPC_CLIFF_BASTIA                = 36585,

    SPELL_INFRARED_QUEST_ACCEPT     = 68344,
    SPELL_INFRARED_ORC_SCOUT_AURA   = 68338,
    SPELL_CLIFF_SUMMON_BASTIA       = 68973,
};

// 35917
struct npc_killag_sangrecroc : public ScriptedAI
{
    npc_killag_sangrecroc(Creature* creature) : ScriptedAI(creature) {}

    void sQuestAccept(Player* player, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_INFRARED_INFRADEAD)
        {
            Talk(0, player);
            me->CastSpell(player, SPELL_INFRARED_QUEST_ACCEPT, true);
        }

        if (quest->GetQuestId() == QUEST_TO_THE_CLIFFS)
        {
            player->CastSpell(player, SPELL_CLIFF_SUMMON_BASTIA, true);

            if (Creature* bastia = player->GetSummonedCreatureByEntry(NPC_CLIFF_BASTIA))
            {
                Talk(1, player);
                CAST_AI(npc_escortAI, bastia->AI())->Start(false, true, player->GetGUID(), quest);
            }
        }
    }

    void sQuestReward(Player* player, const Quest* quest, uint32 ) override
    {
        if (quest->GetQuestId() == QUEST_INFRARED_INFRADEAD)
            player->RemoveAurasDueToSpell(SPELL_INFRARED_ORC_SCOUT_AURA);
    }
};

// 68338
class aura_infrared_orc_scout : public AuraScript
{
    PrepareAuraScript(aura_infrared_orc_scout);

    void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Creature* orcScout = GetTarget()->GetSummonedCreatureByEntry(NPC_ORC_SCOUT))
            orcScout->DespawnOrUnsummon();
    }

    void Register() override
    {
        AfterEffectRemove += AuraEffectRemoveFn(aura_infrared_orc_scout::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};

// 36578
struct npc_cliff_bastia : public npc_escortAI
{
    npc_cliff_bastia(Creature* creature) : npc_escortAI(creature) {}

    void AttackStart(Unit* /*who*/) override {}
    void EnterCombat(Unit* /*who*/) override {}
    void EnterEvadeMode(EvadeReason /*why*/) override {}
    void OnCharmed(bool /*apply*/) override {}

    void Reset() override
    {
        me->SetSpeedRate(MOVE_RUN, 14.f);
    }

    void WaypointReached(uint32 pointId) override
    {
        if (pointId == 20)
            me->DespawnOrUnsummon();
    }
};

enum PreciousCargo
{
    QUEST_PRECIOUS_CARO                 = 14242,
    QUEST_MEET_ME_UP_TOP                = 14326,

    SPELL_PRECIOUS_CARGO_QUEST_ACCEPT   = 68386,
    SPELL_PRECIOUS_CARGO_KILL_CREDIT    = 69081,

    NPC_GYROCOPTER                      = 36143,

    GOB_ARCANE_CAGE                     = 195704,
};

// 36127
struct npc_gyrocopterequest_giver : public ScriptedAI
{
    npc_gyrocopterequest_giver(Creature* creature) : ScriptedAI(creature) {}

    void sQuestAccept(Player* player, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_PRECIOUS_CARO)
        {
            player->CastSpell(player, SPELL_PRECIOUS_CARGO_QUEST_ACCEPT, true);

            if (Creature* gyrocopter = player->GetSummonedCreatureByEntry(NPC_GYROCOPTER))
                CAST_AI(npc_escortAI, gyrocopter->AI())->Start(false, true, player->GetGUID(), quest);
        }
    }
};

// 36143
struct npc_precious_cargo_gyrocopter : public npc_escortAI
{
    npc_precious_cargo_gyrocopter(Creature* creature) : npc_escortAI(creature) {}

    void AttackStart(Unit* /*who*/) override {}
    void EnterCombat(Unit* /*who*/) override {}
    void EnterEvadeMode(EvadeReason /*why*/) override {}
    void OnCharmed(bool /*apply*/) override {}

    void Reset() override
    {
        me->SetCanFly(true);
        me->SetSpeedRate(MOVE_FLIGHT, 21.0f);
    }

    void WaypointReached(uint32 pointId) override
    {
        if (pointId == 2)
        {
            if (Player* player = GetPlayerForEscort())
                me->CastSpell(player, SPELL_PRECIOUS_CARGO_KILL_CREDIT, true);

            me->DespawnOrUnsummon();
        }
    }
};

// 36145
struct npc_lost_isles_thrall_prisonner : public ScriptedAI
{
    npc_lost_isles_thrall_prisonner(Creature* creature) : ScriptedAI(creature) {}

    void MoveInLineOfSight(Unit* who) override
    {
        if (Player* player = who->ToPlayer())
            if (player->GetQuestStatus(QUEST_PRECIOUS_CARO) == QUEST_STATUS_INCOMPLETE)
                if (player->GetDistance(me) < 5.f)
                    player->KilledMonsterCredit(me->GetEntry());
    }

    void sQuestAccept(Player* player, const Quest* /*quest*/) override
    {
        Talk(0, player);
    }
};

enum WarchiefsRevenge
{
    QUEST_WARCHIEF_REVENGE  = 14243,

    SPELL_WR_QUEST_ACCEPT   = 68408,

    NPC_WR_CYCLONE          = 36178,
};

// 36127
struct npc_lost_isles_thrall_top_boat : public ScriptedAI
{
    npc_lost_isles_thrall_top_boat(Creature* creature) : ScriptedAI(creature) {}

    void sQuestAccept(Player* player, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_WARCHIEF_REVENGE)
        {
            player->CastSpell(player, SPELL_WR_QUEST_ACCEPT, true);

            if (Creature* cyclone = player->GetSummonedCreatureByEntry(NPC_WR_CYCLONE))
                cyclone->AI()->DoAction(0);
        }
    }
};

// 36178
struct npc_warchief_revenge_cyclone : public npc_escortAI
{
    npc_warchief_revenge_cyclone(Creature* creature) : npc_escortAI(creature) {}

    void AttackStart(Unit* /*who*/) override {}
    void EnterCombat(Unit* /*who*/) override {}
    void EnterEvadeMode(EvadeReason /*why*/) override {}
    void OnCharmed(bool /*apply*/) override {}

    void Reset() override
    {
        me->SetCanFly(true);
        me->SetSpeedRate(MOVE_FLIGHT, 7.0f);
    }

    void DoAction(int32 /*action*/) override
    {
        me->GetMotionMaster()->MovePoint(1001, 1001.373047f, 3832.485840f, 14.062465f);

        me->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            if (Vehicle* vehicle = me->GetVehicleKit())
            {
                if (Unit* passenger = vehicle->GetPassenger(0))
                {
                    if (Player* player = passenger->ToPlayer())
                    {
                        if (player->GetQuestStatus(QUEST_WARCHIEF_REVENGE) == QUEST_STATUS_COMPLETE)
                        {
                            SetEscortPaused(true);
                            me->SetSpeedRate(MOVE_FLIGHT, 35.0f);
                            me->GetMotionMaster()->MovePoint(1003, 863.672180f, 2778.023193f, 126.243454f, false);
                        }
                        else
                            context.Repeat();
                    }
                }
            }
        });
    }

    void MovementInform(uint32 /*type*/, uint32 id) override
    {
        switch (id)
        {
            case 1001:
                Start(false, true, ObjectGuid::Empty, nullptr, false, true);
                break;
            case 1002:
                me->GetMotionMaster()->MovePoint(1003, 863.672180f, 2778.023193f, 126.243454f, false);
                break;
            case 1003:
                me->DespawnOrUnsummon();
                break;
            default:
                break;
        }
    }
};

enum UpUpAndAway
{
    QUEST_UP_UP_AND_AWAY            = 14244,
    
    SPELL_ROCKET_BLAST              = 66110,
    SPELL_SUMMON_CHARACTER_ROCKET   = 68806,
    SPELL_UUAA_KILL_CREDIT          = 68813,
    SPELL_SUMMON_GALLYWIX           = 68815,
    SPELL_SUMMON_GALLYWIX_ROCKET    = 68819,

    NPC_GALLYWIX_ROCKET             = 36514
};

// 36425
struct npc_sassy_rocket_sling : public ScriptedAI
{
    npc_sassy_rocket_sling(Creature* creature) : ScriptedAI(creature) {}

    void sQuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_UP_UP_AND_AWAY)
            player->CastSpell(player, SPELL_SUMMON_GALLYWIX, true);
    }
};

// 36513
struct npc_gallywix_sling_rocket : public ScriptedAI
{
    npc_gallywix_sling_rocket(Creature* creature) : ScriptedAI(creature) {}

    void Reset() override
    {
        Talk(0);

        me->GetScheduler().Schedule(5s, [this](TaskContext /*context*/)
        {
            Talk(1);
        }).Schedule(5s, [this](TaskContext /*context*/)
        {
            if (me->ToTempSummon())
                Talk(2, me->ToTempSummon()->GetSummoner());
        });

        me->CastSpell(me, SPELL_SUMMON_GALLYWIX_ROCKET, true);

        if (Creature* rocket = me->GetSummonedCreatureByEntry(NPC_GALLYWIX_ROCKET))
        {
            rocket->SetCanFly(true);
            rocket->SetSpeed(MOVE_FLIGHT, 21.f);
        }

        me->GetMotionMaster()->MovePoint(1, 869.895996f, 2744.302246f, 122.355782f);
    }

    void MovementInform(uint32 /*type*/, uint32 id) override
    {
        if (id == 1)
        {
            if (Creature* rocket = me->GetSummonedCreatureByEntry(NPC_GALLYWIX_ROCKET))
            {
                me->EnterVehicle(rocket);

                me->GetScheduler().Schedule(2s, [rocket](TaskContext /*context*/)
                {
                    rocket->CastSpell(rocket, SPELL_ROCKET_BLAST, true);
                    rocket->GetMotionMaster()->MovePoint(1, 907.387085f, 2662.028320f, 193.833740f);
                    rocket->DespawnOrUnsummon(5000);
                });
            }
        }
    }
};

// 196439
class gob_rocket_sling : public GameObjectAI
{
public:
    gob_rocket_sling(GameObject* go) : GameObjectAI(go) { }

    bool GossipSelect(Player* player, uint32 /*sender*/, uint32 /*action*/) override
    {
        if (player->GetQuestStatus(QUEST_UP_UP_AND_AWAY) != QUEST_STATUS_NONE)
            player->CastSpell(player, SPELL_SUMMON_CHARACTER_ROCKET, true);

        return true;
    }
};

// 36505
struct npc_sling_rocket : public npc_escortAI
{
    npc_sling_rocket(Creature* creature) : npc_escortAI(creature) {}

    void AttackStart(Unit* /*who*/) override {}
    void EnterCombat(Unit* /*who*/) override {}
    void EnterEvadeMode(EvadeReason /*why*/) override {}
    void OnCharmed(bool /*apply*/) override {}

    void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply) override
    {
        if (apply)
        {
            me->SetCanFly(true);
            me->SetFlying(true);
            me->SetSpeedRate(MOVE_FLIGHT, 21.0f);
            me->CastSpell(me, SPELL_ROCKET_BLAST, true);
            Start(false, true, who->GetGUID());
        }
    }

    void WaypointReached(uint32 pointId) override
    {
        if (pointId == 3)
        {
            if (Vehicle* vehicle = me->GetVehicleKit())
                if (Unit* passenger = vehicle->GetPassenger(0))
                    me->CastSpell(passenger, SPELL_UUAA_KILL_CREDIT, true);

            me->DespawnOrUnsummon();
        }
    }
};

// 71091
class spell_tiab_effect2 : public SpellScript
{
    PrepareSpellScript(spell_tiab_effect2);

    void HandleDummy(SpellEffIndex effIndex)
    {
        PreventHitDefaultEffect(effIndex);

        if (Unit* unit = GetHitUnit())
            if (Player* casterPlayer = GetCaster()->ToPlayer())
                casterPlayer->KilledMonsterCredit(38024);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_tiab_effect2::HandleDummy, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
    }
};

class npc_poule : public CreatureScript
{
public:
    npc_poule() : CreatureScript("npc_poule") { }

    struct npc_pouleAI : public ScriptedAI
    {
        npc_pouleAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() override
        {
            me->GetMotionMaster()->MoveRandom(10.0f);
        }

        void DoAction(const int32 /*param*/) override
        {
            me->CastSpell(me, 67919, true);
        }

        void SpellHit(Unit* /*caster*/, const SpellInfo* spell) override
        {
            if (spell->Id == 67917)
            {
                if (me->IsNonMeleeSpellCast(true))
                    me->InterruptNonMeleeSpells(true);
                if (Creature *t = me->SummonCreature(me->GetEntry(), me->GetPositionX(), me->GetPositionY(),  me->GetPositionZ(),
                                                     me->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN))
                {
                    t->AI()->DoAction(0);
                    t->DespawnOrUnsummon(3000);
                }
                me->DespawnOrUnsummon();
            }
        }

        void UpdateAI(uint32 /*diff*/) override
        {
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_pouleAI (creature);
    }
};

#define GO_PIEGE 201972

class spell_egg_gob : public SpellScriptLoader
{
public:
    spell_egg_gob() : SpellScriptLoader("spell_egg_gob") { }

    class spell_egg_gobSpellScript : public SpellScript
    {
        PrepareSpellScript(spell_egg_gobSpellScript);

        bool Validate(SpellInfo const* /*spellEntry*/) override
        {
            return true;
        }


        bool Load() override
        {
            if (Unit* caster = GetCastItem()->GetOwner())
            {
                if (GameObject* go = caster->FindNearestGameObject(GO_PIEGE, 5))
                {
                    if (Creature *c = go->FindNearestCreature(38187, 10))
                        c->AI()->DoAction(1);
                }
            }
            return true;
        }


        void HandleActivateGameobject(SpellEffIndex /*effIndex*/)
        {

        }


        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_egg_gobSpellScript::HandleActivateGameobject,EFFECT_0,SPELL_EFFECT_ACTIVATE_OBJECT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_egg_gobSpellScript();
    }
};


class SparkSearcher
{
public:
    SparkSearcher(Creature const* source, float range) : _source(source), _range(range) {}

    bool operator()(Unit* unit)
    {
        if (!unit->IsAlive())
            return false;

        switch (unit->GetEntry())
        {
            case 38318:
                break;
            default:
                return false;
        }

        if (!unit->IsWithinDist(_source, _range, false))
            return false;

        return true;
    }

private:
    Creature const* _source;
    float _range;
};



#define SPELL_CRACK_INVOK 72058

// (Chef des nagas)
#define NAGA_SAY_A "WHO OSE?"
#define NAGA_SAY_B "Small goblins? I remember the creation of your race."
#define NAGA_SAY_C "Your threats do not impress me, nor the naga. Get ready to disappear from this reality."
#define NAGA_SAY_D  "Now, young $ N, you will die!"
//                    (Crack)
//-Quand on rend la quete d'avant
#define QUEST_RENDER_CRACK "I want to let these little demons, $ N. Nagas will never attack until we have grandchildren."

//-Quand on commence la quete
#define QUEST_RESET_CRACK "You are $ gpret, ready to force their leader to get $ gmy friend: my friend; ?"

//Quand on se rend syur place
#define CRACK_PROVOC "Come on, Chief naga, come out of your hiding and surrendered for $ N and Bilgewater Cartel!"
#define CRACK_EVADE "Hula treasure, it smells bad. I am size!"

#define NPC_CRACK 39198

class YoungNagaSearcher
{
public:
    YoungNagaSearcher(Creature const* source, float range) : _source(source), _range(range) {}

    bool operator()(Creature* creature)
    {
        if (!creature->IsAlive())
            return false;

        switch (creature->GetEntry())
        {
            case 44580:
                break;
            case 44579:
                break;
            case 44578:
                break;
            case 38412:
                break;
            default:
                return false;
        }

        if (!creature->IsWithinDist(_source, _range, false))
            return false;

        return true;
    }

private:
    Creature const* _source;
    float _range;
};


class spell_boot_gob : public SpellScriptLoader
{
public:
    spell_boot_gob() : SpellScriptLoader("spell_boot_gob") { }


    class spell_boot_gobSpellScript : public SpellScript
    {
        PrepareSpellScript(spell_boot_gobSpellScript);

        bool Validate(SpellInfo const* /*spellEntry*/) override
        {
            st = false;
            return true;
        }


        bool Load() override
        {
            return true;
        }

        void HandleOnHit()
        {
            if (Unit* caster = GetCastItem()->GetOwner())
                if (caster->GetTypeId() == TYPEID_PLAYER)
                    caster->ToPlayer()->GetMotionMaster()->MoveJump(1480.31f, 1269.97f, 110.0f, 50.0f, 50.0f, 300.0f);
        }

    private :
        bool st;

        void Register() override
        {
            OnHit += SpellHitFn(spell_boot_gobSpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_boot_gobSpellScript();
    }
};



class npc_tremblement_volcano : public CreatureScript
{
public:
    npc_tremblement_volcano() : CreatureScript("npc_tremblement_volcano") { }

    struct npc_tremblement_volcanoAI : public ScriptedAI
    {
        npc_tremblement_volcanoAI(Creature* creature) : ScriptedAI(creature) {}

        void AttackStart(Unit* /*who*/) override {}
        void EnterCombat(Unit* /*who*/) override {}
        void EnterEvadeMode(EvadeReason /*why*/) override {}

        void Reset() override
        {
            mui_soufle = 2000;
        }

        void JustDied(Unit* /*killer*/) override
        {
        }

        void UpdateAI(uint32 diff) override
        {
            if (mui_soufle <= diff)
            {
                me->CastSpell(me, 69235, true);
                mui_soufle = 3000;
            }
            else
                mui_soufle -= diff;
        }

    private :
        uint32 mui_soufle;

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tremblement_volcanoAI (creature);
    }
};

class npc_meteor2_gob : public CreatureScript
{
public:
    npc_meteor2_gob() : CreatureScript("npc_meteor2_gob") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_meteor2_gobAI(creature);
    }

    struct npc_meteor2_gobAI : public ScriptedAI
    {
        npc_meteor2_gobAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() override
        {
            _a = urand(15000, 20200);
            _b = 600000;
            _c = 600000;
        }

        void JustReachedHome() override
        {

        }

        void UpdateAI(uint32 diff) override
        {
            if (_a <= diff)
            {
                me->CastSpell(me, 93668, true);
                _a = urand(15000, 20200);
                _b = 800;
            }
            else _a -= diff;
            if (_b <= diff)
            {
                me->CastSpell(me, 87701, true);
                _b = 600000;
                _c = 500;
            }
            else _b -= diff;
            if (_c <= diff)
            {
                me->CastSpell(me, 69235, true);
                _c = 600000;
            }
            else _c -= diff;
        }

    private :
        uint32 _a, _b, _c;
    };
};

class npc_explosion_volcano : public CreatureScript
{
public:
    npc_explosion_volcano() : CreatureScript("npc_explosion_volcano") { }

    struct npc_explosion_volcanoAI : public ScriptedAI
    {
        npc_explosion_volcanoAI(Creature* creature) : ScriptedAI(creature) {}

        void AttackStart(Unit* /*who*/) override {}
        void EnterCombat(Unit* /*who*/) override {}
        void EnterEvadeMode(EvadeReason /*why*/) override {}

        void Reset() override
        {
            mui_soufle = urand(1100, 2000);
        }

        void JustDied(Unit* /*killer*/) override
        {
        }

        void UpdateAI(uint32 diff) override
        {
            if (mui_soufle <= diff)
            {
                me->CastSpell(me, 73193, true);
                mui_soufle = urand(4000, 5200);
            }
            else
                mui_soufle -= diff;
        }

    private :
        uint32 mui_soufle;

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_explosion_volcanoAI (creature);
    }
};


class npc_Prince : public CreatureScript
{
public:
    npc_Prince() : CreatureScript("npc_Prince") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_PrinceAI(creature);
    }

    struct npc_PrinceAI : public ScriptedAI
    {
        npc_PrinceAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() override
        {
            eventTalk = 0;
            eventTalk2 = 0;
            mui_talk = 2000;
            mui_talk2 = 2000;
            isEventInProgress = false;
            start = false;
            end = false;
            mui1 = 10000;
            mui2 = 30000;
            mui3 = 50000;
            mui4 = 40000;
            mui5 = 60000;
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (isEventInProgress)
                return;
            if (who->ToPlayer())
                return;
            if (!me->IsWithinDistInMap(who, 5.0f))
                return ;
            if (end)
                return;
            if (who->GetEntry() == 39592)
            {
                isEventInProgress = true;
                me->setFaction(14);
                //Talk(-1039585, me);
            }
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage) override
        {
            if (end)
            {
                damage = 0;
                return;
            }
            if (damage >= me->GetHealth())
            {
                damage = 0;
                me->setFaction(35);
                //Talk(-1039588, me);
                end = true;
                if (Creature *c = me->FindNearestCreature(39592, 30))
                    c->DespawnOrUnsummon();
                if (Player *pl = me->SelectNearestPlayer(10))
                    pl->KilledMonsterCredit(39582);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!isEventInProgress)
                return;
            if (end)
            {
                if (mui_talk <= diff)
                {
                    mui_talk = 10000;
                    switch (eventTalk)
                    {
                        case 0 :
                            //          Talk(-1039590, me);
                            break;
                        case 1 :
                            /*if (Creature *c = me->FindNearestCreature(39594, 30))
                            {
                                //              Talk(-1039591, c);
                            }*/
                            break;
                        case 2 :
                            //          Talk(-1039589, me);
                            break;
                        case 3 :
                            /*if (Creature *c = me->FindNearestCreature(39594, 30))
                            {
                                //              Talk(-1039592, c);
                            }*/
                            break;
                        case 4 :
                            /*if (Creature *c = me->FindNearestCreature(39594, 30))
                            {
                                //              Talk(-1039593, c);
                            }*/
                            break;
                        case 5 :
                            me->DespawnOrUnsummon();
                            if (Creature *c = me->FindNearestCreature(39594, 30))
                            {
                                c->DespawnOrUnsummon();
                            }
                            break;
                        default :
                            break;
                    }
                    eventTalk++;
                }
                else
                    mui_talk -= diff;
            }
            else
            {
                if (!me->GetVictim())
                    return;
                if (mui1 <= diff)
                {
                    switch (urand(0, 4))
                    {
                    case 0 :
                        me->CastSpell(me->GetVictim(), 74005, true);
                        //          Talk(-1039583, me);
                        break;
                    case 1 :
                        me->CastSpell(me->GetVictim(), 74000, true);
                        //          Talk(-1039584, me);
                        break;
                    case 2 :
                        me->CastSpell(me->GetVictim(), 74004, true);
                        //          Talk(-1039586, me);
                        break;
                    case 3 :
                        me->CastSpell(me->GetVictim(), 81000, true);
                        //          Talk(-1039582, me);
                        break;
                    case 4 :
                        me->CastSpell(me->GetVictim(), 74003, true);
                        break;
                    default :
                        me->CastSpell(me->GetVictim(), 74003, true);
                        break;
                    }
                    mui1 = 5000;
                }
                else
                    mui1 -= diff;
            }
            DoMeleeAttackIfReady();
        }

    private :
        bool isEventInProgress, start, end;
        uint32 mui_talk, mui_talk2, mui1, mui2, mui3, mui4, mui5;
        unsigned int eventTalk, eventTalk2;
    };
};



class BootSearcher
{
public:
    bool operator()(WorldObject* object)
    {
        if (!object)
            return true;
        Unit* unit = object->ToUnit();
        if (!unit || !unit->IsAlive() || unit->GetTypeId() == TYPEID_PLAYER)
            return true;

        if (unit->ToCreature())
        {
            switch (unit->ToCreature()->GetEntry())
            {
                case 38753:
                    return false;
                default:
                    break;
            }
        }
        return true;
    }
};

class spell_boot_damage : public SpellScriptLoader
{
public:
    spell_boot_damage() : SpellScriptLoader("spell_boot_damage") { }

    class spell_boot_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_boot_damage_SpellScript);

        void FilterTargets(std::list<WorldObject*>& targets)
        {
            targets.remove_if(BootSearcher());
            if (GetCaster())
                if (!GetCaster()->HasAura(72887))
                {
                    GetCaster()->RemoveAura(72885);
                    targets.clear();
                }
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_boot_damage_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_boot_damage_SpellScript();
    }
};

void AddSC_lost_isle()
{
    RegisterSpellScript(spell_lost_isles_near_death);
    RegisterCreatureAI(npc_zapnozzle);
    RegisterGameObjectAI(gob_goblin_escape_pod);
    RegisterCreatureAI(npc_goblin_espace_pod);
    RegisterCreatureAI(npc_bomb_monkey);
    RegisterCreatureAI(npc_frightened_miner_escort);
    RegisterSpellScript(spell_ctu_snapflash);
    RegisterSpellScript(spell_ctu_bind_sight);
    RegisterSpellScript(spell_weed_whacker);
    RegisterCreatureAI(npc_killag_sangrecroc);
    RegisterAuraScript(aura_infrared_orc_scout);
    RegisterCreatureAI(npc_cliff_bastia);
    RegisterCreatureAI(npc_gyrocopterequest_giver);
    RegisterCreatureAI(npc_precious_cargo_gyrocopter);
    RegisterCreatureAI(npc_lost_isles_thrall_prisonner);
    RegisterCreatureAI(npc_lost_isles_thrall_top_boat);
    RegisterCreatureAI(npc_warchief_revenge_cyclone);
    RegisterCreatureAI(npc_sassy_rocket_sling);
    RegisterCreatureAI(npc_gallywix_sling_rocket);
    RegisterGameObjectAI(gob_rocket_sling);
    RegisterCreatureAI(npc_sling_rocket);
    RegisterSpellScript(spell_tiab_effect2);
    new npc_poule();
    new spell_boot_damage();
    new spell_boot_gob();
    new npc_meteor2_gob();
    new npc_tremblement_volcano();
    new npc_explosion_volcano();
    new npc_Prince();
}
