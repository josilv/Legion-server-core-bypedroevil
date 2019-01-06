/*====================
-- Parte 10
====================*/
-- Raptor Rise (4873) Phase 181 When Quest 24897 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68481 AND `area`=4873;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68481, 4873, 24897, 24924, 0, -1, 0, 2, 3, 64, 64);

  -- Spiny Raptor (38187)
   UPDATE `creature_template` SET `unit_flags`='67141632' WHERE  `entry`=38187;

  -- Jungle Panther (40064)
   UPDATE `creature_template` SET `unit_flags`='67141632' WHERE  `entry`=40064;

  -- Oomlot Warrior (38531)
   DELETE FROM `creature` WHERE  `id`='38531' AND `map`='648' AND `zoneId`='4720' AND `areaId`='4871' AND `PhaseId`='181';
   DELETE FROM `creature_addon` WHERE  `guid` IN (401767,401768,401769,401770,401771,401772,401773,401774,401791,401792,401793,401794,401795,401796,401797,401798,401800,401801,401802,401803,401804,401805,401806,401807,401808,401809,401810,401811,401812,401813,401814,401815,401816,401817,401818,401819,401820,401821,401822,401823,401824,401825,401826,401827,401828,401830,401831,401832,401833,401834,401835,401836,401837,401838,401839,401840,401841,401842,401843,401844,401845,401846,401847,401848,401849,401850,401851,401852,401853,401854,401855,401856,401857,401858,401859,401860,401861,401862,401863,401864,401865,401866,401867,401868,401869,401870,401871,401872,401873,401874,401875,401876,401877,401878,401879,401880,401881,401882,401883,401884,401885,401886,401887,401888,401889,401890,401891,401892,401893,401894,401895,401896,401897,401898,401899,401900,401901,401902,401903,401904,401905,401906,401907,401908,401909,401910,401911,401912,401913,401914,401915,401916,401917,401918,401919,401920,401921,401922,401923,401924,401925,401926,401927,401928,401929,401930,401931,401932,401933,401934,401935,401936,401937,401938,401939,401940,401941,401942,401943,401944,401945,401946,401947,401948,401949,401951,401952,401953,401954,401955,401956,401957,401958,401959,401960,401961,401962,401963,401966,401967,401968,401969,401970,401971,401972);

   DELETE FROM `creature` WHERE  `guid` IN (401725,401729,401730,401732,401733,401734,401752,401756,401759,401763,401978,401979,401980,401981,401982,401983,401991,401992,401994,401995,402006);
   DELETE FROM `creature_addon` WHERE  `guid` IN (401725,401729,401730,401732,401733,401734,401752,401756,401759,401763,401978,401979,401980,401981,401982,401983,401991,401992,401994,401995,402006);

   DELETE FROM `creature` WHERE  `guid` IN (401761,401762,401973,401974,401975,401984,401987,401989,401996);
   DELETE FROM `creature_addon` WHERE  `guid` IN (401761,401762,401973,401974,401975,401984,401987,401989,401996);

  -- ELM General Purpose Bunny (scale x3) Large (33111)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=33111;

  -- ELM General Purpose Bunny Large (scale x7) (38908)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=38908;

  -- ELM General Purpose Bunny (Phase II & Phase III) Large (35193)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=35193;

  -- ELM General Purpose Bunny (scale x2) Large (38984)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=38984;

  -- ELM General Purpose Bunny (scale x0.01) Large - High Aggro & Level (44154)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=44154;

  -- ELM General Purpose Bunny Large (scale x3) (46265)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=46265;

  -- ELM General Purpose Bunny Large Hide Body (72665)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=72665;


