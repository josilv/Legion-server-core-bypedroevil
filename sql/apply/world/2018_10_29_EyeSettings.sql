/*==========================

-- Settings

==========================*/

DELETE FROM `areatrigger_template_actions` WHERE  `AreaTriggerId`=4842 AND `ActionType`=10 AND `ActionParam`=0;

UPDATE `creature_text` SET `Sound`='0' WHERE  `CreatureID`=91789 AND `GroupID`=9 AND `ID`=0;

UPDATE .`areatrigger_template` SET `ScriptName`='' WHERE  `Id`=9683;

UPDATE .`areatrigger_template` SET `ScriptName`='' WHERE  `Id`=100101;

UPDATE .`areatrigger_template` SET `ScriptName`='' WHERE  `Id`=9574;

