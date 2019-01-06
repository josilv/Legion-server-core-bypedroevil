 /*====================
-- Parte 11
====================*/
 
 -- Coach Crosscheck (301042)
   UPDATE `gameobject_template_addon` SET `flags`='48' WHERE  `entry`=301042;

   DELETE FROM `gameobject` WHERE `guid`=142038;
   INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`) VALUES 
   (142038, 301042, 648, 4720, 4899, 1, 0, 182, 0, -1, 1463.16, 2044.97, 225.734, 6.1465, -0, -0, -0.0682871, 0.997666, 180, 255, 1, 0, '', 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=301042 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (301042, 'esES', 'Entrenador Paselargo', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=301042 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (301042, 'esMX', 'Entrenador Paselargo', '', NULL, 26365);


-- Oostan (4903) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4903;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4903, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

-- Rockin' Powder (202351)
   UPDATE `gameobject_template` SET `Data8`='24946' WHERE  `entry`=202351;
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `id`=202351;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202351 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202351, 'esES', 'Polvo del Rock', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202351 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202351, 'esMX', 'Polvo del Rock', '', NULL, 26365);


-- Oostan Nord (4900) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4900;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4900, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

  -- Bonfire (201967)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid`=141413;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201967 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201967, 'esES', 'Fogata', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201967 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201967, 'esMX', 'Fogata', '', NULL, 26365);

  -- Cauldron (206992)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid`=141454;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=206992 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206992, 'esES', 'Caldera', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=206992 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206992, 'esMX', 'Caldera', '', NULL, 26365);

  -- ELM General Purpose Bunny (scale x0.50) (38819)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=38819;

  -- Gaahl (38808)
   UPDATE `creature` SET `spawntimesecs`='60' WHERE  `guid`=402523;

   DELETE FROM `creature` WHERE  `guid`=402542;
   DELETE FROM `creature_addon` WHERE  `guid`=402542;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38808;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38808, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 12548, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Gaahl - Cast Frost Shock'),
   (38808, 0, 1, 0, 11, 0, 100, 1, 0, 0, 0, 0, '', 11, 72935, 0, 0, 0, 0, 0, 10, 0, 38643, 0, 0, 0, 0, 0, 'Gaahl - On Spawn - Cast Zombie Transformation');

  -- Goblin Captive (38812)
   UPDATE `creature_addon` SET `emote`='431' WHERE  `guid`=402522;

   DELETE FROM `creature` WHERE  `guid` IN (402537,402543);
   DELETE FROM `creature_addon` WHERE  `guid` IN (402537,402543);


-- Oostan Sor (4901) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4901;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4901, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

  -- Bonfire (201966)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid`=141412;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201966 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201966, 'esES', 'Fogata', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201966 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201966, 'esMX', 'Fogata', '', NULL, 26365);

  -- Cauldron (206991,206989,206990)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid` IN (141420,141416,141417);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (206991,206989,206990) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206991, 'esES', 'Caldera', '', NULL, 26365),
   (206989, 'esES', 'Caldera', '', NULL, 26365),
   (206990, 'esES', 'Caldera', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (206991,206989,206990) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206991, 'esMX', 'Caldera', '', NULL, 26365),
   (206989, 'esMX', 'Caldera', '', NULL, 26365),
   (206990, 'esMX', 'Caldera', '', NULL, 26365);

  -- Oostan Headhunter (38811)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=38811;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38811, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2300, 3900, '', 11, 84837, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oostan Headhunter - Cast Shoot'),
   (38811, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oostan Headhunter - Flee at 15% HP');

  -- Malmo (38809)
   UPDATE `creature` SET `spawntimesecs`='60' WHERE  `guid`=402496;

   DELETE FROM `creature` WHERE  `guid`=402442;
   DELETE FROM `creature_addon` WHERE  `guid`=402442;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38809;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38809, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 57780, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Malmo - Cast Lightning Bolt'),
   (38809, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 15000, 18000, '', 11, 75945, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 'Malmo - Cast Fury of the Storm'),
   (38809, 0, 2, 0, 11, 0, 100, 1, 0, 0, 0, 0, '', 11, 72935, 0, 0, 0, 0, 0, 10, 0, 38643, 0, 0, 0, 0, 0, 'Malmo - On Spawn - Cast Zombie Transformation');

  -- Goblin Captive (50311)
   UPDATE `creature_addon` SET `emote`='431' WHERE  `guid`=402441;

   DELETE FROM `creature` WHERE  `guid` IN (402497,402544,402621,402623);
   DELETE FROM `creature_addon` WHERE  `guid` IN (402497,402544,402621,402623);


-- Oostan Ost (4902) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4902;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4902, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

  -- Bonfire (201962)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid`=141418;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201962 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201962, 'esES', 'Fogata', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201962 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201962, 'esMX', 'Fogata', '', NULL, 26365);

  -- Cauldron (206994,206993)
   UPDATE `gameobject` SET `PhaseId`='182' WHERE  `guid` IN (141463,141469);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (206994,206993) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206994, 'esES', 'Caldera', '', NULL, 26365),
   (206993, 'esES', 'Caldera', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (206994,206993) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (206994, 'esMX', 'Caldera', '', NULL, 26365),
   (206993, 'esMX', 'Caldera', '', NULL, 26365);

  -- Teloch (38810)
   UPDATE `creature` SET `spawntimesecs`='60' WHERE  `guid`=402599;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38810;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38810, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 25000, 37000, '', 11, 39591, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teloch - Cast Searing Totem'),
   (38810, 0, 1, 0, 0, 0, 100, 0, 4000, 4000, 12000, 15000, '', 11, 75946, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Teloch - Cast Fire and the Flames'),
   (38810, 0, 2, 0, 11, 0, 100, 1, 0, 0, 0, 0, '', 11, 72935, 0, 0, 0, 0, 0, 10, 0, 38643, 0, 0, 0, 0, 0, 'Teloch - On Spawn - Cast Zombie Transformation');


-- Lost Caldera (4909) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4909;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4909, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

   UPDATE `creature` SET `position_x`='1479.17', `position_y`='1237.48', `position_z`='116.192', `orientation`='4.316524', `spawndist`='0', `MovementType`='0' WHERE  `guid`=402673;
   UPDATE `creature` SET `unit_flags`='512' WHERE  `guid` IN (402658,402661,402677,402673,402680);
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid` IN (402658,402661,402677,402673,402680);

  -- Hobart Grapplehammer (38120)
   UPDATE `creature_addon` SET `emote`='69' WHERE  `guid`=402662;

  -- Kezan Citizen (38745)
   UPDATE `creature_addon` SET `emote`='69' WHERE  `guid`=402667;

  -- Child of Volcanoth (38845)
   UPDATE `creature_template` SET `unit_flags`='67141632' WHERE  `entry`=38845;
   UPDATE `creature` SET `spawndist`='20', `MovementType`='1' WHERE  `id`=38845 AND NOT `MovementType`='2';

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38845;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38845, 0, 0, 0, 9, 0, 100, 0, 0, 5, 15000, 16000, '', 11, 8873, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Child of Volcanoth - On Close - Cast Flame Breath');

  -- Volcanoth Champion (38850)
   DELETE FROM `creature` WHERE  `guid` IN (402655,402656,402663,402668,402669,402672,402676,402681,402682,402684,402691,402696,402700,402701,402703,402704,402708,402709,402710,402711);
   DELETE FROM `creature_addon` WHERE  `guid` IN (402655,402656,402663,402668,402669,402672,402676,402681,402682,402684,402691,402696,402700,402701,402703,402704,402708,402709,402710,402711);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38850;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38850, 0, 0, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Volcanoth Champion - Flee at 15% HP');

-- Volcanoth Priest (38851)
   UPDATE `creature_template` SET `unit_flags`='32772' WHERE  `entry`=38851;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38851;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38851, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 72991, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Volcanoth Priest - Cast Fireball'),
   (38851, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Volcanoth Priest - Flee at 15% HP');


-- Volcanoth's Lair (4911) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4911;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4911, 24958, 24958, 0, -1, 0, 2, 3, 8, 66);

  -- Volcanoth (38855)
   UPDATE `creature_template` SET `KillCredit1`='38868', `unit_flags`='32772', `speed_walk`='0.1', `speed_run`='0.1' WHERE  `entry`=38855;
   UPDATE `creature` SET `spawntimesecs`='60' WHERE  `guid`=402101;
   UPDATE `creature` SET `unit_flags`='33555200' WHERE  `guid`=402734;
   UPDATE `creature_addon` SET `auras`='29266' WHERE  `guid`=402734;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38855;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38855, 0, 0, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Volcanoth - On Aggro - Stop Moving'),
   (38855, 0, 1, 0, 9, 0, 100, 0, 0, 100, 12000, 15000, '', 11, 73097, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Volcanoth - On Close - Cast Volcanic Breath');


-- Volcanoth's Lair (4911) Phase 183 When Quest 24958 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68483 AND `area`=4911;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68483, 4911, 24958, 25023, 0, -1, 0, 2, 3, 66, 64);

  -- Flying Bomber (38929)
   UPDATE `creature_template` SET `unit_flags`='512', `InhabitType`='4', `ScriptName`='' WHERE  `entry`=38929;
   UPDATE `creature` SET `unit_flags`='33554432' WHERE  `guid`=402735;

  -- Sassy Hardwrench (38928)
   UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=38928;

   DELETE FROM `creature` WHERE `guid`=403800;
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (403800, 38928, 648, 4720, 4911, 1, 0, 183, 0, -1, 0, 0, 1172.46, 1097.47, 119.165, 0.566265, 180, 0, 0, 187, 0, 0, 0, 0, 0, 0, 0, '', 26365);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38928;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38928, 0, 0, 1, 19, 0, 100, 0, 25023, 0, 0, 0, '', 11, 45472, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sassy Hardwrench - On Quest Add - Cast Parachute'),
   (38928, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 62, 648, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1563.127, 2686.40, 122.11, 1.441973, 'Sassy Hardwrench - Teleport Player');
