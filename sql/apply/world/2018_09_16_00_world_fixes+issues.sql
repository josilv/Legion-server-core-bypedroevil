/*========
-- Gilneas
==========*/
-- Playercreateinfo
DELETE FROM `playercreateinfo` WHERE `race`=22;
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(22, 1, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 3, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 4, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 5, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 6, 609, 4298, 2356.21, -5662.21, 426.026, 3.93485),
(22, 8, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 9, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847),
(22, 11, 654, 4756, -1451.53, 1403.35, 35.5561, 0.333847);


/*=============================================
-- Pit Commander Galvinoth 100000  (Issue #5)
=============================================*/
DELETE FROM `creature` WHERE  `guid`=382279;


/*================================
-- From Within Quests (Issue #6)
================================*/
UPDATE `quest_template_addon` SET `ExclusiveGroup`='36920' WHERE  `ID` IN (36920,40815,44140);


/*==============================================
-- Acievements Free Disable Rewards (Issue #8)
==============================================*/
-- Logro: 4.º aniversario de WoW (2398) / Item: Osezno de Blizzard (44819)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=2398;


-- Logro: 5.º aniversario de WoW (4400) / Item: Vástago de Onyxia (49362)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=4400;


-- Logro: 7.º aniversario de WoW (5863) / Item: Paquete de celebración (71134)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=5863;


-- Logro: 9.º aniversario de WoW (6131) / Item: Paquete de celebración (90918)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=6131;


-- Logro: 8.º aniversario de WoW (7853) / Item: Paquete de celebración (71134)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=7853;


-- Logro: 10.º aniversario de WoW (8820) / Item: Corgi de magma (115301)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=8820;


-- Logro: 11.º aniversario de WoW (10058) / Item: Regalo conmemorativo (128513)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=10058;


-- Logro: 12.º aniversario de WoW (10741) / Item: Regalo conmemorativo (139284)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=10741;


-- Logro: 13.º aniversario de WoW (11848) / Item: Regalo conmemorativo (147876)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=11848;


-- Logro: Lucha por la Alianza (11210) / Item: Caja fuerte de la Alianza (140997)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=11210;


-- Logro: Lucha por la Horda (11211) / Item: Caja fuerte de la Horda (140998)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=11211;


-- Logro: Mutiladora de señor de la guerra (9496) / Item: Mutiladora de señor de la guerra (116788)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=9496;


-- Logro: Tigre de jade (3636) / Item: Jade encantado (46894)
UPDATE `achievement_reward` SET `item`='0' WHERE  `entry`=3636;


/*===========================
-- Object 251673 (Issue #9)
===========================*/
UPDATE `gameobject_template` SET `name`='Paladines Class Headquarters to Dalaran' WHERE  `entry`=251673;

DELETE FROM `gameobject_template_locale` WHERE `entry`=251673 AND `locale`='esES';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
(251673, 'esES', 'Sede de Clase de Paladines a Dalaran', NULL, NULL, 26365);

DELETE FROM `gameobject_template_locale` WHERE `entry`=251673 AND `locale`='esMX';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
(251673, 'esMX', 'Sede de Clase de Paladines a Dalaran', NULL, NULL, 26365);

DELETE FROM `gameobject_template_locale` WHERE `entry`=251673 AND `locale`='frFR';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
(251673, 'frFR', 'Domaine de classe des Paladins vers Dalaran', NULL, NULL, 26365);

