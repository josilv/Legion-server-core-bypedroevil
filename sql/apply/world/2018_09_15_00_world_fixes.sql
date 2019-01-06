/*=============
-- Echo Isles
=============*/
-- A Troll's Truest Companion (24622)
DELETE FROM `quest_offer_reward` WHERE `ID`=24622;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(24622, 3, 0, 0, 0, 0, 0, 0, 0, 'Nice ta see new faces \'round here, mon. It\'s easy ta get ta feelin\' isolated since we left Orgrimmar.', 26365);


/*=============
-- Dun Morogh
=============*/
-- Forced to Watch from Afar (313)
UPDATE creature_template SET faction=57 WHERE entry IN (40991,40994,41056);
UPDATE creature_template SET unit_flags=131074 WHERE entry IN (40991,40994,41056);


-- The Ultrasafe Personnel Launcher (25839)
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (41327,41398);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(41327, 77424, 2, 0),
(41398, 77424, 2, 0),
(41327, 77431, 3, 0),
(41398, 77431, 3, 0);


/*=================
--  Elwynn Forest
=================*/
-- Elmore's Task (1097)
DELETE FROM `creature_queststarter` WHERE `id`=1416 AND `quest`=1097;


/*=============
-- Teldrassil
=============*/
-- To Darnassus (6341)
DELETE FROM `creature_queststarter` WHERE `id`=10118 AND `quest`=6341;
DELETE FROM `creature_questender` WHERE `id`=3838 AND `quest`=6341;


-- An Unexpected Gift (6342)
DELETE FROM `creature_queststarter` WHERE `id`=3838 AND `quest`=6342;
DELETE FROM `creature_queststarter` WHERE `id`=40552 AND `quest`=6342;
DELETE FROM `creature_questender` WHERE `id`=4200 AND `quest`=6342;


-- Return to Nyoma (6343)
DELETE FROM `creature_queststarter` WHERE `id`=4200 AND `quest`=6343;
DELETE FROM `creature_queststarter` WHERE `id`=4265 AND `quest`=6343;
DELETE FROM `creature_questender` WHERE `id`=10118 AND `quest`=6343;


-- Reminders of Home
DELETE FROM `creature_queststarter` WHERE `id`=4241 AND `quest`=6344;
DELETE FROM `creature_queststarter` WHERE `id`=40553 AND `quest`=6344;
DELETE FROM `creature_questender` WHERE `id`=10118 AND `quest`=6344;


/*=================
-- Eversong Woods
=================*/
-- The Party Never Ends (9067)
DELETE FROM `creature_queststarter` WHERE `id`=16144 AND `quest`=9067;


-- Goods from Silvermoon City (9130)
DELETE FROM `creature_queststarter` WHERE `id`=16187 AND `quest`=9130;
DELETE FROM `creature_queststarter` WHERE `id`=44036 AND `quest`=9130;


-- Botanist Tyniarrel (16367)
DELETE FROM `npc_trainer` WHERE `ID`=16367 AND `SpellID` IN (2366,2368,3570,11993,28695,50300,74519,110413);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES 
(16367, 2366, 10, 0, 0, 0, 0),
(16367, 2368, 500, 182, 50, 0, 0),
(16367, 3570, 5000, 182, 125, 0, 0),
(16367, 11993, 50000, 182, 200, 0, 0),
(16367, 28695, 100000, 182, 275, 0, 0),
(16367, 50300, 350000, 182, 350, 0, 0),
(16367, 74519, 500000, 182, 425, 0, 0),
(16367, 110413, 600000, 182, 500, 0, 0);


/*===========
-- Westfall
===========*/
-- Furlbrow's Deed (184)
DELETE FROM `creature_questender` WHERE `id`=237 AND `quest`=184;

DELETE FROM `quest_request_items` WHERE `ID`=184;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES 
(184, 1, 0, 0, 0, 'We don\'t need any civilian vigilante types getting involved, kid. Leave this one to the professionals.', 26365);

DELETE FROM `quest_offer_reward` WHERE `ID`=184;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(184, 1,0, 0, 0, 0, 0, 0, 0, 'This is useless. Look at the date on this letter. The Furlbrows have been squatting on the Jansen Steed for five years. They never could quite get their wagon... fixed.', 26365);


-- Hero's Call: Westfall! (26378)
DELETE FROM `quest_offer_reward` WHERE `ID`=26378;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26378, 1, 0, 0, 0, 0, 0, 0, 0, 'Murder, rookie. That\'s what you\'re looking at on the ground in front of us.', 26365);


-- Hero's Call: Westfall! (28562)
DELETE FROM `quest_offer_reward` WHERE `ID`=28562;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(28562, 1, 0, 0, 0, 0, 0, 0, 0, 'Murder, rookie. That\'s what you\'re looking at on the ground in front of us.', 26365);


/*=================
-- New Tinkertown
=================*/
-- Pinned Down (27670)
DELETE FROM `quest_offer_reward` WHERE `ID`=27670;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(27670, 1, 0, 0, 0, 0, 0, 0, 0, 'Well done, $n. My men can take it from here. Let\'s focus on getting the other survivors out now.', 26365);


-- Report to Carvo Blastbolt (28167)
DELETE FROM `quest_offer_reward` WHERE `ID`=28167;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(28167, 1, 0, 0, 0, 0, 0, 0, 0, 'Did Nevin send you ahead? That means he\'s getting ready to end the mission, but there are still survivors to be rescued. We have to help them!', 26365);


-- See to the Survivors (27671)
DELETE FROM `quest_offer_reward` WHERE `ID`=27671;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) 
VALUES (27671, 1, 0, 0, 0, 0, 0, 0, 0, 'I know Nevin will be pleased with all the survivors you managed to help. I still can\'t believe you managed to stay so strong down here in the radiation. You\'ve seen the shape the other survivors are in. Let\'s get you to the loading room for decontamination.', 26365);


-- Withdraw to the Loading Room! (28169)
DELETE FROM `quest_offer_reward` WHERE `ID`=28169;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(28169, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $c. We rarely come across survivors as strong and capable as you are. I can help get you decontaminated and on your way out of here.', 26365);


-- Decontamination (27635)
DELETE FROM `quest_offer_reward` WHERE `ID`=27635;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(27635, 1, 0, 0, 0, 0, 0, 0, 0, 'There, now you\'re fit to head off to the surface and start your new life. The High Tinker will be delighted to hear of your arrival.', 26365);


-- To the Surface (27674)
DELETE FROM `quest_offer_reward` WHERE `ID`=27674;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(27674, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to see you again, $n. Without your help, we wouldn\'t have been able to get so many survivors out of Gnomeregan this time. Everyone is going to be thrilled to meet you and hear your story.', 26365);


-- The Future of Gnomeregan (26197)
DELETE FROM `quest_offer_reward` WHERE `ID`=26197;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26197, 1, 0, 0, 0, 0, 0, 0, 0, '$n, isn\'t it? It\'s a pleasure to finally meet you. While you were getting cleaned up, Nevin\'s team told me about your escape from Gnomeregan.', 26365);


-- The Future of Gnomeregan (26199)
DELETE FROM `quest_offer_reward` WHERE `ID`=26199;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26199, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. I\'m sure your time in Gnomeregan afforded you ample opportunity to practice your arts. Things are somewhat safer here, but your talents will never go to waste.', 26365);


-- The Future of Gnomeregan (26202)
DELETE FROM `quest_offer_reward` WHERE `ID`=26202;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26202, 1, 0, 0, 0, 0, 0, 0, 0, 'So, another one of Nevin\'s "rescued" survivors, eh? More than likely, you saved his life from the troggs down there. Did he stumble over his words when he mentioned me? The man has a healthy respect for the demonic powers we channel.', 26365);


-- The Future of Gnomeregan (26203)
DELETE FROM `quest_offer_reward` WHERE `ID`=26203;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) 
VALUES (26203, 1, 0, 0, 0, 0, 0, 0, 0, 'For a $r who has spent so much time inside Gnomeregan, you look positively fit and healthy, $n. That\'s good. Before we can complete what Operation: Gnomeregan began, we\'re going to need more warriors like you.', 26365);


-- The Future of Gnomeregan (26206)
DELETE FROM `quest_offer_reward` WHERE `ID`=26206;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26206, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. Nevin tells me that you managed to survive the dangers in Gnomeregan by using your wits. That\'s exactly what we need up here. Clever minds and quick blades.', 26365);


