/*=================
-- Durotar 1
=================*/

-- Den Grunt (51787)
DELETE FROM `creature` WHERE  `guid`=187401;
DELETE FROM `creature_addon` WHERE  `guid`=187401;
UPDATE `creature_addon` SET `emote`='333' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=51787);

DELETE FROM `creature_template_addon` WHERE `entry`=51787;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(51787, 0, 0, 0, 1, 333, 0, 0, 0, NULL);


-- Den Grunt (5952)
UPDATE `creature_template_addon` SET `emote`='333' WHERE  `entry`=5952;
UPDATE `creature_addon` SET `emote`='333' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=5952);


-- Adder (3300)
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=3300 AND NOT `MovementType`='2';


-- Cactus Apple (171938)
UPDATE `gameobject` SET `spawntimesecs`='60' WHERE  `id`=171938;


-- Hare (5951)
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=5951 AND NOT `MovementType`='2';


-- Spiny Lizard (49837)
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=49837 AND NOT `MovementType`='2';


-- Lazy Peon (10556)
UPDATE `creature` SET `spawntimesecs`='30' WHERE  `id`=10556;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (10556,1055600,1055601,1055602);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(10556, 0, 0, 0, 11, 0, 100, 1, 100, 0, 0, 0, '', 75, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - On Respawn - Add Aura Peon Sleeping'),
(10556, 0, 1, 0, 8, 0, 100, 1, 19938, 0, 0, 0, '', 80, 1055600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - On Spellhit - Run Actionlist'),
(1055600, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Say Line 0'),
(1055600, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 33, 10556, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Quest Credit'),
(1055600, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 28, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Remove Aura Peon Sleeping'),
(1055600, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 69, 1, 0, 0, 3, 0, 0, 15, 175784, 30, 0, 0, 0, 0, 0, 'Lazy Peon - Move to Nearest Lumber Pile'),
(1055600, 9, 4, 0, 0, 0, 100, 1, 1800, 1800, 0, 0, '', 66, 0, 0, 0, 0, 0, 0, 15, 175784, 5, 0, 0, 0, 0, 0, 'Lazy Peon - Add Work State'),
(1055600, 9, 5, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Weapon Sheat'),
(1055600, 9, 6, 0, 0, 0, 100, 1, 0, 0, 0, 0, '', 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Add Work State'),
(1055600, 9, 7, 0, 0, 0, 100, 1, 30000, 30000, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lazy Peon - Despawn Instant');


-- Sarkoth (3281)
UPDATE `creature` SET `spawntimesecs`='60' WHERE  `id`=3281;


-- Thazz'ril's Pick (178087)
UPDATE `gameobject` SET `spawntimesecs`='5' WHERE  `id`=178087;


-- Yarrog Baneshadow (3183)
UPDATE `creature` SET `spawntimesecs`='60' WHERE  `id`=3183;


-- Northwatch Infantryman (39260)
DELETE FROM `creature` WHERE  `guid` IN (157798,157799,158935,158930);
DELETE FROM `creature_addon` WHERE  `guid` IN (157798,157799,158935,158930);
UPDATE `creature_addon` SET `emote`='333' WHERE  `guid` IN (158949,158951);

DELETE FROM `creature_addon` WHERE `guid` IN (158143,158938,158940,158928);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(158143, 0, 0, 0, 1, 333, 0, 0, 0, NULL),
(158938, 0, 0, 0, 1, 333, 0, 0, 0, NULL),
(158940, 0, 0, 0, 1, 333, 0, 0, 0, NULL),
(158928, 0, 0, 0, 1, 333, 0, 0, 0, NULL);


-- Northwatch Ranger (39261)
DELETE FROM `creature_addon` WHERE `guid` IN (158934,158947,158931,158932);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(158934, 0, 0, 0, 1, 69, 0, 0, 0, NULL),
(158947, 0, 0, 0, 1, 333, 0, 0, 0, NULL),
(158931, 0, 0, 0, 1, 333, 0, 0, 0, NULL),
(158932, 0, 0, 0, 1, 333, 0, 0, 0, NULL);

UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `guid` IN (158931,158932) AND NOT `MovementType`='2';


-- Dung Beetle (49743)
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=49743 AND NOT `MovementType`='2';


-- Creepy Crawly (62116)
UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=62116 AND NOT `MovementType`='2';


-- Attack Plan: Valley of Trials (3189)
UPDATE `gameobject` SET `spawntimesecs`='5' WHERE  `id`=3189;


-- Attack Plan: Sen'jin Village (3190)
UPDATE `gameobject` SET `spawntimesecs`='5' WHERE  `id`=3190;


-- Attack Plan: Orgrimmar (3192)
UPDATE `gameobject` SET `spawntimesecs`='5' WHERE  `id`=3192;


-- Disenchanted Tiki Mask (205076)
UPDATE `gameobject` SET `spawntimesecs`='30' WHERE  `id`=3192;





-- Docile Island Boar (38141)
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `id`=38141 AND NOT `MovementType`='2';


-- Wildmane Cat (38046)
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `id`=38046 AND NOT `MovementType`='2';


-- Sen'jin Watcher (3297)
UPDATE `creature_template_addon` SET `emote`='333' WHERE  `entry`=3297;
UPDATE `creature_addon` SET `emote`='333' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=3297);
DELETE FROM `creature` WHERE  `guid`=159027;
DELETE FROM `creature_addon` WHERE  `guid`=159027;


-- Sen'jin Guardian (51913)
UPDATE `creature_addon` SET `emote`='333' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=51913);

DELETE FROM `creature_template_addon` WHERE `entry`=51913;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(51913, 0, 0, 0, 1, 333, 0, 0, 0, NULL);


-- Raider Jhash (10676)
DELETE FROM `smart_scripts` WHERE `entryorguid`=10676;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(10676, 0, 0, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Raider Jhash - Between 0-15% Health - Flee For Assist'),
(10676, 0, 1, 0, 9, 0, 100, 0, 0, 20, 7000, 9000, '', 11, 6533, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Raider Jhash - Within 0-20 Range - Cast Net'),
(10676, 0, 2, 3, 62, 0, 100, 0, 11189, 0, 0, 0, '', 11, 45472, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Durotar Riding Wolf - On Gossip Selected - Cast Parachute'),
(10676, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 301.437, -4729.53, 16.73, 2.51323, 'Raider Jhash - Teleport Player');






-- Ula'elek (6408)
DELETE FROM `creature_addon` WHERE `guid`=159024;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(159024, 0, 0, 0, 1, 648, 0, 0, 0, NULL);


-- Razor Hill Grunt (51911)
UPDATE `creature_addon` SET `emote`='333' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=51911);

DELETE FROM `creature_template_addon` WHERE `entry`=51911;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(51911, 0, 0, 0, 1, 333, 0, 0, 0, NULL);

DELETE FROM `creature` WHERE  `guid` IN (159338,159754,241601,159341,159792,241600,159787,159803,159762,159761);
DELETE FROM `creature_addon` WHERE  `guid` IN (159338,159754,241601,159341,159792,241600,159787,159803,159762,159761);
