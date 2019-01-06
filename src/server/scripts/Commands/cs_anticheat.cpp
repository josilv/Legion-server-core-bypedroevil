/*
* Copyright (C) 2016-2017 ColossusWoW <https://colossuswow.com/>
*
* Este codigo es de uso exclusivo y privado para la red de gaming
* ColossusWoW está totalmente prohibida su distribución y
* uso en proyectos ajenos, si has obtenido o encontrado este codigo
* publicamente envianos un email a administracion@colossuswow.com
* indicandonos como y donde has obtenido este codigo
*
* Recuerda, no distribuyas, no compartas y no subas este codigo a ningun
* lugar publico, usa siempre nuestros repositorios Git!
*/

#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "Chat.h"
#include "Language.h"
#include "DatabaseEnv.h"
#include "World.h"
#include "RBAC.h"
#include "WorldSession.h"

class anticheat_commandscript : public CommandScript
{
public:
    anticheat_commandscript() : CommandScript("anticheat_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> anticheatCommandTable =
        {
            { "global",     rbac::RBAC_PERM_COMMAND_ANTICHEAT_GLOBAL,   true,   &HandleAntiCheatGlobalCommand,  "" },
            { "player",     rbac::RBAC_PERM_COMMAND_ANTICHEAT_PLAYER,   true,   &HandleAntiCheatPlayerCommand,  "" },
            { "delete",     rbac::RBAC_PERM_COMMAND_ANTICHEAT_DELETE,   true,   &HandleAntiCheatDeleteCommand,  "" },
            { "handle",     rbac::RBAC_PERM_COMMAND_ANTICHEAT_HANDLE,   true,   &HandleAntiCheatHandleCommand,  "" },
            { "jail",       rbac::RBAC_PERM_COMMAND_ANTICHEAT_JAIL,     true,   &HandleAnticheatJailCommand,    "" },
        };

        static std::vector<ChatCommand> commandTable =
        {
            { "anticheat",  rbac::RBAC_PERM_COMMAND_ANTICHEAT,          true,   NULL,                           "",     anticheatCommandTable},
        };

        return commandTable;
    }