-- The Future of Gnomeregan (31135)
DELETE FROM `quest_offer_reward` WHERE `ID`=31135;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(31135, 1, 0, 0, 0, 0, 0, 0, 0, 'Why, you look great! I\'ve heard bad things about what happens down there. Well, are you ready to start your training in the ways of the $c?', 26365);


-- The Future of Gnomeregan (41217)
DELETE FROM `quest_offer_reward` WHERE `ID`=41217;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(41217, 1, 0, 0, 0, 0, 0, 0, 0, 'For a $r who has spent so much time inside Gnomeregan, you look positively fit and healthy, $n. That\'s good. Before we can complete what Operation: Gnomeregan began, we\'re going to need more hunters like you.', 26365);


-- Meet the High Tinker (26421)
DELETE FROM `quest_offer_reward` WHERE `ID`=26421;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26421, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (26422)
DELETE FROM `quest_offer_reward` WHERE `ID`=26422;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26422, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (26423)
DELETE FROM `quest_offer_reward` WHERE `ID`=26423;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26423, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (26424)
DELETE FROM `quest_offer_reward` WHERE `ID`=26424;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26424, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (26425)
DELETE FROM `quest_offer_reward` WHERE `ID`=26425;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26425, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (31137)
DELETE FROM `quest_offer_reward` WHERE `ID`=31137;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(31137, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- Meet the High Tinker (41218)
DELETE FROM `quest_offer_reward` WHERE `ID`=41218;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(41218, 1, 0, 0, 0, 0, 0, 0, 0, 'It\'s good to meet you, $n. You\'ve probably heard others speaking of Operation: Gnomeregan. Let me tell you a bit about what happened and why we left the dwarven city of Ironforge.', 26365);


-- The Fight Continues (26208)
DELETE FROM `quest_offer_reward` WHERE `ID`=26208;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26208, 1, 0, 0, 0, 0, 0, 0, 0, 'Even now, only the S.A.F.E. teams dare to venture far into the city to search for survivors. Meanwhile, Thermaplugg has sent one of his followers, Crushcog, to distract us and buy time for him to dig in.', 26365);


-- Scrounging for Parts (26222)
DELETE FROM `quest_request_items` WHERE `ID`=26222;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES 
(26222, 1, 0, 0, 0, 'Did you get those parts?', 26365);

DELETE FROM `quest_offer_reward` WHERE `ID`=26222;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26222, 1, 0, 0, 0, 0, 0, 0, 0, 'These are fantastic! Let\'s see what we can put together. Would you be interested in testing out the prototype once I\'m done?', 26365);


-- A Job for the Multi-Bot (26205)
DELETE FROM `quest_offer_reward` WHERE `ID`=26205;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(26205, 1, 0, 0, 0, 0, 0, 0, 0, 'Wow, I never expected it to work on the first trial! Uh, I mean, we\'ve succeeded! I wonder what other uses I we can find for this handy little guy.', 26365);