-- Oomlot Village (4886) Phase 181 When Quest 24897 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68481 AND `area`=4886;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68481, 4886, 24897, 24937, 0, -1, 0, 2, 3, 64, 64);

  -- Oomlot Shaman (38574)
   UPDATE `creature_template` SET `type_flags`='2048' WHERE  `entry`=38574;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38574;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38574, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 13281, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - Cast Earth Shock'),
   (38574, 0, 1, 0, 1, 0, 100, 0, 500, 1000, 600000, 600000, '', 11, 12550, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - On Spawn - Cast Lightning Shield'),
   (38574, 0, 2, 0, 16, 0, 100, 0, 12550, 1, 15000, 30000, '', 11, 12550, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - On Repeat - Cast Lightning Shield');

  -- Oomlot Tribesman (38575)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=38575;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38575, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2300, 3900, '', 11, 74613, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Tribesman - Cast Shoot'),
   (38575, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Tribesman - Flee at 15% HP');

  -- Goblin Captive (38643)
   UPDATE `creature_template` SET `KillCredit1`='38644', `gossip_menu_id`='38643', `npcflag`='1', `AIName`='SmartAI' WHERE  `entry`=38643;

   DELETE FROM `gossip_menu` WHERE `MenuId`=38643 AND `TextId`=1;
   INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES 
   (38643, 1, 26365);

   DELETE FROM `gossip_menu_option` WHERE `MenuId`=38643 AND `OptionIndex`=0;
   INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
   (38643, 0, 0, 'You\'re free!', 0, 1, 1, 26365);

   DELETE FROM `gossip_menu_option_locale` WHERE `MenuId`=38643 AND `OptionIndex`=0 AND `Locale`='esES';
   INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`, `BoxText`) VALUES 
   (38643, 0, 'esES', 'Eres libre!', NULL);

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=38643 AND `ConditionValue1`=24925;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (15, 38643, 0, 0, 0, 9, 0, 24925, 0, 0, 0, 0, 0, '', 'Goblin Captive - Show Gossip 38643 if Player has Quest 24925');

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38643;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38643, 0, 0, 1, 62, 0, 100, 0, 38643, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Captive - On Gossip Selected - Close Gossip)'),
   (38643, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 72243, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Captive - Cast Free The Captives: Summon Oomlot Shaman'),
   (38643, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Captive - Despawn');

  -- Oomlot Shaman (38644)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=38644;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38644, 0, 0, 0, 54, 0, 100, 1, 0, 0, 0, 0, '', 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - On Spawn - Set Random Movement'),
   (38644, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 13281, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - Cast Earth Shock'),
   (38644, 0, 2, 0, 1, 0, 100, 0, 500, 1000, 600000, 600000, '', 11, 12550, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - On Spawn - Cast Lightning Shield'),
   (38644, 0, 3, 0, 16, 0, 100, 0, 12550, 1, 15000, 30000, '', 11, 12550, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - On Repeat - Cast Lightning Shield'),
   (38644, 0, 4, 0, 0, 0, 100, 0, 10000, 10000, 10000, 18000, '', 11, 72518, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - Cast Enveloping Winds'),
   (38644, 0, 5, 0, 1, 0, 100, 1, 7000, 7000, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oomlot Shaman - OCC for 7 seg - Despawn Instant');

  -- Yngwie (38696)
   UPDATE `creature` SET `spawndist`='0', `MovementType`='0', `spawntimesecs`='60' WHERE  `guid`=402081;
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=402081;

   DELETE FROM `creature` WHERE  `guid`=402804;
   DELETE FROM `creature_addon` WHERE  `guid`=402804;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38696;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38696, 0, 0, 0, 2, 0, 100, 0, 0, 75, 15000, 18000, '', 11, 75942, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yngwie - Cast Voodoo Illusion at 75% HP'),
   (38696, 0, 1, 0, 1, 0, 100, 0, 500, 1000, 60000, 125000, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yngwie - On Spawn - Say Random Text');

  -- Bonfire (204584,204977,205204,204151,204978)
   UPDATE `gameobject` SET `PhaseId`='181' WHERE  `guid` IN (141391,141392,141395,141398,141397);

   DELETE FROM `gameobject` WHERE `guid` IN (55004,55005,55006,55007,61513);
   INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`) VALUES 
   (55004, 204584, 648, 4720, 4886, 1, 0, 182, 0, -1, 729.707, 1729.06, 113.936, 3.14245, -0.0164456, 0.0260935, 0.999524, 0, 180, 255, 1, 0, '', 27547),
   (55005, 204977, 648, 4720, 4886, 1, 0, 182, 0, -1, 776.635, 1728.93, 119.44, 2.95833, -0.0756617, 0.0225897, 0.992584, 0.0924204, 180, 255, 1, 0, '', 27547),
   (55006, 205204, 648, 4720, 4886, 1, 0, 182, 0, -1, 764.924, 1671.64, 125.645, 6.06228, 0.0103574, -0.0481501, -0.109368, 0.99278, 180, 255, 1, 0, '', 27547),
   (55007, 204978, 648, 4720, 4886, 1, 0, 182, 0, -1, 711.691, 1545.71, 123.468, 3.01941, -0.0610619, 0.0193529, 0.996025, 0.0618948, 180, 255, 1, 0, '', 27547),
   (61513, 204151, 648, 4720, 4886, 1, 0, 182, 0, -1, 742.231, 1546.99, 129.193, 3.14233, 0.107458, 0.0155287, -0.994086, 0.00204263, 180, 255, 1, 0, '', 27547);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (204584,204977,205204,204151,204978) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (204584, 'esES', 'Fogata', '', NULL, 26365),
   (204977, 'esES', 'Fogata', '', NULL, 26365),
   (205204, 'esES', 'Fogata', '', NULL, 26365),
   (204151, 'esES', 'Fogata', '', NULL, 26365),
   (204978, 'esES', 'Fogata', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (204584,204977,205204,204151,204978) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (204584, 'esMX', 'Fogata', '', NULL, 26365),
   (204977, 'esMX', 'Fogata', '', NULL, 26365),
   (205204, 'esMX', 'Fogata', '', NULL, 26365),
   (204151, 'esMX', 'Fogata', '', NULL, 26365),
   (204978, 'esMX', 'Fogata', '', NULL, 26365);


-- Oomlot Village (4886) Phase 182 When Quest 24937 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4886;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4886, 24937, 25023, 0, -1, 0, 2, 3, 64, 64);


-- Raptor Rise (4873) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4873;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4873, 24924, 25023, 0, -1, 0, 2, 3, 64, 64);


-- Landing Site (4870) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4870;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4870, 24924, 25023, 0, -1, 0, 2, 3, 64, 64);

   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid` IN (402198,402195,402194,402197,402204,402220,402228,402222,402234,402225,402224);
   UPDATE `creature` SET `unit_flags`='33555264' WHERE  `guid` IN (402229,402209,402212,402213,402217,402221,402119,402122,402124,402125,402126,402127,402128,402130,402134,402135,402136,402138,402142,402144,402145,402148,402150,402151,402152,402154,402156,402158,402160,402162,402168,402170,402171,402172,402173,402174,402176);
   UPDATE `creature_addon` SET `auras`='29266' WHERE  `guid` IN (402229,402209,402212,402213,402217,402221,402119,402122,402124,402125,402126,402127,402128,402130,402134,402135,402136,402138,402142,402144,402145,402148,402150,402151,402152,402154,402156,402158,402160,402162,402168,402170,402171,402172,402173,402174,402176);
   UPDATE `creature` SET `spawndist`='15', `MovementType`='1' WHERE  `guid` IN (402207,402211);
   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid`=402199;

  -- Goblin Zombie (38753)
   UPDATE `creature_template` SET `KillCredit1`='38807', `unit_flags`='32768', `flags_extra`='2' WHERE  `entry`=38753;
   UPDATE `creature` SET `spawndist`='20', `MovementType`='1' WHERE  `id`=38753 AND NOT `MovementType`='2';


