/*============================
-- Creature Template Journal
============================*/
DROP TABLE IF EXISTS `creature_template_journal`;
CREATE TABLE `creature_template_journal`(
    `entry` INT(10) UNSIGNED NOT NULL,
    `JournalEncounterID` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`entry`)
);

INSERT IGNORE INTO `creature_template_journal` (entry, JournalEncounterID) VALUES
(24723, 530),
(24744, 531),
(20870, 548),
(20885, 549),
(20886, 550),
(20912, 551),
(18341, 534),
(18343, 535),
(22930, 536),
(18344, 537),
(17941, 570),
(17991, 571),
(17942, 572),
(16807, 566),
(16809, 568),
(16808, 569),
(20923, 728),
(22887, 1582),
(22898, 1583),
(22841, 1584),
(22871, 1585),
(22948, 1586),
(23418, 1587),
(23419, 1587),
(23420, 1587),
(22947, 1588),
(22949, 1589),
(22950, 1589),
(22951, 1589),
(22952, 1589),
(22917, 1590);


/*========
-- World
========*/
-- Dragonmaw Sky Stalker (23030)
UPDATE creature_template SET inhabitType=4 WHERE entry=23030;


/*================
-- Ticket System
================*/
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 2000 AND 2002;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000','|cff00ff00New ticket from|r|cffff00ff %s.|r |cff00ff00Ticket entry:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('2001','|cff00ff00Character|r|cffff00ff %s |r|cff00ff00edited his/her ticket:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('2002','|cff00ff00Character|r|cffff00ff %s |r|cff00ff00abandoned ticket entry:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