/*===========================
-- Blood on the Snow (1130)
===========================*/
DELETE FROM `creature_text` WHERE `creatureid`=70279;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70279, 0, 0, 'For Ironforge! For the Alliance!', 14, 0, 100, 0, 0, 37188, 0, 0, 'Moira Thaurissan, Blood on the Snow Final 01'),
(70279, 1, 0, 'Hearts of Fire, will of Iron, back on your feet, grind them to dust!', 14, 0, 100, 0, 0, 37189, 0, 0, 'Moira Thaurissan, Blood on the Snow Final 02'),
(70279, 2, 0, 'Shimmer Ridge. I know it well. The Frostmane trolls breed and plot above the snow-blown mesa.', 12, 0, 100, 0, 0, 37190, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 1'),
(70279, 3, 0, 'We\'ve lost many mountaineers to this freakish storm, or the trolls slithering about in it.', 12, 0, 100, 0, 0, 37191, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 2'),
(70279, 4, 0, 'Aye. I am loathe to send my men into that. It reeks of ambush and bloody disaster.', 12, 0, 100, 0, 0, 37192, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 3'),
(70279, 5, 0, 'If they can stop that storm, I\'ll lead the Forgeguard to the top myself.', 12, 0, 100, 0, 0, 37193, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 4'),
(70279, 6, 0, 'Indeed. With the aid of your champions, the Dark Irons will put an end to the Zandalari threat in Dun Morogh.', 12, 0, 100, 0, 0, 37194, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 5'),
(70279, 7, 0, 'We will prove our loyalty - to the Council, Ironforge, and the Alliance - here, today, and with our own blood.', 12, 0, 100, 0, 0, 37195, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 6'),
(70279, 8, 0, 'I\'ll see you when it\'s done, King of Stormwind.', 12, 0, 100, 0, 0, 37196, 0, 0, 'Moira Thaurissan, Blood on the Snow Start 7'),
(70279, 9, 0, 'The king\'s champions have done it. The storm has ended! Forward Dark Irons! TO BATTLE WE MARCH!', 14, 0, 100, 0, 0, 37197, 0, 0, 'Moira Thaurissan, Blood on the Snow Storm 1'),
(70279, 10, 0, 'That they are, King Varian. And at the service of the Alliance, I might add.', 12, 0, 100, 0, 0, 37198, 0, 0, 'Moira Thaurissan, Blood on the Snow Victory 1'),
(70279, 11, 0, 'Better they\'re grateful for the clansmen spared death on this miserable hilllock. We sought to protect and impress,', 12, 0, 100, 0, 0, 37199, 0, 0, 'Moira Thaurissan, Blood on the Snow Victory 2');

DELETE FROM `creature_text` WHERE `creatureid`=70799;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70799, 0, 0, 'This is where my agents tracked the Zandalari.', 12, 0, 100, 0, 0, 37328, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 1, 0, 'I can only imagine what foul business the Zandalari have with them...', 12, 0, 100, 0, 0, 37329, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 2, 0, 'Yes. This weather is not natural.', 12, 0, 100, 0, 0, 37330, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 3, 0, 'My champions will go. They will see what can be done, and rescue who they can.', 12, 0, 100, 0, 0, 37331, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 4, 0, 'It\'s heartening to see you here, Moira. You have my thanks.', 12, 0, 100, 0, 0, 37332, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 5, 0, 'Hrmmm. Farewell, Queen Regent.', 12, 0, 100, 0, 0, 37333, 0, 0,'Varian Wrynn, Blood on the Snow '),
(70799, 6, 0, 'Well fought. I see the Dark Irons are as formidable as ever.', 12, 0, 100, 0, 0, 37334, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 7, 0, 'Hah! For that, I\'m glad. The Bronzebeards and Wildhammers will regret not having been here to share in your glory.', 12, 0, 100, 0, 0, 37335, 0, 0, 'Varian Wrynn, Blood on the Snow '),
(70799, 8, 0, 'Well, you\'ve done just that. Come: let us return to Ironforge, and announce your victory to the Council.', 12, 0, 100, 0, 0, 37336, 0, 0, 'Varian Wrynn, Blood on the Snow ');

DELETE FROM `creature_text` WHERE `creatureid`=70602;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70602, 0, 0, 'Oh ho ho ho ho! By my beard. I thought I was done for! Oh, thank ye. Thank ye!', 12, 0, 100, 0, 0, 37296, 0, 0, 'Scout Stonebeard, Blood on the Snow '),
(70602, 1, 0, 'Oh... right. Now: Did the human king send ye? Oh, his spies are all dead... and most of us are, too. I saw \'em draggin\' Boldbrew, kickin\' and bitin\', towards some hut south o\' here. Now, if ye hurry, ye can help her, and she might know more. BUT STAY AWAY FROM THE BIG VILLAGE! There\'s dozens o\' mad ice trolls in there! Oh, that Zandalari priest has \'em whipped up into a great frenzy.', 12, 0, 100, 0, 0, 37297,0, 0, 'Scout Stonebeard, Blood on the Snow '),
(70602, 2, 0, '', 12, 0, 100, 0, 0, 37298, 0, 0, 'Scout Stonebeard, Blood on the Snow ');

DELETE FROM `creature_text` WHERE `creatureid`=70744;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70744, 0, 0, 'Oh, that was a CLOSE one, thank ye!', 12, 0, 100, 0, 0, 37292, 0, 0, 'Scout Boldbrew, Blood on the Snow '),
(70744, 1, 0, 'There\'s only a few of us left; the ones they don\'t eat, they butcher at some big altar. It\'s just northwest o\' here; if ye hurry, ye might be able ta save some! Sorry I don\'t know anythin\' more...', 12, 0, 100, 0, 0, 37293, 0, 0, 'Scout Boldbrew, Blood on the Snow ');

DELETE FROM `creature_text` WHERE `creatureid`=70801;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70801, 0, 0, 'There ye are. Here\'s the lay of it: The king\'s spies are dead to a man. Only a handful o\' dwarven scouts are left.', 12, 0, 100, 0, 0, 37262, 0, 0, 'Mountaineer Grimbolt, Blood on the Snow '),
(70801, 1, 0, 'The nearest is just ahead. If ye can save him, he may know a thing or two. We\'ll cover ye from the brush: Point out a target, and we\'ll open fire.', 12, 0, 100, 0, 0, 37263, 0, 0, 'Mountaineer Grimbolt, Blood on the Snow ');

DELETE FROM `creature_text` WHERE `creatureid`=70745;
INSERT INTO `creature_text` (`creatureid`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, BroadCastTextID, TextRange, `comment`) VALUES
(70745, 0, 0, 'Filthy mosters! I owe ye me life.', 12, 0, 100, 0, 0, 37294, 0, 0, 'Scout Forgefellow, Blood on the Snow '),
(70745, 1, 0, 'Listen: The storm. We figured out what\'s makin\' it. That sneaky Zandalari has these ice trolls makin\' blood sacrifices ta elemental spirits. There\'s a cave north o\' here, across a bridge. If ye can slay the elemental within, the storm ought ta stop.', 12, 0, 100, 0, 0, 37295, 0, 0, 'Scout Forgefellow, Blood on the Snow ');


/*==============================================
-- Milling/Prospecting Reference/Loot Template
==============================================*/
DELETE FROM `reference_loot_template` WHERE `Entry` IN (11919,11920,11921) OR `Entry` BETWEEN 13006 AND 13010;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(11919, 61979, 11919,100, 0, 1, 0, 2, 4, 'Ashen Pigment'), -- Milling
(11919, 61980, 11919, 25, 0, 1, 0, 1, 3, 'Burning Embers'), -- Milling
(11920, 61979, 11920,100, 0, 1, 0, 2, 3, 'Ashen Pigment'), -- Milling
(11920, 61980, 11920, 25, 0, 1, 0, 1, 3, 'Burning Embers'), -- Milling
(11921, 61979, 11921,100, 0, 1, 0, 2, 4, 'Ashen Pigment'), -- Milling
(11921, 61980, 11921, 50, 0, 1, 0, 1, 3, 'Burning Embers'), -- Milling
(13006, 52327, 13006,100, 0, 1, 0, 1, 3, 'Volatile Earth from Pyrite Ore'), -- Prospecting
(13007, 52177, 13007, 17, 0, 1, 1, 1, 1, 'Carnelian - Green gems'), -- Prospecting
(13007, 52178, 13007, 17, 0, 1, 1, 1, 1, 'Zephyrite - Green gems'), -- Prospecting
(13007, 52179, 13007, 17, 0, 1, 1, 1, 1, 'Alicite - Green gems'), -- Prospecting
(13007, 52180, 13007, 16, 0, 1, 1, 1, 1, 'Nightstone - Green gems'), -- Prospecting
(13007, 52181, 13007, 17, 0, 1, 1, 1, 1, 'Hessonite - Green gems'), -- Prospecting
(13007, 52182, 13007, 16, 0, 1, 1, 1, 1, 'Jasper - Green gems'), -- Prospecting
(13008, 52190, 13008,  4, 0, 1, 2, 1, 1, 'Inferno Ruby - Blue gems'), -- Prospecting
(13008, 52191, 13008,  4, 0, 1, 2, 1, 1, 'Ocean Sapphire - Blue gems'), -- Prospecting
(13008, 52192, 13008,  4, 0, 1, 2, 1, 1, 'Dream Emerald - Blue gems'), -- Prospecting
(13008, 52193, 13008,  4, 0, 1, 2, 1, 1, 'Ember Topaz - Blue gems'), -- Prospecting
(13008, 52194, 13008,  4, 0, 1, 2, 1, 1, 'Demonseye - Blue gems'), -- Prospecting
(13008, 52195, 13008,  4, 0, 1, 2, 1, 1, 'Amberjewel - Blue gems'), -- Prospecting
(13009, 52177, 13009, 17, 0, 1, 1, 1, 2, 'Carnelian - Green gems 2'), -- Prospecting
(13009, 52178, 13009, 17, 0, 1, 1, 1, 2, 'Zephyrite - Green gems 2'), -- Prospecting
(13009, 52179, 13009, 17, 0, 1, 1, 1, 2, 'Alicite - Green gems 2'), -- Prospecting
(13009, 52180, 13009, 16, 0, 1, 1, 1, 2, 'Nightstone - Green gems 2'), -- Prospecting
(13009, 52181, 13009, 17, 0, 1, 1, 1, 2, 'Hessonite - Green gems 2'), -- Prospecting
(13009, 52182, 13009, 16, 0, 1, 1, 1, 2, 'Jasper - Green gems 2'), -- Prospecting
(13010, 52190, 13010,  7, 0, 1, 2, 1, 2, 'Inferno Ruby - Blue gems 2'), -- Prospecting
(13010, 52191, 13010,  7, 0, 1, 2, 1, 2, 'Ocean Sapphire - Blue gems 2'), -- Prospecting
(13010, 52192, 13010,  7, 0, 1, 2, 1, 2, 'Dream Emerald - Blue gems 2'), -- Prospecting
(13010, 52193, 13010,  7, 0, 1, 2, 1, 2, 'Ember Topaz - Blue gems 2'), -- Prospecting
(13010, 52194, 13010,  7, 0, 1, 2, 1, 2, 'Demonseye - Blue gems 2'), -- Prospecting
(13010, 52195, 13010,  7, 0, 1, 2, 1, 2, 'Amberjewel - Blue gems 2'); -- Prospecting

DELETE FROM `milling_loot_template` WHERE `Entry` BETWEEN 52983 AND 52988;
INSERT INTO `milling_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(52983, 11919, 11919, 100, 0, 1, 0, 1, 1, 'Cinderbloom - Ashen Pigment, Burning Embers'),
(52984, 11920, 11920, 100, 0, 1, 0, 1, 1, 'Stormvine - Ashen Pigment, Burning Embers'),
(52985, 11920, 11920, 100, 0, 1, 0, 1, 1, 'Azshara\'s Veil - Ashen Pigment, Burning Embers'),
(52986, 11919, 11919, 100, 0, 1, 0, 1, 1, 'Heartblossom - Ashen Pigment, Burning Embers'),
(52987, 11921, 11921, 100, 0, 1, 0, 1, 1, 'Twilight Jasmine - Ashen Pigment, Burning Embers'),
(52988, 11921, 11921, 100, 0, 1, 0, 1, 1, 'Whiptail - Ashen Pigment, Burning Embers');

DELETE FROM `prospecting_loot_template` WHERE `Entry` IN (52183,52185,53038);
INSERT INTO `prospecting_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(52183, 13006, 13006, 100, 0, 1, 0, 1, 1, 'Pyrite Ore - Volatile Earth'),
(52183, 13009, 13009, 100, 0, 1, 0, 1, 1, 'Pyrite Ore - Green gems 2'),
(52183, 13010, 13010, 100, 0, 1, 0, 1, 1, 'Pyrite Ore - Blue gems 2'),
(52185, 13007, 13007, 100, 0, 1, 0, 1, 1, 'Elementium Ore - Green gems'),
(52185, 13008, 13008, 100, 0, 1, 0, 1, 1, 'Elementium Ore - Blue gems'),
(53038, 13007, 13007, 100, 0, 1, 0, 1, 1, 'Obsidium Ore - Green gems'),
(53038, 13008, 13008,  50, 0, 1, 0, 1, 1, 'Obsidium Ore - Blue gems');


/*=======================
-- Legion Blacksmithing
=======================*/
SET @CGUID = 403810;
SET @GGUID = 142039;

-- Quest Chain
UPDATE `quest_template_addon` SET `NextQuestId`='39681' WHERE `ID`='38499';
UPDATE `quest_template_addon` SET `PrevQuestId`='38499', `NextQuestId`='38502' WHERE `ID`='39681';
UPDATE `quest_template_addon` SET `PrevQuestId`='39681', `ExclusiveGroup`='-38502' WHERE `ID`='38502';
UPDATE `quest_template_addon` SET `PrevQuestId`='39681', `ExclusiveGroup`='-38502' WHERE `ID`='38501';
UPDATE `quest_template_addon` SET `PrevQuestId`='38502', `NextQuestId`='38506' WHERE `ID`='38505';
UPDATE `quest_template_addon` SET `PrevQuestId`='38505', `NextQuestId`='38507' WHERE `ID`='38506';
UPDATE `quest_template_addon` SET `PrevQuestId`='38506', `NextQuestId`='38515' WHERE `ID`='38507';
UPDATE `quest_template_addon` SET `PrevQuestId`='38507', `ExclusiveGroup`='-38500' WHERE `ID`='38515';
UPDATE `quest_template_addon` SET `PrevQuestId`='38507', `ExclusiveGroup`='-38500' WHERE `ID`='38500';
UPDATE `quest_template_addon` SET `PrevQuestId`='38500', `NextQuestId`='38513' WHERE `ID`='38563';
UPDATE `quest_template_addon` SET `PrevQuestId`='38563', `NextQuestId`='38514' WHERE `ID`='38513';
UPDATE `quest_template_addon` SET `PrevQuestId`='38513', `NextQuestId`='39699' WHERE `ID`='38514';
UPDATE `quest_template_addon` SET `PrevQuestId`='38514', `ExclusiveGroup`='-38519' WHERE `ID`='39699';
UPDATE `quest_template_addon` SET `PrevQuestId`='38514', `ExclusiveGroup`='-38519' WHERE `ID`='38519';
UPDATE `quest_template_addon` SET `PrevQuestId`='38519', `NextQuestId`='38522' WHERE `ID`='38518';
UPDATE `quest_template_addon` SET `PrevQuestId`='38518', `NextQuestId`='38523' WHERE `ID`='38522';
UPDATE `quest_template_addon` SET `PrevQuestId`='38522' WHERE `ID`='38523';
UPDATE `quest_template_addon` SET `PrevQuestId`='38523', `NextQuestId`='39680' WHERE `ID`='39702';
UPDATE `quest_template_addon` SET `PrevQuestId`='39702', `ExclusiveGroup`='-39680' WHERE `ID`='39680';
UPDATE `quest_template_addon` SET `PrevQuestId`='39702', `ExclusiveGroup`='-39680' WHERE `ID`='39726';
UPDATE `quest_template_addon` SET `PrevQuestId`='39680', `NextQuestId`='38564' WHERE `ID`='39729';
UPDATE `quest_template_addon` SET `PrevQuestId`='39729', `NextQuestId`='44449' WHERE `ID`='38564';
UPDATE `quest_template_addon` SET `PrevQuestId`='38564', `NextQuestId`='38524' WHERE `ID`='44449';
UPDATE `quest_template_addon` SET `PrevQuestId`='44449', `NextQuestId`='38525' WHERE `ID`='38524';
UPDATE `quest_template_addon` SET `PrevQuestId`='38524', `NextQuestId`='38526' WHERE `ID`='38525';
UPDATE `quest_template_addon` SET `PrevQuestId`='38525', `NextQuestId`='38527' WHERE `ID`='38526';
UPDATE `quest_template_addon` SET `PrevQuestId`='38526', `NextQuestId`='38528' WHERE `ID`='38527';
UPDATE `quest_template_addon` SET `PrevQuestId`='38527', `NextQuestId`='38530' WHERE `ID`='38528';
UPDATE `quest_template_addon` SET `PrevQuestId`='38528', `NextQuestId`='38531' WHERE `ID`='38530';
UPDATE `quest_template_addon` SET `PrevQuestId`='38530', `ExclusiveGroup`='-38531' WHERE `ID`='38531';
UPDATE `quest_template_addon` SET `PrevQuestId`='38530', `ExclusiveGroup`='-38531' WHERE `ID`='38532';
UPDATE `quest_template_addon` SET `PrevQuestId`='38531', `NextQuestId`='38833' WHERE `ID`='38559';
UPDATE `quest_template_addon` SET `PrevQuestId`='38559', `NextQuestId`='38533' WHERE `ID`='38833';
UPDATE `quest_template_addon` SET `PrevQuestId`='38833' WHERE `ID`='38533';


-- Spawn Missing Creature
DELETE FROM `creature` WHERE `id` IN (97261,92183,96763,92438);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+01 AND @CGUID+16;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@CGUID+01, 97261, 1220, 0, 0, 1, 3201, 0, 0, 0, -740.861023, 4509.919922, 731.080994, 5.534260, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 25996),
(@CGUID+02, 92183, 1220, 0, 0, 1, 3202, 0, 0, 0, -740.861023, 4509.919922, 731.080994, 5.534260, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 25996),
(@CGUID+03, 96763, 1220, 0, 0, 1, 0, 0, 0, 0, 2954.992920, 7405.303711, 65.204597, 3.939429, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 25996),
(@CGUID+04, 92438, 1220, 0, 0, 1, 3203, 0, 0, 0,  -748.458557, 4506.065918, 730.997986, 5.114434, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 25996),
(@CGUID+05, 92438, 1220, 0, 0, 1, 3205, 0, 0, 0,   -745.721008, 4459.109863, 733.934998, 4.677490, 7200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 25996),
(@CGUID+06, 92438, 1220, 0, 0, 1, 3206, 0, 0, 0,   -745.721008, 4459.109863, 733.934998, 4.677490, 7200, 0, 0, 0, 0, 0, 16777216, 0, 0, 0, 0, '', 25996);


-- Spawn Missing Gameobject
DELETE FROM `creature` WHERE `id` IN (267019,241510,241691,241696,241695,241694,241515,241438,241437,241420,241514,241515,241516,241454,241511);
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GGUID+01 AND @GGUID+19;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`) VALUES
(@GGUID+1, 267019, 1220, 0, 0, 1, 0, 0, 2981.59, 3768.4, 1349.34, 4.65384, -0, -0, -0.727502, 0.686106, 300, 255, 1, 0, '', 0),
(@GGUID+2, 241510, 1220, 0, 0, 1, 0, 0, -747.525, 4505.13, 731.692, 2.01042, -0, -0, -0.844274, -0.535911, 300, 255, 1, 0, '', 0),
(@GGUID+3, 241691, 1220, 0, 0, 1, 0, 0, 1470.03, 4999.18, 183.749, 4.93248, -0, -0, -0.625172, 0.780487, 300, 255, 1, 0, '', 0),
(@GGUID+4, 241696, 1220, 0, 0, 1, 0, 0, 1477.85, 4998.25, 184.206, 0.404539, -0, -0, -0.200893, -0.979613, 300, 255, 1, 0, '', 0),
(@GGUID+5, 241695, 1220, 0, 0, 1, 0, 0, 1471.04, 5002.41, 184.185, 5.94553, -0, -0, -0.168027, 0.985783, 300, 255, 1, 0, '', 0),
(@GGUID+6, 241694, 1220, 0, 0, 1, 0, 0, 1474.7, 5002.6, 184.44, 3.54614, -0, -0, -0.979612, 0.200897, 300, 255, 1, 0, '', 0),
(@GGUID+7, 241515, 1220, 0, 0, 1, 0, 0, -746.801, 4505.75, 731.692, 3.75162, -0, -0, -0.953844, 0.300304, 300, 255, 1, 0, '', 0),
(@GGUID+8, 241438, 1220, 0, 0, 1, 0, 0, 2990.83, 3805.43, 1348.55, 5.5193, -0, -0, -0.372723, 0.927943, 300, 255, 1, 0, '', 0),
(@GGUID+9, 241438, 1220, 0, 0, 1, 0, 0, 2985.27, 3808.88, 1348.98, 2.84502, -0, -0, -0.989026, -0.147743, 300, 255, 1, 0, '', 0),
(@GGUID+10, 241438, 1220, 0, 0, 1, 0, 0, 2978.52, 3810.68, 1348.45, 5.97876, -0, -0, -0.151625, 0.988438, 300, 255, 1, 0, '', 0),
(@GGUID+11, 241437, 1220, 0, 0, 1, 0, 0, 2968.18, 3800.52, 1348.52, 0.571292, -0, -0, -0.281777, -0.95948, 300, 255, 1, 0, '', 0),
(@GGUID+12, 241420, 1220, 0, 0, 1, 0, 0, -742.863, 4512.27, 730.997, 0.819432, -0, -0, -0.398349, -0.917234, 300, 255, 1, 0, '', 0),
(@GGUID+13, 241514, 1220, 0, 0, 1, 0, 0, -740.684, 4496.64, 730.997, 5.54086, -0, -0, -0.362699, 0.931906, 300, 255, 1, 0, '', 0),
(@GGUID+14, 241515, 1220, 0, 0, 1, 0, 0, -747.295, 4505.16, 730.997, 3.95206, -0, -0, -0.91901, 0.394234, 300, 255, 1, 0, '', 0),
(@GGUID+15, 241516, 1220, 0, 0, 1, 0, 0, -739.596, 4509, 731.051, 2.40879, -0, -0, -0.933623, -0.358258, 300, 255, 1, 0, '', 0),
(@GGUID+16, 241516, 1220, 0, 0, 1, 0, 0, -743.406, 4502.72, 730.997, 5.55574, -0, -0, -0.355756, 0.934579, 300, 255, 1, 0, '', 0),
(@GGUID+17, 241454, 1220, 0, 0, 1, 0, 0, -737.111, 4511.58, 731.991, 3.9555, -0, -0, -0.918331, 0.395814, 300, 255, 1, 0, '', 0),
(@GGUID+18, 241454, 1220, 0, 0, 1, 0, 0, -745.526, 4500.28, 731.974, 0.820489, -0, -0, -0.398834, -0.917023, 300, 255, 1, 0, '', 0),
(@GGUID+19, 241511, 1220, 0, 0, 1, 0, 0, -739.596, 4509, 731.051, 2.40879, -0, -0, -0.933623, -0.358256, 300, 255, 1, 0, '', 0);


-- Alard Schmied (92183)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=92183;
DELETE FROM `smart_scripts` WHERE `entryorguid`=92183;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
('92183', '0', '0', '1', '19', '0', '100', '0', '39681', '0', '0', '0', '', '83', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Quest Accept - Remove NPC Flag 2'),
('92183', '0', '1', '2', '61', '0', '100', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Say Line 0'),
('92183', '0', '2', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '53', '0', '92183', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - WP Start'),
('92183', '0', '3', '4', '40', '0', '100', '0', '1', '92183', '0', '0', '', '54', '5000', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On WP Reached - Pause'),
('92183', '0', '4', '5', '61', '0', '100', '0', '0', '0', '0', '0', '', '5', '606', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Play Emote'),
('92183', '0', '5', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Say Line 1'),
('92183', '0', '6', '7', '40', '0', '100', '0', '2', '92183', '0', '0', '', '66', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '5.534260', 'Alard Schmied - On WP Reached - Set Orientation'),
('92183', '0', '7', '8', '61', '0', '100', '0', '0', '0', '0', '0', '', '5', '233', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Play Emote'),
('92183', '0', '8', '9', '61', '0', '100', '0', '0', '0', '0', '0', '', '1', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Say Line 2'),
('92183', '0', '9', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '67', '1', '5000', '5000', '0', '0', '100', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Timed Event'),
('92183', '0', '10', '11', '59', '0', '100', '0', '1', '0', '0', '0', '', '33', '96642', '0', '0', '0', '0', '0', '18', '20', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Timed Event - Quest Credit'),
('92183', '0', '11', '12', '61', '0', '100', '0', '0', '0', '0', '0', '', '86', '183107', '0', '18', '20', '0', '0', '18', '20', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Give KC - On player dist'),
('92183', '0', '12', '24', '61', '0', '100', '0', '0', '0', '0', '0', '', '82', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Add NPC Flag 2'),
('92183', '0', '13', '14', '19', '0', '100', '0', '38500', '0', '0', '0', '', '56', '124005', '4', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Quest Accept - Add Item'),
('92183', '0', '14', '25', '61', '0', '100', '0', '0', '0', '0', '0', '', '1', '3', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Say Line 3'),
('92183', '0', '17', '25', '19', '0', '100', '0', '38522', '0', '0', '0', '', '56', '124417', '5', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Quest Accept - Add Item'),
('92183', '0', '20', '0', '19', '0', '100', '0', '38564', '0', '0', '0', '', '1', '4', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Quest Accept - Say Line 4'),
('92183', '0', '21', '25', '19', '0', '100', '0', '44449', '0', '0', '0', '', '56', '124392', '2', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - On Quest Accept - Add Item'),
('92183', '0', '24', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '86', '155164', '0', '18', '20', '0', '0', '18', '20', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Cast Update Phases'),
('92183', '0', '25', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '85', '201699', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Alard Schmied - Player Cast on Self Legion Blacksmith');

DELETE FROM `creature_text` WHERE `creatureID` IN (92183);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92183, 0, 0, 'Alright, let\'s see what we can do with this ore. First things first: we heat the ore.', 12, 0, 100, 1, 0, 0, 98567, 'Alard'),
(92183, 1, 0, 'Now let\'s see what we can make with it.', 12, 0, 100, 1, 0, 0, 98568, 'Alard'),
(92183, 2, 0, 'And now for the simple step of applying the flux. Lean in closely and watch my technique.', 12, 0, 100, 1, 0, 0, 98569, 'Alard'),
(92183, 3, 0, 'You know what to do, smith: temper, heat, hammer, and weld. You can use any of the shop\'s equipment.', 12, 0, 100, 1, 0, 0, 95029, 'Alard'),
(92183, 4, 0, 'Go see if you can find a frost mage to help us, $n. If we can get our quenching trough cool enough, we can perform this leysmithing technique.', 12, 0, 100, 1, 0, 0, 95030, 'Alard');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='17') AND (`SourceEntry`='183107') AND (`ConditionTypeOrReference`='9') AND (`ConditionValue1`='39681');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='17') AND (`SourceEntry`='183107') AND (`ConditionTypeOrReference`='47') AND (`ConditionValue1`='39681');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('17', '0', '183107', '0', '47', '39681', '2', '0', 'Alard Schmied - Spell 183107 Only if has Quest 39681');

DELETE FROM `waypoints` WHERE `entry`='92183';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(92183, 1, -745.437622, 4502.655762, 731.050232, 'Jabrul Event Intro'),
(92183, 2, -740.861023, 4509.919922, 731.080994, 'Jabrul Event Intro');

DELETE FROM `scene_template` WHERE `SceneId` IN (973);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(973, 17, 1393);


-- Alard Schmied (97261)
UPDATE `creature_template` SET `faction`=2007, `minlevel`=105, `maxlevel`=105, `gossip_menu_id`=18759 WHERE `entry`=97261;

DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID+1);
INSERT INTO `creature_addon` (`guid`, `emote`, `bytes1`, `bytes2`, `auras`) VALUES
(@CGUID+1, 64, 0, 1, '');

DELETE FROM gossip_menu_option WHERE `MenuId` IN (18759);
INSERT INTO gossip_menu_option (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES
('18759', '1', '3', 'Train me.', '3266', '5', '16', '0');

DELETE FROM `gossip_menu` WHERE `MenuId`=18759;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(18759, 29523);

DELETE FROM `npc_text` WHERE `id` IN (29523);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(29523, 1, 0, 0, 0, 0, 0, 0, 0, 98986, 0, 0, 0, 0, 0, 0, 0, 25996);


-- Adjusts
DELETE FROM `phase_area` WHERE `PhaseId`=3200 AND  `AreaId`=8413;
DELETE FROM `phase_area` WHERE `PhaseId`=3201 AND  `AreaId`=8413;
DELETE FROM `phase_area` WHERE `PhaseId`=3202 AND  `AreaId`=8413;
DELETE FROM `phase_area` WHERE `PhaseId`=169 AND  `AreaId`=8413;
DELETE FROM `phase_area` WHERE `PhaseId`=3203 AND  `AreaId`=8413;
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES
('8413', '169', 'Tank for everything - See See all'),
('8413', '3203', 'Tank for everything - See basic Alard'),
('8413', '3202', 'Tank for everything - See basic Alard'),
('8413', '3200', 'Tank for everything - See basic Alard'),
('8413', '3201', 'Tank for everything  - See Exploded Alard');

DELETE FROM `conditions` WHERE `SourceGroup`=3200 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=39681;
DELETE FROM `conditions` WHERE `SourceGroup`=3201 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=39681;
DELETE FROM `conditions` WHERE `SourceGroup`=3200 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=40542;
DELETE FROM `conditions` WHERE `SourceGroup`=3201 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=40542;
DELETE FROM `conditions` WHERE `SourceGroup`=3201 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=38501;
DELETE FROM `conditions` WHERE `SourceGroup`=3202 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=38501;
DELETE FROM `conditions` WHERE `SourceGroup`=3203 AND `SourceEntry`=8413 AND `ConditionTypeOrReference`=47 AND `ConditionValue1`=38564;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('26', '3200', '8413', '47', '39681', '66', '1', 'Phase 3500 if quest 39681 not complete/rewarded'),
('26', '3201', '8413', '47', '39681', '66', '0', 'Phase 3501 if quest 39681 complete/rewarded'),
('26', '3201', '8413', '47', '38501', '66', '1', 'Phase 3501 if quest 38501 not complete/rewarded'),
('26', '3202', '8413', '47', '38501', '66', '0', 'Phase 3502 if quest 38501 complete/rewarded'),
('26', '3203', '8413', '47', '38564', '66', '0', 'Phase 3503 if quest 38564 complete/rewarded');


-- Timofey Oshenko (92194)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=92194;
DELETE FROM `smart_scripts` WHERE `entryorguid`=92194;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
('92194', '0', '0', '1', '19', '0', '100', '0', '38506', '0', '0', '0', '', '83', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - On Quest Accept - Remove NPC Flag 2'),
('92194', '0', '1', '2', '61', '0', '100', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Say Line 0'),
('92194', '0', '2', '3', '61', '0', '100', '0', '0', '0', '0', '0', '', '56', '123978', '1', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Add Item'),
('92194', '0', '3', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '69', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', -723.837036,4560.879395, 729.930786, 1.072411, 'Timofey Oshenko - Move to Pos'),
('92194', '0', '4', '5', '34', '0', '100', '0', '0', '1', '0', '0', '', '5', '606', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Movement Inform - Play Emote'),
('92194', '0', '5', '0', '61', '0', '100', '0', '0', '0', '0', '0', '', '67', '1', '5000', '5000', '0', '0', '100', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Timed Event'),
('92194', '0', '6', '7', '59', '0', '100', '0', '1', '0', '0', '0', '', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - On Timed Event - Say Line 1'),
('92194', '0', '7', '0', '61', '0', '100', '0', '1', '0', '0', '0', '', '69', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', -726.593994, 4561.290039, 729.719971, 4.709670, 'Timofey Oshenko - Move to Pos'),
('92194', '0', '8', '9', '34', '0', '100', '0', '0', '2', '0', '0', '', '66', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Movement Inform - Set Orientation'),
('92194', '0', '9', '0', '61', '0', '100', '0', '0', '1', '0', '0', '', '82', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Timofey Oshenko - Add NPC Flag 2');

DELETE FROM `creature_text` WHERE `creatureID` IN (92194);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92194, 0, 0, 'The Data Extratinator 3000 might be able to decipher this core. Cross your fingers that it doesn\'t explode in the process.', 12, 0, 100, 1, 0, 0, 98376, 'Timofey'),
(92194, 1, 0, 'This core contains a script written in an ancient Highborne dialect, which I can\'t read. Professor Pallin in the Scribes\' Sacellum may be able to translate this.', 12, 0, 100, 1, 0, 0, 98378, 'Timofey');

DELETE FROM `gameobject_template` WHERE `entry` IN (241514, 241515, 241516, 241454, 241420, 241437, 241438, 241691, 241694, 241695, 241696, 241510);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `RequiredLevel`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
('241514', '8', '0', 'Alard\'s Workbench', '', '', '', '1', '1863', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241515', '8', '0', 'Alard\'s Quenching Trough', '', '', '', '1', '1865', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241516', '8', '0', 'Alard\'s Anvil', '', '', '', '1', '1861', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241454', '8', '0', 'Alard\'s Forge', '', '', '', '1', '1862', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241420', '8', '0', 'Alard\'s Whetstone', '', '', '', '1', '1868', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241437', '8', '0', 'Greenhoof\'s Forge', '', '', '', '1', '1869', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241438', '8', '0', 'Greenhoof\'s Anvil', '', '', '', '1', '1870', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241694', '8', '0', 'Felsmith Forge', '', '', '', '1', '1872', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241695', '8', '0', 'Felsmith Anvil', '', '', '', '1', '1871', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241696', '8', '0', 'Felsmith Workbench', '', '', '', '1', '1873', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241691', '8', '0', 'Felsmith Quenching Trough', '', '', '', '1', '1874', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0'),
('241510', '8', '0', 'Frozen Quenching Trough', '', '', '', '1', '1867', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0');


-- Linzy Blackbolt (92456)
UPDATE `creature_template` SET `gossip_menu_id`=18380, `AIName`='SmartAI' WHERE `entry`='92456';
DELETE FROM `smart_scripts` WHERE `entryorguid`=92456;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92456, 0, 0, 1, 62, 0, 100, 0, 18380, 2, 0, 0, 33, 92456, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Linzy Blackbolt - On Gossip Select - Quest Credit"),
(92456, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Linzy Blackbolt - Say Line 0"),
(92456, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Linzy Blackbolt - Close Gossip");

DELETE FROM `creature_text` WHERE `creatureID`=92456;
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92456, 0, 0, 'Whoah! Neat recipe. As long as the herbalists keep bringing me fresh foxflower, I can certainly make this preparation for you. No problem.', 12, 0, 100, 1, 0, 0, 94508, 'Linzy');

DELETE FROM `gossip_menu_option` WHERE `MenuId`=18380;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
('18380', '2', '0', 'Alard at the blacksmith shop will need a regular supply of foxflower flux. Can you make any?', '94482', '1', '1'),
('18380', '1', '0', 'Hello again, Linzy. What\'s new with you?', '98720', '1', '1'),
('18380', '0', '3', 'I Would like to train', '8221', '5', '16');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18380') AND (`ConditionTypeOrReference`='48');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18380') AND (`ConditionTypeOrReference`='9');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('15', '18380', '2', '0', '48', '278183', '0', '1', 'Linzy Blackbolt - Show Gossip if Objective is Not Complete'),
('15', '18380', '2', '0', '9', '38563', '0', '0', 'Linzy Blackbolt - Show Gossip if Have Quest Taken');

DELETE FROM `gossip_menu` WHERE `MenuId`=18736 AND `TextId`=27231;
DELETE FROM `gossip_menu` WHERE `MenuId`=18735 AND `TextId`=27230;
DELETE FROM `gossip_menu` WHERE `MenuId`=18380 AND `TextId`=14712;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(18736, 27231),
(18735, 27230),
(18380, 14712);

DELETE FROM `npc_text` WHERE `ID` IN (27231, 27230, 14712);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(27231, 1, 0, 0, 0, 0, 0, 0, 0, 98726, 0, 0, 0, 0, 0, 0, 0, 25996),
(27230, 1, 0, 0, 0, 0, 0, 0, 0, 98721, 0, 0, 0, 0, 0, 0, 0, 25996),
(14712, 1, 0, 0, 0, 0, 0, 0, 0, 35401, 0, 0, 0, 0, 0, 0, 0, 25996);

DELETE FROM `gossip_menu_option_action` WHERE `MenuId`=18735 AND `OptionIndex`=1;
DELETE FROM `gossip_menu_option_action` WHERE `MenuId`=18380 AND `OptionIndex`=1;
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(18735, 1, 18736, 0),
(18380, 1, 18735, 0);


-- Kuhuine Tenderstride (92464)
UPDATE `creature_template` SET `gossip_menu_id`=18379, `AIName`='SmartAI' WHERE `entry`= '92464';
DELETE FROM `smart_scripts` WHERE `entryorguid`=92464;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92464, 0, 0, 1, 62, 0, 100, 0, 18379, 1, 0, 0, 33, 92464, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kuhuine Tenderstride - On Gossip Select - Quest Credit"),
(92464, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kuhuine Tenderstride - Say Line 0"),
(92464, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kuhuine Tenderstride - Close Gossip");

DELETE FROM `creature_text` WHERE `creatureID` IN (92464);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92464, 0, 0, 'Of course. Our herbalists bring in plenty of foxflower. I will make sure to set some aside for your metalwork.', 12, 0, 100, 1, 0, 0, 94507, 'Kuhuine');

DELETE FROM `gossip_menu` WHERE `MenuId`=18379 AND `TextId`=26474;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(18379, 26474);

DELETE FROM `npc_text` WHERE `ID` IN (26474);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(26474, 1, 1, 1, 0, 0, 0, 0, 0, 94478, 94479, 94480, 0, 0, 0, 0, 0, 25996);

DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (18379);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
('18379', '1', '0', 'Alard at the blacksmith shop will need a regular supply of foxflower. Do you have any?', '94481', '1', '1'),
('18379', '0', '3', 'I Would like to train', '8221', '5', '16');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18379') AND (`ConditionTypeOrReference`='48');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18379') AND (`ConditionTypeOrReference`='9');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('15', '18379', '1', '0', '48', '278184', '0', '1', 'Kuhuine Tenderstride - Show Gossip if Objective is Not Complete'),
('15', '18379', '1', '0', '9', '38563', '0', '0', 'Kuhuine Tenderstride - Show Gossip if Have Quest Taken');


-- Barm Stonebreaker (92242)
UPDATE `creature_template` SET `gossip_menu_id`=30020, `AIName`='SmartAI' WHERE `entry`=92242;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92242 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92242, 0, 0, 0, 19, 0, 100, 0, 39699, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Barm Stonebreaker - On Quest Accept - Say Line 0"),
(92242, 0, 1, 0, 19, 0, 100, 0, 0, 0, 0, 0, 85, 201699, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Barm Stonebreaker - Player Cast on Self Legion Blacksmith");

DELETE FROM `creature_text` WHERE `creatureID` IN (92242);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92242, 0, 0, 'A responsible smith does not waste material. You may use any pieces of scrap metal that you find around our camp.', 12, 0, 100, 1, 0, 0, 94507, 'Kuhuine');

DELETE FROM `gossip_menu` WHERE `MenuId`=30020 AND `TextId`=35020;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(30020, 35020);

DELETE FROM `npc_text` WHERE `ID` IN (35020);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(35020, 1, 0, 0, 0, 0, 0, 0, 0, 95400, 0, 0, 0, 0, 0, 0, 0, 25996);

DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (30020);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
('30020', '0', '3', 'I Would like to train', '8221', '5', '16');

UPDATE `gameobject_template` SET `Data1`='241635', `Data8`='39699' WHERE (`entry`='241635');
UPDATE `gameobject_template` SET `Data1`='241634', `Data8`='39699' WHERE (`entry`='241634');
UPDATE `gameobject_template` SET `Data1`='241633', `Data8`='39699' WHERE (`entry`='241633');

DELETE FROM `gameobject_loot_template` WHERE (`Entry`='241635') AND (`Item`='124404');
DELETE FROM `gameobject_loot_template` WHERE (`Entry`='241634') AND (`Item`='124403');
DELETE FROM `gameobject_loot_template` WHERE (`Entry`='241633') AND (`Item`='124405');
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `QuestRequired`) VALUES
('241635', '124404', '1'),
('241634', '124403', '1'),
('241633', '124405', '1');


-- Kubrul (93021)
UPDATE `creature_loot_template` SET `Chance`='100', `GroupId`='1' WHERE (`Entry`='93021') AND (`Item`='124004');
UPDATE `creature_template` SET `LootId`=93021 WHERE `entry`=93021;


-- Mei Francis (92489)
UPDATE `creature_template` SET `gossip_menu_id`=18383, `AIName`='SmartAI' WHERE `entry`= '92489';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92489 AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=9248900 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92489, 0, 0, 0, 62, 0, 100, 0, 18383, 1, 0, 0, 80, 9248900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - On Gossip Select - Actionlist"),
(9248900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Remove NPC Flag"),
(9248900, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Say Line 0"),
(9248900, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 1, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Say Line 1"),
(9248900, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 182993, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Cast Leystone Hoofplates"),
(9248900, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 92492, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Quest Credit"),
(9248900, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 82, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Mei Francis - Add NPC Flag");

DELETE FROM `creature_text` WHERE `creatureID` IN (92489);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92489, 0, 0, 'You need your mount shod? Let\'s see if I can make these hoofplates fit...', 12, 0, 100, 1, 0, 0, 94518, 'Mei Francis'),
(92489, 1, 0, 'All done! You take care of that mount now. It\'s a beauty.', 12, 0, 100, 1, 0, 0, 94519, 'Mei Francis');

DELETE FROM `gossip_menu` WHERE `MenuId`=18383 AND `TextId`=14127;
DELETE FROM `gossip_menu` WHERE `MenuId`=18384 AND `TextId`=35021;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(18383, 14127),
(18384, 35021);

DELETE FROM `gossip_menu_option_action` WHERE `MenuId`=18383 AND `OptionIndex`=1;
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(18383, 1, 18384, 0);

DELETE FROM `npc_text` WHERE `ID` IN (14127, 35021);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(14127, 1, 0, 0, 0, 0, 0, 0, 0, 32779, 0, 0, 0, 0, 0, 0, 0, 25996),
(35021, 1, 0, 0, 0, 0, 0, 0, 0, 94521, 0, 0, 0, 0, 0, 0, 0, 25996);

DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (18383);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
('18383', '1', '0', 'Can you fit these hoofplates on my mount?', '94520', '1', '1'),
('18383', '0', '0', 'I want to browse your goods.', '3370', '3', '128');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18383') AND (`ConditionTypeOrReference`='48');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='18383') AND (`ConditionTypeOrReference`='9');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('15', '18383', '1', '0', '48', '278195', '0', '1', 'Mei Francis - Show Gossip if Objective is Not Complete'),
('15', '18383', '1', '0', '9', '38523', '0', '0', 'Mei Francis - Show Gossip if Have Quest Taken');


-- Legend of the Black Rook
DELETE FROM `event_scripts` WHERE `id`=46338;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES
('46338', '1', '10', '96726', '220000',  3061.896729, 7294.654785, 51.557743, 3.770569);


-- Saris Swifthammer (96726)
UPDATE `creature_template` SET `AIName`='SmartAI', `minlevel`=105, `maxlevel`=110, `faction`=15, `unit_flags`=0 WHERE `entry`= '96726';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=96726 AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=9672600 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(96726, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 3056.664307, 7289.800781, 51.55774, 3.853036, "Saris Swifthammer - On Just Summoned - Move to Pos"),
(96726, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Say Line 0"),
(96726, 0, 2, 3, 34, 0, 100, 0, 0, 1, 0, 0, 18, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Movement Inform - Set Unit Flag"),
(96726, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 2, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Set Faction"),
(96726, 0, 4, 0, 2, 0, 100, 1, 0, 50, 1, 1, 80, 9672600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Health PCT - Begin Actionlist"),
(9672600, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Set Faction"),
(9672600, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Combat Stop"),
(9672600, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Say Line 1"),
(9672600, 9, 4, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 1, 2, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Say Line 2"),
(9672600, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 96736, 0, 0, 0, 0, 0, 18, 70, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Quest Credit"),
(9672600, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Saris Swifthammer - Despawn");

DELETE FROM `creature_text` WHERE `creatureID` IN (96726);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(96726, 0, 0, 'Here to pillage our wares, demon?! You shall take NOTHING!', 12, 0, 100, 1, 0, 0, 98722, 'Saris Swifthammer'),
(96726, 1, 0, 'Wait! Stop! You\'re... you\'re no demon...', 12, 0, 100, 1, 0, 0, 98723, 'Saris Swifthammer'),
(96726, 2, 0, 'The fog has lifted and I can see the truth once more. Thank you, $pc. If you would join me at my old shop, perhaps we can speak further.', 12, 0, 100, 1, 0, 0, 98725, 'Saris Swifthammer');


-- Saris Swifthammer (96763)
UPDATE `creature_template` SET `faction`=35, `minlevel`=105, `maxlevel`=110, `gossip_menu_id`=30021 WHERE `entry`=96763;

DELETE FROM `gossip_menu` WHERE `MenuId`=30021 AND `TextId`=35021;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(30021, 35021);

DELETE FROM `npc_text` WHERE `ID` IN (35021);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(35021, 1, 0, 0, 0, 0, 0, 0, 0, 98958, 0, 0, 0, 0, 0, 0, 0, 25996);


-- Saris' Hammer (244000)
UPDATE `gameobject_template` SET `Data1`='244000', `Data8`='39680' WHERE (`entry`='244000');

DELETE FROM `gameobject_loot_template` WHERE (`Entry`='244000') AND (`Item`='128745');
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `QuestRequired`) VALUES
('244000', '128745', '1');

UPDATE `creature_loot_template` SET `Chance`='80', `GroupId`='1' WHERE `Item`='128751';


-- Saris' Research (244001)
UPDATE `gameobject_template` SET `Data1`='244001', `Data8`='39729' WHERE (`entry`='244001');
DELETE FROM `gameobject_loot_template` WHERE (`Entry`='244001') AND (`Item`='128746');
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `QuestRequired`) VALUES
('244001', '128746', '1');


-- A Sweet Bargain
DELETE FROM `phase_area` WHERE `PhaseId`=169 AND  `AreaId`=7581;
DELETE FROM `phase_area` WHERE `PhaseId`=3204 AND  `AreaId`=7581;
DELETE FROM `phase_area` WHERE `PhaseId`=3205 AND  `AreaId`=7581;
DELETE FROM `phase_area` WHERE `PhaseId`=3206 AND  `AreaId`=7581;
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES
('7581', '169', 'Dalaran - See See all'),
('7581', '3204', 'Dalaran - See basic Glaciela'),
('7581', '3205', 'Dalaran - See Talk to Glaciela'),
('7581', '3206', 'Dalaran - See SpellClick Glaciela');

DELETE FROM `conditions` WHERE `SourceGroup`=3204 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=9 AND `ConditionValue1`=38564;
DELETE FROM `conditions` WHERE `SourceGroup`=3205 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=48 AND `ConditionValue1`=278114;
DELETE FROM `conditions` WHERE `SourceGroup`=3205 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=9 AND `ConditionValue1`=38564;
DELETE FROM `conditions` WHERE `SourceGroup`=3206 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=48 AND `ConditionValue1`=278114;
DELETE FROM `conditions` WHERE `SourceGroup`=3206 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=48 AND `ConditionValue1`=278116;
DELETE FROM `conditions` WHERE `SourceGroup`=3206 AND `SourceEntry`=7581 AND `ConditionTypeOrReference`=9 AND `ConditionValue1`=38564;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
('26', '3204', '7581', '9', '38564', '0', '1', 'Phase 3204 if havn''t quest 38564'),
('26', '3205', '7581', '48', '278114', '0', '1', 'Phase 3204 if quest 39681 not complete/rewarded'),
('26', '3205', '7581', '9', '38564', '0', '0', 'Phase 3204 if have quest 38564'),
('26', '3206', '7581', '48', '278114', '0', '0', 'Phase 3204 if quest 39681 not complete/rewarded'),
('26', '3206', '7581', '48', '278116', '0', '1', 'Phase 3204 if quest 39681 not complete/rewarded'),
('26', '3206', '7581', '9', '38564', '0', '0', 'Phase 3204 if have quest 38564');


-- Glaciela Rimebang (92438)
UPDATE `creature_template` SET `AIName`='SmartAI', `npcflag`=0 WHERE `entry`= '92438';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92438 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92438, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - On Gossip Hello - Say Line 0"),
(92438, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - Close Gossip"),
(92438, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 85, 155164, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - Player Cast on Self Update Phases"),
(92438, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 92936, 30, 0, 0, 0, 0, 0, "Glaciela Rimebang - ");

DELETE FROM `creature_text` WHERE `creatureID` IN (92438);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92438, 0, 0, 'You need my help in the blacksmithing shop? Fine, but every mage has her price... and my price happens to be candy.', 12, 0, 100, 1, 0, 0, 94455, '');

-- Aimee (92936)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`= '92936';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92936 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92936, 0, 0, 1, 38, 0, 100, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Aimee - On Gossip Hello - Say Line 0"),
(92936, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 155164, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Aimee - Player Cast on Self Update Phases");

DELETE FROM `creature_text` WHERE `creatureID` IN (92936);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92936, 0, 0, 'Glaciela, I swear, your teeth are going to fall out one day from eating all my delicious candies.', 12, 0, 100, 1, 0, 0, 98999, '');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=92438;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
('92438', '184169', '3');

DELETE FROM `conditions` WHERE `SourceGroup`=92438 AND `SourceEntry`=184169 AND `ConditionTypeOrReference`=48 AND `ConditionValue1`=278116;
DELETE FROM `conditions` WHERE `SourceGroup`=92438 AND `SourceEntry`=184169 AND `ConditionTypeOrReference`=48 AND `ConditionValue1`=278115;
DELETE FROM `conditions` WHERE `SourceGroup`=92438 AND `SourceEntry`=184169 AND `ConditionTypeOrReference`=9 AND `ConditionValue1`=38564;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `NegativeCondition`, `Comment`) VALUES
('18', '92438', '184169', '48', '278115', '0', 'Glaciela Rimebang - Spellclick Only if Has Objective Complete'),
('18', '92438', '184169', '9', '38564', '0', 'Glaciela Rimebang - Spellclick Only if Has Quest Taken');


