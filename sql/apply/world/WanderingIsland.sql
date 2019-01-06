/*==============================
-- Wandering Island Fixes
==============================*/
-- Spirit Healer (6491)
DELETE FROM `creature` WHERE `guid`=105164;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(105164, 6491, 860, 0, 0, 1, 0, 0, 0, -1, 0, 0, 1475.2, 3468.53, 181.899, 3.62801, 180, 0, 0, 15141, 0, 0, 0, 0, 0, 0, 0, '', 26365);


-- Master Shang Xi (53566)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=53566 AND `SourceEntry`=114746 AND `ConditionValue1`=29408;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 53566, 114746, 0, 0, 9, 0, 29408, 0, 0, 0, 0, 0, '', 'Master Shang Xi - Required Quest Active for Spellclick');


-- Water Pincer (60411)
UPDATE `creature_template` SET `flags_extra`='2' WHERE  `entry`=60411;


-- Plump Virmen (55483)
UPDATE `creature_template` SET `flags_extra`='2' WHERE  `entry`=55483;


-- Injured Sailor (55999)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=55999 AND `SourceEntry`=56685 AND `ConditionValue1`=29794;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 55999, 56685, 0, 0, 9, 0, 29794, 0, 0, 0, 0, 0, '', 'Injured Sailor - Required Quest Active for Spellclick');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=55999 AND `SourceEntry`=129340 AND `ConditionValue1`=29794;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 55999, 129340, 0, 0, 9, 0, 29794, 0, 0, 0, 0, 0, '', 'Injured Sailor - Required Quest Active for Spellclick');


-- Ji Firepaw (57739)
UPDATE `creature_template` SET `AIName`='' WHERE  `entry`=57739;
DELETE FROM `smart_scripts` WHERE `entryorguid`=57739 AND `source_type`=0 AND `id`=0 AND `link`=0;


-- Delivery Cart (57740)
UPDATE `smart_scripts` SET `event_param1`='33' WHERE  `entryorguid`=57740 AND `source_type`=0 AND `id`=7 AND `link`=0;
DELETE FROM `waypoints` WHERE `entry`=57740 AND `pointid` IN (34,35,36,37,38,39);


-- Nourished Yak (57742)
UPDATE `smart_scripts` SET `event_param1`='33' WHERE  `entryorguid`=57742 AND `source_type`=0 AND `id`=4 AND `link`=0;
DELETE FROM `waypoints` WHERE `entry`=57742 AND `pointid` IN (34,35,36,37,38,39);


-- Dai-Lo Farmer (65473)
DELETE FROM `creature_text` WHERE `CreatureID`=65473;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(65473, 0, 0, 'I will protect this land with my life!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dai-Lo Farmer');