-- Lost Peak (4899) Phase 182 When Quest 24924 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68482 AND `area`=4899;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68482, 4899, 24924, 24958, 0, -1, 0, 2, 3, 64, 66);

  -- Assistant Greely (38124)
   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=11082 AND `ConditionValue1`=24942;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (15, 11082, 0, 0, 0, 9, 0, 24942, 0, 0, 0, 0, 0, '', 'Assistant Greely - Show Gossip 11082 if Player has Quest 24942');

  -- Coach Crosscheck (38738)
   UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=38738;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38738;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38738, 0, 0, 1, 19, 0, 100, 0, 24942, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - On Quest Add - Quest Credit'),
   (38738, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 16, 17, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 24, 25, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 25, 26, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 26, 27, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 27, 28, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 28, 29, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 29, 30, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 30, 31, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 31, 32, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 32, 33, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 33, 34, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 34, 35, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 35, 36, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 36, 37, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 37, 38, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 38, 39, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 39, 40, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 40, 41, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 41, 42, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 42, 43, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 43, 44, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 44, 45, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 45, 46, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 46, 47, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 47, 48, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 48, 49, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit'),
   (38738, 0, 49, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38807, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coach Crosscheck - Quest Credit');

  -- Super Booster Rocket Boots (38802)  -- Summon Spell 72889 -- Spell Aura 72885