    static bool HandleAnticheatWarnCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE))
            return false;

        Player* pTarget = NULL;

        std::string strCommand;

        char* command = strtok((char*)args, " ");

        if (command)
        {
            strCommand = command;
            normalizePlayerName(strCommand);

            //pTarget = sObjectMgr->GetPlayerNameByGUID(strCommand.c_str()); //get player by name
        }else
            pTarget = handler->getSelectedPlayer();

        if (!pTarget)
            return false;

        WorldPacket data;

        // need copy to prevent corruption by strtok call in LineFromMessage original string
        char* buf = strdup("Nuestro sistema AntiCheat ha detectado varias advertencias en uno de tus personajes, tu cuenta sera revisada para evitar falsos positivos.");
        char* pos = buf;

        while (char* line = handler->LineFromMessage(pos))
        {
            handler->SendSysMessage(line);
            pTarget->GetSession()->SendPacket(&data);
        }

        free(buf);
        return true;
    }

    static bool HandleAnticheatJailCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE))
            return false;

        Player* pTarget = NULL;

        std::string strCommand;

        char* command = strtok((char*)args, " ");

        if (command)
        {
            strCommand = command;
            normalizePlayerName(strCommand);

            //pTarget = sObjectMgr->GetPlayerNameByGUID(strCommand.c_str()); //get player by name
        }else
            pTarget = handler->getSelectedPlayer();

        if (!pTarget)
        {
            handler->SendSysMessage(LANG_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (pTarget == handler->GetSession()->GetPlayer())
            return false;

        // teleport both to jail.
        pTarget->TeleportTo(1,16226.5f,16403.6f,-64.5f,3.2f);
        handler->GetSession()->GetPlayer()->TeleportTo(1,16226.5f,16403.6f,-64.5f,3.2f);

        WorldLocation loc;

        // the player should be already there, but no :(
        // pTarget->GetPosition(&loc);

        loc.m_mapId = 1;
        loc.m_positionX = 16226.5f;
        loc.m_positionY = 16403.6f;
        loc.m_positionZ = -64.5f;
        loc.SetOrientation(3.2f);

        pTarget->SetHomebind(loc,876);
        return true;
    }

    static bool HandleAntiCheatDeleteCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE))
            return false;

        std::string strCommand;

        char* command = strtok((char*)args, " "); //get entered name

        if (!command)
            return true;

        strCommand = command;

        if (strCommand.compare("deleteall") == 0)
            CharacterDatabase.PExecute("DELETE FROM players_reports_status;");
        else
        {
            normalizePlayerName(strCommand);
            //Player* pPlayer = sObjectMgr->GetPlayerNameByGUID(strCommand.c_str()); //get player by name

           /* if (!pPlayer)
handler->PSendSysMessage("Player doesn't exist");
else
CharacterDatabase.PExecute("DELETE FROM players_reports_status WHERE guid=%u;",pPlayer->GetGUID().GetCounter());*/
        }

        return true;
    }

    static bool HandleAntiCheatPlayerCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE))
            return false;

        std::string strCommand;

        char* command = strtok((char*)args, " ");

        uint32 uiGUID = 0;
        Player* player = NULL;

        if (command)
        {
            strCommand = command;

            normalizePlayerName(strCommand);
            //player = sObjectMgr->GetPlayerNameByGUID(strCommand.c_str()); //get player by name

            if (player)
                uiGUID = player->GetGUID().GetCounter();
        }else
        {
            player = handler->getSelectedPlayer();
            if (player)
                uiGUID = player->GetGUID().GetCounter();
        }

        if (uiGUID == 0)
        {
            handler->PSendSysMessage("No has seleccionado un jugador.");
            return true;
        }


        uint32 average = player->anticheatData.average;
        uint32 total_reports = player->anticheatData.total_reports;
        uint32 speed_reports = player->anticheatData.type_reports[0];
        uint32 fly_reports = player->anticheatData.type_reports[1];
        uint32 jump_reports = player->anticheatData.type_reports[3];
        uint32 waterwalk_reports = player->anticheatData.type_reports[2];
        uint32 teleportplane_reports = player->anticheatData.type_reports[4];

        handler->PSendSysMessage("Information about player %s", player->GetName().c_str());
        handler->PSendSysMessage("Average: %u || Total Reports: %u ",average,total_reports);
        handler->PSendSysMessage("Speed Reports: %u || Fly Reports: %u || Jump Reports: %u ",speed_reports,fly_reports,jump_reports);
        handler->PSendSysMessage("Walk On Water Reports: %u || Teleport To Plane Reports: %u",waterwalk_reports,teleportplane_reports);

        return true;
    }

    static bool HandleAntiCheatHandleCommand(ChatHandler* handler, const char* args)
    {
        std::string strCommand;

        char* command = strtok((char*)args, " ");

        if (!command)
            return true;

        if (!handler->GetSession()->GetPlayer())
            return true;

        strCommand = command;

        if (strCommand.compare("on") == 0)
        {
            sWorld->setBoolConfig(CONFIG_ANTICHEAT_ENABLE,true);
            handler->SendSysMessage("El sistema AntiCheat ha sido activado");
        }
        else if (strCommand.compare("off") == 0)
        {
            sWorld->setBoolConfig(CONFIG_ANTICHEAT_ENABLE,false);
            handler->SendSysMessage("El sistema AntiCheat ha sido desactivado");
        }

        return true;
    }

    static bool HandleAntiCheatGlobalCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE))
        {
            handler->PSendSysMessage("El sistema AntiCheat esta desactivado");
            return true;
        }

        QueryResult resultDB = CharacterDatabase.Query("SELECT guid,average,total_reports FROM players_reports_status WHERE total_reports != 0 ORDER BY average ASC LIMIT 3;");
        if (!resultDB)
        {
            handler->PSendSysMessage("No se han encontrado jugadores.");
            return true;
        } else
        {
                handler->SendSysMessage("=============================");
                handler->PSendSysMessage("Players with the lowest averages:");
                do
                {
                    Field *fieldsDB = resultDB->Fetch();

                    uint64 guid = fieldsDB[0].GetUInt64();
                    uint32 average = fieldsDB[1].GetUInt32();
                    uint32 total_reports = fieldsDB[2].GetUInt32();

                     if (Player* player = sObjectMgr->GetPlayerByLowGUID(guid))
                         handler->PSendSysMessage("Player: %s Average: %u Total Reports: %u",player->GetName().c_str(),average,total_reports);

                } while (resultDB->NextRow());
        }

        resultDB = CharacterDatabase.Query("SELECT guid,average,total_reports FROM players_reports_status WHERE total_reports != 0 ORDER BY total_reports DESC LIMIT 3;");

        // this should never happen
        if (!resultDB)
        {
            handler->PSendSysMessage("No se han encontrado jugadores.");
            return true;
        } else
        {
            handler->SendSysMessage("=============================");
            handler->PSendSysMessage("Players with the more reports:");
            do
            {
                Field *fieldsDB = resultDB->Fetch();

                uint64 guid = fieldsDB[0].GetUInt64();
                uint32 average = fieldsDB[1].GetUInt32();
                uint32 total_reports = fieldsDB[2].GetUInt32();

                    if (Player* player = sObjectMgr->GetPlayerByLowGUID(guid))
                        handler->PSendSysMessage("Player: %s Total Reports: %u Average: %u",player->GetName().c_str(),total_reports,average);

            } while (resultDB->NextRow());
        }

        return true;
    }
};

void AddSC_anticheat_commandscript()
{
    new anticheat_commandscript();
}