DELETE FROM `smart_scripts` WHERE `entryorguid`=65473;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(65473, 0, 0, 0, 0, 0, 100, 0, 2000, 5000, 5000, 8000, '', 11, 128435, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dai-Lo Farmer - Cast Palm Strike'),
(65473, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 8000, 12000, '', 11, 128436, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dai-Lo Farmer - Cast Round Kick');


-- Dai-Lo Farmer (56241)
DELETE FROM `creature_text` WHERE `CreatureID`=56241;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(56241, 0, 0, 'I will protect this land with my life!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dai-Lo Farmer');


-- Escaped Horde Crewman (60854)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=60854;

DELETE FROM `creature_text` WHERE `CreatureID`=60854;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(60854, 0, 0, 'For the Horde!', 12, 0, 100, 0, 0, 0, 0, 0, 'Escaped Horde Crewman');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60854;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60854, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, '', 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Escaped Horde Crewman - On Respawn - Set React State'),
(60854, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 8000, 12000, '', 11, 128510, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Escaped Horde Crewman - Update IC - Cast Double Thrust');


-- Skyseeker Sailor (57317)
DELETE FROM `creature_text` WHERE `CreatureID`=57317;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(57317, 0, 0, 'For the Alliance!', 12, 0, 100, 0, 0, 0, 0, 0, 'Skyseeker Sailor');


-- Jojo Ironbrow (56419)
DELETE FROM `creature_text` WHERE `CreatureID`=56419;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(56419, 0, 0, 'I will protect Shen-zin Su with my life!', 12, 0, 100, 0, 0, 0, 0, 0, 'Jojo Ironbrow');


-- Horde Phase Area
DELETE FROM `phase_area` WHERE `AreaId`=14 AND `PhaseId` IN (1164,1165);
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES 
(14, 1164, 'Durotar (Panda) - Phase 1164 After Quest 31450 Complete and Before Quest 31012 Taken');

DELETE FROM `phase_area` WHERE `AreaId`=1637 AND `PhaseId` IN (1164,1165);
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES 
(1637, 1164, 'Orgrimmar (Panda) - Phase 1164 After Quest 31012 Complete and Before Quest 31012 Rewarded');


-- Horde Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup`=1164 AND `SourceEntry`=14 AND `ConditionValue1` IN (31012,31450);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(26, 1164, 14, 0, 0, 47, 0, 31450, 66, 0, 0, 0, 0, '', 'Durotar (Panda) - Phase 1164 On When Quest 31450 is Complete or Rewarded'),
(26, 1164, 14, 0, 0, 47, 0, 31012, 74, 0, 1, 0, 0, '', 'Durotar (Panda) - Phase 1164 Off When Quest 31012 is Incomplete, Complete and Rewarded');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup`=1165 AND `SourceEntry`=14 AND `ConditionValue1` IN (31012,31450);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup`=1164 AND `SourceEntry`=1637 AND `ConditionValue1` IN (31012,31450);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(26, 1164, 1637, 0, 0, 47, 0, 31012, 2, 0, 0, 0, 0, '', 'Durotar (Panda) - Phase 1164 On When Quest 31012 is Complete'),
(26, 1164, 1637, 0, 0, 47, 0, 31012, 64, 0, 1, 0, 0, '', 'Durotar (Panda) - Phase 1164 Off When Quest 31012 is Rewarded');


-- Shang Xi's Hot Air Balloon (60571)
UPDATE `creature` SET `PhaseId`='1164' WHERE  `guid`=399123;


-- Alliance Phase Area
DELETE FROM `phase_area` WHERE `AreaId`=12 AND `PhaseId` IN (1164,1165);
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES 
(12, 1164, 'Elwynn Forest (Panda) - Phase 1164 After Quest 31450 Complete and Before Quest 30987 Taken');

DELETE FROM `phase_area` WHERE `AreaId`=1637 AND `PhaseId` IN (1164,1165);
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES 
(1637, 1164, 'Orgrimmar (Panda) - Phase 1164 After Quest 30987 Complete and Before Quest 30987 Rewarded');


-- Alliance Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup`=1164 AND `SourceEntry`=12 AND `ConditionValue1` IN (30987,31450);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(26, 1164, 12, 0, 0, 47, 0, 31450, 66, 0, 0, 0, 0, '', 'Elwynn Forest (Panda) - Phase 1164 On When Quest 31450 is Complete or Rewarded'),
(26, 1164, 12, 0, 0, 47, 0, 30987, 74, 0, 1, 0, 0, '', 'Elwynn Forest (Panda) - Phase 1164 Off When Quest 30987 is Incomplete, Complete and Rewarded');


-- Aysa Cloudsinger (60566)
UPDATE `creature` SET `PhaseId`='1164' WHERE  `guid`=395730;


-- Shang Xi's Hot Air Balloon (60565)
UPDATE `creature` SET `PhaseId`='1164' WHERE  `guid`=395731;


-- Stormwind Rat (49540)
DELETE FROM `creature_text` WHERE `CreatureID`=49540;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(49540, 0, 0, 'Cheese...', 12, 0, 100, 0, 0, 0, 0, 0, 'Stormwind Rat');
