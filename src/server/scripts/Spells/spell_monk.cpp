/*
 * Copyright (C) 2018 Hiriko-PPA.
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
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

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "GridNotifiers.h"
#include "ScriptMgr.h"
#include "SpellAuraEffects.h"
#include "SpellHistory.h"
#include "SpellMgr.h"
#include "SpellPackets.h"
#include "SpellScript.h"
#include "Spell.h"
#include "SpellInfo.h"
#include "Item.h"
#include "Unit.h"
#include "Player.h"
#include "Pet.h"
#include "Creature.h"


enum MonkSpells
{
    ITEM_MONK_T14_TANK_4P                               = 123159,
    MONK_NPC_BLACK_OX_STATUE                            = 61146,
    MONK_NPC_JADE_SERPENT_STATUE                        = 60849,
    SPELL_MONK_BLACKOUT_KICK_DOT                        = 128531,
    SPELL_MONK_BLACKOUT_KICK_HEAL                       = 128591,
    SPELL_MONK_BLACKOUT_STRIKE                          = 205523,
    SPELL_MONK_BLACK_OX_BREW                            = 115399,
    SPELL_MONK_BREATH_OF_FIRE                           = 115181,
    SPELL_MONK_BREATH_OF_FIRE_CONFUSED                  = 123393,
    SPELL_MONK_BREATH_OF_FIRE_DOT                       = 123725,
    SPELL_MONK_CHI_BURST_DAMAGE                         = 148135,
    SPELL_MONK_CHI_BURST_HEAL                           = 130654,
    SPELL_MONK_CHI_TORPEDO_DAMAGE                       = 117993,
    SPELL_MONK_CHI_TORPEDO_HEAL                         = 124040,
    SPELL_MONK_CHI_WAVE_DAMAGE                          = 132467,
    SPELL_MONK_CHI_WAVE_HEAL                            = 132463,
    SPELL_MONK_CHI_WAVE_HEALING_BOLT                    = 132464,
    SPELL_MONK_CHI_WAVE_TALENT_AURA                     = 115098,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHANNEL         = 117952,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHI_PROC        = 123333,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK       = 117962,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD    = 117953,
    SPELL_MONK_CRACKLING_JADE_SHOCK_BUMP                = 117962,
    SPELL_MONK_CREATE_CHI_SPHERE                        = 121286,
    SPELL_MONK_DISABLE                                  = 116095,
    SPELL_MONK_DISABLE_ROOT                             = 116706,
    SPELL_MONK_DIZZYING_HAZE                            = 116330,
    SPELL_MONK_ELUSIVE_BRAWLER                          = 195630,
    SPELL_MONK_ELUSIVE_BREW                             = 115308,
    SPELL_MONK_ELUSIVE_BREW_STACKS                      = 128939,
    SPELL_MONK_EMINENCE_HEAL                            = 126890,
    SPELL_MONK_ENHANCED_ROLL                            = 157361,
    SPELL_MONK_ENVELOPING_MIST                          = 124682,
    SPELL_MONK_ENVELOPING_MIST_HEAL                     = 132120,
    SPELL_MONK_ESSENCE_FONT_HEAL                        = 191840,
    SPELL_MONK_FISTS_OF_FURY                            = 113656,
    SPELL_MONK_FISTS_OF_FURY_DAMAGE                     = 117418,
    SPELL_MONK_FLYING_SERPENT_KICK                      = 101545,
    SPELL_MONK_FLYING_SERPENT_KICK_AOE                  = 123586,
    SPELL_MONK_FLYING_SERPENT_KICK_NEW                  = 115057,
    SPELL_MONK_FORTIFYING_BREW                          = 120954,
    SPELL_MONK_GIFT_OF_THE_OX_AURA                      = 124502,
    SPELL_MONK_GIFT_OF_THE_OX_AT_RIGHT                  = 124503,
    SPELL_MONK_GIFT_OF_THE_OX_AT_LEFT                   = 124506,
    SPELL_MONK_GLYPH_OF_BLACKOUT_KICK                   = 132005,
    SPELL_MONK_GLYPH_OF_RENEWING_MIST                   = 123334,
    SPELL_MONK_GLYPH_OF_ZEN_FLIGHT                      = 125893,
    SPELL_MONK_GRAPPLE_WEAPON_DPS_UPGRADE               = 123231,
    SPELL_MONK_GRAPPLE_WEAPON_HEAL_UPGRADE              = 123234,
    SPELL_MONK_GRAPPLE_WEAPON_TANK_UPGRADE              = 123232,
    SPELL_MONK_GUARD                                    = 115295,
    SPELL_MONK_HEALING_ELIXIRS_AURA                     = 122280,
    SPELL_MONK_HEALING_ELIXIRS_RESTORE_HEALTH           = 122281,
    SPELL_MONK_HEAVY_STAGGER                            = 124273,
    SPELL_MONK_ITEM_2_S12_MISTWEAVER                    = 131561,
    SPELL_MONK_ITEM_4_S12_MISTWEAVER                    = 124487,
    SPELL_MONK_ITEM_PVP_GLOVES_BONUS                    = 124489,
    SPELL_MONK_JADE_LIGHTNING_ENERGIZE                  = 123333,
    SPELL_MONK_KEG_SMASH_AURA                           = 121253,
    SPELL_MONK_KEG_SMASH_ENERGIZE                       = 127796,
    SPELL_MONK_KEG_SMASH_VISUAL                         = 123662,
    SPELL_MONK_LEGACY_OF_THE_EMPEROR                    = 117667,
    SPELL_MONK_LIFECYCLES_ENVELOPING_MIST               = 197919,
    SPELL_MONK_LIFECYCLES_VIVIFY                        = 197916,
    SPELL_MONK_LIGHT_STAGGER                            = 124275,
    SPELL_MONK_MANA_TEA_REGEN                           = 115294,
    SPELL_MONK_MANA_TEA_STACKS                          = 115867,
    SPELL_MONK_MEDITATE_VISUAL                          = 124416,
    SPELL_MONK_MODERATE_STAGGER                         = 124274,
    SPELL_MONK_MORTAL_WOUNDS                            = 115804,
    SPELL_MONK_PATH_OF_BLOSSOM_AREATRIGGER              = 122035,
    SPELL_MONK_PLUS_ONE_MANA_TEA                        = 123760,
    SPELL_MONK_POWER_STRIKES_TALENT                     = 121817,
    SPELL_MONK_POWER_STRIKES_AURA                       = 129914,
    SPELL_MONK_PROVOKE                                  = 118635,
    SPELL_MONK_PROVOKE_AOE                              = 118635,
    SPELL_MONK_PROVOKE_SINGLE_TARGET                    = 116189,
    SPELL_MONK_PURIFYING_BREW                           = 119582,
    SPELL_MONK_RENEWING_MIST_HOT                        = 119611,
    SPELL_MONK_RENEWING_MIST_JUMP_AURA                  = 119607,
    SPELL_MONK_RENEWING_MIST_PERIODIC                   = 119611,
    SPELL_MONK_RING_OF_PEACE_DISARM                     = 137461,
    SPELL_MONK_RING_OF_PEACE_SILENCE                    = 137460,
    SPELL_MONK_RISING_SUN_KICK                          = 107428,
    SPELL_MONK_RISING_THUNDER                           = 210804,
    SPELL_MONK_ROLL                                     = 109132,
    SPELL_MONK_ROLL_ANIMATION                           = 111396,
    SPELL_MONK_ROLL_BACKWARD                            = 109131,
    SPELL_MONK_ROLL_TRIGGER                             = 107427,
    SPELL_MONK_SHUFFLE                                  = 115307,
    SPELL_MONK_SONG_OF_CHIJI                            = 198909,
    SPELL_MONK_SOOTHING_MIST                            = 115175,
    SPELL_MONK_SOOTHING_MIST_AURA                       = 193884,
    SPELL_MONK_SOOTHING_MIST_ENERGIZE                   = 116335,
    SPELL_MONK_SOOTHING_MIST_VISUAL                     = 125955,
    SPELL_MONK_SPEAR_HAND_STRIKE_SILENCE                = 116709,
    SPELL_MONK_SPINNING_FIRE_BLOSSOM_MISSILE            = 118852,
    SPELL_MONK_SPINNING_FIRE_BLOSSOM_ROOT               = 123407,
    SPELL_MONK_SPIRIT_OF_THE_CRANE_AURA                 = 210802,
    SPELL_MONK_SPIRIT_OF_THE_CRANE_MANA                 = 210803,
    SPELL_MONK_STAGGER                                  = 124255,
    SPELL_MONK_STANCE_OF_THE_SPIRITED_CRANE             = 154436,
    SPELL_MONK_SURGING_MIST_HEAL                        = 116995,
    SPELL_MONK_TEACHINGS_OF_THE_MONASTERY               = 116645,
    SPELL_MONK_TEACHINGS_OF_THE_MONASTERY_AURA          = 202090,
    SPELL_MONK_THUNDER_FOCUS_TEA                        = 116680,
    SPELL_MONK_TIGEREYE_BREW                            = 116740,
    SPELL_MONK_TIGEREYE_BREW_STACKS                     = 125195,
    SPELL_MONK_TRANSCENDENCE_CLONE_TARGET               = 119051,
    SPELL_MONK_TRANSCENDENCE_VISUAL                     = 119053,
    SPELL_MONK_TOUCH_OF_DEATH                           = 115080,
    SPELL_MONK_TOUCH_OF_DEATH_DAMAGE                    = 229980,
    SPELL_MONK_TOUCH_OF_KARMA_REDIRECT_DAMAGE           = 124280,
    SPELL_MONK_UPLIFT_ALLOWING_CAST                     = 123757,
    SPELL_MONK_VIVIFY                                   = 116670,
    SPELL_MONK_WEAKENED_BLOWS                           = 115798,
    SPELL_MONK_WHIRLING_DRAGON_PUNCH                    = 152175,
    SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA        = 196742,
    SPELL_MONK_WHIRLING_DRAGON_PUNCH_DAMAGE             = 158221,
    SPELL_MONK_WINDWALKER_AURA                          = 166646,
    SPELL_MONK_WINDWALKING                              = 157411,
    SPELL_MONK_ZEN_FLIGHT                               = 125883,
    SPELL_MONK_ZEN_FOCUS                                = 124488,
    SPELL_MONK_ZEN_PILGRIMAGE                           = 126892,
    SPELL_MONK_ZEN_PILGRIMAGE_RETURN                    = 126895,
    SPELL_MONK_ZEN_PULSE_DAMAGE                         = 124081,
    SPELL_MONK_ZEN_PULSE_HEAL                           = 198487,
    SPELL_MONK_MARK_OF_THE_CRANE                        = 228287,
    SPELL_MONK_TIGER_PALM                               = 100780,
    SPELL_MONK_WHIRLWIND_DRAGON_PUNCH_AURASTATE         = 196742,
    SPELL_MONK_WHIRLWIND_DRAGON_PUNCH_DAMAGE            = 158221,
    SPELL_MONK_HEALING_SPHERE                           = 224863,
    SPELL_MONK_GIFT_OF_THE_OX                           = 124502,
    SPELL_MONK_GIFT_OF_THE_OX_HEAL                      = 124507,
    SPELL_MONK_IRONSKIN_BREW_AURASTATE                  = 215479,
    SPELL_MONK_SPECIAL_DELIVERY                         = 196730,
    SPELL_MONK_SPECIAL_DELIVERY_TRIGGERED               = 196734,
    SPELL_MONK_SPECIAL_DELIVERY_DAMAGE                  = 196732,
    SPELL_MONK_BLACKOUT_COMBO                           = 196736,
    SPELL_MONK_BLACKOUT_COMBO_AURASTATE                 = 228563,
    SPELL_MONK_STAGGER_DOT                              = 124255,
    SPELL_MONK_SONG_OF_CHI_JI_STUN                      = 198909,
    SPELL_MONK_EFFUSE                                   = 116694,
    SPELL_MONK_BEAR_HUG                                 = 127361,
    SPELL_MONK_SPINNING_FIRE_BLOSSOM_DAMAGE             = 123408,
    SPELL_MONK_CLASH_CHARGE                             = 126452,
    SPELL_MONK_KEG_SMASH                                = 121253,
    SPELL_MONK_IRON_SKIN_BREW                           = 115308,
    SPELL_MONK_RENEWING_MIST                            = 115151,
    SPELL_MONK_GUST_OF_MIST_HEAL                        = 191894,


};

enum StormEarthAndFireSpells
{
    SPELL_MONK_SEF                  = 137639,
    SPELL_MONK_SEF_STORM_VISUAL     = 138080,
    SPELL_MONK_SEF_FIRE_VISUAL      = 138081,
    SPELL_MONK_SEF_EARTH_VISUAL     = 138083,
    SPELL_MONK_SEF_CHARGE           = 138104,
    SPELL_MONK_SEF_SUMMON_EARTH     = 138121,
    SPELL_MONK_SEF_SUMMON_FIRE      = 138123,
    SPELL_MONK_SEF_SUMMONS_STATS    = 138130,
    SPELL_MONK_SEF_CHARGE_TARGET    = 196860,
    SPELL_MONK_SEF_FIXATE           = 221771,

    NPC_FIRE_SPIRIT                 = 69791,
    NPC_EARTH_SPIRIT                = 69792,
};

#define MONK_TRANSCENDENCE_GUID "MONK_TRANSCENDENCE_GUID"

// 109132 - Roll
class spell_monk_roll : public SpellScriptLoader
{
public:
    spell_monk_roll() : SpellScriptLoader("spell_monk_roll") { }

    class spell_monk_roll_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_roll_SpellScript);

    private:
        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL) ||
                !sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL_TRIGGER) ||
                !sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL_BACKWARD))
                return false;
            return true;
        }

        void HandleAfterCast()
        {
            Unit* caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            if (caster->HasAura(SPELL_MONK_ITEM_PVP_GLOVES_BONUS))
                caster->RemoveAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);
        }

        void HandleDummy()
        {
            if (Unit* caster = GetCaster())
            {
                if (caster->HasUnitMovementFlag(MOVEMENTFLAG_BACKWARD))
                    caster->CastSpell(caster, SPELL_MONK_ROLL_BACKWARD, true);
                else
                    caster->CastSpell(caster, SPELL_MONK_ROLL_TRIGGER, true);
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_monk_roll_SpellScript::HandleAfterCast);
            AfterHit += SpellHitFn(spell_monk_roll_SpellScript::HandleDummy);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_roll_SpellScript();
    }
};

// Roll trigger - 107427
class spell_monk_roll_trigger : public SpellScriptLoader
{
public:
    spell_monk_roll_trigger() : SpellScriptLoader("spell_monk_roll_trigger") {}

    class spell_monk_roll_trigger_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_roll_trigger_AuraScript);

        void CalcSpeed(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                amount = 277;
        }

        void CalcSpeed2(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (!caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                return;

            amount = 377;
        }

        void SendAmount(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (!caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                return;

            Aura* aur = GetAura();
            if (!aur)
                return;

            aur->SetMaxDuration(600);
            aur->SetDuration(600);

            if (AuraApplication* aurApp = GetAura()->GetApplicationOfTarget(caster->GetGUID()))
                aurApp->ClientUpdate();
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_roll_trigger_AuraScript::CalcSpeed, EFFECT_0, SPELL_AURA_MOD_SPEED_NO_CONTROL);
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_roll_trigger_AuraScript::CalcSpeed2, EFFECT_2, SPELL_AURA_MOD_MINIMUM_SPEED);
            AfterEffectApply += AuraEffectApplyFn(spell_monk_roll_trigger_AuraScript::SendAmount, EFFECT_4, SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_roll_trigger_AuraScript();
    }
};

// Fists of Fury (stun effect) - 120086
class spell_monk_fists_of_fury_stun : public SpellScriptLoader
{
public:
    spell_monk_fists_of_fury_stun() : SpellScriptLoader("spell_monk_fists_of_fury_stun") { }

    class spell_monk_fists_of_fury_stun_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_fists_of_fury_stun_SpellScript);

        void RemoveInvalidTargets(std::list<WorldObject*>& targets)
        {
            targets.remove_if(Trinity::UnitAuraCheck(true, GetSpellInfo()->Id));
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_fists_of_fury_stun_SpellScript::RemoveInvalidTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_24);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_fists_of_fury_stun_SpellScript();
    }
};

// Expel Harm - 115072
class spell_monk_expel_harm : public SpellScriptLoader
{
public:
    spell_monk_expel_harm() : SpellScriptLoader("spell_monk_expel_harm") { }

    class spell_monk_expel_harm_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_expel_harm_SpellScript);

        void HandleOnHit()
        {
            if (!GetCaster())
                return;

            if (Player* _player = GetCaster()->ToPlayer())
            {
                std::list<Unit*> targetList;
                _player->GetAttackableUnitListInRange(targetList, 10.0f);

                for (auto itr : targetList)
                {
                    if (_player->IsValidAttackTarget(itr))
                    {
                        int32 bp = CalculatePct((-GetHitDamage()), 50);
                        _player->CastCustomSpell(itr, 115129, &bp, NULL, NULL, true);
                    }
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_expel_harm_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_expel_harm_SpellScript();
    }
};

// Called by Thunder Focus Tea - 116680
// Item S12 4P - Mistweaver - 124487
class spell_monk_item_s12_4p_mistweaver : public SpellScriptLoader
{
public:
    spell_monk_item_s12_4p_mistweaver() : SpellScriptLoader("spell_monk_item_s12_4p_mistweaver") { }

    class spell_monk_item_s12_4p_mistweaver_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_item_s12_4p_mistweaver_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (_player->HasAura(SPELL_MONK_ITEM_4_S12_MISTWEAVER))
                    _player->CastSpell(_player, SPELL_MONK_ZEN_FOCUS, true);
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_item_s12_4p_mistweaver_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_item_s12_4p_mistweaver_SpellScript();
    }
};

// Diffuse Magic - 122783
// En attente

// Summon Black Ox Statue - 115315
// En attente

// Bear Hug - 127361
// En attente

// Zen Flight - 125883
class spell_monk_zen_flight_check : public SpellScriptLoader
{
public:
    spell_monk_zen_flight_check() : SpellScriptLoader("spell_monk_zen_flight_check") { }

    class spell_monk_zen_flight_check_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_zen_flight_check_SpellScript);

        SpellCastResult CheckTarget()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (_player->GetMap()->IsBattlegroundOrArena())
                    return SPELL_FAILED_NOT_IN_BATTLEGROUND;

                // In Kalimdor or Eastern Kingdom with Flight Master's License
                if (!_player->HasSpell(90267) && (_player->GetMapId() == 1 || _player->GetMapId() == 0))
                    return SPELL_FAILED_NOT_HERE;

                // In Pandaria with Wisdom of the Four Winds
                if (!_player->HasSpell(115913) && (_player->GetMapId() == 870))
                    return SPELL_FAILED_NOT_HERE;
            }

            return SPELL_CAST_OK;
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_monk_zen_flight_check_SpellScript::CheckTarget);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_zen_flight_check_SpellScript();
    }

    class spell_monk_zen_flight_check_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_zen_flight_check_AuraScript);

        bool Load() override
        {
            return GetCaster() && GetCaster()->GetTypeId() == TYPEID_PLAYER;
        }

        void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool & /*canBeRecalculated*/)
        {
            if (!GetCaster())
                return;

            if (Player* caster = GetCaster()->ToPlayer())
                if (caster->GetSkillValue(SKILL_RIDING) >= 375)
                    amount = 310;
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_zen_flight_check_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_MOD_INCREASE_VEHICLE_FLIGHT_SPEED);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_zen_flight_check_AuraScript();
    }
};