-- Glaciela Rimebang (92938)
UPDATE `creature_template` SET `AIName`='SmartAI', `minlevel`=105, `maxlevel`=105, `faction`=2007 WHERE `entry`= '92938';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92938 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92938, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - On Just Summoned - Say Line 0"),
(92938, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - Despawn"),
(92938, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 56, 124398, 20, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - Add Item"),
(92938, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 92925, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Glaciela Rimebang - Quest Credit");

DELETE FROM `creature_text` WHERE `creatureID` IN (92938);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92938, 0, 0, 'Consider me hired. See you there!', 12, 0, 100, 1, 0, 0, 94457, '');


-- Felsmith Nal\'ryssa
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`= '92264';
DELETE FROM `smart_scripts` WHERE (`entryorguid`=92264 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(92264, 0, 0, 1, 19, 0, 100, 0, 38526, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Felsmith Nal\'ryssa - On Quest Accept - Say Line 0"),
(92264, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 56, 124425, 8, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Felsmith Nal\'ryssa - Add Item"),
(92264, 0, 3, 4, 19, 0, 100, 0, 38528, 0, 0, 0, 56, 124451, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Felsmith Nal\'ryssa - On Quest Accept - Add item - Player"),
(92264, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 56, 124449, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Felsmith Nal\'ryssa - Add Item"),
(92264, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 201699, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Felsmith Nal\'ryssa - Player Cast on Self Legion Blacksmith");

DELETE FROM `creature_text` WHERE `creatureID` IN (92264);
INSERT INTO `creature_text` (`creatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(92264, 0, 0, 'Be quick about your work. You\'ll only have a small window of time to hammer out those red-hot leystone bars into the components you need.', 12, 0, 100, 1, 0, 0, 95033, 'Nal\'ryssa');


-- Leysmithing Masteries
DELETE FROM `spell_learn_spell` WHERE `entry`=201699;
INSERT INTO `spell_learn_spell` (`entry`, `SpellID`) VALUES
('201699', '183562'),
('201699', '183281'),
('201699', '183280'),
('201699', '183283'),
('201699', '183279'),
('201699', '184214'),
('201699', '184215'),
('201699', '184216'),
('201699', '184217'),
('201699', '184218'),
('201699', '184219'),
('201699', '184220'),
('201699', '184315'),
('201699', '184309'),
('201699', '184313'),
('201699', '184314'),
('201699', '184308'),
('201699', '184312'),
('201699', '184310'),
('201699', '183278'),
('201699', '184181'),
('201699', '184183'),
('201699', '184182'),
('201699', '184185'),
('201699', '184184'),
('201699', '184336'),
('201699', '184337'),
('201699', '184338'),
('201699', '184339'),
('201699', '184344'),
('201699', '184340'),
('201699', '184405'),
('201699', '184407'),
('201699', '184404'),
('201699', '184408'),
('201699', '184403');

DELETE FROM `spell_script_names` WHERE `spell_id`=184758;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('184758', 'spell_gen_firmament_stone_dummy');

DELETE FROM `creature_template_addon` WHERE `entry` IN (92247,92244,92246);
INSERT INTO `creature_template_addon` (`entry`, `emote`, `bytes1`, `bytes2`, `auras`) VALUES
(92247, 233, 0, 1, ''),
(92244, 233, 0, 1, ''),
(92246, 233, 0, 1, '');


/*=======
-- Others
=========*/
-- Strange Crate (139777)
DELETE FROM `item_loot_template` WHERE `entry`='139777';
INSERT INTO `item_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `mincount`, `maxcount`) VALUES
(139777, 139776, 100, 1 , 0, 1, 1),
(139777, 139775, 100, 1 , 0, 1, 1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=5 AND `SourceGroup`=139777;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(5, 139777, 139776, 0, 0, 6, 0, 67, 0, 0, 0, 0, '', "Only receive item when you are Horde"),
(5, 139777, 139775, 0, 0, 6, 0, 469, 0, 0, 0, 0, '', "Only receive item when you are Alliance");


-- Spirit Healer (6491)
UPDATE `creature_template` SET `npcflag`=16384 WHERE `entry`=6491;


-- Yarrog Baneshadow (3183)
UPDATE `smart_scripts` SET `action_param1`=75965 WHERE `entryorguid`=3183 AND `id`=1;


-- Surf Crawler (3106)
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=3106;


-- Quest Items Loot Template
UPDATE `creature_loot_template` SET `Chance`='100' WHERE  `QuestRequired`='1';
UPDATE `gameobject_loot_template` SET `Chance`='100' WHERE  `QuestRequired`='1';


-- Clean
DELETE FROM `creature_addon` WHERE  `guid`=358419;

