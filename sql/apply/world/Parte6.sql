/*====================
-- Parte 6
====================*/
-- Dire Strait (4816) Phase 179 When Quest 14244 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4816;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4816, 14244, 14245, 0, -1, 0, 2, 3, 66, 66);

  -- Ravenous Lurker (36681)
   UPDATE `creature_template` SET `InhabitType`='2' WHERE  `entry`=36681;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `id`=36681 AND NOT `MovementType`='2';

   DELETE FROM `smart_scripts` WHERE `entryorguid`=36681;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36681, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 69203, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Lurker - Cast Vicious Bite');

  -- The Hammer (36682)
   UPDATE `creature_template` SET `InhabitType`='2' WHERE  `entry`=36682;
   UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE  `id`=36682 AND NOT `MovementType`='2';


-- Landing Site (4870) Phase 179 When Quest 14244 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=67789 AND `area`=4870;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(67789, 4870, 14244, 14245, 0, -1, 0, 2, 3, 66, 66);

  -- Foreman Dampwick (36470)
   DELETE FROM `smart_scripts` WHERE `entryorguid`=36470;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (36470, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Gossip - Play Emote'),
   (36470, 0, 1, 0, 19, 0, 100, 0, 14245, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Foreman Dampwick - On Quest Add - Say Text 0');

  -- Wild Clucker (38111)
   UPDATE `creature` SET `spawndist`='15', `MovementType`='1' WHERE  `id`=38111 AND NOT `MovementType`='2';
   UPDATE `creature_template` SET `npcflag`='0', `unit_flags`='32768', `AIName`='SmartAI' WHERE  `entry`=38111;
   DELETE FROM `npc_spellclick_spells` WHERE  `npc_entry`=38111 AND `spell_id`=66727;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38111;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38111, 0, 0, 1, 8, 0, 100, 512, 71170, 0, 0, 0, '', 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - On Spellhit - Stop Random Movement'),
   (38111, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, '', 18, 100696072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Set Flag Not Selectable'),
   (38111, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, '', 33, 38117, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Quest Credit'),
   (38111, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 74177, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Cast Cluster Cluck: Remote Control Fireworks Visual'),
   (38111, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 46419, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Cast Cosmetic - Explosion'),
   (38111, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Despawn in 2 seg');

  -- Town-In-A-Box Plunger (201938)
   UPDATE `gameobject_template` SET `ScriptName`='' WHERE  `entry`=201938;
   UPDATE `gameobject` SET `PhaseId`='179', `spawntimesecs`='30' WHERE  `guid`=141263;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201938 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201938, 'esES', 'Embolo de la Ciudad de Bolsillo', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=201938 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (201938, 'esMX', 'Embolo de la Ciudad de Bolsillo', '', NULL, 26365);

  -- Bunny (2000008)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=2000008;
   DELETE FROM `creature_template` WHERE  `entry`=2000008;


-- Dire Strait (4816) Phase 180 When Quest 14245 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4816;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4816, 14245, 24897, 0, -1, 0, 2, 3, 66, 64);


-- Landing Site (4870) Phase 180 When Quest 14245 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4870;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4870, 14245, 24897, 0, -1, 0, 2, 3, 66, 64);

  -- Goblin Barbeque (205500)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid`=141265;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205500 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205500, 'esES', 'Barbacoa Goblin', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205500 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205500, 'esMX', 'Barbacoa Goblin', '', NULL, 26365);

  -- Anvil (205506)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid`=141264;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205506 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205506, 'esES', 'Yunque', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205506 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205506, 'esMX', 'Yunque', '', NULL, 26365);

  -- Forge (205507)
   UPDATE `gameobject` SET `PhaseId`='180', `spawntimesecs`='30' WHERE  `guid`=141267;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205507 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205507, 'esES', 'Forja', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=205507 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (205507, 'esMX', 'Forja', '', NULL, 26365);