// Glyph of Zen Flight - 125893
// En attente

// Called by Jab - 100780
// Power Strikes - 121817
// En attente

// Crackling Jade Lightning - 117952
class spell_monk_crackling_jade_lightning : public SpellScriptLoader
{
public:
    spell_monk_crackling_jade_lightning() : SpellScriptLoader("spell_monk_crackling_jade_lightning") { }

    class spell_monk_crackling_jade_lightning_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_crackling_jade_lightning_AuraScript);

        void OnTick(AuraEffect const* /* aurEff */)
        {
            if (Unit* caster = GetCaster())
                if (roll_chance_i(25))
                    caster->CastSpell(caster, SPELL_MONK_JADE_LIGHTNING_ENERGIZE, true);
        }

        void OnProc(AuraEffect const* /* aurEff */, ProcEventInfo& eventInfo)
        {
            PreventDefaultAction();

            if (!GetCaster())
                return;

            if (eventInfo.GetActor()->GetGUID() != GetTarget()->GetGUID())
                return;

            /*if (GetCaster()->ToPlayer())
            {
                ;
            }*/
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_crackling_jade_lightning_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            OnEffectProc += AuraEffectProcFn(spell_monk_crackling_jade_lightning_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_crackling_jade_lightning_AuraScript();
    }
};

// Touch of Karma - 122470
// En attente

// Path of Blossom - 124336
class spell_monk_path_of_blossom : public AuraScript
{
    PrepareAuraScript(spell_monk_path_of_blossom);

    void OnTick(AuraEffect const* /* aurEff */)
    {
        if (GetCaster())
            GetCaster()->CastSpell(GetCaster(), SPELL_MONK_PATH_OF_BLOSSOM_AREATRIGGER, true);
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_path_of_blossom::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// Called by Uplift - 116670 and Uplift - 130316
// Thunder Focus Tea - 116680
// En attente

// Summon Jade Serpent Statue - 115313
// En attente

// Enveloping Mist - 124682
class spell_monk_enveloping_mist : public SpellScriptLoader
{
public:
    spell_monk_enveloping_mist() : SpellScriptLoader("spell_monk_enveloping_mist") { }

    class spell_monk_enveloping_mist_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_enveloping_mist_SpellScript);

        void HandleAfterCast()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (Unit* target = GetExplTargetUnit())
                    _player->CastSpell(target, SPELL_MONK_ENVELOPING_MIST_HEAL, true);
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_monk_enveloping_mist_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_enveloping_mist_SpellScript();
    }
};

// Renewing Mist - 119611
// En attente

// Called by : Fortifying Brew - 115203, Chi Brew - 115399, Elusive Brew - 115308, Tigereye Brew - 116740
// Purifying Brew - 119582, Mana Tea - 115294, Thunder Focus Tea - 116680 and Energizing Brew - 115288
// Healing Elixirs - 122280
// En attente

// Zen Pulse - 124081
class spell_monk_zen_pulse : public SpellScriptLoader
{
public:
    spell_monk_zen_pulse() : SpellScriptLoader("spell_monk_zen_pulse") {}

    class spell_monk_zen_pulse_SpellScript : public SpellScript
    {

        PrepareSpellScript(spell_monk_zen_pulse_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_ZEN_PULSE_DAMAGE))
                return false;
            return true;
        }

        void OnHit(SpellEffIndex /*effIndex*/)
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_MONK_ZEN_PULSE_HEAL, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_zen_pulse_SpellScript::OnHit, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_zen_pulse_SpellScript();
    }
};

// Chi Burst - 123986
// En attente

// Energizing Brew - 115288
class spell_monk_energizing_brew : public SpellScriptLoader
{
public:
    spell_monk_energizing_brew() : SpellScriptLoader("spell_monk_energizing_brew") { }

    class spell_monk_energizing_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_energizing_brew_SpellScript);

        SpellCastResult CheckFight()
        {
            if (!GetCaster()->IsInCombat())
                return SPELL_FAILED_CASTER_AURASTATE;
            return SPELL_CAST_OK;
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_monk_energizing_brew_SpellScript::CheckFight);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_energizing_brew_SpellScript();
    }
};

// Spear Hand Strike - 116705
// En attente

// Tigereye Brew - 116740
// En attente

// Tiger's Lust - 116841
// En attente

// Flying Serpent Kick - 115057
class spell_monk_flying_serpent_kick : public SpellScriptLoader
{
public:
    spell_monk_flying_serpent_kick() : SpellScriptLoader("spell_monk_flying_serpent_kick") { }

    class spell_monk_flying_serpent_kick_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_flying_serpent_kick_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_FLYING_SERPENT_KICK_NEW))
                return false;
            return true;
        }

        void HandleOnCast()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (_player->HasAura(SPELL_MONK_FLYING_SERPENT_KICK))
                        _player->RemoveAura(SPELL_MONK_FLYING_SERPENT_KICK);

                    if (caster->HasAura(SPELL_MONK_ITEM_PVP_GLOVES_BONUS))
                        caster->RemoveAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);

                    _player->CastSpell(_player, SPELL_MONK_FLYING_SERPENT_KICK_AOE, true);
                }
            }
        }

        void Register() override
        {
            OnCast += SpellCastFn(spell_monk_flying_serpent_kick_SpellScript::HandleOnCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_flying_serpent_kick_SpellScript();
    }
};

// Chi Torpedo - 115008 or Chi Torpedo (3 charges) - 121828
// En attente

// Purifying Brew - 119582
class spell_monk_purifying_brew : public SpellScriptLoader
{
public:
    spell_monk_purifying_brew() : SpellScriptLoader("spell_monk_purifying_brew") { }

    class spell_monk_purifying_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_purifying_brew_SpellScript);

        void HandleOnHit()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    Aura* staggerAmount = _player->GetAura(SPELL_MONK_LIGHT_STAGGER);

                    if (!staggerAmount)
                        staggerAmount = _player->GetAura(SPELL_MONK_MODERATE_STAGGER);
                    if (!staggerAmount)
                        staggerAmount = _player->GetAura(SPELL_MONK_HEAVY_STAGGER);

                    if (staggerAmount)
                    {
                        int32 newStagger = staggerAmount->GetEffect(EFFECT_1)->GetAmount();
                        newStagger = newStagger * 0.5;
                        staggerAmount->GetEffect(EFFECT_1)->ChangeAmount(newStagger);
                    }
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_purifying_brew_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_purifying_brew_SpellScript();
    }
};

// Keg Smash - 121253
class spell_monk_keg_smash : public SpellScriptLoader
{
public:
    spell_monk_keg_smash() : SpellScriptLoader("spell_monk_keg_smash") { }

    class spell_monk_keg_smash_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_keg_smash_SpellScript);

        void HandleOnHit()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (Unit* target = GetHitUnit())
                    {
                        _player->CastSpell(target, SPELL_MONK_KEG_SMASH_VISUAL, true);
                        _player->CastSpell(target, SPELL_MONK_WEAKENED_BLOWS, true);
                        _player->CastSpell(_player, SPELL_MONK_KEG_SMASH_ENERGIZE, true);
                        // Prevent to receive 2 CHI more than once time per cast
                        _player->GetSpellHistory()->AddCooldown(SPELL_MONK_KEG_SMASH_ENERGIZE, 0, std::chrono::seconds(1));
                        _player->CastSpell(target, SPELL_MONK_DIZZYING_HAZE, true);
                    }
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_keg_smash_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_keg_smash_SpellScript();
    }
};

// Elusive Brew - 115308
// En attente

// Soothing Mist - 115175
class spell_monk_soothing_mist : public SpellScriptLoader
{
public:
    spell_monk_soothing_mist() : SpellScriptLoader("spell_monk_soothing_mist") { }

    class spell_monk_soothing_mist_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_soothing_mist_AuraScript);

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (!GetCaster())
                return;

            if (Unit* target = GetTarget())
                target->CastSpell(target, SPELL_MONK_SOOTHING_MIST_VISUAL, true);

            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetTarget())
                {
                    std::list<Unit*> playerList;
                    std::list<Creature*> tempList;
                    std::list<Creature*> statueList;
                    Creature* statue;

                    _player->GetPartyMembers(playerList);

                    if (playerList.size() > 1)
                    {
                        playerList.remove(target);
                        playerList.sort(Trinity::HealthPctOrderPred());
                        playerList.resize(1);
                    }

                    _player->GetCreatureListWithEntryInGrid(tempList, 60849, 100.0f);
                    _player->GetCreatureListWithEntryInGrid(statueList, 60849, 100.0f);

                    // Remove other players jade statue
                    for (std::list<Creature*>::iterator i = tempList.begin(); i != tempList.end(); ++i)
                    {
                        Unit* owner = (*i)->GetOwner();
                        if (owner && owner == _player && (*i)->IsSummon())
                            continue;

                        statueList.remove((*i));
                    }

                    for (auto itr : playerList)
                    {
                        if (statueList.size() == 1)
                        {
                            for (auto itrBis : statueList)
                                statue = itrBis;

                            if (statue && (statue->IsPet() || statue->IsGuardian()))
                                if (statue->GetOwner() && statue->GetOwner()->GetGUID() == _player->GetGUID())
                                    statue->CastSpell(itr, GetSpellInfo()->Id, true);
                        }
                    }
                }
            }
        }

        void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
        {
            if (Unit* caster = GetCaster())
                if (GetTarget())
                    // 25% to give 1 chi per tick
                    if (roll_chance_i(25))
                        caster->CastSpell(caster, SPELL_MONK_SOOTHING_MIST_ENERGIZE, true);
        }

        void OnRemove(AuraEffect const* /* aurEff */, AuraEffectHandleModes /*mode*/)
        {
            if (GetCaster())
                if (Unit* target = GetTarget())
                    if (target->HasAura(SPELL_MONK_SOOTHING_MIST_VISUAL))
                        target->RemoveAura(SPELL_MONK_SOOTHING_MIST_VISUAL);
        }

        void Register() override
        {
            AfterEffectApply += AuraEffectApplyFn(spell_monk_soothing_mist_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_HEAL, AURA_EFFECT_HANDLE_REAL);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_soothing_mist_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_HEAL);
            AfterEffectRemove += AuraEffectRemoveFn(spell_monk_soothing_mist_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_HEAL, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_soothing_mist_AuraScript();
    }
};

// Disable - 116095
class spell_monk_disable : public SpellScript
{
    PrepareSpellScript(spell_monk_disable);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo({ SPELL_MONK_DISABLE, SPELL_MONK_DISABLE_ROOT });
    }

    void HandleOnEffectHitTarget(SpellEffIndex /*effectIndex*/)
    {
        if (Unit* target = GetExplTargetUnit())
            if (target->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED))
                GetCaster()->CastSpell(target, SPELL_MONK_DISABLE_ROOT, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_monk_disable::HandleOnEffectHitTarget, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
    }
};

// Disable - 116095
class aura_monk_disable : public AuraScript
{
    PrepareAuraScript(aura_monk_disable);

    bool CheckProc(ProcEventInfo& eventInfo)
    {
        if (DamageInfo* damageInfo = eventInfo.GetDamageInfo())
        {
            if ((damageInfo->GetAttackType() == BASE_ATTACK ||
                 damageInfo->GetAttackType() == OFF_ATTACK) &&
                damageInfo->GetAttacker() == GetCaster())
            {
                GetAura()->RefreshDuration();
                return true;
            }
        }
        return false;
    }

    void Register() override
    {
        DoCheckProc += AuraCheckProcFn(aura_monk_disable::CheckProc);
    }
};

// Zen Pilgrimage - 126892 and Zen Pilgrimage : Return - 126895
class spell_monk_zen_pilgrimage : public SpellScriptLoader
{
public:
    spell_monk_zen_pilgrimage() : SpellScriptLoader("spell_monk_zen_pilgrimage") { }

    class spell_monk_zen_pilgrimage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_zen_pilgrimage_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_ZEN_PILGRIMAGE) || !sSpellMgr->GetSpellInfo(SPELL_MONK_ZEN_PILGRIMAGE_RETURN))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            PreventHitEffect(effIndex);

            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (GetSpellInfo()->Id == SPELL_MONK_ZEN_PILGRIMAGE)
                    {
                        _player->SaveRecallPosition();
                        //Class Order Hall
                        if (_player->getLevel() >= 98)
                            _player->TeleportTo(1514, 882.933f, 3605.61f, 192.218f, _player->GetOrientation());
                        else
                            _player->TeleportTo(870, 3818.55f, 1793.18f, 950.35f, _player->GetOrientation());
                    }
                }
            }
        }

        void HandleScriptEffect(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            PreventHitEffect(effIndex);

            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (GetSpellInfo()->Id == SPELL_MONK_ZEN_PILGRIMAGE_RETURN)
                    {
                        _player->Recall();
                        _player->RemoveAura(126896);
                    }
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_zen_pilgrimage_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_TELEPORT_UNITS);
            OnEffectHitTarget += SpellEffectFn(spell_monk_zen_pilgrimage_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_zen_pilgrimage_SpellScript();
    }
};

// Blackout Kick - 100784
// En attente

// Paralysis - 115078
// En attente

// Touch of Death - 115080
class spell_monk_touch_of_death : public AuraScript
{
    PrepareAuraScript(spell_monk_touch_of_death);

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (Unit* caster = GetCaster())
        {
            uint32 damagePct = GetEffectInfo(EFFECT_1)->BasePoints;

            // Damage reduced to Players, need to check reduction value
            if (GetTarget()->IsPlayer())
                damagePct /= 2;

            caster->CastCustomSpell(SPELL_MONK_TOUCH_OF_DEATH_DAMAGE, SPELLVALUE_BASE_POINT0, CalculatePct(caster->GetMaxHealth(), damagePct), GetTarget());
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_touch_of_death::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// Fortifying brew - 115203
class spell_monk_fortifying_brew : public SpellScriptLoader
{
public:
    spell_monk_fortifying_brew() : SpellScriptLoader("spell_monk_fortifying_brew") { }

    class spell_monk_fortifying_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_fortifying_brew_SpellScript);

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (caster && caster->GetTypeId() == TYPEID_PLAYER)
                caster->CastSpell(caster, SPELL_MONK_FORTIFYING_BREW, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_fortifying_brew_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_fortifying_brew_SpellScript();
    }
};

// Roll - 109132 or Roll (3 charges) - 121827
// En attente

// Brewing : Tigereye Brew - 123980
class spell_monk_tigereye_brew_stacks : public SpellScriptLoader
{
public:
    spell_monk_tigereye_brew_stacks() : SpellScriptLoader("spell_monk_tigereye_brew_stacks") { }

    class spell_monk_tigereye_brew_stacks_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_tigereye_brew_stacks_AuraScript);

        uint32 chiConsumed;

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            chiConsumed = 0;
        }

        void SetData(uint32 /* type */, uint32 data)
        {
            while ((chiConsumed += data) >= 4)
            {
                chiConsumed = 0;
                data = data > 4 ? data - 4 : 0;

                if (GetCaster())
                    GetCaster()->CastSpell(GetCaster(), SPELL_MONK_TIGEREYE_BREW_STACKS, true);
            }
        }

        void Register() override
        {
            AfterEffectApply += AuraEffectApplyFn(spell_monk_tigereye_brew_stacks_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_tigereye_brew_stacks_AuraScript();
    }
};

// 117959 - Crackling Jade Lightning
class spell_monk_crackling_jade_lightning_knockback_proc_aura : public SpellScriptLoader
{
public:
    spell_monk_crackling_jade_lightning_knockback_proc_aura() : SpellScriptLoader("spell_monk_crackling_jade_lightning_knockback_proc_aura") { }

    class spell_monk_crackling_jade_lightning_aura_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_crackling_jade_lightning_aura_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD))
                return false;
            return true;
        }

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            Unit* target = GetTarget();

            if (target->HasAura(SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD))
                return false;

            DynamicFieldStructuredView<ObjectGuid> channelObjects = target->GetChannelObjects();
            if (Unit* channelTarget = (channelObjects.size() == 1 ? ObjectAccessor::GetUnit(*target, *channelObjects.begin()) : nullptr))
                if (eventInfo.GetActor()->GetGUID() != channelTarget->GetGUID())
                    return false;

            Spell* currentChanneledSpell = target->GetCurrentSpell(CURRENT_CHANNELED_SPELL);
            if (!currentChanneledSpell || currentChanneledSpell->GetSpellInfo()->Id != SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHANNEL)
                return false;

            return true;
        }

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
        {
            GetTarget()->CastSpell(eventInfo.GetActor(), SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK, TRIGGERED_FULL_MASK);
            GetTarget()->CastSpell(GetTarget(), SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD, TRIGGERED_FULL_MASK);
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_monk_crackling_jade_lightning_aura_AuraScript::CheckProc);
            OnEffectProc += AuraEffectProcFn(spell_monk_crackling_jade_lightning_aura_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_crackling_jade_lightning_aura_AuraScript();
    }
};

class spell_monk_breath_of_fire : public SpellScriptLoader
{
public:
    spell_monk_breath_of_fire() : SpellScriptLoader("spell_monk_breath_of_fire") { }

    class spell_monk_breath_of_fire_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_breath_of_fire_SpellScript);

        void HandleAfterHit()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (Unit* target = GetHitUnit())
                    {
                        // if Dizzying Haze is on the target, they will burn for an additionnal damage over 8s
                        if (target->HasAura(SPELL_MONK_DIZZYING_HAZE))
                            _player->CastSpell(target, SPELL_MONK_BREATH_OF_FIRE_DOT, true);
                        if(target->HasAura(SPELL_MONK_KEG_SMASH_AURA))
                            _player->CastSpell(target, SPELL_MONK_BREATH_OF_FIRE_DOT, true);
                    }
                }
            }
        }

        void Register() override
        {
            AfterHit += SpellHitFn(spell_monk_breath_of_fire_SpellScript::HandleAfterHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_breath_of_fire_SpellScript();
    }
};

class spell_monk_chi_torpedo : public SpellScriptLoader
{
public:
    spell_monk_chi_torpedo() : SpellScriptLoader("spell_monk_chi_torpedo") { }

