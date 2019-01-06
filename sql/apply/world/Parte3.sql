/*====================
-- Parte 3
====================*/
-- Gobber (36186)
UPDATE `gossip_menu_option` SET `OptionType`='9', `OptionNpcFlag`='131072' WHERE  `MenuId`=10722 AND `OptionIndex`=0;


-- Bamm Megabomb (35758)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35758;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35758, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bamm Megabomb - On Gossip - Play Emote'),
(35758, 0, 1, 0, 19, 0, 100, 0, 14019, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bamm Megabomb - On Quest Add - Say Text 0'),
(35758, 0, 2, 0, 20, 0, 100, 0, 14019, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bamm Megabomb - On Quest End - Say Text 1');


-- Maxx Avalanche (35786)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35786;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35786, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Maxx Avalanche - On Gossip - Play Emote'),
(35786, 0, 1, 0, 19, 0, 100, 0, 14473, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Maxx Avalanche - On Quest Add - Say Text 0'),
(35786, 0, 2, 0, 20, 0, 100, 0, 14473, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Maxx Avalanche - On Quest End - Say Text 1');


-- Goblin Survivor (36179)
UPDATE `creature_addon` SET `emote`='648' WHERE  `guid` IN (399321,399317);
UPDATE `creature_addon` SET `emote`='616' WHERE  `guid` IN (399316,399310);
UPDATE `creature_addon` SET `emote`='69' WHERE  `guid` IN (399322,399333);


-- Sally "Salvager" Sandscrew (36430)
UPDATE `creature_addon` SET `emote`='648' WHERE  `guid`=399303;


-- Sassy Hardwrench (35650)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35650;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35650, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sassy Hardwrench - On Gossip - Play Emote'),
(35650, 0, 1, 0, 19, 0, 100, 0, 14014, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sassy Hardwrench - On Quest Add - Say Text 0'),
(35650, 0, 2, 0, 19, 0, 100, 0, 14248, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sassy Hardwrench - On Quest Add - Say Text 1'),
(35650, 0, 3, 0, 19, 0, 100, 0, 14234, 0, 0, 0, '', 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sassy Hardwrench - On Quest Add - Say Text 2');


-- Trade Prince Gallywix (36403)
UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=36403;

DELETE FROM `smart_scripts` WHERE `entryorguid`=36403;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(36403, 0, 1, 0, 1, 0, 100, 0, 30000, 125000, 30000, 125000, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Trade Prince Gallywix - OOC - Say Text 0'),
(36403, 0, 2, 0, 19, 0, 100, 0, 14120, 0, 0, 0, '', 28, 59074, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Trade Prince Gallywix - On Quest Add - Remove Aura to Player Phase - Quest Zone-Specific 02'),
(36403, 0, 4, 0, 20, 0, 100, 0, 14126, 0, 0, 0, '', 75, 69010, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Trade Prince Gallywix - On Quest End - Put Aura to Player Near Death!'),
(36403, 0, 5, 0, 20, 0, 100, 0, 14126, 0, 0, 0, '', 62, 648, 0, 0, 0, 0, 0, 7, 0, 0, 0, 533.77, 3274.62, 0.198, 4.9, 'Trade Prince Gallywix - Teleport Player to Lost Isle');


-- Crate of Tools (195201)
UPDATE `gameobject_template` SET `Data8`='14014' WHERE  `entry`=195201;

DELETE FROM `gameobject_template_locale` WHERE `entry`=195201 AND `locale`='esES';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
(195201, 'esES', 'Cajon de herramientas', '', NULL, 26365);

DELETE FROM `gameobject_template_locale` WHERE `entry`=195201 AND `locale`='esMX';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
(195201, 'esMX', 'Cajon de herramientas', '', NULL, 26365);


-- Get Our Stuff Back! (14014)
UPDATE `quest_template_addon` SET `PrevQuestID`='0' WHERE  `ID`=14014;


-- It's Our Problem Now (14473)
UPDATE `quest_template_addon` SET `PrevQuestID`='0' WHERE  `ID`=14473;


-- Monkey Business (14019)
UPDATE `quest_template_addon` SET `PrevQuestID`='0' WHERE  `ID`=14019;


-- Teraptor Hatchling (36740)
DELETE FROM `smart_scripts` WHERE `entryorguid`=36740;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(36740, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, '', 11, 6268, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Teraptor Hatchling - On Aggro - Cast Rushing Charge');


-- Bomb-Throwing Monkey (34699)
UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=34699;
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=34699 AND NOT `MovementType`='2';

DELETE FROM `smart_scripts` WHERE `entryorguid`=34699;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(34699, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3500, 4100, '', 11, 8858, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - Cast Throw Bomb'),
(34699, 0, 1, 2, 8, 0, 100, 512, 67917, 0, 0, 0, '', 11, 67919, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - On Spellhit - Cast Exploding Bananas on Self'),
(34699, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - Stop Random Movement'),
(34699, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, '', 18, 100696072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - Set Flag Not Selectable'),
(34699, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 35760, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - Quest Credit'),
(34699, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - Despawn in 3 seg');


-- Teraptor Matriarch (36735)
DELETE FROM `creature` WHERE  `guid` IN (399292,400236,400655);
DELETE FROM `creature_addon` WHERE  `guid` IN (399292,400236,400655);

DELETE FROM `creature` WHERE `guid` IN (400649,105376,401081);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(400649, 36735, 648, 4720, 4782, 1, 0, 0, 0, -1, 0, 0, 797.285, 2987.45, 94.8048, 2.51327, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481),
(105376, 36735, 648, 4720, 4782, 1, 0, 171, 0, -1, 0, 0, 797.285, 2987.45, 94.8048, 2.51327, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481),
(401081, 36735, 648, 4720, 4782, 1, 0, 179, 0, -1, 0, 0, 797.285, 2987.45, 94.8048, 2.51327, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);


-- Jumping Monkey (36383)
UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=36383;


-- Foreman Dampwick (35769)
UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=35769;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35769;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35769, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Gossip - Play Emote'),
(35769, 0, 1, 0, 19, 0, 100, 0, 14021, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest Add - Say Text 0'),
(35769, 0, 2, 0, 20, 0, 100, 0, 14021, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest End - Say Text 1'),
(35769, 0, 3, 0, 19, 0, 100, 0, 14021, 0, 0, 0, '', 33, 35816, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest Add - Quest Credit');


-- Miner Troubles (14021)
UPDATE `quest_template_addon` SET `PrevQuestID`='14248', `NextQuestID`='14234', `ExclusiveGroup`='-14021' WHERE  `ID`=14021;
UPDATE `quest_template` SET `RewardNextQuest`='14234' WHERE  `ID`=14021;


-- Capturing the Unknown (14031)
UPDATE `quest_template_addon` SET `PrevQuestID`='14248', `NextQuestID`='14234', `ExclusiveGroup`='-14021' WHERE  `ID`=14031;
UPDATE `quest_template` SET `RewardNextQuest`='14234' WHERE  `ID`=14031;


-- Orcs Can Write? (14233)
UPDATE `quest_template_addon` SET `PrevQuestID`='14248', `NextQuestID`='14234', `ExclusiveGroup`='-14021' WHERE  `ID`=14233;
UPDATE `quest_template` SET `RewardNextQuest`='14234' WHERE  `ID`=14233;


-- The Enemy of My Enemy (14234)
UPDATE `quest_template_addon` SET `PrevQuestID`='14021' WHERE  `ID`=14234;


-- Frightened Miner (35810)
UPDATE `creature_template` SET `unit_flags`='32768', `dynamicflags`='0', `ScriptName`='' WHERE  `entry`=35810;
UPDATE `creature_addon` SET `emote`='69' WHERE  `guid`=399458;
UPDATE `creature_addon` SET `emote`='648' WHERE  `guid` IN (400349,400361,400419,400447,400479,400481,400524);
UPDATE `creature_addon` SET `emote`='431' WHERE  `guid`=399460;
UPDATE `creature` SET `unit_flags`='33554432' WHERE  `guid` IN (399377,399463,399471,399498,399504);
