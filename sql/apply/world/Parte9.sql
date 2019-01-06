/*====================
-- Parte 9
====================*/
-- General
   UPDATE `creature` SET `spawntimesecs`='180' WHERE  `map`='648' AND `spawntimesecs`='120';
   UPDATE `gameobject` SET `spawntimesecs`='180' WHERE  `map`='648' AND `spawntimesecs`='120';

  -- Strange Tentacle (33420)
   UPDATE `creature_template` SET `unit_flags`='67141636', `InhabitType`='4' WHERE  `entry`=33420;

  -- Pterrordax Scavenger (36719)
   UPDATE `creature_template` SET `unit_flags`='67141632' WHERE  `entry`=36719;

  -- Smart Mining Monkey (35812)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=35812;

  -- Jungle Cat (35904)
   UPDATE `creature_template` SET `unit_flags`='67141632' WHERE  `entry`=35904;


-- Landing Site (4870) Phase 180

  -- Mailbox (202543)
   UPDATE `gameobject` SET `PhaseId`='180' WHERE  `guid`=141268;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202543 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202543, 'esES', 'Buzon', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202543 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202543, 'esMX', 'Buzon', '', NULL, 26365);


-- Landing Site (4870) Phase 181 When Quest 24897 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68481 AND `area`=4870;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68481, 4870, 24897, 24924, 0, -1, 0, 2, 3, 64, 64);

  -- Foreman Dampwick (36471)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401749;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401749 AND NOT `MovementType`='2';

  -- Bamm Megabomb (38122)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401753;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401753 AND NOT `MovementType`='2';

  -- Sassy Hardwrench (38387)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=38387;
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401754;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401754 AND NOT `MovementType`='2';

  -- Beastblast Babblesnaff (68989)
   UPDATE `creature_template` SET `unit_flags`='32768', `faction`='2160' WHERE  `entry`=68989;
   UPDATE `creature_addon` SET `emote`='540' WHERE  `guid`=401757;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401757 AND NOT `MovementType`='2';

  -- Fizz Lighter (38514)
   UPDATE `creature_addon` SET `emote`='425' WHERE  `guid`=401755;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401755 AND NOT `MovementType`='2';

  -- Maxx Avalanche (38515)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401750;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401750 AND NOT `MovementType`='2';

  -- Gobber (38746)
   UPDATE `creature_template` SET `unit_flags`='32768', `faction`='2160' WHERE  `entry`=38746;
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401760;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401760 AND NOT `MovementType`='2';

  -- Grimy Greasefingers (42473)
   UPDATE `creature_addon` SET `emote`='375' WHERE  `guid`=401764;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401764 AND NOT `MovementType`='2';

  -- Slinky Sharpshiv (38517)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401751;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401751 AND NOT `MovementType`='2';

  -- Sally "Salvager" Sandscrew (38511)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401743;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401743 AND NOT `MovementType`='2';

  -- Assistant Greely (38124)
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401746;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401746 AND NOT `MovementType`='2';

  -- Geargrinder Gizmo (36600)
   UPDATE `creature_template` SET `unit_flags`='32768', `faction`='2160' WHERE  `entry`=36600;
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=401742;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401742 AND NOT `MovementType`='2';

  -- Evol Fingers (38513)
   UPDATE `creature_addon` SET `emote`='425' WHERE  `guid`=401737;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401737 AND NOT `MovementType`='2';

  -- Doc Zapnozzle (36615)
   UPDATE `creature_template` SET `unit_flags`='32768', `faction`='2160' WHERE  `entry`=36615;
   UPDATE `creature_addon` SET `emote`='540' WHERE  `guid`=401736;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401736 AND NOT `MovementType`='2';

  -- Sister Goldskimmer (38516)
   UPDATE `creature_addon` SET `emote`='425' WHERE  `guid`=401739;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401739 AND NOT `MovementType`='2';

  -- Coach Crosscheck (38738)
   UPDATE `creature_addon` SET `emote`='540' WHERE  `guid`=401744;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401744 AND NOT `MovementType`='2';

  -- Hobart Grapplehammer (38120)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=38120;
   UPDATE `creature_addon` SET `emote`='540' WHERE  `guid`=401745;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid`=401745 AND NOT `MovementType`='2';

  -- Warrior-Matic NX-01 (38518)
   UPDATE `creature_template` SET `unit_flags`='33280' WHERE  `entry`=38518;

  -- B.C. Eliminator (38526)
   UPDATE `creature_template` SET `npcflag`='16777216', `unit_flags`='516', `spell1`='72206', `spell2`='0', `spell6`='72844', `InhabitType`='8', `ScriptName`='' WHERE  `entry`=38526;

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=38526 AND `spell_id`=46598;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (38526, 46598, 0, 0);

  -- Oomlot Warrior (38531)
   UPDATE `creature_template` SET `KillCredit1`='38536', `unit_flags`='32768', `dynamicflags`='0', `type_flags`='0', `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=38531;
   UPDATE `creature_template_addon` SET `emote`='333' WHERE  `entry`=38531;

   DELETE FROM `creature` WHERE  `guid` IN (401645,401648,401651,401653,401654,401657,401659,401663,401667,401665,401668,401670,401671,401677,401678,401679,401680,401681,401683,401684,401685,401686,401687,401688,401689,401690,401691,401692,401693,401694,401695,401696,401697,401698,401699,401701,401703,401704,401705,401706,401707,401709,401710,401711,401712,401713,401717,401719,401720,401722,401724);
   DELETE FROM `creature_addon` WHERE  `guid` IN (401645,401648,401651,401653,401654,401657,401659,401663,401667,401665,401668,401670,401671,401677,401678,401679,401680,401681,401683,401684,401685,401686,401687,401688,401689,401690,401691,401692,401693,401694,401695,401696,401697,401698,401699,401701,401703,401704,401705,401706,401707,401709,401710,401711,401712,401713,401717,401719,401720,401722,401724);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38531;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38531, 0, 0, 0, 8, 0, 100, 512, 72207, 0, 0, 0, '', 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Warrior - On Spellhit - Die');

   DELETE FROM `creature` WHERE `guid` IN (403797,403796,403795,403794,403793,403792,403791,403790,403789,403788,403787,403786,403785,403784,403783,403782,403781,403780,403779,403778,403777,403776,403775,403774,403773,403772,403771,403770,403769,403768);
   INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
   (403797, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 928.09, 2286.4, 12.365, 1.88, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403796, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 924.993, 2285.48, 12.7239, 1.69936, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403795, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 922.129, 2284.94, 12.9184, 1.70329, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403794, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 918.723, 2284.73, 13.0141, 1.66009, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403793, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 915.682, 2284.44, 13.0608, 1.68758, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403792, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 912.807, 2284.47, 12.9428, 1.64438, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403791, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 909.73, 2285.23, 12.6231, 1.67972, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403790, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 929.349, 2288.3, 11.8739, 1.89571, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403789, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 926.065, 2287.49, 12.3161, 1.81324, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403788, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 923.174, 2286.92, 12.5556, 1.87215, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403787, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 920.07, 2286.72, 12.6706, 1.66794, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403786, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 917.054, 2286.62, 12.6184, 1.78575, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403785, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 913.991, 2286.41, 12.6517, 1.61689, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403784, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 911.216, 2286.63, 12.5293, 1.61296, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403783, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 907.944, 2286.86, 12.5152, 1.52657, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403782, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 927.305, 2289.61, 11.7216, 1.85644, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403781, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 924.036, 2289, 12.1038, 1.87215, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403780, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 921.232, 2288.46, 12.3128, 1.81717, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403779, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 918.012, 2288.43, 12.2629, 1.74255, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403778, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 915.257, 2288.23, 12.2786, 1.64831, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403777, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 912.206, 2288.44, 12.2738, 1.49123, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403776, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 908.888, 2289.02, 12.2713, 1.32237, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403775, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 907.814, 2291.7, 11.8699, 1.25168, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403774, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 910.829, 2290.85, 11.9005, 1.42054, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403773, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 928.214, 2292.57, 10.9325, 1.9389, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403772, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 925.072, 2291.5, 11.5075, 1.85251, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403771, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 913.682, 2290.29, 11.8931, 1.4284, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403770, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 916.118, 2290.06, 11.8882, 1.51872, 120, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403769, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 921.844, 2291.12, 11.7075, 1.77397, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365),
   (403768, 38531, 648, 4720, 4870, 1, 0, 181, 0, -1, 0, 1, 918.92, 2290.44, 11.8488, 1.67972, 120, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, '', 26365);