    class spell_monk_chi_torpedo_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_torpedo_SpellScript);

        void HandleAfterCast()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    std::list<Unit*> tempUnitMap;
                    _player->GetAttackableUnitListInRange(tempUnitMap, 20.0f);

                    for (std::list<Unit*>::iterator itr = tempUnitMap.begin(); itr != tempUnitMap.end(); ++itr)
                    {
                        if (!(*itr)->isInFront(_player, float(M_PI / 3)) && (*itr)->GetGUID() != _player->GetGUID())
                            continue;

                        uint32 spell = _player->IsValidAttackTarget((*itr)) ? SPELL_MONK_CHI_TORPEDO_DAMAGE : SPELL_MONK_CHI_TORPEDO_HEAL;
                        _player->CastSpell((*itr), spell, true);
                    }

                    if (caster->HasAura(SPELL_MONK_ITEM_PVP_GLOVES_BONUS))
                        caster->RemoveAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);
                }
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_monk_chi_torpedo_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_chi_torpedo_SpellScript();
    }
};

enum CracklingJade
{
    SPELL_MONK_CRACKLING_JADE_LIGHTNING                     = 117952,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHI_PROC_DRIVER     = 123332,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCK_BACK_DRIVER   = 117959,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCK_BACK          = 117962,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_TALENT              = 125648,
    SPELL_MONK_CRACKLING_JAD_LIGHTNING_TALENT_SPEED         = 125647,
};

// 117962 - crackling jade lightning knockback
class spell_monk_crackling_jade_knockback : public SpellScriptLoader
{
public:
    spell_monk_crackling_jade_knockback() : SpellScriptLoader("spell_monk_crackling_jade_knockback") { }

    class spell_monk_crackling_jade_knockback_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_crackling_jade_knockback_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCK_BACK) != nullptr;
        }

        void Hit()
        {
            Unit* target = GetHitUnit();
            Unit* caster = GetCaster();
            if (caster && target && caster->HasAura(SPELL_MONK_CRACKLING_JADE_LIGHTNING_TALENT))
                caster->CastSpell(target, SPELL_MONK_CRACKLING_JAD_LIGHTNING_TALENT_SPEED, true);
        }

        void Register() override
        {
            AfterHit += SpellHitFn(spell_monk_crackling_jade_knockback_SpellScript::Hit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_crackling_jade_knockback_SpellScript();
    }
};

class spell_monk_power_strikes : public SpellScriptLoader
{
public:
    spell_monk_power_strikes() : SpellScriptLoader("spell_monk_power_strikes") { }

    class spell_monk_power_strikes_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_power_strikes_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (target->GetGUID() != _player->GetGUID())
                    {
                        if (_player->HasAura(SPELL_MONK_POWER_STRIKES_TALENT))
                        {
                            if (!_player->GetSpellHistory()->HasCooldown(SPELL_MONK_POWER_STRIKES_TALENT))
                            {
                                if (_player->GetPower(POWER_CHI) < _player->GetMaxPower(POWER_CHI))
                                {
                                    _player->EnergizeBySpell(_player, GetSpellInfo()->Id, 1, POWER_CHI);
                                    _player->GetSpellHistory()->AddCooldown(SPELL_MONK_POWER_STRIKES_TALENT, 0, std::chrono::seconds(20));
                                }
                                else
                                    _player->CastSpell(_player, SPELL_MONK_CREATE_CHI_SPHERE, true);
                            }
                        }
                    }
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_power_strikes_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_power_strikes_SpellScript();
    }
};

// 140023 - Ring of Peace Aura
class spell_monk_ring_of_peace_aura : public SpellScriptLoader
{
public:
    spell_monk_ring_of_peace_aura() : SpellScriptLoader("spell_monk_ring_of_peace_aura") {}

    class spell_monk_ring_of_peace_aura_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_ring_of_peace_aura_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_MONK_RING_OF_PEACE_SILENCE)
                && sSpellMgr->GetSpellInfo(SPELL_MONK_RING_OF_PEACE_DISARM);
        }

        void HandleDummyProc(AuraEffect const* /*auraEffect*/, ProcEventInfo& /*eventInfo*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetTarget();
            if (!caster)
                return;

            caster->CastSpell(target, SPELL_MONK_RING_OF_PEACE_SILENCE, true);
            caster->CastSpell(target, SPELL_MONK_RING_OF_PEACE_DISARM, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_ring_of_peace_aura_AuraScript::HandleDummyProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_ring_of_peace_aura_AuraScript();
    }
};

class spell_monk_spear_hand_strike : public SpellScriptLoader
{
public:
    spell_monk_spear_hand_strike() : SpellScriptLoader("spell_monk_spear_hand_strike") { }

    class spell_monk_spear_hand_strike_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_spear_hand_strike_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (target->isInFront(_player))
                    {
                        _player->CastSpell(target, SPELL_MONK_SPEAR_HAND_STRIKE_SILENCE, true);
                        _player->GetSpellHistory()->AddCooldown(116705, 0, std::chrono::seconds(15));
                    }
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_spear_hand_strike_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_spear_hand_strike_SpellScript();
    }
};

// 124273 - Heavy Stagger
// 124274 - Moderate Stagger
// 124275 - Light Stagger
class spell_monk_stagger_visual : public SpellScriptLoader
{
public:
    spell_monk_stagger_visual() : SpellScriptLoader("spell_monk_stagger_visual") {}

    class spell_monk_stagger_visual_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_stagger_visual_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_MONK_STAGGER) != nullptr;
        }

        void HandleDummy1Apply(AuraEffect const* auraEffect, AuraEffectHandleModes /*mode*/)
        {
            Unit* target = GetTarget();
            if (AuraEffect* stagger = target->GetAuraEffect(SPELL_MONK_STAGGER, EFFECT_0))
            {
                stagger->SetAmount(auraEffect->GetAmount());
                stagger->ResetPeriodic();
            }
        }

        void HandleDummy1Remove(AuraEffect const* /*auraEffect*/, AuraEffectHandleModes /*mode*/)
        {
            GetTarget()->RemoveAura(SPELL_MONK_STAGGER);
        }

        void Register() override
        {
            //OnEffectApply += AuraEffectApplyFn(spell_monk_stagger_visual_AuraScript::HandleDummy1Apply, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            OnEffectRemove += AuraEffectRemoveFn(spell_monk_stagger_visual_AuraScript::HandleDummy1Remove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_stagger_visual_AuraScript();
    }
};

// 115069 - Stance of the Sturdy Ox
class spell_monk_stance_of_the_sturdy_ox : public SpellScriptLoader
{
public:
    spell_monk_stance_of_the_sturdy_ox() : SpellScriptLoader("spell_monk_stance_of_the_sturdy_ox") {}

    class spell_monk_stance_of_the_sturdy_ox_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_stance_of_the_sturdy_ox_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_MONK_STAGGER) != nullptr;
        }

        void CalculateAmount(const AuraEffect* /*aurEff*/, int32& amount, bool & /*canBeRecalculated*/)
        {
            amount = -1;
        }

        void HandleAbsorb(AuraEffect* /*auraEffect*/, DamageInfo& dmgInfo, uint32& absorbAmount)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (dmgInfo.GetSpellInfo() == sSpellMgr->GetSpellInfo(SPELL_MONK_STAGGER))
                return;

            int32 staggerPct = GetSpellInfo()->GetEffect(EFFECT_8)->CalcValue(GetCaster());
            int32 staggerAmount = CalculatePct(dmgInfo.GetDamage(), staggerPct);

            absorbAmount = staggerAmount;

            int32 duration = sSpellMgr->GetSpellInfo(SPELL_MONK_HEAVY_STAGGER)->GetMaxDuration();
            int32 ticks = duration / 500;

            int64 healthPercent = staggerAmount * 100 / caster->GetMaxHealth();

            uint32 staggerVisualSpellId;
            if (healthPercent > 3.34)
                staggerVisualSpellId = SPELL_MONK_HEAVY_STAGGER;
            else if (healthPercent > 1.67)
                staggerVisualSpellId = SPELL_MONK_MODERATE_STAGGER;
            else
                staggerVisualSpellId = SPELL_MONK_LIGHT_STAGGER;

            int32 staggerPerTick = staggerAmount / ticks;

            if (caster->HasAura(SPELL_MONK_STAGGER))
            {
                int32 currentTotalAmount = 0;

                Aura* damageAura = caster->GetAura(SPELL_MONK_STAGGER);
                Aura* visualAura = nullptr;

                if (caster->HasAura(SPELL_MONK_LIGHT_STAGGER))
                    visualAura = caster->GetAura(SPELL_MONK_LIGHT_STAGGER);
                else if (caster->HasAura(SPELL_MONK_MODERATE_STAGGER))
                    visualAura = caster->GetAura(SPELL_MONK_MODERATE_STAGGER);
                else if (caster->HasAura(SPELL_MONK_HEAVY_STAGGER))
                    visualAura = caster->GetAura(SPELL_MONK_HEAVY_STAGGER);

                if (!damageAura || !visualAura)
                    return;

                currentTotalAmount = visualAura->GetEffect(EFFECT_1)->GetAmount();

                staggerAmount += currentTotalAmount;
                staggerPerTick = staggerAmount / ticks;

                float healthPercent = staggerAmount * 100 / caster->GetMaxHealth();

                uint32 staggerVisualSpellId;

                if (healthPercent > 3.34)
                    staggerVisualSpellId = SPELL_MONK_HEAVY_STAGGER;
                else if (healthPercent > 1.67)
                    staggerVisualSpellId = SPELL_MONK_MODERATE_STAGGER;
                else
                    staggerVisualSpellId = SPELL_MONK_LIGHT_STAGGER;


                if (staggerVisualSpellId == visualAura->GetSpellInfo()->Id)
                {
                    visualAura->GetEffect(EFFECT_0)->ChangeAmount(staggerPerTick);
                    visualAura->GetEffect(EFFECT_1)->ChangeAmount(staggerAmount);
                }
                else
                {
                    if (visualAura)
                        caster->RemoveAura(visualAura);

                    caster->CastCustomSpell(caster, staggerVisualSpellId, &staggerPerTick, &staggerAmount, 0, true);
                }

                if (damageAura)
                    caster->RemoveAura(damageAura);
                caster->CastCustomSpell(SPELL_MONK_STAGGER, SPELLVALUE_BASE_POINT0, staggerPerTick, caster, true);
            }
            else
            {
                caster->CastCustomSpell(SPELL_MONK_STAGGER, SPELLVALUE_BASE_POINT0, staggerPerTick, caster, true);
                caster->CastCustomSpell(caster, staggerVisualSpellId, &staggerPerTick, &staggerAmount, 0, true);
            }
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_stance_of_the_sturdy_ox_AuraScript::CalculateAmount, EFFECT_2, SPELL_AURA_SCHOOL_ABSORB);
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_stance_of_the_sturdy_ox_AuraScript::CalculateAmount, EFFECT_3, SPELL_AURA_SCHOOL_ABSORB);
            OnEffectAbsorb += AuraEffectAbsorbFn(spell_monk_stance_of_the_sturdy_ox_AuraScript::HandleAbsorb, EFFECT_2);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_stance_of_the_sturdy_ox_AuraScript();
    }
};

//124255
class spell_monk_stagger_damage : public SpellScriptLoader
{
public:
    spell_monk_stagger_damage() : SpellScriptLoader("spell_monk_stagger_damage") { }

    class spell_monk_stagger_damage_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_stagger_damage_AuraScript);

        void HandlePeriodic(AuraEffect const* /*aurEff*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (!caster->HasAura(SPELL_MONK_LIGHT_STAGGER))
                if (!caster->HasAura(SPELL_MONK_MODERATE_STAGGER))
                    if (!caster->HasAura(SPELL_MONK_HEAVY_STAGGER))
                    {
                        PreventDefaultAction();
                        caster->RemoveAura(SPELL_MONK_STAGGER);
                    }

            Aura* visualAura = nullptr;
            if (caster->HasAura(SPELL_MONK_LIGHT_STAGGER))
                visualAura = caster->GetAura(SPELL_MONK_LIGHT_STAGGER);
            else if (caster->HasAura(SPELL_MONK_MODERATE_STAGGER))
                visualAura = caster->GetAura(SPELL_MONK_MODERATE_STAGGER);
            else if (caster->HasAura(SPELL_MONK_HEAVY_STAGGER))
                visualAura = caster->GetAura(SPELL_MONK_HEAVY_STAGGER);

            if (!visualAura || !visualAura->GetEffect(EFFECT_1)->GetAmount() || !visualAura->GetEffect(EFFECT_0)->GetAmount())
                return;

            int32 newAmount = (visualAura->GetEffect(EFFECT_1)->GetAmount() - visualAura->GetEffect(EFFECT_0)->GetAmount());
            if (newAmount <= 0)
            {
                caster->RemoveAura(SPELL_MONK_LIGHT_STAGGER);
                caster->RemoveAura(SPELL_MONK_MODERATE_STAGGER);
                caster->RemoveAura(SPELL_MONK_HEAVY_STAGGER);
                caster->RemoveAura(SPELL_MONK_STAGGER);
            }
            else
            {
                visualAura->GetEffect(EFFECT_1)->ChangeAmount(newAmount);
            }
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_stagger_damage_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_stagger_damage_AuraScript();
    }
};

enum TigerLust
{
    SPELL_MONK_TIGER_LUST = 116841,
};

// 116841 - tiger's lust
class spell_monk_tiger_lust : public SpellScriptLoader
{
public:
    spell_monk_tiger_lust() : SpellScriptLoader("spell_monk_tiger_lust") {}

    class spell_monk_tiger_lust_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_tiger_lust_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_MONK_TIGER_LUST) != nullptr;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* target = GetHitUnit())
                target->RemoveMovementImpairingAuras();
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_tiger_lust_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_tiger_lust_SpellScript();
    }
};

class spell_monk_touch_of_karma : public SpellScriptLoader
{
public:
    spell_monk_touch_of_karma() : SpellScriptLoader("spell_monk_touch_of_karma") { }

    class spell_monk_touch_of_karma_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_touch_of_karma_AuraScript);

        uint32 totalAbsorbAmount;

        bool Load() override
        {
            totalAbsorbAmount = 0;
            return true;
        }

        void CalculateAmount(const AuraEffect* /*aurEff*/, int32& amount, bool & /*canBeRecalculated*/)
        {
            if (GetCaster())
                amount = GetCaster()->GetMaxHealth();
        }

        void OnAbsorb(AuraEffect* aurEff, DamageInfo& dmgInfo, uint32& /*absorbAmount*/)
        {
            if (Unit* caster = dmgInfo.GetVictim())
            {
                if (Unit* attacker = dmgInfo.GetAttacker())
                {
                    totalAbsorbAmount += dmgInfo.GetDamage();

                    if (attacker->HasAura(aurEff->GetSpellInfo()->Id, caster->GetGUID()))
                        caster->CastCustomSpell(SPELL_MONK_TOUCH_OF_KARMA_REDIRECT_DAMAGE, SPELLVALUE_BASE_POINT0, (totalAbsorbAmount / 16), attacker);
                }
            }
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_touch_of_karma_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_SCHOOL_ABSORB);
            OnEffectAbsorb += AuraEffectAbsorbFn(spell_monk_touch_of_karma_AuraScript::OnAbsorb, EFFECT_1);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_touch_of_karma_AuraScript();
    }
};

// 101643
class spell_monk_transcendence : public SpellScript
{
public:
    PrepareSpellScript(spell_monk_transcendence);

    void HandleSummon(Creature* creature)
    {
        DespawnSpirit(GetCaster());
        GetCaster()->CastSpell(creature, SPELL_MONK_TRANSCENDENCE_CLONE_TARGET, true);
        creature->CastSpell(creature, SPELL_MONK_MEDITATE_VISUAL, true);
        GetCaster()->Variables.Set(MONK_TRANSCENDENCE_GUID, creature->GetGUID());
    }

    static Creature* GetSpirit(Unit* caster)
    {
        ObjectGuid spiritGuid = caster->Variables.GetValue<ObjectGuid>(MONK_TRANSCENDENCE_GUID, ObjectGuid());

        if (spiritGuid.IsEmpty())
            return nullptr;

        return ObjectAccessor::GetCreature(*caster, spiritGuid);
    }

    static void DespawnSpirit(Unit* caster)
    {
        // Remove previous one if any
        if (Creature* spirit = GetSpirit(caster))
            spirit->DespawnOrUnsummon();

        caster->Variables.Remove(MONK_TRANSCENDENCE_GUID);
    }

    void Register() override
    {
        OnEffectSummon += SpellOnEffectSummonFn(spell_monk_transcendence::HandleSummon);
    }
};

// 101643
class aura_monk_transcendence : public AuraScript
{
    PrepareAuraScript(aura_monk_transcendence);

    void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        spell_monk_transcendence::DespawnSpirit(GetTarget());
    }

    void Register() override
    {
        OnEffectRemove += AuraEffectRemoveFn(aura_monk_transcendence::OnRemove, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};

// 119996 - Transcendence: Transfer
class spell_monk_transcendence_transfer : public SpellScript
{
    PrepareSpellScript(spell_monk_transcendence_transfer);

    SpellCastResult CheckCast()
    {
        Unit* caster = GetCaster();

        if (!caster)
            return SPELL_FAILED_ERROR;

        Unit* spirit = spell_monk_transcendence::GetSpirit(caster);
        if (!spirit)
            return SPELL_FAILED_NO_PET;

        if (!spirit->IsWithinDist(caster, GetSpellInfo()->GetMaxRange(true, caster, GetSpell())))
            return SPELL_FAILED_OUT_OF_RANGE;

        return SPELL_CAST_OK;
    }

    void HandleOnCast()
    {
        Unit* caster = GetCaster();
        if (!caster)
            return;

        Unit* spirit = spell_monk_transcendence::GetSpirit(caster);
        if (!spirit)
            return;

        caster->NearTeleportTo(*spirit, true);
        spirit->NearTeleportTo(*caster, true);
    }

    void Register() override
    {
        OnCheckCast += SpellCheckCastFn(spell_monk_transcendence_transfer::CheckCast);
        OnCast += SpellCastFn(spell_monk_transcendence_transfer::HandleOnCast);
    }
};

// 100780
class spell_monk_jab : public SpellScriptLoader
{
public:
    spell_monk_jab() : SpellScriptLoader("spell_monk_jab") { }

    class spell_monk_jab_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_jab_SpellScript);

    public:
        spell_monk_jab_SpellScript() : SpellScript() { }

        void HandleProc()
        {
            Unit* caster = GetCaster();
            if (AuraEffect* comboBreaker = caster->GetAuraEffect(137384, EFFECT_0))
            {
                if (roll_chance_i(comboBreaker->GetAmount()))
                {
                    uint32 spellId = 116768;
                    if (roll_chance_i(50))
                        spellId = 118864;

                    caster->CastSpell(caster, spellId, true);
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_monk_jab_SpellScript::HandleProc);
        }

    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_jab_SpellScript();
    }
};

class spell_monk_fists_of_fury_visual_filter : public SpellScriptLoader
{
public:
    spell_monk_fists_of_fury_visual_filter() : SpellScriptLoader("spell_monk_fists_of_fury_visual_filter") { }

