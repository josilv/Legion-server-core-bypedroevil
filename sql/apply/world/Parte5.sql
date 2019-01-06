/*====================
-- Parte 5
====================*/

-- Orc Scout (35918)
DELETE FROM `smart_scripts` WHERE `entryorguid`=35918;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(35918, 0, 0, 0, 54, 0, 100, 1, 0, 0, 0, 0, '', 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - On Just Summoned - Set Random Movement'),
(35918, 0, 1, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - On Aggro - Stop Moving'),
(35918, 0, 2, 0, 0, 0, 100, 0, 2500, 3800, 2500, 3800, '', 11, 15620, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - Cast Shoot'),
(35918, 0, 3, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - OCC for 10 seg - Despawn');


-- The Savage Glen (4782) Phase 171 When Quest 14237 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=59074 AND `area`=4782;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59074, 4782, 14237, 14240, 0, -1, 0, 2, 3, 66, 64);


-- Wild Overlook (4781) Phase 171 When Quest 14237 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=59074 AND `area`=4781;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59074, 4781, 14237, 14240, 0, -1, 0, 2, 3, 66, 64);


-- SI:7 Assassin (36092)
DELETE FROM `smart_scripts` WHERE `entryorguid`=36092;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(36092, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 14873, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'SI:7 Assassin - Cast Sinister Strike');


-- The Lost Isles (4720) Spell 68376 When Quest 14238 is Taken
DELETE FROM `spell_area` WHERE `spell`=68376 AND `area`=4720;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68376, 4720, 14238, 14238, 0, -1, 0, 2, 2, 8, 64);


-- The Savage Glen (4782) Spell 68376 When Quest 14238 is Taken
DELETE FROM `spell_area` WHERE `spell`=68376 AND `area`=4782;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68376, 4782, 14238, 14238, 0, -1, 0, 2, 2, 8, 64);


-- Wild Overlook (4781) Spell 68376 When Quest 14238 is Taken
DELETE FROM `spell_area` WHERE `spell`=68376 AND `area`=4781;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68376, 4781, 14238, 14238, 0, -1, 0, 2, 2, 8, 64);


-- Scout Brax (36112)
DELETE FROM `creature` WHERE `guid`=400658;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(400658, 36112, 648, 4720, 4782, 1, 0, 0, 0, -1, 0, 0, 1079.87, 3241.81, 80.8397, 2.60054, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 27481);

