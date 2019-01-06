/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Undercity
SD%Complete: 95
SDComment: Quest support: 6628, 9180(post-event).
SDCategory: Undercity
EndScriptData */

/* ContentData
npc_lady_sylvanas_windrunner
npc_highborne_lamenter
EndContentData */

#include "ScriptMgr.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"

/*######
## npc_lady_sylvanas_windrunner
######*/

enum Sylvanas
{
    QUEST_JOURNEY_TO_UNDERCITY      = 9180,

    EMOTE_LAMENT_END                = 0,
    SAY_LAMENT_END                  = 1,
    EMOTE_LAMENT                    = 2,

    // Ambassador Sunsorrow
    SAY_SUNSORROW_WHISPER           = 0,

    SOUND_CREDIT                    = 10896,

    NPC_HIGHBORNE_LAMENTER          = 21628,
    NPC_HIGHBORNE_BUNNY             = 21641,
    NPC_AMBASSADOR_SUNSORROW        = 16287,

    SPELL_HIGHBORNE_AURA            = 37090,
    SPELL_SYLVANAS_CAST             = 36568,
    //SPELL_RIBBON_OF_SOULS         = 34432, the real one to use might be 37099
    SPELL_RIBBON_OF_SOULS           = 37099,

    // Combat spells
    SPELL_BLACK_ARROW               = 59712,
    SPELL_FADE                      = 20672,
    SPELL_FADE_BLINK                = 29211,
    SPELL_MULTI_SHOT                = 59713,
    SPELL_SHOT                      = 59710,
    SPELL_SUMMON_SKELETON           = 59711,

    // Events
    EVENT_FADE                      = 1,
    EVENT_SUMMON_SKELETON           = 2,
    EVENT_BLACK_ARROW               = 3,
    EVENT_SHOOT                     = 4,
    EVENT_MULTI_SHOT                = 5,
    EVENT_LAMENT_OF_THE_HIGHBORN    = 6,
    EVENT_SUNSORROW_WHISPER         = 7,

    GUID_EVENT_INVOKER              = 1,
};

float HighborneLoc[4][3]=
{
    {1285.41f, 312.47f, 0.51f},
    {1286.96f, 310.40f, 1.00f},
    {1289.66f, 309.66f, 1.52f},
    {1292.51f, 310.50f, 1.99f},
};

#define HIGHBORNE_LOC_Y             -61.00f
#define HIGHBORNE_LOC_Y_NEW         -55.50f


/*######
## npc_highborne_lamenter
######*/

class npc_highborne_lamenter : public CreatureScript
{
public:
    npc_highborne_lamenter() : CreatureScript("npc_highborne_lamenter") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_highborne_lamenterAI(creature);
    }

    struct npc_highborne_lamenterAI : public ScriptedAI
    {
        npc_highborne_lamenterAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            EventMoveTimer = 10000;
            EventCastTimer = 17500;
            EventMove = true;
            EventCast = true;
        }

        uint32 EventMoveTimer;
        uint32 EventCastTimer;
        bool EventMove;
        bool EventCast;

        void Reset() override
        {
            Initialize();
        }

        void EnterCombat(Unit* /*who*/) override { }

        void UpdateAI(uint32 diff) override
        {
            if (EventMove)
            {
                if (EventMoveTimer <= diff)
                {
                    me->SetDisableGravity(true);
                    me->MonsterMoveWithSpeed(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW, me->GetDistance(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW) / (5000 * 0.001f));
                    me->SetPosition(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW, me->GetOrientation());
                    EventMove = false;
                } else EventMoveTimer -= diff;
            }
            if (EventCast)
            {
                if (EventCastTimer <= diff)
                {
                    DoCast(me, SPELL_HIGHBORNE_AURA);
                    EventCast = false;
                } else EventCastTimer -= diff;
            }
        }
    };
};

/*######
## AddSC
######*/

void AddSC_undercity()
{
    new npc_highborne_lamenter();
}