    class spell_monk_fists_of_fury_visual_filter_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_fists_of_fury_visual_filter_SpellScript);

        void RemoveInvalidTargets(std::list<WorldObject*>& targets)
        {
            targets.remove_if(Trinity::UnitAuraCheck(true, 123154, GetCaster()->GetGUID()));
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_fists_of_fury_visual_filter_SpellScript::RemoveInvalidTargets, EFFECT_1, TARGET_UNIT_CONE_ENEMY_24);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_fists_of_fury_visual_filter_SpellScript();
    }
};

class spell_monk_fists_of_fury_visual : public SpellScriptLoader
{
public:
    spell_monk_fists_of_fury_visual() : SpellScriptLoader("spell_monk_fists_of_fury_visual") { }

    class spell_monk_fists_of_fury_visual_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_fists_of_fury_visual_AuraScript);

        void OnApply(const AuraEffect* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            SetMaxDuration(1000); //The spell doesn't have a duration on WoWHead and never ends if we don't give it one, so one sec should be good
            SetDuration(1000);    //Same as above
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_monk_fists_of_fury_visual_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_fists_of_fury_visual_AuraScript();
    }
};

// 115546 - Provoke
class spell_monk_provoke : public SpellScriptLoader
{
public:
    spell_monk_provoke() : SpellScriptLoader("spell_monk_provoke") { }

    class spell_monk_provoke_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_provoke_SpellScript);

        static uint32 const BlackOxStatusEntry = 61146;

        bool Validate(SpellInfo const* spellInfo) override
        {
            if (!(spellInfo->GetExplicitTargetMask() & TARGET_FLAG_UNIT_MASK)) // ensure GetExplTargetUnit() will return something meaningful during CheckCast
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_PROVOKE_SINGLE_TARGET))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_PROVOKE_AOE))
                return false;
            return true;
        }

        SpellCastResult CheckExplicitTarget()
        {
            if (GetExplTargetUnit()->GetEntry() != BlackOxStatusEntry)
            {
                SpellInfo const* singleTarget = sSpellMgr->AssertSpellInfo(SPELL_MONK_PROVOKE_SINGLE_TARGET);
                SpellCastResult singleTargetExplicitResult = singleTarget->CheckExplicitTarget(GetCaster(), GetExplTargetUnit());
                if (singleTargetExplicitResult != SPELL_CAST_OK)
                    return singleTargetExplicitResult;
            }
            else if (GetExplTargetUnit()->GetOwnerGUID() != GetCaster()->GetGUID())
                return SPELL_FAILED_BAD_TARGETS;

            return SPELL_CAST_OK;
        }

        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            if (GetHitUnit()->GetEntry() != BlackOxStatusEntry)
                GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_PROVOKE_SINGLE_TARGET, true);
            else
                GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_PROVOKE_AOE, true);
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_monk_provoke_SpellScript::CheckExplicitTarget);
            OnEffectHitTarget += SpellEffectFn(spell_monk_provoke_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_provoke_SpellScript();
    }
};

// 116694 - Surging Mist
class spell_monk_surging_mist : public SpellScriptLoader
{
public:
    spell_monk_surging_mist() : SpellScriptLoader("spell_monk_surging_mist") { }

    class spell_monk_surging_mist_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_surging_mist_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_SURGING_MIST_HEAL))
                return false;
            return true;
        }

        void SelectTarget(WorldObject*& target)
        {
            Unit* caster = GetCaster();
            DynamicFieldStructuredView<ObjectGuid> channelObjects = caster->GetChannelObjects();

            if (caster->GetChannelSpellId() == SPELL_MONK_SOOTHING_MIST)
                if (Unit* soothingMistTarget = (channelObjects.size() == 1 ? ObjectAccessor::GetUnit(*target, *channelObjects.begin()) : nullptr))
                    target = soothingMistTarget;
        }

        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_SURGING_MIST_HEAL, true);
        }

        void Register() override
        {
            OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_monk_surging_mist_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_TARGET_ALLY);
            OnEffectHitTarget += SpellEffectFn(spell_monk_surging_mist_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_surging_mist_SpellScript();
    }
};

// 123273 - Surging Mist (Glyphed)
class spell_monk_surging_mist_glyphed : public SpellScriptLoader
{
public:
    spell_monk_surging_mist_glyphed() : SpellScriptLoader("spell_monk_surging_mist_glyphed") { }

    class spell_monk_surging_mist_glyphed_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_surging_mist_glyphed_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_SURGING_MIST_HEAL))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_SOOTHING_MIST))
                return false;
            return true;
        }

        void SelectTarget(std::list<WorldObject*>& targets)
        {
            Unit* caster = GetCaster();
            if (caster->GetChannelSpellId() == SPELL_MONK_SOOTHING_MIST)
            {
                targets.clear();
                DynamicFieldStructuredView<ObjectGuid> channelObjects = caster->GetChannelObjects();

                if (Unit* soothingMistTarget = (channelObjects.size() == 1 ? ObjectAccessor::GetUnit(*caster, *channelObjects.begin()) : nullptr))
                    targets.push_back(soothingMistTarget);
            }
            else
            {
                targets.remove_if([caster](WorldObject* target)
                {
                    return target->GetTypeId() != TYPEID_UNIT || !target->ToUnit()->IsInRaidWith(caster);
                });
                targets.sort(Trinity::HealthPctOrderPred());
                if (!targets.empty())
                    targets.resize(1);
            }

            if (targets.empty())
                targets.push_back(caster);
        }

        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_SURGING_MIST_HEAL, true);
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_surging_mist_glyphed_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_SRC_AREA_ALLY);
            OnEffectHitTarget += SpellEffectFn(spell_monk_surging_mist_glyphed_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_surging_mist_glyphed_SpellScript();
    }
};

// Rising Thunder - 210804
class spell_monk_rising_thunder : public SpellScriptLoader
{
public:
    spell_monk_rising_thunder() : SpellScriptLoader("spell_monk_rising_thunder") { }

    class spell_monk_rising_thunder_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_rising_thunder_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_THUNDER))
                return false;
            return true;
        }

        void HandleEffectProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
        {
            Unit* caster = GetCaster();

            caster->ToPlayer()->GetSpellHistory()->ResetCooldown(SPELL_MONK_THUNDER_FOCUS_TEA, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_rising_thunder_AuraScript::HandleEffectProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_rising_thunder_AuraScript();
    }
};

// Teachings of the Monastery - 116645
class spell_monk_teachings_of_the_monastery : public SpellScriptLoader
{
public:
    spell_monk_teachings_of_the_monastery() : SpellScriptLoader("spell_monk_teachings_of_the_monastery") { }

    class spell_monk_teachings_of_the_monastery_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_teachings_of_the_monastery_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_TEACHINGS_OF_THE_MONASTERY))
                return false;
            return true;
        }

        void HandleEffectProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
        {
            Unit* caster = GetCaster();

            switch (eventInfo.GetSpellInfo()->Id)
            {
                case 100780: //Tiger Palm causes your next Blackout Kick to strike an additional time, stacking up to 3.
                {
                    caster->CastSpell(caster, 202090, true); //Buff which indicates how many times will your BoK hit.
                    break;
                }
                default:
                {
                    break;
                }
            }
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_teachings_of_the_monastery_AuraScript::HandleEffectProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_teachings_of_the_monastery_AuraScript();
    }
};


// Rising Sun Kick - 107428
class spell_monk_rising_sun_kick : public SpellScriptLoader
{
public:
    spell_monk_rising_sun_kick() : SpellScriptLoader("spell_monk_rising_sun_kick") { }

    class spell_monk_rising_sun_kick_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_rising_sun_kick_SpellScript);

        void HandleOnHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!target || !caster)
                return;

            if (caster->HasAura(SPELL_MONK_RISING_THUNDER))
                caster->ToPlayer()->GetSpellHistory()->ResetCooldown(SPELL_MONK_THUNDER_FOCUS_TEA, true);

            if (caster->GetUInt32Value(PLAYER_FIELD_CURRENT_SPEC_ID) == TALENT_SPEC_MONK_BATTLEDANCER)
                caster->CastSpell(target, SPELL_MONK_MORTAL_WOUNDS, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_rising_sun_kick_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_TRIGGER_SPELL);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_rising_sun_kick_SpellScript();
    }
};

// Blackout Kick - 100784
class spell_monk_blackout_kick : public SpellScriptLoader
{
public:
    spell_monk_blackout_kick() : SpellScriptLoader("spell_monk_blackout_kick") { }

    class spell_monk_blackout_kick_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_blackout_kick_SpellScript);

        void HandleOnHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();

            if (caster->HasAura(SPELL_MONK_TEACHINGS_OF_THE_MONASTERY) && roll_chance_i(15)) //15% chance to reset cooldown of RSK
            {
                caster->ToPlayer()->GetSpellHistory()->ResetCooldown(SPELL_MONK_RISING_SUN_KICK, true);
                caster->ToPlayer()->GetSpellHistory()->ResetCharges(sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK)->ChargeCategoryId);
            }

            if (caster->HasAura(202090)) //Teachings of the Monastery
            {
                int stacks = GetCaster()->GetAura(SPELL_MONK_TEACHINGS_OF_THE_MONASTERY_AURA)->GetStackAmount();

                caster->RemoveAurasDueToSpell(SPELL_MONK_TEACHINGS_OF_THE_MONASTERY_AURA);

                SpellNonMeleeDamage dmg(caster, target, GetSpellInfo()->Id, GetSpellInfo()->GetSpellXSpellVisualId(caster), GetSpellInfo()->SchoolMask);
                dmg.damage = GetHitDamage();

                for (int i = 0; i < stacks; ++i)
                {
                    caster->DealSpellDamage(&dmg, false);
                    caster->SendSpellNonMeleeDamageLog(&dmg);
                }
                if (caster->HasAura(SPELL_MONK_SPIRIT_OF_THE_CRANE_AURA)) //Spirit of the Crane
                {
                    int32 amount = int32(0.65f * stacks);
                    caster->CastCustomSpell(caster, SPELL_MONK_SPIRIT_OF_THE_CRANE_MANA, &amount, NULL, NULL, true); //Spirit of the Crane refunds mana
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_blackout_kick_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_blackout_kick_SpellScript();
    }
};

//191840 - Essence Font (Heal)
class spell_monk_essence_font_heal : public SpellScriptLoader
{
public:
    spell_monk_essence_font_heal() : SpellScriptLoader("spell_monk_essence_font_heal") { }

    class spell_monk_essence_font_heal_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_essence_font_heal_SpellScript);

        void FilterTargets(std::list<WorldObject*>& p_Targets)
        {
            if (Unit* caster = GetCaster())
            {
                p_Targets.remove_if([caster](WorldObject* object) -> bool
                {
                    if(object == nullptr || object->ToUnit() == nullptr)
                        return true;

                    Unit* unit = object->ToUnit();

                    if (unit == caster)
                        return true;
                    //If the target has the aura and the aura has more than 5 second duration (meaning it was cast less than 1 second ago) we dont keep it
                    if(unit->HasAura(SPELL_MONK_ESSENCE_FONT_HEAL) && unit->GetAura(SPELL_MONK_ESSENCE_FONT_HEAL)->GetDuration() > 5 * IN_MILLISECONDS)
                        return true;

                    return false;
                });

                if (p_Targets.size() > 1)
                {
                    p_Targets.sort(Trinity::HealthPctOrderPred());
                    p_Targets.resize(1);
                }
            }
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_essence_font_heal_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ALLY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_essence_font_heal_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ALLY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_essence_font_heal_SpellScript();
    }
};

//115313 - Summon Jade Serpent Statue
class spell_monk_jade_serpent_statue : public SpellScriptLoader
{
public:
    spell_monk_jade_serpent_statue() : SpellScriptLoader("spell_monk_jade_serpent_statue") { }

    class spell_monk_jade_serpent_statue_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_jade_serpent_statue_SpellScript);

        void HandleSummon()
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            Player* player = caster->ToPlayer();
            if (!player)
                return;

            std::list<Creature*> serpentStatueList;
            player->GetCreatureListWithEntryInGrid(serpentStatueList, MONK_NPC_JADE_SERPENT_STATUE, 500.0f);

            for (std::list<Creature*>::iterator i = serpentStatueList.begin(); i != serpentStatueList.end(); ++i)
            {
                Unit* owner = (*i)->GetOwner();

                if (owner && owner == player && (*i)->IsSummon())
                    continue;

                i = serpentStatueList.erase(i);
            }

            if ((int32)serpentStatueList.size() >= 1)
                serpentStatueList.back()->ToTempSummon()->UnSummon();
        }

        void Register() override
        {
            OnCast += SpellCastFn(spell_monk_jade_serpent_statue_SpellScript::HandleSummon);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_jade_serpent_statue_SpellScript();
    }
};

//115151 renewing mist
class spell_monk_renewing_mist : public SpellScriptLoader
{
public:
    spell_monk_renewing_mist() : SpellScriptLoader("spell_monk_renewing_mist") { }

    class spell_monk_renewing_mist_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_renewing_mist_SpellScript);

        void HandleHit(SpellEffIndex /*eff*/)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                {
                    caster->CastSpell(target, SPELL_MONK_RENEWING_MIST_PERIODIC);
                }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_renewing_mist_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_renewing_mist_SpellScript();
    }
};

//119611 Renewing Mist
class spell_monk_renewing_mist_periodic : public SpellScriptLoader
{
public:
    spell_monk_renewing_mist_periodic() : SpellScriptLoader("spell_monk_renewing_mist_periodic") { }

    class spell_monk_renewing_mist_periodic_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_renewing_mist_periodic_AuraScript);

        void OnTick(AuraEffect const* /*aurEff*/)
        {
            if(Unit* caster = GetCaster())
                if(Unit* target = GetTarget())
                    if (target->GetHealthPct() >= 100 && target->HasAura(SPELL_MONK_RENEWING_MIST_PERIODIC))
                    {
                        int32 remainingDuration = target->GetAura(SPELL_MONK_RENEWING_MIST_PERIODIC)->GetDuration();
                        std::list<Unit*> targets;
                        Trinity::AnyFriendlyUnitInObjectRangeCheck check(target, target, 25.0f);
                        Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(target, targets, check);
                        Cell::VisitAllObjects(target, searcher, 25.0f);

                        targets.sort(Trinity::HealthPctOrderPred());
                        if(targets.size() > 1)
                            targets.resize(1);

                        caster->CastSpell(targets.front(), SPELL_MONK_RENEWING_MIST_PERIODIC, true);

                        if(targets.front()->HasAura(SPELL_MONK_RENEWING_MIST_PERIODIC))
                        {
                            targets.front()->GetAura(SPELL_MONK_RENEWING_MIST_PERIODIC)->SetDuration(remainingDuration);
                            target->RemoveAura(SPELL_MONK_RENEWING_MIST_PERIODIC);
                        }
                    }
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_renewing_mist_periodic_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_HEAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_renewing_mist_periodic_AuraScript();
    }
};

//193884 Soothing Mist
class spell_monk_soothing_mist_aura : public SpellScriptLoader
{
public:
    spell_monk_soothing_mist_aura() : SpellScriptLoader("spell_monk_soothing_mist_aura") { }

    class spell_monk_soothing_mist_aura_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_soothing_mist_aura_AuraScript);

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
        {
            if (Unit* caster = GetCaster())
                if(eventInfo.GetProcTarget())
                    caster->CastSpell(eventInfo.GetActionTarget(), SPELL_MONK_SOOTHING_MIST, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_soothing_mist_aura_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_soothing_mist_aura_AuraScript();
    }
};

class spell_monk_fists_of_fury : public SpellScriptLoader
{
public:
    spell_monk_fists_of_fury() : SpellScriptLoader("spell_monk_fists_of_fury") { }

    class spell_monk_fists_of_fury_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_fists_of_fury_AuraScript);

        void HandlePeriodic(AuraEffect const* aurEff)
        {
            Unit* caster = GetCaster();
            if(!caster)
                return;

            if(aurEff->GetTickNumber() % 6 == 0)
                caster->CastSpell(GetTarget(), SPELL_MONK_FISTS_OF_FURY_DAMAGE, true);
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_fists_of_fury_AuraScript::HandlePeriodic, EFFECT_2, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_fists_of_fury_AuraScript();
    }
};

class spell_monk_fists_of_fury_damage : public SpellScriptLoader
{
public:
    spell_monk_fists_of_fury_damage() : SpellScriptLoader("spell_monk_fists_of_fury_damage") { }

    class spell_monk_fists_of_fury_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_fists_of_fury_damage_SpellScript);

        void HandleDamage(SpellEffIndex /*effIndex*/)
        {
            if (!GetCaster())
                return;

            Unit* l_Target = GetHitUnit();
            Player* l_Player = GetCaster()->ToPlayer();

            if (l_Target == nullptr || l_Player == nullptr)
                return;

            int32 l_Damage = l_Player->GetTotalAttackPowerValue(BASE_ATTACK) * 5.25f;
            l_Damage = l_Player->SpellDamageBonusDone(l_Target, GetSpellInfo(), l_Damage, SPELL_DIRECT_DAMAGE, GetSpellInfo()->GetEffect(EFFECT_0));
            l_Damage = l_Target->SpellDamageBonusTaken(l_Player, GetSpellInfo(), l_Damage, SPELL_DIRECT_DAMAGE, GetSpellInfo()->GetEffect(EFFECT_0));

            SetHitDamage(l_Damage);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_fists_of_fury_damage_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_fists_of_fury_damage_SpellScript();
    }
};

class spell_monk_life_cocoon : public SpellScriptLoader
{
public:
    spell_monk_life_cocoon() : SpellScriptLoader("spell_monk_life_cocoon") { }

    class spell_monk_life_cocoon_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_life_cocoon_AuraScript);

        void CalcAbsorb(AuraEffect const* /*aurEff*/, int32& amount, bool& canBeRecalculated)
        {
            if(!GetCaster())
                return;
            Unit* caster = GetCaster();

            //Formula:  [(((Spell power * 31.164) + 0)) * (1 + $versadmg)]
            //Simplified to : [(Spellpower * 31.164)]
            //Versatility will be taken into account at a later date.
            amount += caster->GetTotalSpellPowerValue(GetSpellInfo()->GetSchoolMask(), true) * 31.164;
            canBeRecalculated = false;
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_life_cocoon_AuraScript::CalcAbsorb, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_life_cocoon_AuraScript();
    }
};

// Spell 124503
// AT ID : 3282
struct at_monk_gift_of_the_ox_sphere : AreaTriggerAI
{
    uint32 pickupDelay;

    at_monk_gift_of_the_ox_sphere(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger)
    {
        pickupDelay = 1000;
    }

    enum SpellsUsed
    {
        SPELL_MONK_GIFT_OF_THE_OX_HEAL      = 178173,
        SPELL_MONK_HEALING_SPHERE_COOLDOWN  = 224863
    };

