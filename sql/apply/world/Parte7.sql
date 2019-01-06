/*====================
-- Parte 7
====================*/

-- The Biggest Egg Ever - Flavor Event (202104)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid`=141351;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202104 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202104, 'esES', 'El huevo mas grande del mundo - Evento de Sabor', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202104 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202104, 'esMX', 'El huevo mas grande del mundo - Evento de Sabor', '', NULL, 26365);

  -- Clucker Coop (201948)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid`=141266;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201948 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201948, 'esES', 'Corral de cloqueadora', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201948 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201948, 'esMX', 'Corral de cloqueadora', '', NULL, 26365);

  -- Mechashark X-Steam Controller (202108)
   UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE  `entry`=202108;
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid` IN (141269,141270,141276);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=202108;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (202108, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, '', 85, 71662, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Mechashark X-Steam Controller - On State Changed - Player Cast on Self A Goblin In Shark\'s Clothing: Mechashark X-Steam Controller');

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202108 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202108, 'esES', 'Controlador de Mecatiburon Vapor-X', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202108 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202108, 'esMX', 'Controlador de Mecatiburon Vapor-X', '', NULL, 26365);

  -- Trainers
   UPDATE `creature_template` SET `npcflag`='1' WHERE  `entry` IN (38513,38514,38515,38516,38518);
   UPDATE `creature_template` SET `npcflag`='3' WHERE  `entry` IN (38122,38517);

  -- Flying Bomber (39037)
   UPDATE `creature_template` SET `unit_flags`='768', `InhabitType`='4' WHERE  `entry`=39037;
   UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `guid`=401245 AND NOT `MovementType`='2';

  -- Foreman Dampwick (36471)
   DELETE FROM `creature_queststarter` WHERE  `id`=36471 AND `quest`=14245;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36471;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36471, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Gossip - Play Emote'),
   (36471, 0, 1, 0, 19, 0, 100, 0, 27139, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest Add - Say Text 0'),
   (36471, 0, 2, 0, 20, 0, 100, 0, 14245, 0, 0, 0, '', 28, 68750, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest End - Remove Aura Quest Phase 05');

  -- Sally "Salvager" Sandscrew (38511)
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid`=401249;

  -- Assistant Greely (38124)
   UPDATE `creature_addon` SET `emote`='69' WHERE  `guid`=401254;

  -- KTC Train-a-Tron Deluxe (45286)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=45286;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (45286, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, '', 11, 7165, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'KTC Train-a-Tron Deluxe - On Spawn - Cast Battle Stance');

  -- Izzy (38647)
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid`=401247;

  -- Gobber (38746)
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid`=401251;
   UPDATE `gossip_menu_option` SET `OptionType`='9', `OptionNpcFlag`='131072' WHERE  `MenuId`=11248 AND `OptionIndex`=0;

  -- Coach Crosscheck (38738)
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid`=401261;

  -- Goblin Survivor (38409)
   UPDATE `creature_template` SET `unit_flags`='32768', `dynamicflags`='0' WHERE  `entry`=38409;
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid` IN (401265,401268,401271);
   UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `guid`=401280 AND NOT `MovementType`='2';

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38409;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38409, 0, 0, 1, 8, 0, 100, 0, 73583, 0, 0, 0, '', 33, 38409, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - On Spellhit - Quest Credit'),
   (38409, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Say Text 0'),
   (38409, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Despawn in 5 seg'),
   (38409, 0, 3, 4, 8, 0, 100, 0, 73599, 0, 0, 0, '', 33, 38409, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - On Spellhit - Quest Credit'),
   (38409, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Say Text 0'),
   (38409, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goblin Survivor - Despawnin 5 seg');

  -- Kezan Citizen (38745)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=38745;
   UPDATE `creature_addon` SET `emote`='1' WHERE  `guid` IN (401252,401259,401284,401285,401287);
   UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `guid` IN (401283,401286) AND NOT `MovementType`='2';

  -- Hobart Grapplehammer (38120)
   UPDATE `creature` SET `position_x`='927.042', `position_y`='2330.65', `position_z`='5.0223', `orientation`='2.40327' WHERE  `guid` IN (401273,401745);
   DELETE FROM `creature_queststarter` WHERE  `id`=38120 AND `quest`=27139;

  -- Mechashark X-Steam (38318)
   UPDATE `creature_template` SET `minlevel`='10', `maxlevel`='10', `npcflag`='16777216', `unit_flags`='16809984', `AIName`='SmartAI', `InhabitType`='2' WHERE  `entry`=38318;

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=38318 AND `spell_id`=46598;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (38318, 46598, 0, 0);

   DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=38318 AND `spell_id`=71662;
   INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
   (38318, 71662, 2, 0);

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=38318 AND `SourceEntry`=46598 AND `ConditionValue1`=24817;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 38318, 46598, 0, 0, 9, 0, 24817, 0, 0, 0, 0, 0, '', 'Mechashark X-Steam - Required Quest Active for Spellclick');

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=38318 AND `SourceEntry`=71662 AND `ConditionValue1`=24817;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 38318, 71662, 0, 0, 9, 0, 24817, 0, 0, 0, 0, 0, '', 'Mechashark X-Steam - Required Quest Active for Spellclick');

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38318;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38318, 0, 0, 0, 1, 0, 100, 1, 3000, 3000, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mechashark X-Steam - OCC for 3 seg - Despawn');


-- Raptor Rise (4873) Phase 180 When Quest 14245 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4873;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4873, 14245, 24897, 0, -1, 0, 2, 3, 66, 64);

  -- Raptor Trap (201972,301038)
   UPDATE `gameobject` SET `PhaseId`='180' WHERE  `id`=201972;

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (201972,301038) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201972, 'esES', 'Trampa de Raptor', '', NULL, 26365),
   (301038, 'esES', 'Trampa de Raptor', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (201972,301038) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201972, 'esMX', 'Trampa de Raptor', '', NULL, 26365),
   (301038, 'esMX', 'Trampa de Raptor', '', NULL, 26365);

  -- Raptor Egg (201974)
   UPDATE `gameobject_template` SET `Data8`='24741' WHERE  `entry`=201974;
   UPDATE `gameobject` SET `PhaseId`='180' WHERE  `id`=201974;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201974 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201974, 'esES', 'Huevo de raptor', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201974 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201974, 'esMX', 'Huevo de raptor', '', NULL, 26365);

  -- Spiny Raptor (38187)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=38187;
   UPDATE `creature` SET `spawndist`='10', `MovementType`='1' WHERE  `id`=38187 AND NOT `MovementType`='2';

   DELETE FROM `creature_questitem` WHERE `CreatureEntry`=38187 AND `Idx`=0;
   INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES 
   (38187, 0, 50239, 26365);

   DELETE FROM `creature_loot_template` WHERE `Entry`=38187 AND `Item`=50239;
   INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
   (38187, 50239, 0, 100, 1, 1, 0, 1, 1, '');

  -- Jungle Panther (40064)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=40064;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (40064, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 31289, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Jungle Panther - Cast Claw');


-- Scorched Gully (4874) Phase 180 When Quest 24741 is Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4874;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4874, 24741, 24744, 0, -1, 0, 2, 3, 64, 64);

  -- The Biggest Egg Ever (201977)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='120' WHERE  `guid`=141350;
   UPDATE `gameobject_template` SET `Data8`='24744' WHERE  `entry`=201977;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201977 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201977, 'esES', 'El huevo mas grande del mundo', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201977 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201977, 'esMX', 'El huevo mas grande del mundo', '', NULL, 26365);

  -- Mechachicken (38224)
   UPDATE `creature` SET `areaId`='4874', `position_x`='1259.44', `position_y`='2376.56', `position_z`='0.418662' WHERE  `guid`=401322;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38224;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38224, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 71657, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mechachicken - Cast Deadly Egg Barrage');

