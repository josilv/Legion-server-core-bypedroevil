/*===========

-- DBErrors

===========*/

DELETE FROM `spell_areatrigger` WHERE  `SpellMiscId`=5786;

UPDATE `areatrigger_template` SET `ScriptName`='' WHERE  `Id`=5762;

UPDATE `areatrigger_template` SET `ScriptName`='' WHERE  `Id`=5738;

UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=101951;

UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=102301;

DELETE FROM `spell_script_names` WHERE  `spell_id`=201961 AND `ScriptName`='spell_shivermaw_ice_bomb';

DELETE FROM `spell_script_names` WHERE  `spell_id`=201672 AND `ScriptName`='spell_shivermaw_relentless_storm';

DELETE FROM `spell_script_names` WHERE  `spell_id`=201865 AND `ScriptName`='spell_shivermaw_relentless_storm_missile';