    void OnUpdate(uint32 diff)  override
    {
        if (pickupDelay >= diff)
            pickupDelay -= diff;
        else
            pickupDelay = 0;
    }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
        {
            if (unit == caster && !pickupDelay)
            {
                caster->CastSpell(caster, SPELL_MONK_GIFT_OF_THE_OX_HEAL, true);
                at->Remove();
            }
        }
    }

    void OnRemove() override
    {
        //Todo : Remove cooldown
        if (Unit* caster = at->GetCaster())
            if(caster->HasAura(SPELL_MONK_HEALING_SPHERE_COOLDOWN))
                caster->RemoveAura(SPELL_MONK_HEALING_SPHERE_COOLDOWN);
    }
};

//124502 - Gift of the Ox
class spell_monk_gift_of_the_ox_aura : public PlayerScript
{
public:
    spell_monk_gift_of_the_ox_aura() : PlayerScript("spell_monk_gift_of_the_ox_aura") {}

    enum UsedSpells
    {
        SPELL_MONK_HEALING_SPHERE_COOLDOWN  = 224863
    };

    std::vector<uint32> spellsToCast
    {
        SPELL_MONK_GIFT_OF_THE_OX_AT_RIGHT,
        SPELL_MONK_GIFT_OF_THE_OX_AT_LEFT,
    };

    void OnTakeDamage(Player* victim, uint32 damage, SpellSchoolMask /*school*/) override
    {
        if(!damage || !victim)
            return;

        if(!victim->HasAura(SPELL_MONK_GIFT_OF_THE_OX_AURA))
            return;

        uint32 spellToCast = spellsToCast[urand(0, (spellsToCast.size() - 1))];

        if(roll_chance_i((0.75 * damage / victim->GetMaxHealth()) * (3 - 2 * (victim->GetHealthPct() / 100)) * 100))
        {
            if (!victim->HasAura(SPELL_MONK_HEALING_SPHERE_COOLDOWN))
            {
                victim->CastSpell(victim, SPELL_MONK_HEALING_SPHERE_COOLDOWN, true);
                victim->CastSpell(victim, spellToCast, true);
            }
        }
    }

};

// 117906 - Mastery : Elusive Brawler
class spell_monk_elusive_brawler_mastery : public AuraScript
{
    PrepareAuraScript(spell_monk_elusive_brawler_mastery);

    bool CheckProc(ProcEventInfo& eventInfo)
    {
        if (eventInfo.GetTypeMask() & TAKEN_HIT_PROC_FLAG_MASK)
            return true;

        return eventInfo.GetProcSpell() &&
              (eventInfo.GetProcSpell()->GetSpellInfo()->Id == SPELL_MONK_BLACKOUT_STRIKE ||
               eventInfo.GetProcSpell()->GetSpellInfo()->Id == SPELL_MONK_BREATH_OF_FIRE);
    }

    void Register() override
    {
        DoCheckProc += AuraCheckProcFn(spell_monk_elusive_brawler_mastery::CheckProc);
    }
};

// 195630 - Elusive Brawler
class spell_monk_elusive_brawler_stacks : public AuraScript
{
    PrepareAuraScript(spell_monk_elusive_brawler_stacks);

    bool CheckProc(ProcEventInfo& eventInfo)
    {
        if (!(eventInfo.GetHitMask() & PROC_HIT_DODGE))
            return false;

        if (Aura* elusiveBrawler = GetCaster()->GetAura(SPELL_MONK_ELUSIVE_BRAWLER, GetCaster()->GetGUID()))
            elusiveBrawler->SetDuration(0);

        return true;
    }

    void Register() override
    {
        DoCheckProc += AuraCheckProcFn(spell_monk_elusive_brawler_stacks::CheckProc);
    }
};

// Dampen Harm - 122278
class spell_monk_dampen_harm : public SpellScriptLoader
{
public:
    spell_monk_dampen_harm() : SpellScriptLoader("spell_monk_dampen_harm") { }
    class spell_monk_dampen_harm_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_dampen_harm_AuraScript);
        int32 healthPct;

        bool Load() override
        {
            healthPct = GetSpellInfo()->GetEffect(EFFECT_0)->CalcValue(GetCaster());
            return GetUnitOwner()->ToPlayer();
        }

        void CalculateAmount(AuraEffect const* /*auraEffect*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            amount = -1;
        }

        void Absorb(AuraEffect* auraEffect, DamageInfo& dmgInfo, uint32& absorbAmount)
        {
            Unit* target = GetTarget();
            uint32 health = target->CountPctFromMaxHealth(healthPct);
            if (dmgInfo.GetDamage() < health)
                return;

            absorbAmount = dmgInfo.GetDamage() * (GetSpellInfo()->GetEffect(EFFECT_0)->CalcValue(GetCaster()) / 100);
            auraEffect->GetBase()->DropCharge();
        }
        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_dampen_harm_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
            OnEffectAbsorb += AuraEffectAbsorbFn(spell_monk_dampen_harm_AuraScript::Absorb, EFFECT_0);
        }
    };
    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_dampen_harm_AuraScript();
    }
};

// Chi Burst damage - 123986
// AreaTriggerID - 5302
struct at_monk_chi_burst_damage : AreaTriggerAI
{
    at_monk_chi_burst_damage(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_MONK_CHI_BURST_DAMAGE, true);
    }
};

// Chi Burst heal - 123986
// AreaTriggerID - 5300
struct at_monk_chi_burst_heal : AreaTriggerAI
{
    at_monk_chi_burst_heal(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (caster->IsValidAssistTarget(unit))
                caster->CastSpell(unit, SPELL_MONK_CHI_BURST_HEAL, true);
    }
};

// Chi Burst heal - 130654
class spell_monk_chi_burst_heal : public SpellScriptLoader
{
public:
    spell_monk_chi_burst_heal() : SpellScriptLoader("spell_monk_chi_burst_heal") {}

    class spell_monk_chi_burst_heal_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_burst_heal_SpellScript);

        void HandleHeal(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* unit = GetHitUnit();
            if (!caster || !unit)
                return;

            SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(SPELL_MONK_CHI_BURST_HEAL);
            if (!spellInfo)
                return;
            SpellEffectInfo const* effectInfo = spellInfo->GetEffect(EFFECT_0);
            if (!effectInfo)
                return;

            int32 damage = (float)caster->GetTotalAttackPowerValue(BASE_ATTACK) * 4.125f;
            damage = caster->SpellDamageBonusDone(unit, spellInfo, damage, HEAL, effectInfo);
            damage = unit->SpellDamageBonusTaken(caster, spellInfo, damage, HEAL, effectInfo);

            SetHitHeal(damage);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_chi_burst_heal_SpellScript::HandleHeal, EFFECT_0, SPELL_EFFECT_HEAL);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_chi_burst_heal_SpellScript();
    }
};

//197915
class spell_monk_lifecycles : public SpellScriptLoader
{
public:
    spell_monk_lifecycles() : SpellScriptLoader("spell_monk_lifecycles") { }

    class spell_monk_lifecycles_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_lifecycles_AuraScript);

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& procInfo)
        {
            Unit* caster = GetCaster();

            if (!caster || !procInfo.GetSpellInfo())
                return;

            if (procInfo.GetSpellInfo()->Id == SPELL_MONK_VIVIFY)
                caster->CastSpell(caster, SPELL_MONK_LIFECYCLES_ENVELOPING_MIST, true);

            if (procInfo.GetSpellInfo()->Id == SPELL_MONK_ENVELOPING_MIST_HEAL)
                caster->CastSpell(caster, SPELL_MONK_LIFECYCLES_VIVIFY, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_lifecycles_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_lifecycles_AuraScript();
    }
};

//5484
struct at_monk_song_of_chiji : AreaTriggerAI
{
    at_monk_song_of_chiji(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    /*void OnSetCreatePosition(Unit* caster, Position& startPos, Position& endPos, std::list<Position>& path) override
    {
        if (!caster)
            return;

        if (!caster->ToPlayer())
            return;

        startPos = caster->GetPosition();
        at->SetLinearMove(caster, startPos, endPos, path, 40.0f);
    }*/

    void OnUnitEnter(Unit* unit) override
    {
        Unit* caster = at->GetCaster();

        if (!caster || !unit)
            return;

        if (!caster->ToPlayer())
            return;

        if(unit != caster && caster->IsValidAttackTarget(unit))
            caster->CastSpell(unit, SPELL_MONK_SONG_OF_CHIJI, true);
    }
};

//137639
class spell_monk_storm_earth_and_fire : public AuraScript
{
    PrepareAuraScript(spell_monk_storm_earth_and_fire);

    void HandleApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        Unit* target = GetTarget();
        target->CastSpell(target, SPELL_MONK_SEF_STORM_VISUAL, true);
        target->CastSpell(target, SPELL_MONK_SEF_SUMMON_EARTH, true);
        target->CastSpell(target, SPELL_MONK_SEF_SUMMON_FIRE,  true);
    }

    void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        GetTarget()->RemoveAurasDueToSpell(SPELL_MONK_SEF_STORM_VISUAL);

        if (Creature* fireSpirit = GetTarget()->GetSummonedCreatureByEntry(NPC_FIRE_SPIRIT))
            fireSpirit->ToTempSummon()->DespawnOrUnsummon();

        if (Creature* earthSpirit = GetTarget()->GetSummonedCreatureByEntry(NPC_EARTH_SPIRIT))
            earthSpirit->ToTempSummon()->DespawnOrUnsummon();
    }

    void Register() override
    {
        OnEffectApply  +=  AuraEffectApplyFn(spell_monk_storm_earth_and_fire::HandleApply,  EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER, AURA_EFFECT_HANDLE_REAL);
        OnEffectRemove += AuraEffectRemoveFn(spell_monk_storm_earth_and_fire::HandleRemove, EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER, AURA_EFFECT_HANDLE_REAL);
    }
};

// 69791 - 69792
struct npc_monk_sef_spirit : public ScriptedAI
{
    npc_monk_sef_spirit(Creature* creature) : ScriptedAI(creature) {}

    void IsSummonedBy(Unit* summoner)
    {
        me->SetLevel(summoner->getLevel());
        summoner->CastSpell(me, SPELL_MONK_TRANSCENDENCE_CLONE_TARGET, true);
        me->CastSpell(me, me->GetEntry() == NPC_FIRE_SPIRIT ? SPELL_MONK_SEF_FIRE_VISUAL : SPELL_MONK_SEF_EARTH_VISUAL, true);
        me->CastSpell(me, SPELL_MONK_SEF_SUMMONS_STATS, true);

        if (Unit* target = ObjectAccessor::GetUnit(*summoner, summoner->GetTarget()))
            me->CastSpell(target, SPELL_MONK_SEF_CHARGE, true);
    }
};

class playerScript_monk_earth_fire_storm : public PlayerScript
{
public:
    playerScript_monk_earth_fire_storm() : PlayerScript("playerScript_monk_earth_fire_storm") {}

    void OnSuccessfulSpellCast(Player* player, Spell* spell) override
    {
        SpellInfo const* spellInfo = spell->GetSpellInfo();
        if (player->HasAura(SPELL_MONK_SEF) && !spellInfo->IsPositive())
        {
            if (Unit* target = ObjectAccessor::GetUnit(*player, player->GetTarget()))
            {
                if (Creature* fireSpirit = player->GetSummonedCreatureByEntry(NPC_FIRE_SPIRIT))
                    fireSpirit->CastSpell(target, spellInfo->Id, true);

                if (Creature* earthSpirit = player->GetSummonedCreatureByEntry(NPC_EARTH_SPIRIT))
                    earthSpirit->CastSpell(target, spellInfo->Id, true);
            }
        }
    }
};

/*
END OF STORM EARTH AND FIRE
*/

//115399
class spell_monk_black_ox_brew : public SpellScriptLoader
{
public:
    spell_monk_black_ox_brew() : SpellScriptLoader("spell_monk_black_ox_brew") { }

    class spell_monk_black_ox_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_black_ox_brew_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            caster->GetSpellHistory()->ResetCharges(sSpellMgr->GetSpellInfo(SPELL_MONK_PURIFYING_BREW)->ChargeCategoryId);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_black_ox_brew_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_ENERGIZE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_black_ox_brew_SpellScript();
    }
};

//122280
class spell_monk_healing_elixirs_aura : public SpellScriptLoader
{
public:
    spell_monk_healing_elixirs_aura() : SpellScriptLoader("spell_monk_healing_elixirs_aura") { }
    class spell_monk_healing_elixirs_aura_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_healing_elixirs_aura_AuraScript);
        void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
        {
            PreventDefaultAction();
            if (!GetCaster())
                return;
            if (!eventInfo.GetDamageInfo())
                return;
            if (!eventInfo.GetDamageInfo()->GetDamage())
                return;
            if (Unit* caster = GetCaster())
            {
                if (caster->HealthBelowPctDamaged(35, eventInfo.GetDamageInfo()->GetDamage()))
                {
                    caster->CastSpell(caster, SPELL_MONK_HEALING_ELIXIRS_RESTORE_HEALTH, true);
                    caster->GetSpellHistory()->ConsumeCharge(SPELL_MONK_HEALING_ELIXIRS_RESTORE_HEALTH);
                }
            }
        }
        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_healing_elixirs_aura_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
        }
    };
    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_healing_elixirs_aura_AuraScript();
    }
};

//202162 - Guard
class spell_monk_guard : public SpellScriptLoader
{
public:
    spell_monk_guard() : SpellScriptLoader("spell_monk_guard") { }

    class spell_monk_guard_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_guard_AuraScript);

        void CalcAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            amount = (caster->GetTotalAttackPowerValue(BASE_ATTACK) * 18);
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_guard_AuraScript::CalcAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_guard_AuraScript();
    }
};

// Whirling Dragon Punch - 152175
class playerScript_monk_whirling_dragon_punch : public PlayerScript
{
public:
    playerScript_monk_whirling_dragon_punch() : PlayerScript("playerScript_monk_whirling_dragon_punch") {}

    void OnCooldownStart(Player* player, SpellInfo const* spellInfo, uint32 /*itemId*/, int32& cooldown, uint32& /*categoryId*/, int32& /*categoryCooldown*/) override
    {
        if (spellInfo->Id == SPELL_MONK_FISTS_OF_FURY)
        {
            SpellInfo const* risingSunKickInfo  = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
            ApplyCasterAura(player, cooldown, player->GetSpellHistory()->GetChargeRecoveryTime(risingSunKickInfo->ChargeCategoryId));
        }
    }

    void OnChargeRecoveryTimeStart(Player* player, uint32 chargeCategoryId, int32& chargeRecoveryTime) override
    {
        SpellInfo const* risingSunKickInfo = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
        if (risingSunKickInfo->ChargeCategoryId == chargeCategoryId)
        {
            SpellInfo const* fistsOfFuryInfo = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
            ApplyCasterAura(player, chargeRecoveryTime, player->GetSpellHistory()->GetRemainingCooldown(fistsOfFuryInfo));
        }
    }

private:
    void ApplyCasterAura(Player* player, int32 cooldown1, int32 cooldown2)
    {
        if (cooldown1 > 0 && cooldown2 > 0)
        {
            uint32 whirlingDragonPunchAuraDuration = std::min(cooldown1, cooldown2);
            player->CastSpell(player, SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA, true);

            if (Aura* aura = player->GetAura(SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA))
                aura->SetDuration(whirlingDragonPunchAuraDuration);
        }
    }
};

// Whirling Dragon Punch - 152175
class spell_monk_whirling_dragon_punch : public AuraScript
{
    PrepareAuraScript(spell_monk_whirling_dragon_punch);

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (GetCaster())
            GetCaster()->CastSpell(GetCaster(), SPELL_MONK_WHIRLING_DRAGON_PUNCH_DAMAGE, true);
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_whirling_dragon_punch::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// 100780
class spell_monk_tiger_palm : public SpellScript
{
    PrepareSpellScript(spell_monk_tiger_palm);

    void HandleHit(SpellEffIndex /*effIndex*/)
    {
        if (Aura* powerStrikes = GetCaster()->GetAura(SPELL_MONK_POWER_STRIKES_AURA))
        {
            SetEffectValue(GetEffectValue() + powerStrikes->GetEffect(EFFECT_0)->GetBaseAmount());
            powerStrikes->Remove();
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_monk_tiger_palm::HandleHit, EFFECT_1, SPELL_EFFECT_ENERGIZE);
    }
};

// 116844 Ring of Peace 
/// 7.2.5
class at_spell_monk_ring_of_peace : public AreaTriggerEntityScript
{
public:
    at_spell_monk_ring_of_peace() : AreaTriggerEntityScript("at_spell_monk_ring_of_peace") { }

    struct at_spell_monk_ring_of_peace_AI : AreaTriggerAI
    {
        at_spell_monk_ring_of_peace_AI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        enum Spells
        {
            SPELL_MONK_RING_OF_PEACE_KNOCKBACK = 237371,
        };

        void OnUnitEnter(Unit* unit) override
        {
            if (Unit* caster = at->GetCaster())
                if (!caster->IsFriendlyTo(unit))
                    caster->CastSpell(unit, SPELL_MONK_RING_OF_PEACE_KNOCKBACK, true);
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_spell_monk_ring_of_peace_AI(areatrigger);
    }
};

// 115098 Chi Wave
// 7.2.5
class spell_monk_chi_wave : public SpellScriptLoader
{
public:
    spell_monk_chi_wave() : SpellScriptLoader("spell_monk_chi_wave") { }

    class spell_monk_chi_wave_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_wave_SpellScript);

        enum Spells
        {
            SPELL_MONK_CHI_WAVE_SCRIPT = 132464,
            SPELL_MONK_CHI_WAVE_DAMAGE = 132467,
            SPELL_MONK_CHI_WAVE_VISUAL = 173527,
        };

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            return ValidateSpellInfo({ SPELL_MONK_CHI_WAVE_SCRIPT, SPELL_MONK_CHI_WAVE_DAMAGE });
        }

        void HandleCast()
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetExplTargetUnit())
                {
                    caster->CastSpell(target, SPELL_MONK_CHI_WAVE_VISUAL, true);
                    caster->CastSpell(target, target->IsFriendlyTo(caster) ? SPELL_MONK_CHI_WAVE_SCRIPT : SPELL_MONK_CHI_WAVE_DAMAGE, true);
                }
        }

        void Register() override
        {
            OnCast += SpellCastFn(spell_monk_chi_wave_SpellScript::HandleCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_chi_wave_SpellScript();
    }
};

// Chi Wave Triggered, 132464(ScriptEffect), 132467 (Damage)
/// 7.2.5
class spell_monk_chi_wave_triggered : public SpellScriptLoader
{
public:
    spell_monk_chi_wave_triggered() : SpellScriptLoader("spell_monk_chi_wave_triggered") { }

