/*===============
-- Paladin Hall
===============*/
-- Portal to Sanctum of Light (251304)
UPDATE `gameobject` SET `position_x`='-657.534', `position_y`='4363.91', `position_z`='748.576', `orientation`='2.79372', `rotation0`='-0', `rotation1`='-0', `rotation2`='-0.984911', `rotation3`='-0.173062', `spawntimesecs`='180' WHERE  `guid`=130494;


-- Portal to Dalaran (251673)
UPDATE `gameobject_template` SET `name`='Portal to Dalaran' WHERE  `entry`=251673;
UPDATE `gameobject_template_locale` SET `name`='Portal a Dalaran' WHERE  `entry`=251673 AND `locale`='esES';
UPDATE `gameobject_template_locale` SET `name`='Portal a Dalaran' WHERE  `entry`=251673 AND `locale`='esMX';
UPDATE `gameobject_template_locale` SET `name`='Portail vers Dalaran' WHERE  `entry`=251673 AND `locale`='frFR';


-- Creatures
UPDATE `creature_template` SET `name`='Krohm Dawnhammer' WHERE  `entry`=98278;
UPDATE `creature_template` SET `name`='Lady Mara Fordragon' WHERE  `entry`=98269;
UPDATE `creature_template` SET `name`='Uther the Lightbringer' WHERE  `entry`=98247;
UPDATE `creature_template` SET `name`='General Turalyon' WHERE  `entry`=98250;
UPDATE `creature_template` SET `name`='Highlord Alexandros Mograine' WHERE  `entry`=98249;
UPDATE `creature_template` SET `name`='Vindicator Maraad' WHERE  `entry`=98251;
UPDATE `creature_template` SET `name`='General Lena Stormpike' WHERE  `entry`=98279;
UPDATE `creature_template` SET `name`='Highlord Tirion Fordring' WHERE  `entry`=98245;

UPDATE `creature_template_addon` SET `bytes2`='1' WHERE  `entry`=96708;
UPDATE `creature_template_addon` SET `bytes2`='1' WHERE  `entry`=96698;

DELETE FROM `creature_addon` WHERE `guid`=358500;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(358500, 0, 0, 0, 1, 0, 0, 0, 0, NULL);

DELETE FROM `creature_addon` WHERE `guid`=358641;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(358641, 0, 0, 0, 1, 0, 0, 0, 0, NULL);

