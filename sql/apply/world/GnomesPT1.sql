/*=============
-- Fixs Sanitron
=============*/
-- Sanitron 500 (46185)
UPDATE `creature_template` SET `gossip_menu_id`='46185', `npcflag`='1', `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=46185;

DELETE FROM `gossip_menu` WHERE `MenuId`=46185 AND `TextId`=1;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES 
(46185, 1, 26365);

DELETE FROM `gossip_menu_option` WHERE `MenuId`=46185 AND `OptionIndex`=0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(46185, 0, 0, 'Decontaminate me!.', 0, 1, 1, 26365);



DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=46185 AND `ConditionValue1`=27635;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 46185, 0, 0, 0, 9, 0, 27635, 0, 0, 0, 0, 0, '', 'Sanitron 500 - Show Gossip Only if Player has Taken Quest 27635');

DELETE FROM `smart_scripts` WHERE `entryorguid`=46185;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(46185, 0, 0, 1, 62, 0, 100, 0, 46185, 0, 0, 0, '', 85, 86075, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Gossip Select - Player Cast on Self Decontaminate Stage 1'),
(46185, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 86080, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - Cast Clean Cannon Clean Burst'),
(46185, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 85, 86086, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - Player Cast on Self Decontaminate Stage 3'),
(46185, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, '', 28, 80653, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - Remove Aura Irradiated From the Player'),
(46185, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 30934, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - Cast Explosion'),
(46185, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - Despawn in 1 seg');

UPDATE `creature` SET `spawntimesecs`='60' WHERE  `id`=46185;


-- Decontamination Bunny (46165)
UPDATE `creature` SET `modelid`='28016' WHERE  `id`=46165;


-- Clean Cannon X-2 (46208)
UPDATE `creature_template` SET `modelid1`='27669', `modelid2`='0', `InhabitType`='8' WHERE  `entry`=46208;
UPDATE `creature` SET `modelid`='27669' WHERE  `id`=46208;


-- Sparking Console (46085)
UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=46085;
UPDATE `creature` SET `modelid`='28016' WHERE  `id`=46085;