    class spell_monk_chi_wave_triggered_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_chi_wave_triggered_AuraScript);

        enum Spells
        {
            SPELL_MONK_CHI_WAVE_SCRIPT = 132464,
            SPELL_MONK_CHI_WAVE_DAMAGE = 132467,
            SPELL_MONK_CHI_WAVE_HEAL = 132463,
            SPELL_MONK_CHI_WAVE_VISUAL = 173527,
        };

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            return ValidateSpellInfo({ SPELL_MONK_CHI_WAVE_SCRIPT, SPELL_MONK_CHI_WAVE_DAMAGE, SPELL_MONK_CHI_WAVE_HEAL });
        }

        void OnApply(AuraEffect const* aurEff, AuraEffectHandleModes mode)
        {
            if (Unit* caster = aurEff->GetCaster())
                if (Unit* target = GetTarget())
                {
                    std::list<Unit*> targetList;
                    caster->GetAnyUnitListInRange(targetList, 25.0f);
                    targetList.remove(target);
                    if (!targetList.empty())
                        if (aurEff->GetAmount() < 7)
                            if (Unit * nextTarget = Trinity::Containers::SelectRandomContainerElement(targetList))
                            {
                                target->CastSpell(nextTarget, SPELL_MONK_CHI_WAVE_VISUAL, true);
                                target->CastCustomSpell(nextTarget->IsFriendlyTo(caster) ? SPELL_MONK_CHI_WAVE_SCRIPT : SPELL_MONK_CHI_WAVE_DAMAGE, SPELLVALUE_BASE_POINT1, aurEff->GetAmount() + 1, nextTarget, true, 0, 0, aurEff->GetCasterGUID());
                            }
                }
        }

        void Register()
        {
            OnEffectApply += AuraEffectApplyFn(spell_monk_chi_wave_triggered_AuraScript::OnApply, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_chi_wave_triggered_AuraScript();
    }
};

// 132464 Chi Wave Script
// 7.2.5
class spell_monk_chi_wave_script : public SpellScriptLoader
{
public:
    spell_monk_chi_wave_script() : SpellScriptLoader("spell_monk_chi_wave_script") { }

    class spell_monk_chi_wave_script_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_wave_script_SpellScript);

        enum Spells
        {
            SPELL_MONK_CHI_WAVE_HEAL = 132463,
        };

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            return ValidateSpellInfo({ SPELL_MONK_CHI_WAVE_HEAL });
        }

        void OnHitTarget(SpellEffIndex effIndex)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                    caster->CastSpell(target, SPELL_MONK_CHI_WAVE_HEAL, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_chi_wave_script_SpellScript::OnHitTarget, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_chi_wave_script_SpellScript();
    }
};

// 228287 Mark of the Crane -> 100780 Tiger Palm, 100784 Blackout Kick, or 107428 Rising Sun Kick
/// 7.1.5
class spell_monk_mark_of_the_crane : public SpellScriptLoader
{
public:
    spell_monk_mark_of_the_crane() : SpellScriptLoader("spell_monk_mark_of_the_crane") { }

    class spell_monk_mark_of_the_crane_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_mark_of_the_crane_SpellScript);

        void HandleHitTarget(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                    caster->CastSpell(target, SPELL_MONK_MARK_OF_THE_CRANE, true);

        }

        void Register() override
        {
            switch (m_scriptSpellId)
            {
            case SPELL_MONK_RISING_SUN_KICK:
                OnEffectHitTarget += SpellEffectFn(spell_monk_mark_of_the_crane_SpellScript::HandleHitTarget, EFFECT_0, SPELL_EFFECT_TRIGGER_SPELL);
                break;
            default:
                OnEffectHitTarget += SpellEffectFn(spell_monk_mark_of_the_crane_SpellScript::HandleHitTarget, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
                break;
            }

        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_mark_of_the_crane_SpellScript();
    }
};

// 101546 Spinning Crane Kick
/// 7.1.5
class spell_monk_spinning_crane_kick : public SpellScriptLoader
{
public:
    spell_monk_spinning_crane_kick() : SpellScriptLoader("spell_monk_spinning_crane_kick") { }

    class spell_monk_spinning_crane_kick_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_spinning_crane_kick_AuraScript);

        uint8 count;

        bool Load()
        {
            count = 0;
            return true;
        }

        void CalculateAmount(AuraEffect const* auraEffect, int32& amount, bool& /*canBeRecalculated*/)
        {
            if (Unit* caster = GetCaster())
            {
                std::list<Unit*> targetList;
                caster->GetAnyUnitListInRange(targetList, 25.0f);

                for (auto itr : targetList)
                    if (itr->HasAura(SPELL_MONK_MARK_OF_THE_CRANE, caster->GetGUID()))
                        count++;

                if (count > 0)
                    amount = count;
            }
        }

        void Register()
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_spinning_crane_kick_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_spinning_crane_kick_AuraScript();
    }
};

// 107270 Spinning Crane Kick Damage
/// 7.2.5
class spell_monk_spinning_crane_kick_damage : public SpellScriptLoader
{
public:
    spell_monk_spinning_crane_kick_damage() : SpellScriptLoader("spell_monk_spinning_crane_kick_damage") { }

    class spell_monk_spinning_crane_kick_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_spinning_crane_kick_damage_SpellScript);

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
            {
                uint32 amount = 0, count = 0;
                std::list<Unit*> targetList;

                caster->GetAttackableUnitListInRange(caster, targetList, 25.0f);

                for (auto itr : targetList)
                    if (itr->HasAura(SPELL_MONK_MARK_OF_THE_CRANE, caster->GetGUID()))
                        count++;

                uint32 damage = GetHitDamage() * 4;
                if (count > 0)
                {
                    AddPct(damage, 40 * count);
                    SetHitDamage(damage);
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_spinning_crane_kick_damage_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_spinning_crane_kick_damage_SpellScript();
    }
};

// 196607 Eye of the Tiger
/// 7.2.5
class spell_monk_eye_of_the_tiger : public SpellScriptLoader
{
public:
    spell_monk_eye_of_the_tiger() : SpellScriptLoader("spell_monk_eye_of_the_tiger") { }

    class spell_monk_eye_of_the_tiger_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_eye_of_the_tiger_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo())
                return eventInfo.GetSpellInfo()->Id == SPELL_MONK_TIGER_PALM;

            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_monk_eye_of_the_tiger_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_eye_of_the_tiger_AuraScript();
    }
};

// 196742 Whirling Dragon Punch Aurastate -> 107428 Rising Sun Kick, 113656 Fists of Fury
// 7.1.5
class spell_monk_whirlwind_dragon_punch_aurastate : public SpellScriptLoader
{
public:
    spell_monk_whirlwind_dragon_punch_aurastate() : SpellScriptLoader("spell_monk_whirlwind_dragon_punch_aurastate") { }

    class spell_monk_whirlwind_dragon_punch_aurastate_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_whirlwind_dragon_punch_aurastate_SpellScript);

        void HandleCast()
        {
            if (Unit* caster = GetCaster())
            {
                // hack, spell no triggerea su cooldown internamente al core
                if (GetSpellInfo()->Id == SPELL_MONK_RISING_SUN_KICK)
                    caster->GetSpellHistory()->AddCooldown(SPELL_MONK_RISING_SUN_KICK, 0, std::chrono::seconds(10));

                uint32 risingSunKick, fistOfFury;
                fistOfFury = caster->GetSpellHistory()->GetRemainingCooldown(sSpellMgr->GetSpellInfo(SPELL_MONK_FISTS_OF_FURY));
                risingSunKick = caster->GetSpellHistory()->GetRemainingCooldown(sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK));

                uint32 dragonPunchAurastateDuration = std::min(fistOfFury, risingSunKick);

                if (dragonPunchAurastateDuration > 0)
                {
                    if (Aura* dragonPunchAurastate = caster->AddAura(SPELL_MONK_WHIRLWIND_DRAGON_PUNCH_AURASTATE, caster))
                    {
                        dragonPunchAurastate->SetMaxDuration(dragonPunchAurastateDuration);
                        dragonPunchAurastate->SetDuration(dragonPunchAurastateDuration);
                    }
                }
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_monk_whirlwind_dragon_punch_aurastate_SpellScript::HandleCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_whirlwind_dragon_punch_aurastate_SpellScript();
    }
};

// 158221 Whirling Dragon Punch damage
// 7.1.5
class spell_monk_whirlwind_dragon_punch_damage : public SpellScriptLoader
{
public:
    spell_monk_whirlwind_dragon_punch_damage() : SpellScriptLoader("spell_monk_whirlwind_dragon_punch_damage") { }

    class spell_monk_whirlwind_dragon_punch_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_whirlwind_dragon_punch_damage_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                    SetHitDamage(GetHitDamage() * 3);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_whirlwind_dragon_punch_damage_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_whirlwind_dragon_punch_damage_SpellScript();
    }
};

// Areatrigger Gift of the Ox 124503 124506
class spell_at_monk_gift_of_the_ox : public AreaTriggerEntityScript
{
public:
    spell_at_monk_gift_of_the_ox() : AreaTriggerEntityScript("spell_at_monk_gift_of_the_ox") { }

    struct spell_at_monk_gift_of_the_oxAI : AreaTriggerAI
    {
        spell_at_monk_gift_of_the_oxAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        uint32 CastTimer = 2000;

        void OnCreate() override
        {
            if (Unit* caster = at->GetCaster())
            {
                if (Aura* healingSphere = caster->GetAura(SPELL_MONK_HEALING_SPHERE))
                {
                    uint32 amount = healingSphere->GetEffect(EFFECT_0)->GetAmount() + 1;
                    healingSphere->GetEffect(EFFECT_0)->SetAmount(amount);
                    healingSphere->RefreshDuration();
                }
                else
                    caster->CastCustomSpell(SPELL_MONK_HEALING_SPHERE, SPELLVALUE_BASE_POINT0, 2, caster, true);
            }
        }

        void OnUpdate(uint32 diff) override
        {
            if (CastTimer <= diff)
            {
                if (Unit* caster = at->GetCaster())
                    if (caster->GetDistance2d(at) <= 1.0f)
                    {
                        // Heals AP * 7.5
                        int32 amount = CalculatePct(caster->GetTotalAttackPowerValue(BASE_ATTACK), 750);
                        caster->CastCustomSpell(SPELL_MONK_GIFT_OF_THE_OX_HEAL, SPELLVALUE_BASE_POINT0, amount, caster, true);
                        at->SetDuration(0);
                    }
            }
            else
                CastTimer -= diff;
        }

        void OnRemove() override
        {
            if (Unit* caster = at->GetCaster())
                if (Aura* healingSphere = caster->GetAura(SPELL_MONK_HEALING_SPHERE))
                {
                    uint32 amount = healingSphere->GetEffect(EFFECT_0)->GetAmount();
                    if (amount > 1)
                        healingSphere->GetEffect(EFFECT_0)->SetAmount(amount - 1);
                    else
                        caster->RemoveAura(SPELL_MONK_HEALING_SPHERE);
                }
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new spell_at_monk_gift_of_the_oxAI(areatrigger);
    }
};

// 115308 Ironskin Brew
/// 7.1.5
class spell_monk_ironskin_brew : public SpellScriptLoader
{
public:
    spell_monk_ironskin_brew() : SpellScriptLoader("spell_monk_ironskin_brew") { }

    class spell_monk_ironskin_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_ironskin_brew_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
            {
                caster->CastSpell(caster, SPELL_MONK_IRONSKIN_BREW_AURASTATE);

                // 196730 Special Delivery
                if (Aura* specialDelivery = caster->GetAura(SPELL_MONK_SPECIAL_DELIVERY))
                    if (roll_chance_i(specialDelivery->GetSpellInfo()->ProcChance))
                        if (Unit* nearbyEnemy = caster->SelectNearbyTarget(nullptr, 10))
                            caster->CastSpell(nearbyEnemy, SPELL_MONK_SPECIAL_DELIVERY_TRIGGERED, true);

                // 196736 Blackout Combo
                if (caster->HasAura(SPELL_MONK_BLACKOUT_COMBO) && caster->HasAura(SPELL_MONK_BLACKOUT_COMBO_AURASTATE))
                {
                    if (Aura* staggerDOT = caster->GetAura(SPELL_MONK_STAGGER_DOT))
                        staggerDOT->GetEffect(EFFECT_1)->SetAmount(staggerDOT->GetEffect(EFFECT_1)->GetAmount() * -1);
                    caster->RemoveAura(SPELL_MONK_BLACKOUT_COMBO_AURASTATE);
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_ironskin_brew_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_ironskin_brew_SpellScript();
    }
};

//  216519 Celestial Fortune
/// 7.1.5
class spell_monk_celestial_fortune : public SpellScriptLoader
{
public:
    spell_monk_celestial_fortune() : SpellScriptLoader("spell_monk_celestial_fortune") { }

    class spell_monk_celestial_fortune_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_celestial_fortune_AuraScript);

        void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetHealInfo()->GetHeal() > 0)
                if (Unit* caster = eventInfo.GetActor())
                    if (roll_chance_i(caster->GetFloatValue(PLAYER_CRIT_PERCENTAGE)))
                        caster->HealBySpell(*eventInfo.GetHealInfo());
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_celestial_fortune_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_celestial_fortune_AuraScript();
    }
};

// 196734 Special Delivery triggered
/// 7.2.5
class spell_monk_special_delivery_triggered : public SpellScriptLoader
{
public:
    spell_monk_special_delivery_triggered() : SpellScriptLoader("spell_monk_special_delivery_triggered") { }

    class spell_monk_special_delivery_triggered_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_special_delivery_triggered_SpellScript);

        void HandleEffect(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                caster->CastSpell(caster, SPELL_MONK_SPECIAL_DELIVERY_DAMAGE, true);
        }

        void Register() override
        {
            OnEffectLaunch += SpellEffectFn(spell_monk_special_delivery_triggered_SpellScript::HandleEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_special_delivery_triggered_SpellScript();
    }
};

//  228563 Blackout Combo Aurastate
/// 7.1.5
class spell_monk_blackout_combo_aurastate : public SpellScriptLoader
{
public:
    spell_monk_blackout_combo_aurastate() : SpellScriptLoader("spell_monk_blackout_combo_aurastate") { }

    class spell_monk_blackout_combo_aurastate_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_blackout_combo_aurastate_AuraScript);

        void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            if (Unit* caster = eventInfo.GetActor())
                switch (eventInfo.GetDamageInfo()->GetSpellInfo()->Id)
                {
                case SPELL_MONK_TIGER_PALM:
                case SPELL_MONK_BREATH_OF_FIRE:
                    caster->RemoveAura(SPELL_MONK_BLACKOUT_COMBO_AURASTATE);
                    break;
                case SPELL_MONK_KEG_SMASH:
                    caster->GetSpellHistory()->ModifyCooldown(SPELL_MONK_IRON_SKIN_BREW, -aurEff->GetAmount() * IN_MILLISECONDS);
                    caster->GetSpellHistory()->ModifyCooldown(SPELL_MONK_PURIFYING_BREW, -aurEff->GetAmount() * IN_MILLISECONDS);
                    caster->RemoveAura(SPELL_MONK_BLACKOUT_COMBO_AURASTATE);
                    break;
                default:
                    break;
                }
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_blackout_combo_aurastate_AuraScript::OnProc, EFFECT_2, SPELL_AURA_DUMMY);
            OnEffectProc += AuraEffectProcFn(spell_monk_blackout_combo_aurastate_AuraScript::OnProc, EFFECT_3, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_blackout_combo_aurastate_AuraScript();
    }
};

//  196736 Blackout Combo
/// 7.1.5
class spell_monk_blackout_combo : public SpellScriptLoader
{
public:
    spell_monk_blackout_combo() : SpellScriptLoader("spell_monk_blackout_combo") { }

    class spell_monk_blackout_combo_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_blackout_combo_AuraScript);

        void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo()->Id != SPELL_MONK_BLACKOUT_STRIKE)
                PreventDefaultAction();
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_blackout_combo_AuraScript::OnProc, EFFECT_4, SPELL_AURA_PROC_TRIGGER_SPELL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_blackout_combo_AuraScript();
    }
};

// 116670 Vivify
/// 7.1.5
class spell_monk_vivify : public SpellScriptLoader
{
public:
    spell_monk_vivify() : SpellScriptLoader("spell_monk_vivify") { }

    class spell_monk_vivify_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_vivify_SpellScript);

        void HandleTargets(std::list<WorldObject*>& targets)
        {
            targets.remove(GetCaster());
            targets.sort(Trinity::HealthPctOrderPred());
            targets.resize(GetSpellInfo()->GetEffect(EFFECT_0)->BasePoints);
            targets.push_back(GetCaster());
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_monk_vivify_SpellScript::HandleTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ALLY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_vivify_SpellScript();
    }
};

// 198898 Song of Chi-Ji
/// 7.1.5
class spell_monk_at_song_of_chi_ji : public AreaTriggerEntityScript
{
public:
    spell_monk_at_song_of_chi_ji() : AreaTriggerEntityScript("spell_monk_at_song_of_chi_ji") { }

    struct spell_monk_at_song_of_chi_ji_AI : AreaTriggerAI
    {
        spell_monk_at_song_of_chi_ji_AI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnCreate()
        {

        }

        void OnUnitEnter(Unit* unit)
        {
            if (Unit* caster = at->GetCaster())
                if (!caster->IsFriendlyTo(unit) && !unit->HasAura(SPELL_MONK_SONG_OF_CHI_JI_STUN))
                    caster->CastSpell(unit, SPELL_MONK_SONG_OF_CHI_JI_STUN, true);
        }

        void OnUpdate(uint32 diff) override
        {
            // TODO: Set areatrigger in motion
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new spell_monk_at_song_of_chi_ji_AI(areatrigger);
    }
};

// 117907 Mastery: Gust of Mists
/// 7.1.5
class spell_monk_gust_of_mists : public SpellScriptLoader
{
public:
    spell_monk_gust_of_mists() : SpellScriptLoader("spell_monk_gust_of_mists") { }

    class spell_monk_gust_of_mists_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_gust_of_mists_AuraScript);

        void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            uint32 triggerSpell = eventInfo.GetDamageInfo()->GetSpellInfo()->Id;
            if (triggerSpell == SPELL_MONK_EFFUSE || triggerSpell == SPELL_MONK_VIVIFY || triggerSpell == SPELL_MONK_RENEWING_MIST || triggerSpell == SPELL_MONK_ENVELOPING_MIST)
                if (Unit* caster = eventInfo.GetActor())
                    if (Unit* target = eventInfo.GetActionTarget())
                        caster->CastSpell(target, SPELL_MONK_GUST_OF_MIST_HEAL, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_gust_of_mists_AuraScript::OnProc, EFFECT_1, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_gust_of_mists_AuraScript();
    }
};

// Grapple Weapon - 117368
class spell_monk_grapple_weapon : public SpellScriptLoader
{
public:
    spell_monk_grapple_weapon() : SpellScriptLoader("spell_monk_grapple_weapon") { }

