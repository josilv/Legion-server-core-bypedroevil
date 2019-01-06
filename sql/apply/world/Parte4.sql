/*====================
-- Parte 4
====================*/

-- Smart Mining Monkey (35812)
UPDATE `creature` SET `PhaseId`='171', `spawndist`='0', `MovementType`='0', `unit_flags`='33587200' WHERE  `guid` IN (399544,399546,399653,399919,400198,400346,400445,400450,400476,400515);
UPDATE `creature_addon` SET `auras`='29266' WHERE  `guid` IN (399544,399546,399653,399919,400198,400346,400445,400450,400476,400515);

UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid` IN (399413,399522,399536,399549,399657,400063,400064) AND NOT `MovementType`='2';
UPDATE `creature_addon` SET `emote`='648' WHERE  `guid` IN (399372,399394,399466,399507,400212);

DELETE FROM `smart_scripts` WHERE `entryorguid`=35812;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35812, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3500, 4100, '', 11, 38560, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Smart Mining Monkey - Cast Throw');


-- Pygmy Witchdoctor (35838)
UPDATE `creature` SET `PhaseId`='171', `spawndist`='0', `MovementType`='0', `unit_flags`='33587200' WHERE  `guid`=399658;
UPDATE `creature_addon` SET `auras`='29266' WHERE  `guid`=399658;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35838;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35838, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 9613, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Witchdoctor - Cast Shadow Bolt'),
(35838, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Witchdoctor - Flee at 15% HP'),
(35838, 0, 2, 0, 14, 0, 100, 0, 80, 40, 15000, 18000, '', 11, 11986, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Witchdoctor - Cast Healing Wave on Friendlies'),
(35838, 0, 3, 0, 2, 0, 100, 0, 0, 40, 22000, 25000, '', 11, 11986, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Witchdoctor - Cast Healing Wave at 40% HP'),
(35838, 0, 4, 0, 25, 0, 100, 0, 0, 0, 0, 0, '', 11, 51733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Witchdoctor - On Respawn - Add Aura Shadow Channelling');


-- Capturing The Unknown - Bunny 1 (37872)
UPDATE `creature_template` SET `unit_flags`='33587200', `AIName`='SmartAI', `InhabitType`='4', `flags_extra`='0' WHERE  `entry`=37872;
UPDATE `creature` SET `modelid`='11686', `spawntimesecs`='15', `position_x`='568.399', `position_y`='2946.66', `position_z`='-0.36093', `orientation`='5.80005' WHERE  `guid`=399499;
UPDATE `creature_addon` SET `auras`='88455' WHERE  `guid`=399499;
UPDATE `creature_template_addon` SET `auras`='88455' WHERE  `entry`=37872;

DELETE FROM `smart_scripts` WHERE `entryorguid`=37872;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(37872, 0, 0, 1, 8, 0, 100, 512, 68280, 0, 0, 0, '', 33, 37872, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 1 - On Spellhit - Quest Credit'),
(37872, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 68281, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 1 - Cast KTC Snapflash');


-- Capturing The Unknown - Bunny 2 (37895)
UPDATE `creature_template` SET `unit_flags`='33587200', `AIName`='SmartAI', `InhabitType`='4', `flags_extra`='0' WHERE  `entry`=37895;
UPDATE `creature` SET `modelid`='11686', `spawntimesecs`='15', `position_x`='570.645', `position_y`='2908.03', `position_z`='-8.17043', `orientation`='0.96298' WHERE  `guid`=399500;
UPDATE `creature_addon` SET `auras`='88455' WHERE  `guid`=399500;
UPDATE `creature_template_addon` SET `auras`='88455' WHERE  `entry`=37895;

DELETE FROM `smart_scripts` WHERE `entryorguid`=37895;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(37895, 0, 0, 1, 8, 0, 100, 512, 68280, 0, 0, 0, '', 33, 37895, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 2 - On Spellhit - Quest Credit'),
(37895, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 68281, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 2 - Cast KTC Snapflash');


-- Capturing The Unknown - Bunny 3 (37896)
UPDATE `creature_template` SET `unit_flags`='33587200', `AIName`='SmartAI', `InhabitType`='4', `flags_extra`='0' WHERE  `entry`=37896;
UPDATE `creature` SET `modelid`='11686' WHERE  `guid`=399548;
UPDATE `creature` SET `modelid`='11686', `spawntimesecs`='15', `position_x`='615.749', `position_y`='2851.90', `position_z`='-7.43098', `orientation`='1.90152' WHERE  `guid`=399548;
UPDATE `creature_template_addon` SET `auras`='88455' WHERE  `entry`=37896;
UPDATE `creature_addon` SET `auras`='88455' WHERE  `guid`=399548;
UPDATE `creature_template_addon` SET `auras`='88455' WHERE  `entry`=37896;

DELETE FROM `smart_scripts` WHERE `entryorguid`=37896;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(37896, 0, 0, 1, 8, 0, 100, 512, 68280, 0, 0, 0, '', 33, 37896, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 3 - On Spellhit - Quest Credit'),
(37896, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 68281, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 3 - Cast KTC Snapflash');


-- Capturing The Unknown - Bunny 4 (37897)
UPDATE `creature_template` SET `unit_flags`='33587200', `AIName`='SmartAI', `InhabitType`='4', `flags_extra`='0' WHERE  `entry`=37897;
UPDATE `creature` SET `modelid`='11686', `spawntimesecs`='15' WHERE  `guid`=399547;
UPDATE `creature_addon` SET `auras`='88455' WHERE  `guid`=399547;
UPDATE `creature_template_addon` SET `auras`='88455' WHERE  `entry`=37897;

DELETE FROM `smart_scripts` WHERE `entryorguid`=37897;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(37897, 0, 0, 1, 8, 0, 100, 512, 68280, 0, 0, 0, '', 33, 37897, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 4 - On Spellhit - Quest Credit'),
(37897, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 68281, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Capturing The Unknown - Bunny 4 - Cast KTC Snapflash');


-- Sassy Hardwrench (35650)
DELETE FROM `creature` WHERE `guid`=403765;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(403765, 35650, 648, 4720, 4778, 1, 0, 0, 0, -1, 0, 0, 655.077, 2979.39, 1.15949, 4.84162, 120, 0, 0, 187, 0, 0, 0, 33536, 0, 0, 0, '', 26365);


-- Kaja'mite Cavern (4778) Phase 171 When Quest 14234 is Taken
DELETE FROM `spell_area` WHERE `spell`=59074 AND `area`=4778;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59074, 4778, 14234, 0, 0, -1, 0, 2, 3, 74, 11);

  -- Foreman Dampwick (35769)
   DELETE FROM `creature` WHERE `guid`=39693;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39693, 35769, 648, 4720, 4778, 1, 0, 171, 0, -1, 0, 0, 495.031, 2971.54, 7.88038, 1.79769, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39693;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39693, 0, 0, 0, 1, 0, 0, 0, 0, '68327');

  -- Frightened Miner (35810)
   DELETE FROM `creature` WHERE `guid`=39784;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39784, 35810, 648, 4720, 4778, 1, 0, 171, 0, -1, 0, 0, 499.918, 2970.43, 7.86961, 4.79965, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39784;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39784, 0, 0, 0, 1, 69, 0, 0, 0, '');


-- Jungle Cat (35904)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35904 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35904, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 31289, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Jungle Cat - Cast Claw');


-- Orc Survivor (39655)
UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=400235; 
UPDATE `creature_addon` SET `emote`='648' WHERE  `guid` IN (400230,400231);
UPDATE `creature_addon` SET `emote`='492' WHERE  `guid`=400229;
DELETE FROM `creature` WHERE  `guid` IN (399711,399714,399716,399718,399719);
DELETE FROM `creature_addon` WHERE  `guid` IN (399711,399714,399716,399718,399719);
UPDATE `creature` SET `PhaseId`='0' WHERE  `id`=39655;


-- Aggra (35875)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35875;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35875, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aggra - On Gossip - Play Emote'),
(35875, 0, 1, 0, 19, 0, 100, 0, 14235, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aggra - On Quest Add - Say Text 0'),
(35875, 0, 2, 0, 19, 0, 100, 0, 14237, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aggra - On Quest Add - Say Text 1');


-- SI:7 Infiltrator (35891)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35891;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35891, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 15691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'SI:7 Infiltrator - Cast Eviscerate');


-- Kilag Gorefang (35893)
UPDATE `creature_template` SET `flags_extra`='2' WHERE  `entry`=35893;
UPDATE `creature_addon` SET `emote`='385' WHERE  `guid`=399712;
DELETE FROM `creature_queststarter` WHERE  `id`=35893 AND `quest`=14235;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35893;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35893, 0, 0, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Kilag Gorefang - On Aggro - Stop Moving'),
(35893, 0, 1, 0, 0, 0, 100, 0, 2500, 3800, 2500, 3800, '', 11, 15620, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Kilag Gorefang - Cast Shoot');


-- Orc Scout (35894)
UPDATE `creature_template` SET `flags_extra`='2' WHERE  `entry`=35894;
UPDATE `creature_addon` SET `emote`='385' WHERE  `guid` IN (399717,399713);

DELETE FROM `smart_scripts` WHERE `entryorguid`=35894;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35894, 0, 0, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - On Aggro - Stop Moving'),
(35894, 0, 1, 0, 0, 0, 100, 0, 2500, 3800, 2500, 3800, '', 11, 15620, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - Cast Shoot');


-- Poison Spitter (35896)
UPDATE `creature_template` SET `unit_flags`='32772', `flags_extra`='2' WHERE  `entry`=35896;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35896;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35896, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2300, 3800, '', 11, 68208, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Poison Spitter - Cast Shoot Thorns'),
(35896, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 68207, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Poison Spitter - Cast Poison Spit');


-- Freezya (35897)
UPDATE `creature_template` SET `unit_flags`='32772', `flags_extra`='2' WHERE  `entry`=35897;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35897;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35897, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 68209, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Freezya - Cast Frostbolt');


-- Strangle Vine (35995)
UPDATE `creature_template` SET `unit_flags`='32772', `flags_extra`='2' WHERE  `entry`=35995;

DELETE FROM `smart_scripts` WHERE `entryorguid`=35995;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35995, 0, 0, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Strangle Vine - On Aggro - Stop Moving');


-- The Vicious Vale (4780) Phase 171 When Quest 14236 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=59074 AND `area`=4780;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59074, 4780, 14236, 0, 0, -1, 0, 2, 3, 66, 11);

  -- Kilag Gorefang (35893)
   DELETE FROM `creature` WHERE `guid`=39785;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39785, 35893, 648, 4720, 4780, 1, 0, 171, 0, -1, 0, 0, 602.054, 2783.78, 88.7381, 0.208633, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39785;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39785, 0, 0, 0, 2, 214, 0, 0, 0, '');

  -- Orc Scout (35894)
   DELETE FROM `creature` WHERE `guid`=39786;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39786, 35894, 648, 4720, 4780, 1, 0, 171, 0, -1, 0, 0, 602.571, 2780.97, 88.9863, 0.0949953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39786;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39786, 0, 0, 0, 2, 214, 0, 0, 0, '');

   DELETE FROM `creature` WHERE `guid`=39787;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39787, 35894, 648, 4720, 4780, 1, 0, 171, 0, -1, 0, 0, 600.328, 2786.01, 88.6889, 1.18674, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39787;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39787, 0, 0, 0, 2, 214, 0, 0, 0, '');

  -- Bastia (36578)
   DELETE FROM `creature` WHERE `guid`=39788;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (39788, 36578, 648, 4720, 4780, 1, 0, 171, 0, -1, 0, 0, 604.007, 2785.83, 88.3295, 0.645772, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

   DELETE FROM `creature_addon` WHERE `guid`=39788;
   INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
   (39788, 0, 0, 0, 1, 400, 0, 0, 0, '76354');


