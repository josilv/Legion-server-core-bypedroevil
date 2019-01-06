/*==============
-- World Fixes
==============*/
-- Master Shang Xi (56686)
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (56686,5668600,5668601,5668602,5668603);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56686, 0, 0, 0, 19, 0, 100, 0, 29790, 0, 0, 0, '', 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - On Quest Accepted - Set Visible'),
(56686, 0, 1, 2, 62, 0, 100, 0, 56686, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - On Gossip Selected - Close Gossip'),
(56686, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 80, 5668600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Run Script'),
(56686, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 18, 100696072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Set Flag Not Selectable'),
(56686, 0, 4, 5, 40, 0, 100, 0, 1, 56686, 0, 0, '', 54, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Pause WP'),
(56686, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, '', 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0.699036, 'Master Shang Xi - WP Reached - Set Orientation'),
(56686, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, '', 5, 396, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Play Emote'),
(56686, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 80, 5668601, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Run Script'),
(56686, 0, 8, 9, 40, 0, 100, 0, 5, 56686, 0, 0, '', 54, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Pause WP'),
(56686, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, '', 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 4.8168, 'Master Shang Xi - WP Reached - Set Orientation'),
(56686, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, '', 4, 33098, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Play Sound'),
(56686, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 56913, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Cast CSA Dummy Effect Self'),
(56686, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 1, 3, 3500, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Reached - Say Line 3'),
(56686, 0, 13, 14, 52, 0, 100, 0, 3, 56686, 0, 0, '', 28, 126160, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - On Text Over - Remove Aura'),
(56686, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 128850, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - On Text Over - Cast Forcecast Summon Walking Stick, Blossoming'),
(56686, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 80, 5668602, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - On Text Over - Run Script'),
(56686, 0, 16, 17, 58, 0, 100, 0, 6, 56686, 0, 0, '', 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 4.29266, 'Master Shang Xi - WP Ended - Set Orientation'),
(56686, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, '', 1, 4, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Ended - Say Line 4'),
(56686, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 80, 5668603, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - WP Ended - Run Script'),
(5668600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, '', 4, 33097, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Play Sound'),
(5668600, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Say Line 0'),
(5668600, 9, 2, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, '', 5, 396, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Play Emote'),
(5668600, 9, 3, 0, 0, 0, 100, 0, 5500, 5500, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Say Line 1'),
(5668600, 9, 4, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, '', 59, 1, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Set Run'),
(5668600, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, '', 53, 1, 56686, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Start WP'),
(5668601, 9, 0, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, '', 1, 2, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Say Line 2'),
(5668602, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, '', 5, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Play Emote'),
(5668602, 9, 1, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, '', 5, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Play Emote'),
(5668603, 9, 0, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, '', 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Play Emote'),
(5668603, 9, 1, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, '', 1, 5, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Say Line 5'),
(5668603, 9, 2, 0, 0, 0, 100, 0, 5500, 5500, 0, 0, '', 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Set Bytes1'),
(5668603, 9, 3, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, '', 11, 128851, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Cast Master Shang Spirit Transform'),
(5668603, 9, 4, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, '', 11, 109336, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Cast Trigger Walking Stick Blossom'),
(5668603, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, '', 11, 106625, 0, 0, 0, 0, 0, 18, 10, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Cast Planting Stave Credit'),
(5668603, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Master Shang Xi - Despawn Instant');


-- Disable Class Trainers Option
UPDATE `creature_template` SET `npcflag`='0' WHERE  `npcflag`='32';
UPDATE `creature_template` SET `npcflag`='1' WHERE  `npcflag`='33';
UPDATE `creature_template` SET `npcflag`='2' WHERE  `npcflag`='34';
UPDATE `creature_template` SET `npcflag`='3' WHERE  `npcflag`='35';
UPDATE `creature_template` SET `npcflag`='1' WHERE  `npcflag`='49';
UPDATE `creature_template` SET `npcflag`='3' WHERE  `npcflag`='51';
UPDATE `creature_template` SET `npcflag`='81' WHERE  `npcflag`='113';
UPDATE `creature_template` SET `npcflag`='83' WHERE  `npcflag`='115';
UPDATE `creature_template` SET `npcflag`='145' WHERE  `npcflag`='177';
UPDATE `creature_template` SET `npcflag`='17' WHERE  `entry` IN (2485,2489,2492,45139,20791,19340,27703);

