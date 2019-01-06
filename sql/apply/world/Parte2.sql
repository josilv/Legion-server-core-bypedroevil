/*====================
-- Parte 2
====================*/

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19) AND `sourceEntry` IN (14001,14474);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(19, 0, 14001, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, '', 'Lost Isles - Quest Available For Male'),
(19, 0, 14474, 0, 1, 20, 0, 1, 0, 0, 0, 0, 0, '', 'Lost Isles - Quest Available For Female');


-- Goblin Escape Pod (195188)
UPDATE `gameobject_template` SET `Data3`='60000', `Data10`='0' WHERE  `entry`=195188;
UPDATE `gameobject` SET `spawntimesecs`='60' WHERE  `id`=195188;

DELETE FROM `gameobject` WHERE  `guid` IN (82957,82953,82943,141154,82952,82967,141229,82938,82941,82940,141170,82951,82964,82937,82946,82939,82949,82966,82930,82944,82933,82970,82931,82929,82934,82936,82935);
DELETE FROM `gameobject_addon` WHERE  `guid` IN (82957,82953,82943,141154,82952,82967,141229,82938,82941,82940,141170,82951,82964,82937,82946,82939,82949,82966,82930,82944,82933,82970,82931,82929,82934,82936,82935);

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE  `entry`=195188;
DELETE FROM `smart_scripts` WHERE `entryorguid`=195188;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(195188, 1, 0, 1, 70, 0, 100, 0, 2, 0, 0, 0, '', 11, 66137, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Escape Pod - GO State Changed - Cast Goblin Escape Pods: Summon Live Goblin Survivor'),
(195188, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 34748, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Escape Pod - Quest Credit');


-- Goblin Survivor (34748)
UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=34748;

DELETE FROM `smart_scripts` WHERE `entryorguid`=34748;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(34748, 0, 0, 1, 60, 0, 100, 1, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - On Just Summoned - Say Line 0'),
(34748, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 47127, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Cast Emote State: Swim Run'),
(34748, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 29, 0, 0, 24021, 0, 0, 0, 10, 0, 24021, 0, 0, 0, 0, 0, 'Goblin Survivor - Follow Destination'),
(34748, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Despawn');


-- Trainers
UPDATE `creature_template` SET `npcflag`='1' WHERE  `entry` IN (35778,35780,35805,35806,35807,36518,36519,36520,36523,36524,36525);
UPDATE `creature_template` SET `npcflag`='3' WHERE  `entry` IN (35758,35786,36521);
DELETE FROM `npc_trainer` WHERE  `ID`=35807;

