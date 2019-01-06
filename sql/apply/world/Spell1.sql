delete from spell_linked_spell where spell_trigger=198580 and spell_effect=194667;



delete from areatrigger_template_actions where AreaTriggerId=5718 and ActionType=10 and ActionParam=0;



delete from spell_script_names where spell_id=222703 and ScriptName='spell_dh_fel_barrage_aura';



DELETE FROM `spell_script_names` WHERE `spell_id`=11366 AND `ScriptName`='spell_mage_pyroblast';

INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 

(11366, 'spell_mage_pyroblast');



DELETE FROM `spell_script_names` WHERE `spell_id`=2120 AND `ScriptName`='spell_mage_flamestrike';

INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 

(2120, 'spell_mage_flamestrike');