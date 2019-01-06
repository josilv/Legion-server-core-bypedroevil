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
 
#ifndef _ANTICHEATMGR_H
#define _ANTICHEATMGR_H

#include "Common.h"

enum ReportTypes
{
    SPEED_HACK_REPORT          = 0,
    FLY_HACK_REPORT            = 1,
    WALK_WATER_HACK_REPORT     = 2,
    JUMP_HACK_REPORT           = 3,
    TELEPORT_PLANE_HACK_REPORT = 4,

    MAX_REPORT_TYPES
};

const std::string report_types[MAX_REPORT_TYPES] = {"speed_reports", "fly_reports", "waterwalk_reports", "jump_reports", "teleportplane_reports" };

class TC_GAME_API AnticheatMgr
{
    AnticheatMgr();
    ~AnticheatMgr();

    public:
        static AnticheatMgr* instance();
        void StartHackDetection(Player* player, MovementInfo movementInfo, uint32 opcode);
        void HandleHackDetectionTimer(Player* player, uint32 timeDiff);
        void DisableAnticheatDetection(Player* player, bool teleport = false);
        void DeletePlayerReport(Player* player);
        void JailPlayer(Player* player, bool applyAuras);

    private:
        void SpeedHackDetection(Player* player, MovementInfo movementInfo);
        void FlyHackDetection(Player* player, MovementInfo movementInfo);
        void WalkOnWaterHackDetection(Player* player, MovementInfo movementInfo);
        void JumpHackDetection(Player* player, MovementInfo movementInfo,uint32 opcode);
        void TeleportPlaneHackDetection(Player* player, MovementInfo);
        void BuildReport(Player* player,uint8 reportType);
        void SendAlertToGMs(const std::string& playerName, std::string& reportType);
};

#define sAnticheatMgr AnticheatMgr::instance()
#endif
