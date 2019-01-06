/*=====================
-- Lost Isles Parte 7
=====================*/
-- Totally Generic Bunny (JSB) (28960)
DELETE FROM creature WHERE guid=72514;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
(72514,28960,648,0,0,1,0,0,0,-1,0,0,551.205,3260.38,-1.15172,2.57184,300,0,0,26268,0,0,0,0,0,0,0,'',26365);


-- Doc Zapnozzle (36608)
UPDATE creature_template SET AIName = '', scriptname="npc_zapnozzle" WHERE entry=36608;
UPDATE `creature` SET `spawntimesecs`='1' WHERE  `guid`=403762;


-- Goblin Escape Pod (195188)
UPDATE gameobject_template SET AIName = '', scriptname="gob_goblin_escape_pod" WHERE entry=195188;
UPDATE `gameobject` SET `spawntimesecs`='30' WHERE  `id`=195188;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=195188;


-- Goblin Survivor (34748)
UPDATE creature_template SET `unit_flags`=514, `InhabitType`=2, AIName = '', scriptname="npc_goblin_espace_pod" WHERE entry=34748;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=34748;


-- Trade Prince Gallywix (35649)
UPDATE creature_template SET `unit_flags`=514, `InhabitType`=2, AIName = '', scriptname="npc_goblin_espace_pod" WHERE entry=35649;


