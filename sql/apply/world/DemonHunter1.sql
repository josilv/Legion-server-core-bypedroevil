
DELETE FROM `spell_script_names` WHERE `spell_id`=201453 AND `ScriptName`='spell_dh_metamorphosis_immunity';

DELETE FROM `spell_script_names` WHERE `spell_id`=201453 AND `ScriptName`='spell_dh_metamorphosis_aura';

INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 

(201453, 'spell_dh_metamorphosis_aura');



DELETE FROM `spell_script_names` WHERE `spell_id`=203555 AND `ScriptName`='spell_dh_demon_blades';



DELETE FROM `spell_script_names` WHERE `spell_id`=204022 AND `ScriptName`='spell_dh_fiery_brand_absorb';

 

DELETE FROM `spell_script_names` WHERE `spell_id`=211052 AND `ScriptName`='spell_dh_fel_barrage_aura';



DELETE FROM `spell_script_names` WHERE `spell_id`=201428 AND `ScriptName`='spell_dh_annihilation_damage';

DELETE FROM `spell_script_names` WHERE `spell_id`=227518 AND `ScriptName`='spell_dh_annihilation_damage';



DELETE FROM `areatrigger_scripts` WHERE `entry` IN (3680, 6659, 8867) AND `ScriptName`='areatrigger_dh_shattered_souls';

INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES 

(3680, 'areatrigger_dh_shattered_souls'),

(6659, 'areatrigger_dh_shattered_souls'),

(8867, 'areatrigger_dh_shattered_souls');



DELETE FROM `areatrigger_scripts` WHERE `entry`=8318 AND `ScriptName`='areatrigger_dh_shear';

INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES 

(8318, 'areatrigger_dh_shear');



DELETE FROM `areatrigger_scripts` WHERE `entry` IN (6007, 6710) AND `ScriptName`='at_dh_shattered_souls';



DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5977, 6007, 6710, 6711) AND `ScriptName`='areatrigger_dh_soul_fragment';

INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES 

(5977, 'areatrigger_dh_soul_fragment'),

(6007, 'areatrigger_dh_soul_fragment'),

(6710, 'areatrigger_dh_soul_fragment'),

(6711, 'areatrigger_dh_soul_fragment');