    class spell_monk_grapple_weapon_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_grapple_weapon_SpellScript);

        void HandleBeforeHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (target->ToPlayer())
                    {
                        Item* mainItem = _player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                        Item* targetMainItem = target->ToPlayer()->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);

                        if (mainItem && targetMainItem)
                        {
                            if (targetMainItem->GetTemplate()->GetBaseItemLevel() > mainItem->GetTemplate()->GetBaseItemLevel())
                            {
                                switch (_player->GetUInt32Value(PLAYER_FIELD_CURRENT_SPEC_ID))
                                {
                                case SPEC_MONK_BREWMASTER:
                                    _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_TANK_UPGRADE, true);
                                    break;
                                case SPEC_MONK_MISTWEAVER:
                                    _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_HEAL_UPGRADE, true);
                                    break;
                                case SPEC_MONK_WINDWALKER:
                                    _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_DPS_UPGRADE, true);
                                    break;
                                default:
                                    break;
                                }
                            }
                        }
                    }
                    else if (target->GetTypeId() == TYPEID_UNIT)
                    {
                        if (target->getLevel() > _player->getLevel())
                        {
                            switch (_player->GetUInt32Value(PLAYER_FIELD_CURRENT_SPEC_ID))
                            {
                            case SPEC_MONK_BREWMASTER:
                                _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_TANK_UPGRADE, true);
                                break;
                            case SPEC_MONK_MISTWEAVER:
                                _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_HEAL_UPGRADE, true);
                                break;
                            case SPEC_MONK_WINDWALKER:
                                _player->CastSpell(_player, SPELL_MONK_GRAPPLE_WEAPON_DPS_UPGRADE, true);
                                break;
                            default:
                                break;
                            }
                        }
                    }
                }
            }
        }

        void Register()
        {
            //BeforeHit += SpellHitFn(spell_monk_grapple_weapon_SpellScript::HandleBeforeHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_grapple_weapon_SpellScript();
    }
};

// Serpent's Zeal - 127722
class spell_monk_serpents_zeal : public SpellScriptLoader
{
public:
    spell_monk_serpents_zeal() : SpellScriptLoader("spell_monk_serpents_zeal") { }

    class spell_monk_serpents_zeal_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_serpents_zeal_AuraScript);

        void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            PreventDefaultAction();

            if (!GetCaster())
                return;

            if (eventInfo.GetActor()->GetGUID() != GetTarget()->GetGUID())
                return;

            if (eventInfo.GetDamageInfo()->GetSpellInfo())
                return;

            if (!(eventInfo.GetDamageInfo()->GetDamage()))
                return;

            if (eventInfo.GetDamageInfo()->GetAttackType() != BASE_ATTACK && eventInfo.GetDamageInfo()->GetAttackType() != OFF_ATTACK)
                return;

            int32 bp = eventInfo.GetDamageInfo()->GetDamage();

            if (Player* _player = GetCaster()->ToPlayer())
            {
                std::list<Creature*> tempList;
                std::list<Creature*> statueList;
                Creature* statue = NULL;

                if (Aura* serpentsZeal = _player->GetAura(aurEff->GetSpellInfo()->Id))
                {
                    if (serpentsZeal->GetStackAmount() < 2)
                        bp /= 4;
                    else
                        bp /= 2;
                }

                _player->GetCreatureListWithEntryInGrid(tempList, MONK_NPC_JADE_SERPENT_STATUE, 100.0f);
                _player->GetCreatureListWithEntryInGrid(statueList, MONK_NPC_JADE_SERPENT_STATUE, 100.0f);

                // Remove other players jade statue
                for (std::list<Creature*>::iterator i = tempList.begin(); i != tempList.end(); ++i)
                {
                    Unit* owner = (*i)->GetOwner();
                    if (owner && owner == _player && (*i)->IsSummon())
                        continue;

                    statueList.remove((*i));
                }

                // you gain Serpent's Zeal causing you to heal nearby injured targets equal to 25% of your auto-attack damage. Stacks up to 2 times.
                _player->CastCustomSpell(_player, SPELL_MONK_EMINENCE_HEAL, &bp, NULL, NULL, true);

                if (statueList.size() == 1)
                {
                    for (auto itrBis : statueList)
                        statue = itrBis;

                    if (statue && (statue->IsPet() || statue->IsGuardian()))
                        if (statue->GetOwner() && statue->GetOwner()->GetGUID() == _player->GetGUID())
                            statue->CastCustomSpell(statue, SPELL_MONK_EMINENCE_HEAL, &bp, NULL, NULL, true, 0, NULL, _player->GetGUID()); // Eminence - statue
                }
            }
        }

        void Register()
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_serpents_zeal_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_serpents_zeal_AuraScript();
    }
};

struct auraData
{
    auraData(uint32 id, ObjectGuid casterGUID) : m_id(id), m_casterGuid(casterGUID) {}
    uint32 m_id;
    ObjectGuid m_casterGuid;
};

// Diffuse Magic - 122783
class spell_monk_diffuse_magic : public SpellScriptLoader
{
public:
    spell_monk_diffuse_magic() : SpellScriptLoader("spell_monk_diffuse_magic") { }

    class spell_monk_diffuse_magic_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_diffuse_magic_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                std::set<auraData*> auraListToRemove;
                Unit::AuraApplicationMap AuraList = _player->GetAppliedAuras();
                for (Unit::AuraApplicationMap::iterator iter = AuraList.begin(); iter != AuraList.end(); ++iter)
                {
                    Aura* aura = iter->second->GetBase();
                    if (!aura)
                        continue;

                    Unit* caster = aura->GetCaster();
                    if (!caster || caster->GetGUID() == _player->GetGUID())
                        continue;

                    if (!caster->IsWithinDist(_player, 40.0f))
                        continue;

                    if (aura->GetSpellInfo()->IsPositive())
                        continue;

                    if (!(aura->GetSpellInfo()->GetSchoolMask() & SPELL_SCHOOL_MASK_MAGIC))
                        continue;

                    _player->AddAura(aura->GetSpellInfo()->Id, caster);

                    if (Aura* targetAura = caster->GetAura(aura->GetSpellInfo()->Id, _player->GetGUID()))
                    {
                        for (int i = 0; i < MAX_SPELL_EFFECTS; ++i)
                        {
                            if (targetAura->GetEffect(i) && aura->GetEffect(i))
                            {
                                AuraEffect* auraEffect = _player->GetAuraEffect(aura->GetSpellInfo()->Id, i);
                                if (!auraEffect)
                                    continue;

                                int32 damage = auraEffect->GetAmount();

                                // need to check auraEffect pointer here !!
                                if (auraEffect->GetAuraType() == SPELL_AURA_PERIODIC_DAMAGE ||
                                    auraEffect->GetAuraType() == SPELL_AURA_PERIODIC_DAMAGE_PERCENT)
                                    damage = caster->SpellDamageBonusDone(_player, aura->GetSpellInfo(), damage, DOT,/*, aura->GetStackAmount()*/NULL);

                                targetAura->GetEffect(i)->SetAmount(damage);
                            }
                        }
                    }

                    auraListToRemove.insert(new auraData(aura->GetSpellInfo()->Id, caster->GetGUID()));
                }

                for (std::set<auraData*>::iterator itr = auraListToRemove.begin(); itr != auraListToRemove.end(); ++itr)
                {
                    _player->RemoveAura((*itr)->m_id);
                    delete (*itr);
                }

                auraListToRemove.clear();
            }
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_diffuse_magic_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_diffuse_magic_SpellScript();
    }
};

// Bear Hug - 127361
class spell_monk_bear_hug : public SpellScriptLoader
{
public:
    spell_monk_bear_hug() : SpellScriptLoader("spell_monk_bear_hug") { }

    class spell_monk_bear_hug_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_bear_hug_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (Unit* target = GetHitUnit())
                    if (Aura* bearHug = target->GetAura(SPELL_MONK_BEAR_HUG, _player->GetGUID()))
                        if (bearHug->GetEffect(1))
                            bearHug->GetEffect(1)->SetAmount(_player->CountPctFromMaxHealth(2));
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_bear_hug_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_bear_hug_SpellScript();
    }
};

// Glyph of Zen Flight - 125893
class spell_monk_glyph_of_zen_flight : public SpellScriptLoader
{
public:
    spell_monk_glyph_of_zen_flight() : SpellScriptLoader("spell_monk_glyph_of_zen_flight") { }

    class spell_monk_glyph_of_zen_flight_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_glyph_of_zen_flight_AuraScript);

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Player* _player = GetTarget()->ToPlayer())
                _player->LearnSpell(SPELL_MONK_ZEN_FLIGHT, false);
        }

        void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Player* _player = GetTarget()->ToPlayer())
                if (_player->HasSpell(SPELL_MONK_ZEN_FLIGHT))
                    _player->RemoveSpell(SPELL_MONK_ZEN_FLIGHT, false, false);
        }

        void Register()
        {
            OnEffectApply += AuraEffectApplyFn(spell_monk_glyph_of_zen_flight_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_monk_glyph_of_zen_flight_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_glyph_of_zen_flight_AuraScript();
    }
};

// Spinning Fire Blossom - 123408
class spell_monk_spinning_fire_blossom_damage : public SpellScriptLoader
{
public:
    spell_monk_spinning_fire_blossom_damage() : SpellScriptLoader("spell_monk_spinning_fire_blossom_damage") { }

    class spell_monk_spinning_fire_blossom_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_spinning_fire_blossom_damage_SpellScript);

        SpellCastResult CheckTarget()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (Unit* target = GetExplTargetUnit())
                    if (_player->IsFriendlyTo(target))
                        return SPELL_FAILED_BAD_TARGETS;

            return SPELL_CAST_OK;
        }

        void HandleAfterHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (target->GetDistance(_player) > 10.0f)
                    {
                        SetHitDamage(int32(GetHitDamage() * 1.5f));
                        _player->CastSpell(target, SPELL_MONK_SPINNING_FIRE_BLOSSOM_ROOT, true);
                    }
                }
            }
        }

        void Register()
        {
            OnCheckCast += SpellCheckCastFn(spell_monk_spinning_fire_blossom_damage_SpellScript::CheckTarget);
            AfterHit += SpellHitFn(spell_monk_spinning_fire_blossom_damage_SpellScript::HandleAfterHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_spinning_fire_blossom_damage_SpellScript();
    }
};

// Spinning Fire Blossom - 115073
class spell_monk_spinning_fire_blossom : public SpellScriptLoader
{
public:
    spell_monk_spinning_fire_blossom() : SpellScriptLoader("spell_monk_spinning_fire_blossom") { }

    class spell_monk_spinning_fire_blossom_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_spinning_fire_blossom_SpellScript);

        void HandleAfterCast()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                std::list<Unit*> tempList;
                std::list<Unit*> targetList;

                _player->GetAnyUnitListInRange(tempList, 50.0f);

                for (auto itr : tempList)
                {
                    if (_player->IsFriendlyTo(itr))
                        continue;

                    if (!_player->isInFront(itr))
                        continue;

                    if (!itr->IsWithinLOSInMap(_player))
                        continue;

                    if (itr->GetGUID() == _player->GetGUID())
                        continue;

                    targetList.push_back(itr);
                }

                if (!targetList.empty())
                {
                    Trinity::Containers::RandomResize(targetList, 1);

                    for (auto itr : targetList)
                        _player->CastSpell(itr, SPELL_MONK_SPINNING_FIRE_BLOSSOM_DAMAGE, true);
                }
                else
                    _player->CastSpell(_player, SPELL_MONK_SPINNING_FIRE_BLOSSOM_MISSILE, true);
            }
        }

        void Register()
        {
            AfterCast += SpellCastFn(spell_monk_spinning_fire_blossom_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_spinning_fire_blossom_SpellScript();
    }
};

// Mana Tea - 115294
class spell_monk_mana_tea : public SpellScriptLoader
{
public:
    spell_monk_mana_tea() : SpellScriptLoader("spell_monk_mana_tea") { }

    class spell_monk_mana_tea_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_mana_tea_SpellScript);

        SpellModifier* spellMod;

        void HandleBeforeCast()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                int32 stacks = 0;

                Aura* aura = nullptr;
                if (Aura* manaTeaStacks = _player->GetAura(SPELL_MONK_MANA_TEA_STACKS))
                {
                    stacks = manaTeaStacks->GetStackAmount();
                    aura = manaTeaStacks;
                }

                int32 newDuration = stacks * IN_MILLISECONDS;

                spellMod = new SpellModifier(aura);
                spellMod->op = SPELLMOD_DURATION;
                spellMod->type = SPELLMOD_FLAT;
                spellMod->spellId = SPELL_MONK_MANA_TEA_REGEN;
                spellMod->value = newDuration;
                spellMod->mask[1] = 0x200000;
                spellMod->mask[2] = 0x1;

                _player->AddSpellMod(spellMod, true);
            }
        }

        void HandleAfterCast()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                _player->AddSpellMod(spellMod, false);
        }

        void Register()
        {
            BeforeCast += SpellCastFn(spell_monk_mana_tea_SpellScript::HandleBeforeCast);
            AfterCast += SpellCastFn(spell_monk_mana_tea_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_mana_tea_SpellScript();
    }

    class spell_monk_mana_tea_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_mana_tea_AuraScript);

        void OnTick(AuraEffect const* aurEff)
        {
            if (GetCaster())
            {
                // remove one charge per tick instead of remove aura on cast
                // "Cancelling the channel will not waste stacks"
                if (Aura* manaTea = GetCaster()->GetAura(SPELL_MONK_MANA_TEA_STACKS))
                {
                    if (manaTea->GetStackAmount() > 1)
                        manaTea->SetStackAmount(manaTea->GetStackAmount() - 1);
                    else
                        GetCaster()->RemoveAura(SPELL_MONK_MANA_TEA_STACKS);
                }
            }
        }

        void Register()
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_mana_tea_AuraScript::OnTick, EFFECT_0, SPELL_AURA_OBS_MOD_POWER);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_mana_tea_AuraScript();
    }
};

// Brewing : Mana Tea - 123766
class spell_monk_mana_tea_stacks : public SpellScriptLoader
{
public:
    spell_monk_mana_tea_stacks() : SpellScriptLoader("spell_monk_mana_tea_stacks") { }

    class spell_monk_mana_tea_stacks_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_mana_tea_stacks_AuraScript);

        uint32 chiConsumed;

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            chiConsumed = 0;
        }

        void SetData(uint32 type, uint32 data)
        {
            while ((chiConsumed += data) >= 4)
            {
                chiConsumed = 0;
                data = data > 4 ? data - 4 : 0;

                if (GetCaster())
                {
                    GetCaster()->CastSpell(GetCaster(), SPELL_MONK_MANA_TEA_STACKS, true);
                    GetCaster()->CastSpell(GetCaster(), SPELL_MONK_PLUS_ONE_MANA_TEA, true);
                }
            }
        }

        void Register()
        {
            AfterEffectApply += AuraEffectApplyFn(spell_monk_mana_tea_stacks_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_monk_mana_tea_stacks_AuraScript();
    }
};

// Chi Burst - 123986
class spell_monk_chi_burst : public SpellScriptLoader
{
public:
    spell_monk_chi_burst() : SpellScriptLoader("spell_monk_chi_burst") { }

    class spell_monk_chi_burst_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_chi_burst_AuraScript);

        void OnApply(AuraEffect const*  /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* aurTarget = GetTarget();

            if (!aurTarget)
                return;

            if (aurTarget)
            {
                if (aurTarget->GetTypeId() == TYPEID_UNIT)
                    if (aurTarget->GetEntry() != 70)
                    {
                        if (aurTarget->HasAura(GetId()))
                            aurTarget->RemoveAurasDueToSpell(GetId());
                    }
                    else
                        return;
            }

            if (Unit* caster = GetCaster())
            {
                if (Creature* chiBurst = caster->SummonCreature(70, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000))
                {
                    if (Unit* target = caster->ToPlayer()->GetSelectedUnit())
                    {
                        chiBurst->SetOwnerGUID(caster->GetGUID());
                        caster->AddAura(GetId(), chiBurst);
                        chiBurst->GetMotionMaster()->MoveCharge(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 10.14286f);          // Normal speed
                    }
                }
            }
        }

        void Register()
        {
            AfterEffectApply += AuraEffectApplyFn(spell_monk_chi_burst_AuraScript::OnApply, EFFECT_1, SPELL_AURA_AREA_TRIGGER, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_chi_burst_AuraScript();
    }
};

// Tigereye Brew - 116740
class spell_monk_tigereye_brew : public SpellScriptLoader
{
public:
    spell_monk_tigereye_brew() : SpellScriptLoader("spell_monk_tigereye_brew") { }

    class spell_monk_tigereye_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_tigereye_brew_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (AuraApplication* aura = _player->GetAuraApplication(SPELL_MONK_TIGEREYE_BREW_STACKS, _player->GetGUID()))
                    {
                        int32 stackAmount = aura->GetBase()->GetStackAmount() * 2;

                        AuraApplication* tigereyeBrew = _player->GetAuraApplication(SPELL_MONK_TIGEREYE_BREW, _player->GetGUID());
                        if (tigereyeBrew)
                            tigereyeBrew->GetBase()->GetEffect(0)->ChangeAmount(stackAmount);

                        _player->RemoveAura(SPELL_MONK_TIGEREYE_BREW_STACKS);
                    }
                }
            }
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_tigereye_brew_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_tigereye_brew_SpellScript();
    }
};

// Clash - 122057 and Clash - 126449
class spell_monk_clash : public SpellScriptLoader
{
public:
    spell_monk_clash() : SpellScriptLoader("spell_monk_clash") { }

    class spell_monk_clash_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_clash_SpellScript);

        void HandleOnHit()
        {
            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (Unit* target = GetHitUnit())
                    {
                        int32 basePoint = 2;
                        _player->CastCustomSpell(target, SPELL_MONK_CLASH_CHARGE, &basePoint, NULL, NULL, true);
                        target->CastSpell(_player, SPELL_MONK_CLASH_CHARGE, true);
                    }
                }
            }
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_clash_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_clash_SpellScript();
    }
};

// Elusive Brew - 115308
class spell_monk_elusive_brew : public SpellScriptLoader
{
public:
    spell_monk_elusive_brew() : SpellScriptLoader("spell_monk_elusive_brew") { }

    class spell_monk_elusive_brew_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_elusive_brew_SpellScript);

        void HandleOnHit()
        {
            int32 stackAmount = 0;

            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    if (AuraApplication* brewStacks = _player->GetAuraApplication(SPELL_MONK_ELUSIVE_BREW_STACKS))
                        stackAmount = brewStacks->GetBase()->GetStackAmount();

                    _player->AddAura(SPELL_MONK_ELUSIVE_BREW, _player);

                    if (AuraApplication* aura = _player->GetAuraApplication(SPELL_MONK_ELUSIVE_BREW))
                    {
                        Aura* elusiveBrew = aura->GetBase();
                        int32 maxDuration = elusiveBrew->GetMaxDuration();
                        int32 newDuration = stackAmount * 1000;
                        elusiveBrew->SetDuration(newDuration);

                        if (newDuration > maxDuration)
                            elusiveBrew->SetMaxDuration(newDuration);

                        _player->RemoveAura(SPELL_MONK_ELUSIVE_BREW_STACKS);
                    }
                }
            }
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_elusive_brew_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_elusive_brew_SpellScript();
    }
};

