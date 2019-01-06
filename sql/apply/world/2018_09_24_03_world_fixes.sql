/*================
-- World Updates
================*/
-- Table `creature_template`
REPLACE INTO `gameobject_template` VALUES
(1617, 50, 270, 'Silverleaf', '', '', '', 0.6, 29, 1414, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602),
(1618, 50, 269, 'Peacebloom', '', '', '', 0.5, 29, 1415, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602),
(1731, 50, 310, 'Copper Vein', '', '', '', 0.5, 38, 1502, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602);


-- World Respawns
UPDATE `creature` SET `spawntimesecs`='180' WHERE  `spawntimesecs`='120';
UPDATE `creature` SET `spawntimesecs`='180' WHERE  `spawntimesecs` BETWEEN '180' AND '3600';

UPDATE `gameobject` SET `spawntimesecs`='180' WHERE  `spawntimesecs`='120';
UPDATE `gameobject` SET `spawntimesecs`='180' WHERE  `spawntimesecs` BETWEEN '180' AND '3600';