DELETE FROM `smart_scripts` WHERE `entryorguid`=36112;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(36112, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scout Brax - On Gossip - Play Emote'),
(36112, 0, 1, 0, 19, 0, 100, 0, 14241, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scout Brax - On Quest Add - Say Text 0');


-- Alliance Beachhead (4783) Phase 172 When Quest 14241 is Taken
DELETE FROM `spell_area` WHERE `spell`=59087 AND `area`=4783;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59087, 4783, 14241, 14445, 0, -1, 0, 2, 3, 74, 66);

   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid` IN (400668,400670,400673,400674,400675,400678);

  -- SI:7 Operative (36103)
   UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=36103 AND NOT `MovementType`='2' AND `PhaseId`='172';

  -- Gyrochoppa (36127)npc_gyrocoptere_quest_giver
   UPDATE `creature_template` SET `InhabitType`='4', `AIName`='SmartAI' WHERE  `entry`=36127;
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=42015;

   DELETE FROM `creature` WHERE  `guid`=400650;
   DELETE FROM `creature_addon` WHERE  `guid`=400650;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36127;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36127, 0, 0, 1, 19, 0, 100, 0, 14242, 0, 0, 0, '', 33, 36145, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gyrochoppa - On Quest Add - Quest Credit'),
   (36127, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 45472, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gyrochoppa - Cast Parachute'),
   (36127, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 62, 648, 0, 0, 0, 0, 0, 7, 0, 0, 0, 972.287, 3806.56, 37.91, 0, 'Gyrochoppa - Teleport Player');

  -- Pride of Kezan (39074) -- Summon Spell 73430
   UPDATE `creature_template` SET `minlevel`='10', `maxlevel`='10', `npcflag`='16777216', `unit_flags`='16809984', `InhabitType`='4', `subname`='', `spell1`='73456', `spell2`='73477', `VehicleId`='852' WHERE  `entry`=39074;

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=39074 AND `spell_id`=46598;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (39074, 46598, 0, 0);

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=39074 AND `SourceEntry`=46598 AND `ConditionValue1`=14242;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 39074, 46598, 0, 0, 9, 0, 14242, 0, 0, 0, 0, 0, '', 'Pride of Kezan - Required Quest Active for Spellclick');

  -- Gyrocopter (2000006)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=2000006;
   DELETE FROM `creature_template` WHERE  `entry`=2000006;

  -- Gyrochoppa Pilot (36129)
   UPDATE `creature_addon` SET `emote`='69' WHERE  `guid`=400702;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36129;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36129, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gyrochoppa Pilot - On Aggro - Say Text 0');

  -- Bastia (36578)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=36578;


-- Vegeance Wake (4784) Phase 172 When Quest 14241 is Taken
DELETE FROM `spell_area` WHERE `spell`=59087 AND `area`=4784;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(59087, 4784, 14241, 14326, 0, -1, 0, 2, 3, 74, 66);

  -- Alliance Sailor (36149)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=36149;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36149, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 11976, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Sailor - Cast Strike');

  -- Alliance Captain (36153)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=36153;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36153, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 18000, 22000, '', 11, 13730, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Alliance Captain - Cast Demoralizing Shout');

  -- Alliance Wizard (36621)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=36621;
   UPDATE `creature` SET `unit_flags`='33587968' WHERE  `guid`=400855;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36621;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36621, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, '', 11, 54219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Alliance Wizard - On Respawn - Add Aura Arcane Channeling'),
   (36621, 0, 1, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 9053, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Wizard - Cast Fireball');

  -- Arcane Cage (195704,195707)
   UPDATE `gameobject` SET `PhaseId`='172', `spawntimesecs`='60' WHERE  `guid`=141252;
   UPDATE `gameobject` SET `PhaseId`='179', `spawntimesecs`='60' WHERE  `guid`=141261;

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (195704,195707) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (195704, 'esES', 'Jaula arcana', '', NULL, 26365),
   (195707, 'esES', 'Jaula arcana', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (195704,195707) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (195704, 'esMX', 'Jaula arcana', '', NULL, 26365),
   (195707, 'esMX', 'Jaula arcana', '', NULL, 26365);


-- Vegeance Wake (4784) Phase 179 When Quest 14242 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4784;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4784, 14326, 0, 0, -1, 0, 2, 3, 66, 11);

  -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (36177)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=36177;

  -- Alliance Sailor (36176)
   UPDATE `creature_template` SET `unit_flags`='32768', `flags_extra`='2' WHERE  `entry`=36176;

   UPDATE `creature_addon` SET `auras`='29266' WHERE  `guid` IN (400848,400831,400843,400854,400818,400835,400824,400853,400841,400849,400846,400814,400820,400821,400825,400860,400867,400868,400873);
   UPDATE `creature` SET `unit_flags`='33587968', `spawndist`='0', `MovementType`='0' WHERE  `guid` IN (400848,400831,400843,400854,400818,400835,400824,400853,400841,400849,400846,400814,400820,400821,400825,400860,400867,400868,400873);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36176;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36176, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 11976, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Sailor - Cast Strike');

  -- Cyclone of the Elements (36178) -- Summon Spell 68408
   UPDATE `creature_template` SET `npcflag`='16777216', `InhabitType`='4', `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=36178;

   DELETE FROM `creature` WHERE  `guid`=256069;
   DELETE FROM `creature_addon` WHERE  `guid`=256069;

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36178 AND `spell_id`=46598;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (36178, 46598, 0, 0);

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36178 AND `spell_id`=68436;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (36178, 68436, 2, 0);

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36178 AND `SourceEntry`=46598 AND `ConditionValue1`=14243;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 36178, 46598, 0, 0, 9, 0, 14243, 0, 0, 0, 0, 0, '', 'Cyclone of the Elements - Required Quest Active for Spellclick');

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36178 AND `SourceEntry`=68436 AND `ConditionValue1`=14243;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 36178, 68436, 0, 0, 9, 0, 14243, 0, 0, 0, 0, 0, '', 'Cyclone of the Elements - Required Quest Active for Spellclick');

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36178;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36178, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, '', 11, 36178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Respawn - Add Aura Cosmetic: Blue Cyclone');
  
  -- Thrall (36161)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=36161;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36161;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36161, 0, 0, 1, 19, 0, 100, 0, 14243, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - On Quest Add - Quest Credit'),
   (36161, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 16, 17, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 24, 25, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 25, 26, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 26, 27, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 27, 28, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 28, 29, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 29, 30, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 30, 31, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 31, 32, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 32, 33, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 33, 34, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 34, 35, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 35, 36, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 36, 37, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 37, 38, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 38, 39, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 39, 40, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 40, 41, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 41, 42, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 42, 43, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 43, 44, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 44, 45, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 45, 46, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 46, 47, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 47, 48, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 48, 49, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 49, 50, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 36176, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Thrall - Quest Credit'),
   (36161, 0, 50, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 62, 648, 0, 0, 0, 0, 0, 7, 0, 0, 0, 872.974, 2765.71, 118.63, 4.688789, 'Thrall - Teleport Player'),
   (36161, 0, 51, 0, 25, 0, 100, 0, 0, 0, 0, 0, '', 11, 51380, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thrall - On Respawn - Add Aura Lightning & Ice Channeling');


-- Alliance Beachhead (4783) Phase 179 When Quest 14243 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4783;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4783, 14243, 0, 0, -1, 0, 2, 3, 66, 11);


-- The Savage Glen (4782) Phase 179 When Quest 14243 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4782;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4782, 14243, 14244, 0, -1, 0, 2, 3, 66, 64);