// Legacy of the Emperor - 115921
class spell_monk_legacy_of_the_emperor : public SpellScriptLoader
{
public:
    spell_monk_legacy_of_the_emperor() : SpellScriptLoader("spell_monk_legacy_of_the_emperor") { }

    class spell_monk_legacy_of_the_emperor_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_legacy_of_the_emperor_SpellScript);

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Player* plr = GetCaster()->ToPlayer())
            {
                std::list<Unit*> groupList;

                plr->GetPartyMembers(groupList);
                if (!groupList.empty())
                    for (auto itr : groupList)
                        plr->CastSpell(itr, SPELL_MONK_LEGACY_OF_THE_EMPEROR, true);
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_legacy_of_the_emperor_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_legacy_of_the_emperor_SpellScript();
    }
};

// Paralysis - 115078
class spell_monk_paralysis : public SpellScriptLoader
{
public:
    spell_monk_paralysis() : SpellScriptLoader("spell_monk_paralysis") { }

    class spell_monk_paralysis_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_paralysis_SpellScript);

        void HandleOnHit()
        {
            if (Unit* caster = GetCaster())
            {
                if (Unit* target = GetHitUnit())
                {
                    if (target->isInBack(caster))
                    {
                        if (AuraApplication* aura = target->GetAuraApplication(115078))
                        {
                            Aura* Paralysis = aura->GetBase();
                            int32 maxDuration = Paralysis->GetMaxDuration();
                            int32 newDuration = maxDuration * 2;
                            Paralysis->SetDuration(newDuration);

                            if (newDuration > maxDuration)
                                Paralysis->SetMaxDuration(newDuration);
                        }
                    }

                    if (target->ToPlayer())
                    {
                        if (AuraApplication* aura = target->GetAuraApplication(115078))
                        {
                            Aura* Paralysis = aura->GetBase();
                            int32 maxDuration = Paralysis->GetMaxDuration();
                            int32 newDuration = maxDuration / 2;
                            Paralysis->SetDuration(newDuration);
                            Paralysis->SetMaxDuration(newDuration);
                        }
                    }
                }
            }
        }

        void Register()
        {
            OnHit += SpellHitFn(spell_monk_paralysis_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_paralysis_SpellScript();
    }
};

// Chi Explosion (Windwalker and Brewmaster) - 152174, 157676
class spell_monk_chi_explosion : public SpellScriptLoader
{
public:
    spell_monk_chi_explosion() : SpellScriptLoader("spell_monk_chi_explosion") { }

    class spell_monk_chi_explosion_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_explosion_SpellScript);

        void HandleOnHit(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            uint32 damage;
            int32 bp;

            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->Effect = 0;
                    const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = 0;

                    switch (_player->GetPower(POWER_CHI))
                    {
                    case 1:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.475f;
                        SetHitDamage(damage);
                        break;
                    case 2:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * (0.475f * _player->GetPower(POWER_CHI));
                        bp = CalculatePct(damage, 50);
                        SetHitDamage(damage);
                        _player->CastCustomSpell(GetHitUnit(), 157680, &bp, NULL, NULL, true);
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->Effect = 0;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = 0;
                        break;
                    case 3:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * (0.475f * _player->GetPower(POWER_CHI));
                        bp = CalculatePct(damage, 50);
                        SetHitDamage(damage);
                        _player->CastCustomSpell(GetHitUnit(), 157680, &bp, NULL, NULL, true);
                        _player->CastSpell(_player, 125195, true);
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->Effect = 0;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = 0;
                        break;
                    case 4:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * (0.475f * _player->GetPower(POWER_CHI));
                        bp = CalculatePct(damage, 50);
                        SetHitDamage(damage);
                        _player->CastCustomSpell(GetHitUnit(), 157680, &bp, NULL, NULL, true);
                        _player->CastSpell(_player, 125195, true);
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->Effect = SPELL_EFFECT_SCHOOL_DAMAGE;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = CalculatePct(damage, 80);
                        break;

                        _player->CastSpell(GetHitUnit(), 157679, true);
                        _player->SetPower(POWER_CHI, -_player->GetPower(POWER_CHI));
                    }
                }
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_chi_explosion_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_chi_explosion_SpellScript();
    }
};

// Chi Explosion (Mistweaver) - 159620
class spell_monk_chi_explosion_mistweaver : public SpellScriptLoader
{
public:
    spell_monk_chi_explosion_mistweaver() : SpellScriptLoader("spell_monk_chi_explosion_mistweaver") { }

    class spell_monk_chi_explosion_mistweaver_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_explosion_mistweaver_SpellScript);

        void HandleOnHit(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            int32 damage;
            int32 heal;
            std::list<Unit*> targetList;

            if (Unit* caster = GetCaster())
            {
                if (Player* _player = caster->ToPlayer())
                {
                    uint32 powerChi = GetCaster()->GetPower(POWER_CHI);

                    switch (powerChi)
                    {
                    case 1:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.7f;
                        SetHitDamage(damage);
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = 0;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_2))->BasePoints = 0;
                        break;
                    case 2:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.7f;
                        SetHitDamage(damage);
                        heal = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.5f;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = heal;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_2))->BasePoints = 0;
                        break;
                    case 3:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.7f;
                        SetHitDamage(damage);
                        heal = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.5f;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = heal;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_2))->BasePoints = heal;
                        break;
                    case 4:
                        damage = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.7f;
                        SetHitDamage(damage);
                        heal = _player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_NATURE) * 0.5f;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_1))->BasePoints = heal;
                        const_cast<SpellEffectInfo*>(GetSpellInfo()->GetEffect(EFFECT_2))->BasePoints = heal;

                        for (uint8 i = 0; i < 8; ++i)
                            GetCaster()->CastSpell(GetHitUnit()->GetPositionX(), GetHitUnit()->GetPositionY(), GetHitUnit()->GetPositionZ(), 157682 + i, true, 0, 0, GetCaster()->GetGUID());
                        break;

                        _player->CastSpell(GetHitUnit(), 157679, true);
                        _player->SetPower(POWER_CHI, -_player->GetPower(POWER_CHI));
                    }
                }
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_chi_explosion_mistweaver_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_chi_explosion_mistweaver_SpellScript();
    }
};

// Chi Explosion (Circle) - 157682, 157683, 157684, 157685, 157686, 157687, 157688, 157689
class spell_monk_chi_explosion_circle : public SpellScriptLoader
{
public:
    spell_monk_chi_explosion_circle() : SpellScriptLoader("spell_monk_chi_explosion_circle") { }

    class spell_monk_chi_explosion_circle_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_chi_explosion_circle_SpellScript);

        void HandleCreateAreaTrigger(SpellEffIndex effIndex)
        {
            if (!GetCaster() || !GetHitDest())
                return;

            PreventHitDefaultEffect(effIndex);
            uint32 radius = 8;

            Position pos = GetHitDest()->GetPosition();

            DynamicObject* dynObj = new DynamicObject(false);
            Map* map = GetCaster()->GetMap();
            if (!dynObj->CreateDynamicObject(map->GenerateLowGuid<HighGuid::DynamicObject>(), GetCaster(), GetSpellInfo(), pos, radius, DYNAMIC_OBJECT_AREA_SPELL, NULL))
            {
                delete dynObj;
                return;
            }

            if (dynObj)
            {
                dynObj->SetDuration(15000);
                GetCaster()->CastSpell(dynObj->GetPositionX(), dynObj->GetPositionY(), dynObj->GetPositionZ(), 157681, true, 0, 0, GetCaster()->GetGUID());
            }
        }

        void Register()
        {
            OnEffectHit += SpellEffectFn(spell_monk_chi_explosion_circle_SpellScript::HandleCreateAreaTrigger, EFFECT_0, SPELL_EFFECT_PERSISTENT_AREA_AURA);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_chi_explosion_circle_SpellScript();
    }
};

// 123986
class areatrigger_monk_chi_burst : public AreaTriggerEntityScript
{
public:
    areatrigger_monk_chi_burst() : AreaTriggerEntityScript("areatrigger_monk_chi_burst") { }

    struct areatrigger_monk_chi_burstAI : AreaTriggerAI
    {
        areatrigger_monk_chi_burstAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        ObjectGuid targetGuid;

        void OnInitialize() override
        {
            if (Unit* caster = at->GetCaster())
                if (Unit* target = caster->ToPlayer()->GetSelectedUnit())
                {
                    if (target->HasAura(123986))
                        at->DestroyForNearbyPlayers();

                    targetGuid = target->GetGUID();
                }
        }

        void OnUnitEnter(Unit* unit) override
        {
            if (Unit* caster = at->GetCaster())
            {
                if (unit == caster)
                    return;

                uint32 spell = caster->IsFriendlyTo(unit) ? SPELL_MONK_CHI_BURST_HEAL : SPELL_MONK_CHI_BURST_DAMAGE;
                caster->CastSpell(unit, spell, true);

                if (Unit* target = ObjectAccessor::GetUnit(*caster, targetGuid))
                {
                    if (unit == target)
                    {
                        if (Creature* trigger = caster->FindNearestCreature(70, 50.0f, true))
                            trigger->DespawnOrUnsummon();

                        at->DestroyForNearbyPlayers();
                    }
                }
            }
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new areatrigger_monk_chi_burstAI(areatrigger);
    }
};

// Detox - 115450
class spell_monk_detox : public SpellScriptLoader
{
public:
    spell_monk_detox() : SpellScriptLoader("spell_monk_detox") { }

    class spell_monk_detox_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_detox_SpellScript);

        SpellCastResult CheckCast()
        {
            Player* player = GetCaster()->ToPlayer();
            Unit* target = GetExplTargetUnit();

            if (target == nullptr || player == nullptr)
                return SPELL_FAILED_DONT_REPORT;

            DispelChargesList l_DispelList;
            uint32 dispelMask = 0;

            /// Create dispel mask by dispel type
            SpellInfo const* spellInfo = GetSpellInfo();
            for (uint8 i = 0; i < 3; ++i)
            {
                if (player->GetPrimarySpecialization() != SPEC_MONK_MISTWEAVER && i == EFFECT_2)
                    continue;

                if (spellInfo->GetEffect(i)->IsEffect())
                {
                    uint32 l_Dispel_type = spellInfo->GetEffect(i)->MiscValue;
                    dispelMask = spellInfo->GetDispelMask(DispelType(l_Dispel_type));
                    target->GetDispellableAuraList(player, dispelMask, l_DispelList);
                }
            }

            DispelChargesList l_TempDispelList = l_DispelList;

            for (std::vector<DispelableAura>::iterator itr = l_TempDispelList.begin(); itr != l_TempDispelList.end(); ++itr)
            {
                if (Aura* l_Aura = itr->GetAura())
                {
                    AuraApplication * aurApp = l_Aura->GetApplicationOfTarget(target->GetGUID());
                    if (aurApp->IsPositive())
                        l_DispelList.erase(itr);
                }

            }

            if (l_DispelList.empty())
                return SPELL_FAILED_NOTHING_TO_DISPEL;

            return SPELL_CAST_OK;
        }

        void HandleDispel(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            Player* player = GetCaster()->ToPlayer();
            if (player && player->GetPrimarySpecialization() != SPEC_MONK_MISTWEAVER)
                return;

            GetSpell()->EffectDispel(effIndex);
        }

        void Register()
        {
            OnCheckCast += SpellCheckCastFn(spell_monk_detox_SpellScript::CheckCast);
            OnEffectHitTarget += SpellEffectFn(spell_monk_detox_SpellScript::HandleDispel, EFFECT_2, SPELL_EFFECT_DISPEL);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_monk_detox_SpellScript();
    }
};

// 222029 - 205414 - Strike of the Windlord
class spell_monk_strike_of_the_windlord : public SpellScriptLoader
{
public:
    spell_monk_strike_of_the_windlord() : SpellScriptLoader("spell_monk_strike_of_the_windlord") { }

    class spell_monk_strike_of_the_windlord_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_strike_of_the_windlord_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                    if (target->GetTypeId() == TYPEID_PLAYER)
                        SetHitDamage(CalculatePct(GetHitDamage(), 60)); // 60% damage in PvP
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_strike_of_the_windlord_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_WEAPON_PERCENT_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_strike_of_the_windlord_SpellScript();
    }
};

// 152173 - Serenity
class spell_monk_serenity : public SpellScriptLoader
{
public:
    spell_monk_serenity() : SpellScriptLoader("spell_monk_serenity") { }

    class spell_monk_serenity_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_serenity_SpellScript);

        void HandleHit()
        {
            if (Player* modOwner = GetCaster()->GetSpellModOwner())
            {
                uint32 chiSpells[24] = { 100784, 101546, 107428, 109080, 113656, 116847, 120086, 125150, 148187, 165403, 178338, 178341, 178342, 178345, 185099, 190823, 205320, 205414, 205523, 212142, 212143, 222029, 228649, 232055 };
                uint32 cost = GetSpellInfo()->GetEffect(EFFECT_0)->BasePoints;
                uint32 cooldown = GetSpellInfo()->GetEffect(EFFECT_3)->BasePoints;

                for (uint8 i = 0; i < 24; ++i)
                {
                    modOwner->ApplySpellMod(chiSpells[i], SPELLMOD_COST, cost);
                    modOwner->ApplySpellMod(chiSpells[i], SPELLMOD_COOLDOWN, cooldown);
                }
            }
        }

        void Register() override
        {
            AfterHit += SpellHitFn(spell_monk_serenity_SpellScript::HandleHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_serenity_SpellScript();
    }
};




void AddSC_monk_spell_scripts()
{
    RegisterAreaTriggerAI(at_monk_gift_of_the_ox_sphere);
    RegisterAreaTriggerAI(at_monk_chi_burst_damage);
    RegisterAreaTriggerAI(at_monk_chi_burst_heal);
    RegisterAreaTriggerAI(at_monk_song_of_chiji);

    new spell_monk_black_ox_brew();
    new spell_monk_blackout_kick();
    new spell_monk_breath_of_fire();
    new spell_monk_chi_burst_heal();
    new spell_monk_chi_torpedo();
    new spell_monk_crackling_jade_knockback();
    new spell_monk_crackling_jade_lightning();
    new spell_monk_crackling_jade_lightning_knockback_proc_aura();
    new spell_monk_dampen_harm();
    RegisterSpellAndAuraScriptPair(spell_monk_disable, aura_monk_disable);
    RegisterAuraScript(spell_monk_elusive_brawler_mastery);
    RegisterAuraScript(spell_monk_elusive_brawler_stacks);
    new spell_monk_energizing_brew();
    new spell_monk_enveloping_mist();
    new spell_monk_essence_font_heal();
    new spell_monk_expel_harm();
    new spell_monk_fists_of_fury();
    new spell_monk_fists_of_fury_damage();
    //new spell_monk_fists_of_fury_stun();
    new spell_monk_fists_of_fury_visual();
    new spell_monk_fists_of_fury_visual_filter();
    new spell_monk_flying_serpent_kick();
    new spell_monk_fortifying_brew();
    new spell_monk_gift_of_the_ox_aura();
    new spell_monk_guard();
    new spell_monk_healing_elixirs_aura();
    new spell_monk_item_s12_4p_mistweaver();
    new spell_monk_jab();
    new spell_monk_jade_serpent_statue();
    new spell_monk_keg_smash();
    new spell_monk_lifecycles();
    new spell_monk_life_cocoon();
    RegisterAuraScript(spell_monk_path_of_blossom);
    new spell_monk_power_strikes();
    new spell_monk_provoke();
    new spell_monk_purifying_brew();
    new spell_monk_renewing_mist();
    new spell_monk_renewing_mist_periodic();
    new spell_monk_ring_of_peace_aura();
    new spell_monk_rising_sun_kick();
    new spell_monk_rising_thunder();
    new spell_monk_roll();
    new spell_monk_roll_trigger();
    new spell_monk_soothing_mist();
    new spell_monk_soothing_mist_aura();
    new spell_monk_spear_hand_strike();
    new spell_monk_stagger_damage();
    new spell_monk_stagger_visual();
    new spell_monk_stance_of_the_sturdy_ox();
    RegisterAuraScript(spell_monk_storm_earth_and_fire);
    new spell_monk_surging_mist();
    new spell_monk_surging_mist_glyphed();
    new spell_monk_teachings_of_the_monastery();
    new spell_monk_tiger_lust();
    new spell_monk_tigereye_brew_stacks();
    RegisterAuraScript(spell_monk_touch_of_death);
    new spell_monk_touch_of_karma();
    RegisterSpellAndAuraScriptPair(spell_monk_transcendence, aura_monk_transcendence);
    RegisterSpellScript(spell_monk_transcendence_transfer);
    new spell_monk_zen_flight_check();
    new spell_monk_zen_pilgrimage();
    new spell_monk_zen_pulse();
    new playerScript_monk_whirling_dragon_punch();
    RegisterAuraScript(spell_monk_whirling_dragon_punch);
    RegisterSpellScript(spell_monk_tiger_palm);

    RegisterCreatureAI(npc_monk_sef_spirit);

    new at_spell_monk_ring_of_peace();
    new spell_monk_chi_wave();
    new spell_monk_chi_wave_triggered();
    new spell_monk_chi_wave_script();
    new spell_monk_mark_of_the_crane();
    new spell_monk_spinning_crane_kick();
    new spell_monk_spinning_crane_kick_damage();
    new spell_monk_eye_of_the_tiger();
    new spell_monk_whirlwind_dragon_punch_aurastate();
    new spell_monk_whirlwind_dragon_punch_damage();
    new spell_at_monk_gift_of_the_ox();
    new spell_monk_ironskin_brew();
    new spell_monk_celestial_fortune();
    new spell_monk_special_delivery_triggered();
    new spell_monk_blackout_combo();
    new spell_monk_blackout_combo_aurastate();
    new spell_monk_vivify();
    new spell_monk_at_song_of_chi_ji();
    new spell_monk_gust_of_mists();
    new spell_monk_grapple_weapon();
    new spell_monk_serpents_zeal();
    new spell_monk_diffuse_magic();
    new spell_monk_bear_hug();
    new spell_monk_glyph_of_zen_flight();
    new spell_monk_spinning_fire_blossom_damage();
    new spell_monk_spinning_fire_blossom();
    new spell_monk_mana_tea();
    new spell_monk_mana_tea_stacks();
    new spell_monk_chi_burst();
    new spell_monk_tigereye_brew();
    new spell_monk_clash();
    new spell_monk_elusive_brew();
    new spell_monk_legacy_of_the_emperor();
    new spell_monk_paralysis();
    new spell_monk_chi_explosion();
    new spell_monk_chi_explosion_mistweaver();
    new spell_monk_chi_explosion_circle();
    new areatrigger_monk_chi_burst();
    new spell_monk_detox();
    new spell_monk_strike_of_the_windlord();
    new spell_monk_serenity();
}