-- Spell Area
DELETE FROM `spell_area` WHERE `spell` IN (69010,70661,70678,70680,70681,68212,69303);
INSERT INTO `spell_area` (`spell`, `area`, `flags`, `quest_end`, `quest_end_status`) VALUES
(69010, 4721, 3, 14239, 64), -- Near Death!
(70661, 4778, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 1
(70661, 4780, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 1
(70678, 4778, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 2
(70678, 4780, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 2
(70680, 4778, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 3
(70680, 4780, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 3
(70681, 4778, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 4
(70681, 4780, 3, 14021, 66), -- Capturing The Unknown: See Invis Target Bunny 4
(68212, 4780, 2, 14303, 64), -- Weed Whacker
(69303, 4782, 2, 14238, 64); -- Infrared Heat Focals


-- Spell Script Names
DELETE FROM spell_script_names WHERE scriptname IN ("spell_lost_isles_near_death", "spell_ctu_snapflash", "spell_ctu_bind_sight", "aura_infrared_orc_scout");
INSERT INTO spell_script_names VALUES
(69010, "spell_lost_isles_near_death"), -- Near Death!
(68280, "spell_ctu_snapflash"), -- KTC Snapflash
(70641, "spell_ctu_bind_sight"), -- Capturing The Unknown: Player's Bind Sight
(68338, "aura_infrared_orc_scout"); -- Orc Scout


-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (69018,70641,68280,68059);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`,`ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 69018, 0, 31, 3, 28960), -- Don't Go Into The Light!: Summon Doc Zapnozzle
(13, 1, 70641, 0, 31, 3, 23837), -- Capturing The Unknown: Player's Bind Sight
(13, 1, 68280, 1, 31, 3, 37872), -- KTC Snapflash
(13, 1, 68280, 2, 31, 3, 37895), -- KTC Snapflash
(13, 1, 68280, 3, 31, 3, 37896), -- KTC Snapflash
(13, 1, 68280, 4, 31, 3, 37897), -- KTC Snapflash
(13, 1, 68059, 0, 31, 3, 35810); -- Miner Troubles: Summon Frightened Miner


-- Bomb-Throwing Monkey (34699)
UPDATE creature_template SET AIName = '', scriptname="npc_bomb_monkey" WHERE entry=34699;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34699;


-- Frightened Miner (35813)
UPDATE creature_template SET AIName='', scriptname = "npc_frightened_miner_escort" WHERE entry=35813;


-- Frightened Miner (35810)
UPDATE `creature_template` SET `unit_flags`=0, scriptname='', unit_flags2=2048, unit_flags3=0 WHERE entry=35810;
UPDATE `creature_template_addon` SET `bytes2`=0, `auras`='' WHERE `entry`=35810;


-- Script Waypoint
DELETE FROM `script_waypoint` WHERE entry IN (35813,36585,36143,36178,36505);
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
(35813, 1,  498.656, 2974.73,  7.58185,   0, ''), -- Miner
(35813, 2,  513.852, 2973.64,  8.12042,   0, ''), -- Miner
(35813, 3,  529.972, 2957.91,  6.77907,   0, ''), -- Miner
(35813, 4,  558.182, 2933.34,  0.843215,  0, ''), -- Miner
(35813, 5,  588.137, 2964.54, -2.433,     10000, 'Kaja\'mite 1'), -- Miner
(35813, 6,  598.471, 2952.82, -5.86114,   0, ''), -- Miner
(35813, 7,  576.819, 2916.44, -7.28581,   0, ''), -- Miner
(35813, 8,  576.566, 2907.31, -7.1668,    10000, 'Kaja\'mite 2'), -- Miner
(35813, 9,  573.927, 2904.92, -7.54599,   0, ''), -- Miner
(35813, 10, 577.658, 2878.72, -8.62971,   0, ''), -- Miner
(35813, 11, 608.599, 2857.32, -7.12896,   10000, 'Kaja\'mite 3'), -- Miner
(35813, 12, 633.022, 2920.86, -0.868127,  0, ''), -- Miner
(35813, 13, 665.740, 2948.91, -0.0379976, 10000, 'Kaja\'mite 4'), -- Miner
(35813, 14, 640.430, 2932.24, 0.413035,   0, 'escape'), -- Miner
(36585, 1,  868.362, 2830.14, 105.524, 0, ''), -- Bastia
(36585, 2,  868.498, 2865.06, 101.143, 0, ''), -- Bastia
(36585, 3,  875.859, 2871.74, 100.686, 0, ''), -- Bastia
(36585, 4,  896.847, 2876.02, 99.81,   0, ''), -- Bastia
(36585, 5,  910.631, 2884.86, 99.9498, 0, ''), -- Bastia
(36585, 6,  919.198, 2903.35, 100.76,  0, ''), -- Bastia
(36585, 7,  940.969, 2918.34, 105.378, 0, ''), -- Bastia
(36585, 8,  951.992, 2945.99, 109.54,  0, ''), -- Bastia
(36585, 9,  1040.47, 2952.25, 110.763, 0, ''), -- Bastia
(36585, 10, 1049.41, 2977.52, 112.625, 0, ''), -- Bastia
(36585, 11, 1074.74, 2997.53, 117.164, 0, ''), -- Bastia
(36585, 12, 1074.47, 3022.87, 121.391, 0, ''), -- Bastia
(36585, 13, 1088.9,  3041.96, 123.211, 0, ''), -- Bastia
(36585, 14, 1087.73, 3061.2,  123.738, 0, ''), -- Bastia
(36585, 15, 1070.91, 3099.4,  125.23,  0, ''), -- Bastia
(36585, 16, 1047.68, 3119.57, 125.253, 0, ''), -- Bastia
(36585, 17, 1026.96, 3127.1,  124.978, 0, ''), -- Bastia
(36585, 18, 1023.41, 3168.93, 119.783, 0, ''), -- Bastia
(36585, 19, 1054.61, 3192.71, 114.612, 0, ''), -- Bastia
(36585, 20, 1062.09, 3224.9,  96.4815, 0, ''), -- Bastia
(36585, 21, 1078.86, 3240.03, 81.2089, 0, ''), -- Bastia
(36143, 1, 671.514,  3468.13, 52.9430, 0, ''),  -- Gyrocoptere
(36143, 2, 1040.012, 3759.19, 46.8878, 0, ''), -- Gyrocoptere
(36143, 3, 971.488,  3804.29, 15.0729, 0, ''), -- Gyrocoptere
(36178, 1,  1048.99, 3860,    33.2749, 0, ''), -- Warchief Revenge Cyclone
(36178, 2,  1101.95, 3812.89, 30.3696, 0, ''), -- Warchief Revenge Cyclone
(36178, 3,  1067.27, 3740.67, 29.7548, 0, ''), -- Warchief Revenge Cyclone
(36178, 4,  1019.16, 3777.24, 32.0205, 0, ''), -- Warchief Revenge Cyclone
(36178, 5,  1022.4,  3865.68, 32.8839, 0, ''), -- Warchief Revenge Cyclone
(36178, 6,  978.305, 3877.43, 29.1646, 0, ''), -- Warchief Revenge Cyclone
(36178, 7,  878.821, 3827.45, 29.7215, 0, ''), -- Warchief Revenge Cyclone
(36178, 8,  883.349, 3910.59, 26.0531, 0, ''), -- Warchief Revenge Cyclone
(36178, 9,  949.782, 3933.79, 30.7593, 0, ''), -- Warchief Revenge Cyclone
(36178, 10, 946.961, 3842.94, 34.7302, 0, ''), -- Warchief Revenge Cyclone
(36178, 11, 954.366, 3766,    41.9682, 0, ''), -- Warchief Revenge Cyclone
(36178, 12, 1009.65, 3791.36, 35.2096, 0, ''), -- Warchief Revenge Cyclone
(36178, 13, 1021.12, 3834.18, 36.3348, 0, ''), -- Warchief Revenge Cyclone
(36505, 1,  893.967, 2687.62, 179.202, 0, ''),  -- Sling Rocket
(36505, 2,  910.878, 2566.45, 145.732, 0, ''), -- Sling Rocket
(36505, 3,  924.846, 2420.48, 48.9030, 0, ''), -- Sling Rocket
(36505, 4,  930.617, 2385.13, 7.11655, 0, ''); -- Sling Rocket


-- Kilag Gorefang (35917)
UPDATE creature_template SET AIName='', scriptname = "npc_killag_sangrecroc" WHERE entry=35917;
DELETE FROM `smart_scripts` WHERE `entryorguid`=35917;


-- Bastia (36585)
UPDATE creature_template SET AIName='', scriptname="npc_cliff_bastia" WHERE entry=36585;


-- Gyrochoppa (36127)
UPDATE creature_template SET AIName='', scriptname="npc_gyrocopterequest_giver" WHERE entry=36127;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36127;


-- Gyrochoppa (36143)
UPDATE creature_template SET InhabitType=4, AIName='', scriptname="npc_precious_cargo_gyrocopter" WHERE entry=36143;


-- Thrall (36145)
UPDATE creature_template SET AIName='', scriptname="npc_lost_isles_thrall_prisonner" WHERE entry=36145;


-- Thrall (36161)
UPDATE creature_template SET AIName='', scriptname="npc_lost_isles_thrall_top_boat" WHERE entry=36161;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36161;


-- Cyclone of the Elements (36178)
UPDATE creature_template SET `npcflag`='0', `AIName`='', scriptname="npc_warchief_revenge_cyclone" WHERE entry=36178;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36178 AND `spell_id`=46598;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36178 AND `spell_id`=68436;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36178 AND `SourceEntry`=46598 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=9 AND `ConditionTarget`=0 AND `ConditionValue1`=14243 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36178 AND `SourceEntry`=68436 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=9 AND `ConditionTarget`=0 AND `ConditionValue1`=14243 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36178;


-- Sassy Hardwrench (36425)
UPDATE creature_template SET AIName='', scriptname="npc_sassy_rocket_sling" WHERE entry=36425;


-- Trade Prince Gallywix (36513)
UPDATE creature_template SET AIName='', scriptname="npc_gallywix_sling_rocket" WHERE entry=36513;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36513;


-- Rocket Sling (196439)
UPDATE gameobject_template SET AIName='', scriptname="gob_rocket_sling" WHERE entry=196439;
DELETE FROM `smart_scripts` WHERE `entryorguid`=196439;


-- Sling Rocket (36505)
UPDATE creature_template SET InhabitType=4, AIName='', scriptname="npc_sling_rocket" WHERE entry=36505;


-- DBErrors
DELETE FROM `spell_script_names` WHERE `spell_id`=71091 AND `ScriptName`='spell_tiab_effect2';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(71091, 'spell_tiab_effect2');

UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=17457;
DELETE FROM `spell_script_names` WHERE `spell_id`=68281 AND `ScriptName`='spell_68281';