-- Wild Overlook (4781) Phase 179 When Quest 14243 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4781;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4781, 14243, 14244, 0, -1, 0, 2, 3, 66, 64);

   UPDATE `creature_addon` SET `emote`='333' WHERE  `guid` IN (401141,401152,401154);
   UPDATE `creature_addon` SET `emote`='214' WHERE  `guid` IN (401140,401142,401153);
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid` IN (401171,401165,401179,401159,401158,401176,401177,401178);
   UPDATE `creature_addon` SET `emote`='616' WHERE  `guid`=401151;
   UPDATE `creature_addon` SET `emote`='648' WHERE  `guid` IN (401182,401162,401174,401183,401184,401187,401188,401189,401190);

  -- Goblin Survivor (36426)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=36426;

  -- Rocket Sling (196439)
   UPDATE `gameobject_template` SET `Data1`='14244', `AIName`='SmartGameObjectAI' WHERE  `entry`=196439;
   UPDATE `gameobject` SET `PhaseId`='179' WHERE  `guid`=141262;

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10808 AND `ConditionValue1`=14244;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (15, 10808, 0, 0, 0, 9, 0, 14244, 0, 0, 0, 0, 0, '', 'Rocket Sling - Show Gossip Only if Player has Taken Quest 14244');

   DELETE FROM `smart_scripts` WHERE `entryorguid`=196439;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (196439, 1, 0, 1, 62, 0, 100, 0, 10808, 0, 0, 0, '', 85, 66127, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Rocket Sling - On Gossip Option 0 Selected - Player Cast on Self Up, Up & Away!: Kill Credit + Explosion'),
   (196439, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 62, 648, 0, 0, 0, 0, 0, 7, 0, 0, 0, 936.725, 2385.18, 4.618, 5.171792, 'Rocket Sling - Teleport Player'),
   (196439, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Rocket Sling - Close Gossip');

   DELETE FROM `gameobject_template_locale` WHERE `entry`=196439 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (196439, 'esES', 'Lanzador de cohete', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=196439 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (196439, 'esMX', 'Lanzador de cohete', '', NULL, 26365);

  -- Sling Rocket (36514) -- Summon Spell 68817
   UPDATE `creature_template` SET `minlevel`='10', `maxlevel`='10', `npcflag`='16777216', `unit_flags`='16809984', `InhabitType`='4' WHERE  `entry`=36514;

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36514 AND `spell_id`=46598;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (36514, 46598, 0, 0);

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36514 AND `SourceEntry`=46598 AND `ConditionValue1`=14244;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 36514, 46598, 0, 0, 9, 0, 14244, 0, 0, 0, 0, 0, '', 'Sling Rocket - Required Quest Active for Spellclick');

  -- Gameobject No Name (196432)
   UPDATE `gameobject_template` SET `ScriptName`='' WHERE  `entry`=196432;

  -- Explosive Fuse (42763)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=42763;
