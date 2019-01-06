/*====================
-- Parte 8
====================*/


-- Ruins of Vashj'elan (4876) Phase 180 When Quest 14245 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4876;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4876, 24856, 24897, 0, -1, 0, 2, 3, 66, 64);

  -- [Deprecated for 4.x]Young Arikara (10581)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=10581;

  -- Goblin Banner (202132)
   UPDATE `gameobject` SET `PhaseId`='180' WHERE  `guid`=141297;

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202132 AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202132, 'esES', 'Estandarte goblin', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry`=202132 AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202132, 'esMX', 'Estandarte goblin', '', NULL, 26365);

  -- Megs Dreadshredder (38432)
   UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE  `entry`=38432;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38432;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38432, 0, 1, 0, 19, 0, 100, 0, 24897, 0, 0, 0, '', 28, 68481, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Megs Dreadshredder - On Quest Add - Remove Aura Phase - Quest Zone-Specific 06');

  -- Brett "Coins" McQuid (38381)
   UPDATE `gossip_menu_option` SET `OptionType`='3', `OptionNpcFlag`='128' WHERE  `MenuId`=11009 AND `OptionIndex`=0;

  -- Goblin Survivor (38409)
   UPDATE `creature` SET `unit_flags`='33555200' WHERE  `guid` IN (401356,401359,401371,401372,401374,401377);

  -- Vashj'elan Warrior (38359)
   DELETE FROM `creature` WHERE  `guid` IN (401440,401445,401449,401453,401545,401546);
   DELETE FROM `creature_addon` WHERE  `guid` IN (401440,401445,401449,401453,401545,401546);

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38359;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38359, 0, 0, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, '', 11, 57846, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Vashj\'elan Warrior - Cast Heroic Strike'),
   (38359, 0, 1, 0, 2, 0, 100, 1, 0, 30, 0, 0, '', 11, 8599, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vashj\'elan Warrior - Cast Enrage at 30% HP');

  -- Vashj'elan Siren (38360)
   DELETE FROM `creature` WHERE  `guid`=401447;
   DELETE FROM `creature_addon` WHERE  `guid`=401447;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38360;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38360, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3400, 4700, '', 11, 9672, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Vashj\'elan Siren - Cast Frostbolt'),
   (38360, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vashj\'elan Siren - Flee at 15% HP'),
   (38360, 0, 2, 0, 9, 0, 100, 0, 0, 8, 15000, 25000, '', 11, 11831, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vashj\'elan Siren - Cast Frost Nova on Close');

  -- Intact Naga Hide (50437)
   UPDATE `creature_loot_template` SET `Chance`='100' WHERE  `Item`=50437;

  -- Naga Banner (202133,202248,246389)
   UPDATE `gameobject_template` SET `Data5`='1' WHERE  `entry`=202133;
   UPDATE `gameobject_template_addon` SET `flags`='4' WHERE  `entry`=202133;
   UPDATE `gameobject` SET `PhaseId`='180' WHERE  `id`=202133;

   DELETE FROM `gameobject` WHERE  `guid` IN (141371,141376,141374,141372,141378,141373,141375,141377,141370);
   DELETE FROM `gameobject_addon` WHERE  `guid` IN (141371,141376,141374,141372,141378,141373,141375,141377,141370);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (202133,202248,246389) AND `locale`='esES';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202133, 'esES', 'Estandarte naga', '', NULL, 26365),
   (202248, 'esES', 'Estandarte naga', '', NULL, 26365),
   (246389, 'esES', 'Estandarte naga', '', NULL, 26365);

   DELETE FROM `gameobject_template_locale` WHERE `entry` IN (202133,202248,246389) AND `locale`='esMX';
   INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES 
   (202133, 'esMX', 'Estandarte naga', '', NULL, 26365),
   (202248, 'esMX', 'Estandarte naga', '', NULL, 26365),
   (246389, 'esMX', 'Estandarte naga', '', NULL, 26365);

  -- Faceless of the Deep Void Zone (38450)
   UPDATE `creature_template` SET `InhabitType`='4' WHERE  `entry`=38450;

  -- Faceless of the Deep (38448)
   UPDATE `creature_template` SET `unit_flags`='32768' WHERE  `entry`=38448;
   UPDATE `creature` SET `position_x`='131.564', `position_y`='1938.32', `position_z`='8.62286' WHERE  `guid`=401588;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38448;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38448, 0, 0, 0, 1, 0, 100, 0, 500, 1000, 300000, 300000, '', 11, 72055, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Faceless of the Deep - On Spawn - Cast Absorption Shield'),
   (38448, 0, 1, 0, 16, 0, 100, 0, 72055, 1, 15000, 30000, '', 11, 72055, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Faceless of the Deep - Cast Absorption Shield on Repeat'),
   (38448, 0, 2, 0, 9, 0, 100, 0, 10, 70, 10000, 12000, '', 11, 75903, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Faceless of the Deep - Cast Shadow Crash on Close');

  -- Strange Tentacle (33420)
   UPDATE `creature_template` SET `unit_flags`='4', `InhabitType`='4' WHERE  `entry`=33420;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=33420;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (33420, 0, 0, 0, 4, 1, 100, 1, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Strange Tentacle - On Aggro - Stop Moving'),
   (33420, 0, 1, 0, 0, 0, 100, 0, 3000, 3000, 5000, 5000, '', 11, 71812, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Strange Tentacle - Cast Shadow Bolt');


-- Vashj'elan Spawning Pool (4877) Phase 180 When Quest 14245 is Completed/Rewarded
DELETE FROM `spell_area` WHERE `spell`=68480 AND `area`=4877;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES 
(68480, 4877, 24856, 24897, 0, -1, 0, 2, 3, 66, 64);

  -- Naga Hatchling (44578)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=44578;


   DELETE FROM `smart_scripts` WHERE `entryorguid`=44578;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (44578, 0, 0, 1, 73, 0, 100, 0, 0, 0, 0, 0, '', 33, 38413, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - On Spellclick - Quest Credit'),
   (44578, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - Despawn Instant');

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=44578 AND `SourceEntry`=72073 AND `ConditionValue1`=24864;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 44578, 72073, 0, 0, 9, 0, 24864, 0, 0, 0, 0, 0, '', 'Naga Hatchling - Required Quest Active for Spellclick');

  -- Naga Hatchling (44579)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=44579;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=44579;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (44579, 0, 0, 0, 73, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - On Spellclick - Despawn Instant');

   DELETE FROM `npc_spellclick_spells` WHERE  `npc_entry`=44579 AND `spell_id`=72073;

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=44579 AND `SourceEntry`=90102 AND `ConditionValue1`=24864;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 44579, 90102, 0, 0, 9, 0, 24864, 0, 0, 0, 0, 0, '', 'Naga Hatchling - Required Quest Active for Spellclick');

  -- Naga Hatchling (44580)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=44580;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=44580;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (44580, 0, 0, 1, 73, 0, 100, 0, 0, 0, 0, 0, '', 33, 38413, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - On Spellclick - Quest Credit'),
   (44580, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - Despawn Instant');

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=44580 AND `SourceEntry`=72073 AND `ConditionValue1`=24864;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 44580, 72073, 0, 0, 9, 0, 24864, 0, 0, 0, 0, 0, '', 'Naga Hatchling - Required Quest Active for Spellclick');

  -- Naga Hatchling (38412)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=38412;
   UPDATE `npc_spellclick_spells` SET `spell_id`='90102' WHERE  `npc_entry`=38412 AND `spell_id`=72073;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38412;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38412, 0, 0, 0, 73, 0, 100, 0, 0, 0, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - On Spellclick - Despawn Instant');

   DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=38412 AND `SourceEntry`=90102 AND `ConditionValue1`=24864;
   INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
   (18, 38412, 90102, 0, 0, 9, 0, 24864, 0, 0, 0, 0, 0, '', 'Naga Hatchling - Required Quest Active for Spellclick');

  -- Naga Hatchling (38457)
   UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=38457;

   DELETE FROM `smart_scripts` WHERE `entryorguid`=38457;
   INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
   (38457, 0, 0, 0, 1, 0, 100, 1, 3000, 3000, 0, 0, '', 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - OCC for 3 seg - Despawn');

  -- Ace (39198)
   UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=39198;
