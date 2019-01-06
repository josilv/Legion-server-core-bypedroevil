/*====================
-- Parte 1
====================*/
-- Daggertooth Shark (34763)
UPDATE `creature_template` SET `flags_extra`='2', `InhabitType`='2' WHERE  `entry`=34763;

DELETE FROM `creature` WHERE  `guid`=399342;
DELETE FROM `creature_addon` WHERE  `guid`=399342;
UPDATE `creature` SET `zoneId`='4720', `areaId`='4721' WHERE  `guid` IN (399270,399287,399288,399289,399290,399296,399300,399342);


-- Cangrejo de playa (6827)
UPDATE `creature` SET `spawndist`='15', `MovementType`='1' WHERE  `id`=6827 AND NOT `MovementType`='2';


-- Frog (36591)
UPDATE `creature` SET `spawndist`='15', `MovementType`='1' WHERE  `id`=36591 AND NOT `MovementType`='2';


-- Rata (4075)
UPDATE `creature` SET `spawndist`='15', `MovementType`='1' WHERE  `id`=4075 AND NOT `MovementType`='2';
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `id`=4075 AND `map`='648' AND `zoneId`='4720' AND `areaId`='4778';


-- Pterrordax Scavenger (36719)
UPDATE `creature_template` SET `flags_extra`='2' WHERE  `entry`=36719;


-- Doc Zapnozzle (36608)
UPDATE `creature` SET `spawntimesecs`='5' WHERE  `guid`=403762;


-- Don't Go Into the Light! (14239)
DELETE FROM `creature_queststarter` WHERE `id`=36600 AND `quest`=14239;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
(36600, 14239);

DELETE FROM `creature_questender` WHERE `id`=36600 AND `quest`=14239;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES 
(36600, 14239);


-- Geargrinder Gizmo (36600)
DELETE FROM `smart_scripts` WHERE `entryorguid`=36600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(36600, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - On Gossip - Play Emote'),
(36600, 0, 1, 0, 19, 0, 100, 0, 14001, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - On Quest Add - Say Text 0'),
(36600, 0, 2, 0, 19, 0, 100, 0, 14474, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - On Quest Add - Say Text 0'),
(36600, 0, 3, 4, 20, 0, 100, 0, 14239, 0, 0, 0, '', 11, 54732, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - On Quest End - Cast Defibrillate'),
(36600, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 28, 69010, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - Remove Aura Near Death!');

