-- Can return to English client text by;
-- /script SetCVar("language.2", "ts")

-- Keybind String
-- Placeholder? Should add to Keybinds when Journal is open, or keep accessible from any UI?
ZO_CreateStringId("SI_BINDING_NAME_IMMQUESTS_OPEN_POPUP", "Open Popup")

-- Localized Strings unrelated to Quest Objectives
local stringsEN = {
	-- These use ZOS localization
	IMMERSIVE_QUESTS_QUEST_NAME = GetString(SI_CUSTOMER_SERVICE_QUEST_NAME),
	IMMERSIVE_QUESTS_UNKNOWN_QUEST = GetString(SI_QUEST_JOURNAL_UNKNOWN_QUEST_NAME),
	IMMERSIVE_QUESTS_OBJECTIVES = zo_strformat("<<1>>:", GetString(SI_QUEST_JOURNAL_QUEST_TASKS)),

	-- Custom Strings
	IMMERSIVE_QUESTS_NAME = "Immersive Quests",
	
	IMMERSIVE_QUESTS_QUEST_PANEL = "Immersive Quests – Panel",
	IMMERSIVE_QUESTS_QUEST_ID = "Quest ID:",
	IMMERSIVE_QUESTS_STEP_TEXT = "Step Text",

	IMMERSIVE_QUESTS_DEFAULT_OBJ_TXT = "Open the quest journal of your current quest task & READ the quest journal and determine which information is missing from the following: 1-ZONE NAME 2-LOCATION 3-CLUE  \n\n- Zone Name: Can you travel to a different Zone and Still know in which Zone this quest takes part in? \n\n- Location on the Map: Do I know which Part of the Zone map to explore in order to solve the Task?  \n\n- HIERARCHY of CLUES TYPES:\n- Interactive Clues: We invite the player to interact with an NPC or Item in game.\n-Known Landmark clues: Name of the Icon on the map.\n-Visual Clues: A scenery, locations or objects that a player may distinguish visually. \n-Guiding Clues: Guides a player step by step from a Location on the map.\n-Cardinal Directions: Use of north – east – south – west with a Location.",

	IMMERSIVE_QUESTS_BLOCKED_QUEST = "<'Writer' checkbox unchecked in Settings>",

	IMMERSIVE_QUESTS_QUEST_ID_HELP_LINK_BUTTON = "ESO Data Log",
	IMMERSIVE_QUESTS_QUEST_ID_HELP_LINK = "https://esoitem.uesp.net/viewlog.php?search=&searchtype=uniqueQuest",
	IMMERSIVE_QUESTS_QUEST_ID_HELP_TOOLTIP = "To Get [Quest ID]:\n\n(1) Click ESO Data Log\n(2) Type in the quest name in the search box and filter it to 'Quests (Unique)' using the drop-down menu just below the search bar\n(3) In the 'Note' column should be a number, this is the [Quest ID]",

    IMMERSIVE_QUESTS_ABANDON_WRITING = "Abandon Writing Quest",
    IMMERSIVE_QUESTS_ABANDON_WRITING_BUTTON = "Abandon Writing Quest",
    IMMERSIVE_QUESTS_ABANDON_WRITING_ERROR = "Not currently writing for this quest.",

	IMMERSIVE_QUESTS_SPELLCHECK = "Create Text Output",
	IMMERSIVE_QUESTS_CREATE_CODE = "Create Code Output",

	IMMERSIVE_QUESTS_BACKSTEP = "-1 Step",
	IMMERSIVE_QUESTS_FORWARDSTEP = "+1 Step",

	IMMERSIVE_QUESTS_DESCRIPTION_TITLE = "Example Description Title",
	IMMERSIVE_QUESTS_DESCRIPTION = "Example Description",
	IMMERSIVE_QUESTS_BUTTON_NAME = "Example Button Name",
	IMMERSIVE_QUESTS_BUTTON_TOOLTIP = "Provide feedback on the accuracy and effectiveness of the quest directions. If you find any misleading information, you may be eligible for a bounty of up to 250,000 Gold. Please send the name of the quest and the task at hand, along with a description of the issue, to report inaccuracies. On the other hand, if you loved a quest and would like to give praise to the writer, let us know which quest so we can pass on the good news!",
	IMMERSIVE_QUESTS_DISCORD_TOOLTIP = "Link To Our Discord If You Wish To Become A Creative Writer, Playtester Or Proofreader For The Unfinished Zones And Quests.",
	IMMERSIVE_QUESTS_YOUTUBE_TOOLTIP = "Link To A Youtube Tutorial For The Creative Writers, Playtesters And Proofreaders.",
	IMMERSIVE_QUESTS_ADDONS_TOOLTIP = "Link To An Useful List Of Immersion Addons And Settings.",
	IMMERSIVE_QUESTS_FLOWCHART = "Link To The Directions Flow Chart.",
}

for id, stringVar in pairs(stringsEN) do
   ZO_CreateStringId(id, stringVar)
   SafeAddVersion(id, 1)
end

-- Define AddOn namespace/table
ImmersiveQuests = {}

-- These are the numerical constants used by ZOS to note Alliance as returned by GetUnitAlliance("player")
-- Use these according to the below format if you want to append different text dependent on player Alliance
--[[
	ALLIANCE_ALDMERI_DOMINION
	ALLIANCE_DAGGERFALL_COVENANT
	ALLIANCE_EBONHEART_PACT
]]

-- Since we're using Ids to get the game to translate quest names for us, it's handy to put the quest name as a comment (via --) at the end of that line
-- If an objective is repeated, add a unique number to the end (this can be an incremented one, e.g. ["Objective 1"], ["Objective 2"]). These will need a stepTextKey field to assign the appendText to the correct version of the objective

ImmersiveQuests.localization = {


-- \/ PASTE CODE UNDER THIS LINE \/ -- -- \/ PASTE CODE UNDER THIS LINE \/ -- -- \/ PASTE CODE UNDER THIS LINE \/ -- 

-- /\ PASTE CODE ABOVE THIS LINE /\ ---- /\ PASTE CODE ABOVE THIS LINE /\ ---- /\ PASTE CODE ABOVE THIS LINE /\ --









-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial-- Tutorial

	[GetQuestName(6646)] = { --"The Gates of Adamant"--OneSkyGod
		["Talk to Norianwe"] =
			{appendText="", stepTextKey="I spied an Elf on the other side of my cell door. I should speak with her."},
		["Wait for Norianwe to Open the Door"] =
			{appendText=""},
		["Exit Cell"] =
			{appendText=""},
		["Follow Norianwe 1"] =
			{appendText=", as she leads the way outside of the cell where I woke up.", stepTextKey="I successfully escaped my cell. I should follow my liberator, Norianwe."},
		["Talk to Norianwe 2"] =
			{appendText=". She waits for me in the court, near the fountain outside my cell.", stepTextKey="Norianwe wants to speak with me before we proceed. I should talk to her and find out what she wants."},
		["Take a Weapon"] =
			{appendText="- one that suits your nature. They are set on the stone altars, by the two lit fire basins."},
		["Equip a Weapon"] =
			{appendText=""},
		["Follow Norianwe 2"] =
			{appendText="", stepTextKey="With my weapon equipped, I'm ready to fight. I should follow Norianwe to the next room."},
		["Practice Combat"] =
			{appendText=""},
		["Talk to Norianwe 3"] =
			{appendText=" by the combat practice area.", stepTextKey="Now that I defeated her magical construct, I should talk to Norianwe about what to do next."},
		["Lead Norianwe Outside"] =
			{appendText=" through the door from the practice area."},
		["Find the Keywright's Gallery"] =
			{appendText=", it's in an immensely towering structure on the Island of Balfiera, accessible only by the Gallery Foyer's entrance."},
		["Talk to Norianwe 4"] =
			{appendText=" by the top of the staircase in the Gallery Foyer, inside the towering structure.", stepTextKey="A locked gate blocks our progress. I should talk to Norianwe about what to do next."},
		["Acquire the Skyshard"] =
			{appendText=" inside the Skyshard Vault, near a waterfall on the Isle of Balfiera."},
		["Return to the Gate"] =
			{appendText=" by the top of the staircase."},
		["Repair the Gate"] =
			{appendText=" by the top of the staircase in the Gallery Foyer."},
		["Talk to Norianwe 5"] =
			{appendText=" by the top of the staircase in the Gallery Foyer.", stepTextKey="I repaired the gate. Now, I should talk to Norianwe about what to do next."},
		["Enter Gate"] =
			{appendText=". That is found in the Gallery Antechamber, by the top of the staircase in the Gallery Foyer."},
		["Defeat Shyazzel the Traveler"] =
			{appendText=" in the Gallery Antechamber, by the top of the staircase in the Gallery Foyer."},
		["Enter the Keywright's Gallery"] =
			{appendText=" from the Gallery Antechamber, by the top of the staircase in the Gallery Foyer."},
		["Talk to Norianwe 6"] =
			{appendText=" in the endmost chamber of the towering structure, on Isle of Balfiera.", stepTextKey="The Keywright's Gallery is full of magic doorways! I should talk to Norianwe to find out what she knows about this strange chamber."},
		["Talk to Norianwe 7"] =
			{appendText=" in the endmost chamber of the towering structure, on Isle of Balfiera.", stepTextKey="I found my way to the Keywright's Gallery with the help of Norianwe. I should talk to her about what to do next."},
	},

---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS---- DUNGEONS TRAILS ARENAS

[GetQuestName(4054)] = { --"Deadly Whispers"--OneSkyGod
        ["Clear the First Cave"] =
            {appendText=" cave by venturing into the dark depths of the cavern and face the dreadful arachnid that dwells there. You have heard fearful whispers from the trembling entourage that it is this beast that spins the silken threads that cover all you see."},
        ["Clear the Second Cave"] =
            {appendText=".\nOne of the companions whispered in your ear:\nThere's something you need to know. Down this cave, there's a gate that no one can open, and a spider watches from the darkness. It came out of nowhere and took one of us last time."},
        ["Clear the Third Cave"] =
            {appendText=" by venturing deeper into the \narachnid-infested grotto."},
        ["Silence the Whispers"] =
            {appendText=".\n\nAs I continue to descend deeper into the arachnid-infested grotto, the sound of the scurrying arachnids grows louder and louder, gradually overwhelming my senses. \nThe sound slowly begins to fade away, replaced by a soft whispering voice that gradually becomes more prominent the deeper I go into the cavern."},
        ["Talk to Guardian Sud-Hareem"] =
            {appendText=" at the furthest end of the cave."},
    },

[GetQuestName(3993)] = { --"Kings of the Grotto"--OneSkyGod
        ["Kill the Goblin War Chief"] =
            {appendText=", in the depths of the underground grotto. It's a goblin brute with bulging muscles and a fierce scowl who surveys the largest cavern from atop with a predatory glare. The air is thick with the stench of his power, and his minions cower in fear at his very presence. With a voice like gravel, he rallies his horde, goading them into a frenzied battle rage with promises of glory and plunder."},
        ["Mount the Head on a Spike"] =
            {appendText=".\nThis will make the onlooking goblins, who gather in the largest cavern, fear you."},
        ["Lead the Goblins against the Dreugh"] =
            {appendText=" deeper into the grotto."},
        ["Defeat the Dreugh King"] =
            {appendText=" at the endmost cavern of the grotto."},
        ["Talk to Vila Theran by the Shrine Entrance"] =
            {appendText=", at the top of the hill in the endmost cavern in the grotto."},
    },


---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted---- Undaunted

[GetQuestName(4967)] = { --"One of the Undaunted"--OneSkyGod
        ["Enter the Banished Cells"] =
            {appendText=", a secluded crypt containing forbidden knowledge so taboo that its atrocities were buried on the northern outermost isle, far away from the watchful eyes of Vulkhel Guard."},
        ["Talk to Turuk Redclaws in Vulkhel Guard"] =
            {appendText=", in the loft of the Salted Wings Tavern"},
        ["Be Initiated"] =
            {appendText=" by the Undaunted in the loft of the Salted Wings Tavern, located in Vulkhel Guard."},
    },

[GetQuestName(4767)] = { --"One of the Undaunted"--Rosque
        ["Talk to Mighty Mordra 1"] =
            {appendText=". Njoll was lounging in a tavern located in a bustling city. Given their affiliation, it's plausible that they share similar habits.", stepTextKey="I should talk to Mighty Mordra in Daggerfall. She can tell me more about the Undaunted."},
        ["Talk to Mighty Mordra 2"] =
            {appendText=" inside The Rosy Lion in Daggerfall.", stepTextKey="I should continue my conversation with Mighty Mordra."},
        ["Enter Spindleclutch I"] =
            {appendText=", a series of abandoned mine tunnels beneath the Ayleid ruins of Dwynnarth located northeast of Aldcroft, where many members of the Fighters Guild have been reported missing."},
        ["Talk to Mighty Mordra in Daggerfall 1"] =
            {appendText=".", stepTextKey="I agreed to meet Mighty Mordra at Rosy Lion Inn in Daggerfall for my initiation into the Undaunted."},
        ["Become Initiated"] =
            {appendText=" inside The Rosy Lion in Daggerfall."},
        ["Talk to Mighty Mordra in Daggerfall 2"] =
            {appendText=".", stepTextKey="I agreed to meet Mighty Mordra at Daggerfall's Rosy Lion Inn for my initiation into the Undaunted."},
    },

[GetQuestName(4997)] = { --"One of the Undaunted"--Rosque
        ["Enter Fungal Grotto I"] =
            {appendText=", a dark and dank cave from which few return. It is located west of Iliath Temple."},
        ["Talk to Kailstig the Axe in Davon's Watch"] =
            {appendText="."},
        ["Watch Initiation"] =
            {appendText=" inside The Fish Stink in Davon's Watch."},
        ["Talk to Kailstig the Axe in Stonefalls"] =
            {appendText=" inside The Fish Stink in Davon's Watch."},
    },




-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline-- Main Questline

	[GetQuestName(4296)] = { -- "Soul Shriven in Coldharbour"--OneSkyGod
		["Talk to the Hooded Figure 1"] = { 
			appendText = 
			{
				[ALLIANCE_ALDMERI_DOMINION]=" near the closest Wayshrine.",
				[ALLIANCE_DAGGERFALL_COVENANT]=" near the closest Wayshrine.",
				[ALLIANCE_EBONHEART_PACT]=" near the closest Wayshrine.",
			}, stepTextKey="A hooded figure wishes to speak to me. I should see what the hooded figure wants.",
		},
		["Talk to the Hooded Figure 2"] = { 
			appendText = 
			{
				[ALLIANCE_ALDMERI_DOMINION]=" who is relaxing on the deck of The Interim Suitor, a ship at the Vulkhel Guard Docks in Auridon.",
				[ALLIANCE_DAGGERFALL_COVENANT]=" who is feeding the chickens near the southeastern gate in the city of Daggerfall in Glenumbra.",
				[ALLIANCE_EBONHEART_PACT]=" who is fixing a wooden cart by the bridge that arcs over the two ponds in Davon's Watch city in Stonefalls.",
			}, stepTextKey="I have been approached by a hooded figure who wished to speak to me, but I had other things to attend to. I should find them and see what they wanted from me.",
		},
		["Talk to the Benefactor"] = { 
			appendText = 
			{
				[ALLIANCE_ALDMERI_DOMINION]=" inside The Interim Suitor, a ship at the Vulkhel Guard Docks in Auridon.",
				[ALLIANCE_DAGGERFALL_COVENANT]=" inside the Patheirry House near the southeastern gate in the city of Daggerfall in Glenumbra.",
				[ALLIANCE_EBONHEART_PACT]=" inside The Sadreno House by the bridge that arcs over the two ponds in Davon's Watch city in Stonefalls.",
			},
		},	
		["Find a Way to Escape Coldharbour 1"] =
			{appendText="", stepTextKey="I awoke in some kind of prison cell. I should try to find a way out."},
		["Join Lyris"] =
			{appendText=""},
		["Follow Lyris 1"] =
			{appendText="", stepTextKey="Lyris seems to know her way around this prison. I should follow her."},
		["Defeat the Prison Guard"] =
			{appendText=""},
		["Follow Lyris 2"] =
			{appendText="", stepTextKey="With the guard defeated, Lyris and I can make our way out of this prison."},
		["Defeat the Prison Guards"] =
			{appendText=""},
		["Follow Lyris 3"] =
			{appendText="", stepTextKey="We've defeated the guards, and now we can finally escape. I should let Lyris take the lead."},
		["Talk to Lyris 1"] =
			{appendText="", stepTextKey="A strange vision appeared to both of us, of a man calling himself \"the Prophet.\" I should talk to Lyris about who this is."},
		["Continue through the Bleeding Forge"] =
			{appendText=""},
		["Defeat Vaekar the Forgemaster"] =
			{appendText=""},
		["Reach the Towers of Eyes"] =
			{appendText=""},
		["Destroy a Coldharbour Sentinel"] =
			{appendText=", they are gazing ocular abominations found at the highest vantage point, spying on the area in the name of their Master."},
		["Reach the Prophet's Cell"] =
			{appendText=", which is guarded by a gate with spiked edges, and is located between two cold flame crystals."},
		["Talk to Lyris 2"] =
			{appendText=" next to the Prophet's Cell which has a gate with spiked edges, and is located between two cold flame crystals.", stepTextKey="The door to the Prophet's cell is sealed. I should see if Lyris has any idea on what we should do next."},
		["Talk to Cadwell"] =
			{appendText=" who loves playing his lute and warming himself by a campfire down by the river."},
		["Enter the Undercroft"] =
			{appendText=", its entrance can be found by following the river to its south end."},
		["Find the Prophet's Cell"] =
			{appendText=""},
		["Follow Lyris 4"] =
			{appendText="", stepTextKey="We've entered the cell. The Prophet should be in here somewhere."},
		["Talk to Lyris 3"] =
			{appendText="", stepTextKey="We've found the Prophet, but he's within some kind of magical prison. I should see if Lyris knows how to get him out."},
		["Defend Lyris"] =
			{appendText=""},
		["Activate the Pinions"] =
			{appendText=""},
		["Wait for the Exchange"] =
			{appendText=""},
		["Talk to the Prophet"] =
			{appendText="", stepTextKey="The Prophet is free, but Lyris is now trapped in the cell. I should talk to the Prophet and find out what's next."},
		["Enter the Anchor Mooring"] =
			{appendText=""},
		["Get to the Anchor Base"] =
			{appendText=""},
		["Defeat the Child of Bones"] =
			{appendText=""},
		["Talk to The Prophet"] =
			{appendText=""},
		["Collect the Skyshard"] =
			{appendText=""},
		["Wait for the Prophet"] =
			{appendText=""},
		["Approach the Portal"] =
			{appendText=""},
		["Use the Rift to Escape to Tamriel"] =
			{appendText=""},
		["Talk to the Prophet 2"] =  { 
			appendText = 
			{
				[ALLIANCE_ALDMERI_DOMINION]=" in the Ruined Tower in Eagle's Strand on the Island of Khenarthi's Roost.",
				[ALLIANCE_DAGGERFALL_COVENANT]=" in The Spearhead ship at Port Huding on the Island of Stros M'Kai.",
				[ALLIANCE_EBONHEART_PACT]=" at the residence of Captain Rana's Office on the Island of Bleakrock Isle.",
			}, stepTextKey="I've emerged from the rift in an unfamiliar place. The Prophet is nearby, but his form is indistinct and translucent. I should speak with him.",
		},
		["Talk to the Prophet 3"] =  { 
			appendText = 
			{
				[ALLIANCE_ALDMERI_DOMINION]=" in the Ruined Tower in Eagle's Strand on the Island of Khenarthi's Roost.",
				[ALLIANCE_DAGGERFALL_COVENANT]=" in The Spearhead ship at Port Huding on the Island of Stros M'Kai.",
				[ALLIANCE_EBONHEART_PACT]=" at the residence of Captain Rana's Office on the Island of Bleakrock Isle.",
			}, stepTextKey="I've shown up in an unfamiliar place. The Prophet has appeared as a shade; I should speak with him and see where I must go next.",
		},
	},

-- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD -- AD -- AD --AD 


--[[ EXCLUDE KH 


-- Khenarthi's Roost Main Questline

	[GetQuestName(4680)] = { -- "Storm on the Horizon"--OneSkyGod
		["Talk to the Boatswain"] = 
			{appendText=" Sugar-Claws. She has a tendency to dock near her favorite smell… fish being scaled, gutted, filleted and dried on the Vulkhel Guard Docks."},
		["Talk to Razum-dar 1"] = 
			{appendText=" a Khajiit with a reddish mohawk hairstyle, who awaits my arrival north of Boatswain Sugar-Claws' location, in Eagle's Strand.", stepTextKey="Sugar-Claws took me from the docks of Vulkhel Guard to Khenarthi's Roost. I should look for Razum-dar at Eagle's Strand."},
		["Talk to Razum-dar 2"] = 
			{appendText=", a Khajiit with a reddish mohawk hairstyle, north of Boatswain Sugar-Claws’ location, in Eagle’s Strand.", stepTextKey="Razum-dar approached me in Eagle's Strand. He seemed to know more about my situation than I do. I should speak with him."},
		["Talk to Commander Karinith"] = 
			{appendText=", the Altmer currently delegating duties and managing the unit from the center of Eagle’s Strand."},
		["Talk to Ealcil"] = 
			{appendText=" a scholar of magic, who is currently researching a mysterious anomaly: a floating artifact enveloped as a water sphere in Eagle’s Strand."},
		["Investigate Temple of the Mourning Springs"] = 
			{appendText=", an ancient stone temple in the eastern part of the island, where herds of sheep graze the rich pastures outside the temple's entrance. Locals are gossiping about the motives of the mages that have set up camp there, they may have some insight."},
		["Investigate Shattered Shoals"] = 
			{appendText=" by exploring the western shores of the shipwrecked beaches and its island roads. Search for survivors who could help you learn about the aftermath of those deadly storms."},
		["Go to Mistral"] = 
			{appendText=", a northern port city of Khenarthi's Roost."},
		["Talk to Razum-dar 3"] = 
			{appendText=" by the end of the longest suspended bridge leading into the town of Mistral.", stepTextKey="Razum-dar waits for me in the town of Mistral. I should meet him there and tell him what I've learned."},
	},
 
	[GetQuestName(4625)] = { --"Tears of the Two Moons"--OneSkyGod
		["Enter the Temple Courtyard"] =
			{appendText=""},
		["Talk to the Skeleton"] =
			{appendText=""},
		["Disrupt the Temple Wards"] =
			{appendText=". Gathwen, my guide into the temple, may know the location of the Temple Wards."},
		["Enter the Temple Catacombs"] =
			{appendText=""},
		["Disrupt the Barrier"] =
			{appendText=""},
		["Talk to Gathwen 1"] =
			{appendText="", stepTextKey="I broke the barrier leading further into the temple, but Gathwen wants to speak with me before we proceed."},
		["Find Rurelion"] =
			{appendText=""},
		["Disrupt Uldor's Summoning Ritual"] =
			{appendText=".  It seems to be sustained by the four mounds of bones in the Central Ruins of the temple."},
		["Confront Uldor"] =
			{appendText=". They fled further into the Great Hall of the temple."},
		["Disable the Traps"] =
			{appendText=""},
		["Talk to Rurelion 1"] =
			{appendText=" in the undercroft of the Great Hall, deep within the temple.", stepTextKey="Rurelion forced Uldor out of his body and into a nearby tomb, but the solution seemed temporary. I should speak with Rurelion about making it permanent."},
		["Talk to Gathwen 2"] =
			{appendText=" in the undercroft of the Great Hall, deep within the temple.", stepTextKey="The water crystal once residing in the temple - the \"Mourning Stone\" - is key to sealing Uldor back in his tomb. Rurelion thinks the only solution is to seal himself in the tomb, but Gathwen disagrees. I should ask her for her alternative."},
		["Let Uldor Claim Gathwen"] =
			{appendText=" in the undercroft of the Great Hall, deep within the temple."},
		["Let Uldor Claim Rurelion"] =
			{appendText=" in the undercroft of the Great Hall, deep within the temple."},
		["Seal Uldor's Tomb"] =
			{appendText=""},
		["Talk to Gathwen 3"] =
			{appendText=" deep within the temple in Uldor's tomb.", stepTextKey="I placed the Tears of the Two Moons in their pedestals, sealing Uldor in his tomb. I should say goodbye to Gathwen before I depart."},
		["Talk to Rurelion 1"] =
			{appendText=" deep within the temple in Uldor's tomb.", stepTextKey="I placed the Tears of the Two Moons in their pedestals, sealing Uldor in his tomb. I should say goodbye to Rurelion before I depart."},
		["Talk to Rurelion in the Great Hall"] =
			{appendText="", stepTextKey="Uldor and Gathwen are now sealed in the Tomb of the Waning Moons. I should speak to Rurelion before I depart."},
	},


	[GetQuestName(4620)] = { --"Cast Adrift"--OneSkyGod
		["Find Edhelas"] = 
			{appendText=" somewhere at the southwestern beach shipwreck shoreline of Shattered Shoals and give them some gathered Torchbug Treacle. They glow a faint green, and some flasks might have been swallowed by those two-legged abominations.\n"},
		["Find Onglorn"] = 
			{appendText=" somewhere at the southwestern beach shipwreck shoreline of Shattered Shoals and give them some gathered Torchbug Treacle. They glow a faint green, and some flasks might have been swallowed by those two-legged abominations.\n"},
		["Find Nistel"] = 
			{appendText=" somewhere at the southwestern beach shipwreck shoreline of Shattered Shoals and give them some gathered Torchbug Treacle. They glow a faint green, and some flasks might have been swallowed by those two-legged abominations.\n"},
		["Go to the Cave"] = 
			{appendText=" that is abeam to starboard from the only ship not sunk by the hurricane, on the west coast of the island."},
		["Find Lieutenant Gelin"] =
			{appendText=" in the cave that is abeam to starboard from the only ship not sunk by the hurricane, on the west coast of the island."},
		["Talk to Sergeant Firion"] = 
			{appendText=" outside the cave that is abeam to starboard from the only ship not sunk by the hurricane, on the west coast of the island."},
		["Investigate the Beached Ship"] =
			{appendText=" on the west coast of the island."},
		["Talk to Quartermaster Oblan"] =
			{appendText=" by the beached ship, on the west coast of the island."},
		["Patch Forward Leak"] =
			{appendText=" of the beached ship, on the west coast of the island."},
		["Locate Helmsman's Wheel"] =
			{appendText="  in the shallows on the port side of the Prowler beached ship on the west coast of the island."},
		["Patch Aft Leak"] =
			{appendText=" of the beached ship, on the west coast of the island."},
		["Retrieve Sun-Sighter from Sea Vipers"] =
			{appendText=", they can be found in the shallows on the port side of the Prowler beached ship, on the west coast of the island."},
		["Talk to Quartermaster Oblan at the Prowler"] =
			{appendText=" on the west coast of the island."},
		["Talk to the Prowler's Captain"] =
			{appendText=" on the west coast of the island."},
		["Talk to Mastengwe"] =
			{appendText=" below the deck in the Prowler, on the west coast of the island."},
		["Take Lodestone from Sea Vipers"] =
			{appendText=" near the materialized storm on the port side of the Prowler, the beached ship on the west coast of the island."},
		["Stop the Maormer Ritual"] =
			{appendText=" within the materialized hurricane on the west coast of the island."},
		["Return to Captain Jimila at the Prowler"] =
			{appendText=" on the west coast of the island."},
	},



    [GetQuestName(4624)] = { --"The Perils of Diplomacy"--OneSkyGod
        ["Talk to the Silvenar 1"] =
            {appendText=" in the most notable building in Mistral, the Mistral Treasury.", stepTextKey="Razum-dar gave me a token to hand to the Silvenar, a diplomatic envoy for the Dominion. This will let the Silvenar know I can be trusted to assist him in this delicate matter."},
        ["Investigate the Chancery"] =
            {appendText=" in the most notable building in Mistral, the Mistral Treasury."},
        ["Talk to Razum-dar"] =
            {appendText=" who may be having a drink in the Boatman's Tail tavern."},
        ["Sneak into the Maormer Embassy's Private Quarters"] =
            {appendText=", I'll need to rely on my cunning and ingenuity to overcome any obstacles in my way. The Quarters are on the top floor of the westernmost building in Mistral — the one decorated with Serpentine Maormer Banners."},
	["Take the Treaty of Khenarthi's Roost from the Maormer Embassy"] =
            {appendText=""},
        ["Bring the Treaty to Razum-dar"] =
            {appendText=",.He awaits your arrival on the bridge in front of the Chancery of Mistral."},
        ["Talk to the Silvenar 2"] =
            {appendText="", stepTextKey="The Silvenar can challenge Ambassador Ulondil's claims with the copy of the treaty. I should bring it to him immediately. He and the Green Lady are staying at Ladrelas the armorer's house, located above the forge."},
        ["Talk to The Green Lady"] =
            {appendText=" at Ladrelas the armorer's house, located above the Moonfire Forge in Mistral."},
        ["Talk to Harrani 1"] =
            {appendText=" in the Chancery of Mistral.", stepTextKey="When the Green Lady discovered the Silvenar's murder, she could barely contain her rage. I should find out if Harrani knows anything before the Green Lady seeks her own kind of justice."},
        ["Examine Harrani's Report"] =
            {appendText=" in the Chancery of Mistral."},
        ["Continue Harrani's Investigation in Mistral"] =
            {appendText=". The uninvestigated leads can be examined in the Harrani's Report, in the Chancery of the Mistral Treasury."},
        ["Bring Evidence to Razum-dar"] =
            {appendText=". He expects your presence next to Maladdiq, the Home Goods Furnisher merchant in Mistral."},
        ["Talk to the Green Lady"] =
            {appendText=". She is keeping watch in Mistral, outside of Ladrelas the Armorer's front door — where her beloved Silvenar was murdered."},
        ["Follow the Trail through Mistral"] =
            {appendText=" which starts outside of Ladrelas' house in Mistral."},
	["Destroy the Maormer Ritual"] =
            {appendText=" in the Abandoned House in western Mistral."},
        ["Interrogate the Assassin"] =
            {appendText=" in the Abandoned House in western Mistral."},
        ["Confront Ulondil"] =
            {appendText=" by the Mistral Wayshrine."},
        ["Talk to Harrani 2"] =
            {appendText=" by the Mistral Wayshrine.", stepTextKey="Ulondil fled when I revealed the evidence against his people. I should speak to Harrani and see what should be done in the face of this treachery."},
        ["Follow Ulondil"] =
            {appendText=" into the Maormer Embassy in Mistral."},
        ["Deal with Ulondil in the Embassy"] =
            {appendText=" in Mistral."},
        ["Talk to Harrani 3"] =
            {appendText=" outside of the Maormer Embassy in Mistral.", stepTextKey="I took Ulondil into custody, preventing the Green Lady from taking her revenge.\n\nI should let Harrani know the ambassador won't trouble her town any longer."},
        ["Talk to Harrani 4"] =
            {appendText=" outside of the Maormer Embassy in Mistral.", stepTextKey="I let the Green Lady kill Ulondil.\n\nI should let Harrani know the ambassador won't trouble her town any longer."},
    },

	[GetQuestName(4621)] = { --"The Tempest Unleashed"--OneSkyGod
		["Talk to Commander Karinith"] =
			{appendText=" in Mistral."},
		["Direct Survivors to Safety"] =
			{appendText=""},
		["Find the Dominion Marine"] =
			{appendText=""},
		["Talk to Sergeant Firion"] =
			{appendText=""},
		["The Marine"] =
			{appendText=" Sergeant Firion that is awaiting your decision at the gate to the Cat's Eye Quay."},
		["The Wizard"] =
			{appendText=" next to Sergeant Firion, who is awaiting your decision at the gate to the Cat's Eye Quay."},
		["Enter Cat's Eye Quay"] =
			{appendText=""},
		["Find Signs of the Maormer Plan"] =
			{appendText=". The aid I have chosen may have some clues."},
		["Enter the Wind Tunnels"] =
			{appendText=". The aid I have chosen may have some clues."},
		["Talk to Ealcil 1"] =
			{appendText="", stepTextKey="I discovered the author of the notes in the Wind Tunnels. I previously met Ealcil at the temple of the mourning springs. I should find out what he's doing in Cat's Eye Quay."},
		["Use Ealcil's Lodestone"] =
			{appendText=" within the entrance of the Wind Tunnels."},
		["Talk to Ealcil 2"] =
			{appendText=" within the entrance of the Wind Tunnels.", stepTextKey="I was able to use the lodestone to drain a Storm Totem. I should speak with Ealcil to see if it worked as expected."},
		["Use Lodestone to Drain Storm Totems"] =
			{appendText="", stepTextKey="In order to stop the Maormer ritual, I must drain the Storm Totems within the Wind Tunnels."},
		["Talk to Ealcil's Psijic Projection"] =
			{appendText=" near the exit of the Wind Tunnels."},
		["Disrupt So'Wester Horn"] =
			{appendText=" beyond the exit of the Wind Tunnels."},
		["Disrupt Centralia Horn"] =
			{appendText=" beyond the exit of the Wind Tunnels."},
		["Disrupt Nor'Easter Horn"] =
			{appendText=" beyond the exit of the Wind Tunnels."},
		["Escape the Ritual Site"] =
			{appendText=""},
		["Talk to Razum-dar"] =
			{appendText=" in front of the blocked cave tunnel, in Cat's Eye Quay."},
	},

	[GetQuestName(4818)] = { --"To Auridon"--OneSkyGod
		["Board the Skiff"] =
			{appendText=" in front of the blocked cave tunnel in Cat's Eye Quay."},
		["Talk to Watch Captain Astanya"] =
			{appendText=" at the three Battlegrounds Banner Flags that are visible from the deck of The Prowler, at the Vulkhel Guard Docks."},
	},

 -- Khenarthi's Roost Side Quests

[GetQuestName(4667)] = { -- "Dark Knowledge"--OneSkyGod
        ["Talk to Cartirinque 1"] = 
            {appendText=". If I ever lose sight of her, her spirit will linger next to the Temple of the Crescent Moons in the southern part of the island.", stepTextKey="I should speak with Cartirinque about what exactly she wants done with the books."},
        ["Collect Ritual of Resonance"] = 
            {appendText=". If this task is in the first position in your quest journal, it is located south of Mistral, after crossing two suspended bridges. It can be found on the side of the road near a flock of sheep and a Khajiit shepherd. —— If this task is in the second position in your quest journal, the book is located southwest of the Temple of the Crescent Moon. It washed up on a crate on the beach after a shipwreck. You can find a group of Khajiits and a Wood Elf dancing and playing music just north of that location.\n"},
        ["Collect Journal of Bravam Lythandas"] = 
            {appendText=". If this task is in the second position in your quest journal, it can be found behind a waist-high wall on the only traveled road leading to Windcatcher Plantation when coming from the center of Khenarthi's Roost. —— If this task is in the third position in your quest journal, the book can be found on the beach that is starboard of the largest ship currently docked at Mistral.\n"},
	["Collect Masterwork of the Inducer"] = 
            {appendText=". If this task is in the third position in your quest journal, it can be found in the middle between the Temple of the Crescent Moons, the Speckled Shell Plantation, and Eagle's Strand. —— If this task is in the first position in your quest journal, the book can be found on a tree stump at the crossroads between the Temple of the Crescent Moons and the Temple of the Mourning Springs.\n"},
        ["Find the Ruined Shrine"] = 
            {appendText=" on the southern end of the Windcatcher Plantation."},
        ["Search the Shrine"] = 
            {appendText=" on the southern end of the Windcatcher Plantation. The books somehow compel you to cross paths with a Khajiit."},
        ["Talk to Cartirinque 2"] = 
            {appendText=" next to the ruined shrine on the southern end of the Windcatcher Plantation.", stepTextKey="Sahira-daro, a Khajiit seeking the forbidden tomes, says Cartirinque is a spirit sent to test mortals. I should speak with the spirit and learn the truth."},
        ["Give the Tomes to Sahira-daro"] =
            {appendText=" next to the ruined shrine on the southern end of the Windcatcher Plantation."},
        ["Burn the Tomes in the Shrine's Brazier"] =
            {appendText=" next to the ruined shrine on the southern end of the Windcatcher Plantation."},
        ["Talk to Sahira-daro"] =
            {appendText=" next to the ruined shrine on the southern end of the Windcatcher Plantation."},
        ["Talk to Cartirinque 3"] = 
            {appendText=" next to the ruined shrine on the southern end of the Windcatcher Plantation.", stepTextKey="I destroyed the tomes as Cartirinque asked. I should speak with her and see if there is anything more that must be done."},
    },

[GetQuestName(4693)] = { -- "The Family Business"--OneSkyGod
        ["Talk to Azbi-ra"] = 
            {appendText=", who is tending to her father in the only house in sight that has not been touched by the fire on the Speckled Shell Plantation."},
        ["Salvage Alchemical Tools"] = 
            {appendText=". Azbi-ra hopes they are still intact in the burned storehouses on the Speckled Shell Plantation over the bridge east of where you talked to her. Workbenches, barrels, or any other containers may be salvageable."},
        ["Talk to Zaban-ma 1"] = 
            {appendText=", he seems discontent with your presence on his family's Speckled Shell Plantation.", stepTextKey="While searching for alchemical tools in the burned moon-sugar storehouses, I encountered a Khajiit named Zaban-ma. I should ask if he knows what happened to the plantation."},
        ["Find the Skooma"] = 
            {appendText=" along the coast of the beach south of the Temple of the Mourning Springs — which is found northeast of the Speckled Shell Plantation."}, 
	["Talk to Zaban-ma 2"] = 
            {appendText=", who has rushed to his father's side after hearing that he was injured in the fire. I should check in the vicinity of their house on the Speckled Shell Plantation."},
        ["Talk to Officer Lorin 1"] = 
            {appendText=" behind the Speckled Shell Plantation's abode.", stepTextKey="When I returned to Zaban-ma, I encountered Officer Lorin again. She wants to speak with me. I should do so before I do anything with the skooma."},
        ["Decide the Fate of the Family"] = 
             {appendText=" by choosing what to tell Officer Lorin, behind the Speckled Shell Plantation's abode."},
        ["Talk to Officer Lorin 2"] = 
            {appendText=" behind the Speckled Shell Plantation's abode.", stepTextKey="I gave the skooma to Officer Lorin. I should speak with her and see what's going to happen to Azbi-ra and Zaban-ma."},
        ["Bring the Skooma to Zaban-ma"] = 
            {appendText=" behind the Speckled Shell Plantation's abode."},
    },




[GetQuestName(4664)] = { -- "Moon-Sugar Medicament"--OneSkyGod
        ["Find Hazak's Hollow"] = 
            {appendText=". Scribbled on the back of the found note is a warning to be careful not to alert the Fist of the Thalmor on duty on the beach northeast of the largest ship docked at Mistral, as they are patrolling quite near the hollow further up the beach."},
        ["Enter Hazak's Hollow"] = 
            {appendText=". Zulana mentioned that she was spooked by the three skeletons dangling above the entrance of the hollow, and did not dare to swim under them."},
    ["Enter Hazak's Lair"] =
       {appendText=". Khari could be useful in understanding how to tackle this issue."},
        ["Rescue Khari"] = 
            {appendText=" somewhere within Hazak's Hollow."},
        ["Kill Hazak"] = 
            {appendText=" in his lair in Hazak's Hollow."},
        ["Return to Zulana"] = 
            {appendText=". She should be waiting on the beach outside of Hazak's Hollow where we first met."},
        ["Talk to Zulana"] = 
            {appendText=" on the beach outside of Hazak's Hollow."},
    },


	[GetQuestName(4692)] = { -- "A Pinch of Sugar"--OneSkyGod
		["Talk to Cinder-Tail"] = 
			{appendText=". They are with three senche-tigers, in a dwelling on the Laughing Moons Plantation."},
		["Steal Thunderbug Eggs"] = 
			{appendText=". Which are laid in the Thunderbug's Mounds, closely guarded by the Thunderbugs of the Laughing Moons Plantation."},
		["Destroy Rat Nests"] = 
			{appendText="\nThey have a lingering green stench and are scattered across the Laughing Moons Plantation."},
		["Talk to Juranda-ra 1"] = 
			{appendText=" on the Laughing Moons Plantation.", stepTextKey="Juranda-ra will want to know the Rat Nests have been dealt with."},
		["Talk to Juranda-ra 2"] = 
			{appendText=" on the Laughing Moons Plantation.", stepTextKey="Juranda-ra was thankful for my aid. Perhaps there's a reward for my help."},
	},

	[GetQuestName(4673)] = { -- "The Root of the Problem"--OneSkyGod
		["Enter the Cave"] = 
			{appendText=" below the Great Tree, on the edge of the Windcatcher Plantation."},
		["Talk to Naarwe"] = 
			{appendText=" below the Great Tree, on the edge of the Windcatcher Plantation."},
		["Protect the Spirit as It Heals the Roots"] = 
			{appendText=" from the adult kwama that are deeper in the cave below the Great Tree, on the edge of the Windcatcher Plantation."},
		["Talk to Spinner Benieth"] = 
			{appendText=" outside of the cave below the Great Tree, on the edge of the Windcatcher Plantation."},
	},

]]

-- Auridon MAIN QUESTS




[GetQuestName(4255)] = { --"Ensuring Security" --TEST
        ["Talk to Watch Captain Astanya"] =
            {appendText=". Watchman Vinenondil told me that they are by the top of the docks."},
        ["Talk to Advisor Norion 1"] =
            {appendText=", awaiting assistance at the east warehouse.", stepTextKey="I should speak to Advisor Norion in the west warehouse."},
        ["Find the Deployment Plans 1"] =
            {appendText=".", stepTextKey="I should look for the plans inside the warehouse."},
        ["Talk to Advisor Norion 2"] =
            {appendText=" outside.", stepTextKey="I found the plans Advisor Norion spoke of. I should report back to him outside of the warehouse."},
        ["Talk to Steward Eminwe 1"] =
            {appendText=" in Audrion.", stepTextKey="I need to seek out Steward Eminwe at a warehouse on the north end of the docks."},
        ["Search for Evidence of Poison"] =
            {appendText=" in the food supplies. Eminwe suspects sabotage."},
        ["Talk to Steward Eminwe 2"] =
            {appendText=".", stepTextKey="I discovered some suspicious salted meats, possibly poisoned. I should return to Steward Eminwe back at the warehouse."},
        ["Talk to Watchman Heldil 1"] =
            {appendText=". Once you've had a conversation with Watch Captain Astanya, position yourself to face the stairs behind her. Ascend the stairs, which are situated on the docks. As you reach the top, you will spot the Watchman infront of the second house on your right.", stepTextKey="Watch Captain Astanya has, somewhat rudely, directed me to speak with Watchman Heldil."},		
        ["Talk to the Suspect at the Door"] =
            {appendText=""},
        ["Talk to the Suspect"] =
            {appendText=" in Skywatch."},
	["Witness Confrontation"] =
            {appendText="."},
        ["Talk to Watchman Heldil 2"] =
            {appendText=".", stepTextKey="Looks like my work here is done. I should speak to the watchman one more time."},
        ["Talk to Watchman Heldil 3"] =
            {appendText=" in the house north of the stables.", stepTextKey="I should speak to Watchman Heldil."},
        ["Talk to Steward Eminwe 3"] =
            {appendText=".", stepTextKey="I should speak to Steward Eminwe in one of the warehouses to the east."},
        ["Examine the Supplies For Tampering"] =
            {appendText=" next to the warehouse near the eastern docks. I really like Eminwe's dress."},
        ["Talk to Advisor Norion 3"] =
            {appendText=".", stepTextKey="I need to seek out Advisor Norion by the south end of the docks."},
        ["Find the Deployment Plans 2"] =
            {appendText=" just behind Norion.", stepTextKey="I should enter the warehouse and search for the stolen plans."},
    },

--[[ test
[GetQuestName(4255)] = { --"Ensuring Security"--Rosque
        ["Talk to Watch Captain Astanya 1"] =
            {appendText=" at the top of the docks.", stepTextKey="I should speak to Watch Captain Astanya at the docks."},
        ["Talk to Advisor Norion 1"] =
            {appendText=" at the warehouse near the western docks.", stepTextKey="I should speak to Advisor Norion in the west warehouse."},
        ["Find the Deployment Plans 1"] =
            {appendText=" inside the warehouse near the western docks.", stepTextKey="I should look for the plans inside the warehouse."},
        ["Talk to Advisor Norion 2"] =
            {appendText=" at the warehouse near the western docks.", stepTextKey="I found the plans Advisor Norion spoke of. I should report back to him outside of the warehouse."},
        ["Talk to Steward Eminwe 1"] =
            {appendText=".", stepTextKey="I need to seek out Steward Eminwe at a warehouse on the north end of the docks."},
        ["Search for Evidence of Poison"] =
            {appendText=" in the food supplies next to the warehouse near the northern docks."},
        ["Talk to Steward Eminwe 2"] =
            {appendText=" at the warehouse near the northern docks.", stepTextKey="I discovered some suspicious salted meats, possibly poisoned. I should return to Steward Eminwe back at the warehouse."},
        ["Talk to Watch Captain Astanya 2"] =
            {appendText=" at the top of the docks.", stepTextKey="I should now report back to Watch Captain Astanya. She asked me to report to her at the town's upper level."},
        ["Talk to Watchman Heldil 1"] =
            {appendText=" south of the stables.", stepTextKey="Watch Captain Astanya has, somewhat rudely, directed me to speak with Watchman Heldil."},
        ["Talk to the Suspect at the Door"] =
            {appendText=" of the house south of the stables."},
        ["Talk to the Suspect"] =
            {appendText=" inside the house south of the stables."},
        ["Witness Confrontation"] =
            {appendText=" inside the house south of the stables."},
        ["Talk to Watchman Heldil 2"] =
            {appendText=" inside the house south of the stables.", stepTextKey="Looks like my work here is done. I should speak to the watchman one more time."},
        ["Talk to Watchman Heldil 3"] =
            {appendText=" inside the house south of the stables.", stepTextKey="I should speak to Watchman Heldil."},
        ["Talk to Steward Eminwe 3"] =
            {appendText=", rarely does she cast her gaze upon the docked ships, for she is an exemplar, devoted to the tasks she undertakes.", stepTextKey="I should speak to Steward Eminwe in one of the warehouses to the east."},
        ["Examine the Supplies For Tampering"] =
            {appendText=" next to the warehouse near the eastern docks."},
        ["Talk to Advisor Norion 3"] =
            {appendText=".", stepTextKey="I need to seek out Advisor Norion by the south end of the docks."},
        ["Find the Deployment Plans 2"] =
            {appendText=" inside the warehouse near the south end of the docks.", stepTextKey="I should enter the warehouse and search for the stolen plans."},
    },
]]


[GetQuestName(4256)] = { --"A Hostile Situation"--Rosque
        ["Find Captain Astanya"] =
            {appendText=" near the Vulkhel Guard Manor & Treasury."},
        ["Talk to Watch Captain Astanya"] =
            {appendText=" near the Vulkhel Guard Manor & Treasury."},
        ["Talk to Razum-dar"] =
            {appendText="."},
        ["Get Past the Manor Guards"] =
            {appendText=" by following Razum-dar's plan, or searching for another way."},
        ["Talk to Battlereeve Urcelmo Near the Temple"] =
            {appendText="."},
        ["Allow Urcelmo and Ayrenn to Consult"] =
            {appendText=" in front of the temple."},
        ["Enter the Temple"] =
            {appendText=" in the middle of Vulkhel Guard."},
        ["Examine the Temple"] =
            {appendText=" in the middle of Vulkhel Guard."},
        ["Defeat the Assassins"] =
            {appendText=" within the temple in the middle of Vulkhel Guard."},
        ["Talk to Queen Ayrenn 1"] =
            {appendText=" outside the temple.", stepTextKey="Time to report back to Queen Ayrenn."},
        ["Talk to Queen Ayrenn 2"] =
            {appendText=" to become an Eye of the Queen.", stepTextKey="I need to give my answer to the Queen about her generous offer."},
    }, 

[GetQuestName(4211)] = { --"To Tanzelwil"--Rosque
        ["Find the Queen's Entourage at Tanzelwil"] =
            {appendText=" northwest of Vulkhel Guard. To reach it, head north out of the city, then follow the main road northwest along the river until you reach the Tanzelwil Wayshrine. If they're not at the wayshrine, the Queen's entourage will likely be setting camp on the road leading directly into Tanzelwil, south of the Tanzelwil Wayshrine."},
    },

[GetQuestName(4217)] = { --"In the Name of the Queen"--Rosque
        ["Meet Up with Queen Ayrenn"] =
            {appendText=" at the altar near the southern entrance of Tanzelwil."},
        ["Talk to Queen Ayrenn"] =
            {appendText=" at the altar near the southern entrance of Tanzelwil."},
        ["Aid the Priestess at the West Ritual Site"] =
            {appendText=". It should be on the southwestern circle of Tanzelwil."},
        ["Aid the Priestess at the Northern Ritual Site"] =
            {appendText=". It should be on the northeastern circle of Tanzelwil."},
        ["Speak to Queen Ayrenn"] =
            {appendText=". She will likely be at the ritual site in the northwestern circle of Tanzelwil."},
    },

[GetQuestName(4222)] = { --"Rites of the Queen"--Rosque
        ["Talk to Queen Ayrenn 1"] =
            {appendText=" at the entrance to the tombs in the northwestern circle of Tanzelwil.", stepTextKey="Queen Ayrenn and I need to enter the crypts. I should speak with her first, to learn more about what we might face."},
        ["Enter Inner Tanzelwil"] =
            {appendText=" from the entrance in the northwestern circle."},
        ["Follow Queen Ayrenn"] =
            {appendText=" down through Inner Tanzelwil, accessible from the entrance in the northwestern circle."},
        ["Continue to Follow Queen Ayrenn"] =
            {appendText=" deeper into Inner Tanzelwil, accessible from the entrance in the northwestern circle."},
        ["Enter the Ancestral Chamber"] =
            {appendText=" at the deepest point of Inner Tanzelwil, accessible from the entrance in the northwestern circle."},
        ["Defeat Norion"] =
            {appendText=" in the deepest point of Inner Tanzelwil, accessible from the entrance in the northwestern circle."},
        ["Observe the Queen's Ritual"] =
            {appendText=" in the deepest point of Inner Tanzelwil, accessible from the entrance in the northwestern circle."},
        ["Talk to Queen Ayrenn 2"] =
            {appendText=" in the northwestern circle of Tanzelwil.", stepTextKey="Queen Ayrenn completed the ritual at Tanzelwil. I should meet her outside the tombs."},
    },

[GetQuestName(4366)] = { --"To Mathiisen"--Rosque
        ["Meet with Razum-dar near Mathiisen"] =
            {appendText=". To reach it, take one of the roads heading north out of Tanzelwil, and trend northeast until you reach a large bridge."},
    }, 

[GetQuestName(4293)] = { --"Putting the Pieces Together"--Rosque
        ["Meet Fistalle at Her Home"] =
            {appendText=". The archer statue in the center of town points his bow directly at it."},
        ["Search Fistalle's Body"] =
            {appendText=" in her home. The archer statue in the center of town points his bow directly at it."},
        ["Take Fistalle's Note to Razum-dar"] =
            {appendText=". If he isn't behind Fistalle's house like he said, he may be skulking around the forge on the east end of town following up on the weapons."},
        ["Search the Forge"] =
            {appendText=" on the east end of town for evidence on who is supplying the Veiled Heritance."},
        ["Talk to Razum-dar 1"] =
            {appendText=". He's probably skulking around the forge on the east end of town again.", stepTextKey="I uncovered evidence implicating Condalin the Forgemaster. I should report this information to Razum-dar."},
        ["Search Malanie's House"] =
            {appendText=", the only one in town with its own patio."},
        ["Talk to Razum-dar 2"] =
            {appendText=". He may be skulking around the patio in town.", stepTextKey="Malanie appears to lead the Heritance in Mathiisen. I should report this to Raz."},
        ["Talk to Razum-dar 3"] =
            {appendText=". He's still skulking around the patio in town.", stepTextKey="I need to speak with Raz so that we can plan our next move."},
    },

[GetQuestName(4294)] = { --"The Unveiling"--Rosque
        ["Enter the Barracks"] =
            {appendText=" in the center of town, while making the biggest scene possible."},
        ["Confront Malanie"] =
            {appendText=" in the barracks in the middle of town."},
        ["Talk to Razum-dar 1"] =
            {appendText=".", stepTextKey="I woke in a cell under the barracks. Raz, as promised, waits for me outside."},
        ["Defeat Condalin"] =
            {appendText=" in his house at the southernmost point in town near the creek shore."},
        ["Talk to Razum-dar 2"] =
            {appendText=". He's probably gearing up to fight near one of the entrances to the forge in the east end of town.", stepTextKey="I need to find Raz, so that together we might put an end to this treacherous Heirtance cell once and for all."},
        ["Defeat Malanie"] =
            {appendText=" while she's trapped inside the forge at the east end of town. If she isn't there, be on the lookout for hidden passages she could have used to escape."},
        ["Meet Razum-dar Outside"] =
            {appendText=" by the northeast docks of Mathiisen."},
        ["Talk to Razum-dar 3"] =
            {appendText=" by the northeast docks of Mathiisen.", stepTextKey="I should speak with Raz once more to end our business in Mathiisen."},
    },

[GetQuestName(4368)] = { --"To Skywatch"--Rosque
        ["Talk to Captain Tendil"] =
            {appendText=" at the gates of Skywatch, the great coastal city just north of Mathiisen."},
    },

[GetQuestName(4330)] = { --"Lifting the Veil"--Rosque
        ["Find Razum-dar"] =
            {appendText=" in the Skywatch Manor."},
        ["Talk to the Noble"] =
            {appendText=" in the Skywatch Manor."},
        ["Follow the Noble"] =
            {appendText=" in the Skywatch Manor."},
        ["Talk to Razum-dar"] =
            {appendText=" in the Skywatch Manor."},
        ["Enter the Barbed Hook Tavern"] =
            {appendText=" near the southern docks."},
        ["Find the Veiled Heritance Recruiter"] =
            {appendText=" inside the Barbed Hook Tavern."},
        ["Obtain a Sword From the Royal Guard"] =
            {appendText="."},
        ["Return to Palomir"] =
            {appendText=" in the Barbed Hook Tavern."},
        ["Drink…"] =
            {appendText=""},
        ["Talk to Palomir 1"] =
            {appendText=" on Errinorne Isle, the great island east of Skywatch.", stepTextKey="What? I was drugged. I should speak to Palomir and get some answers."},
        ["Talk to Palomir 2"] =
            {appendText=" on Errinorne Isle, the great island east of Skywatch.", stepTextKey="I passed my first test with the Heritance. I need to talk to Palomir once more to continue my initiation."},
    },

[GetQuestName(4331)] = { --"Wearing the Veil"--Rosque
		["Talk to Ohmonir 1"] =
			{appendText=" on Errinorne Isle, just east of the dock.", stepTextKey="For my first trial, I must prove my intelligence. I should speak to Ohmonir to begin this trial."},
		["Select Your Answer 1"] =
			{appendText=" from Ohmonir's tables on Errinorne Isle, just east of the dock.", stepTextKey="\"When young, I'm sweet in the sun. When middle-aged, I'm the life of the party. When old, I'm worth my weight in gold. When I'm gone, everyone laments my absence. What am I?\" This is the riddle I need to solve by selecting the proper item."},
		["Talk to Ohmonir 2"] =
			{appendText=" on Errinorne Isle, just east of the dock.", stepTextKey="I should talk to Ohmonir."},
		["Select Your Answer 2"] =
			{appendText=" from Ohmonir's tables on Errinorne Isle, just east of the dock.", stepTextKey="\"I'm always smiling, but I never laugh. I once loved life, from cat to calf. I'm always staring, but I cannot see. I once held secrets, those given to me. What am I?\" This is the riddle I need to solve by selecting the proper item."},
		["Select Your Answer 3"] =
			{appendText=" from Ohmonir's table on Errinorne Isle, just east of the dock.", stepTextKey="\"Friend to soldiers, guardsmen, and mercs. Scarred from battle, unbowed by hurt. I always face forward when battle is joined. When on the march, I watch from behind. What am I? This is the riddle I need to solve by selecting the proper item."},
		["Talk to Ohmonir 3"] =
			{appendText=" on Errinorne Isle, just east of the dock.", stepTextKey="I have answered the riddles. I should speak to Ohmonir and find out what I need to do next."},
		["Talk to Varustante 1"] =
			{appendText=" on the northwestern platform on Errinorne Isle.", stepTextKey="My next trial is one of endurance. I need to speak to Varustante to begin the test."},
		["Complete the Race"] =
			{appendText=". It starts north of Varustante, and runs along the beach."},
		["Talk to Varustante 2"] =
			{appendText=" near the tents south of the center of Errinorne Isle.", stepTextKey="I completed the test of endurance. I should speak to Varustante now."},
		["Talk to Alandare 1"] =
			{appendText=" just south of the center of Errinorne Isle.", stepTextKey="The final trial isa test of strength. I need to speak to Alandare to begin the test."},
		["Defeat the Other Initiates"] =
			{appendText=" in the southern circle of Errinorne Isle."},
		["Talk to Alandare 2"] =
			{appendText=" just south of the center of Errinorne Isle.", stepTextKey="I completed my final trial. I should talk to Alandare and find out what happens next."},
	},

[GetQuestName(4345)] = { --"The Veil Falls"--Rosque
        ["Enter the Veiled Keep"] =
            {appendText=", the ruins at the top of Errinorne Isle."},
        ["Discover the Veiled Heritance Leader"] =
            {appendText=" within the ruins at the top of Errinorne Isle."},
        ["Clear the First Room"] =
            {appendText=" of the ruins at the top of Errinorne Isle."},
        ["Enter the Second Room"] =
            {appendText=" of the ruins at the top of Errinorne Isle."},
        ["Deactivate the Lock Crystals"] =
            {appendText=" inside the ruins at the top of Errinorne Isle."},
        ["Enter the Third Room"] =
            {appendText=" of the ruins at the top of Errinorne Isle."},
        ["Defeat the Leaders of the Veiled Heritance"] =
            {appendText=" inside the ruins at the top of Errinorne Isle."},
        ["Return to Skywatch"] =
            {appendText="."},
        ["Talk to Razum-dar"] =
            {appendText=". He's probably lounging somewhere in front of Skywatch Manor."},
        ["Confront Estre"] =
            {appendText=" inside Skywatch Manor."},
        ["Talk to the Queen"] =
            {appendText=" inside Skywatch Manor."},
        ["Talk to Queen Ayrenn"] =
            {appendText=" inside Skywatch Manor."},
    }, 

[GetQuestName(4365)] = { --"To Dawnbreak"--Rosque
        ["Talk to Canonreeve Sinyon in Dawnbreak"] =
            {appendText=" northwest of Skywatch. To reach it, travel the roads due northwest from Skywatch until the first bridge."},
    },

[GetQuestName(4355)] = { --"Through the Ashes"--Rosque
        ["Find People in Dawnbreak"] =
            {appendText="\nCheck your list of missing citizens for their locations and descriptions."},
        ["Talk to Captain Landare at the Manor House"] =
            {appendText="'s ruins located on the western side of the town."},
        ["Listen to Artinaire's Report"] =
            {appendText=" in the ruined manor at the west end of town."},
        ["Talk to Captain Landare 1"] =
            {appendText=" in the ruined manor at the west end of town.", stepTextKey="Sergeant Artinaire said the Daedra have attacked again. I should ask Captain Landare what she plans to do."},
        ["Rescue Patrolling Marines"] =
            {appendText="."},
        ["Talk to Sergeant Artinaire"] =
            {appendText=" in the woods east of Dawnbreak."},
        ["Find and Enter the Cave"] =
            {appendText=" with the Abandoned Mine."},
        ["Find Captain Landare"] =
            {appendText=" in the cave with the Abandoned Mine northeast of Dawnbreak."},
        ["Stop the Ritual"] =
            {appendText=" deep inside the cave with the Abandoned Mine northeast of Dawnbreak."},
        ["Find Landare at the Manor House"] =
            {appendText="'s ruins at the west edge of Dawnbreak."},
        ["Talk to Captain Landare 2"] =
            {appendText=" in front of the ruined manor in Dawnbreak.", stepTextKey="I should speak to Captain Landare."},
    },

[GetQuestName(4357)] = { --"To Firsthold"--Rosque
        ["Report to a First Auridon Marine at Firsthold"] =
            {appendText=", the large city at the northwestern corner of Auridon."},
    },

[GetQuestName(4260)] = { --"Breaking the Barrier"--Rosque
        ["Talk to Battlereeve Urcelmo"] =
            {appendText=". Someone outside of Firsthold might know where he is."},
        ["Talk to Sinien"] =
            {appendText="."},
        ["Destroy the Western Ward"] =
            {appendText=". It must be close to the barrier it's powering."},
        ["Destroy the Eastern Ward"] =
            {appendText=". It must be close to the barrier it's powering."},
        ["Talk to Razum-dar"] =
            {appendText=". He was heading towards the courtyard near the portal, but the barriers surrounding the bridges to the north may have sidetracked him before he got there."},
    }, 

[GetQuestName(4261)] = { --"Sever All Ties"--Rosque
	["Close the Portals"] =
            {appendText="\nThe perils within must be conquered before they can be closed. There may be more portals in the Firsthold Courtyard, likely in strategic locations near the Firsthold Castle."},
        ["Find Razum-dar"] =
            {appendText=" in front of the Firsthold Castle."},
        ["Enter the Castle"] =
            {appendText=" within the Firsthold Courtyard."},
        ["Enter the Portal"] =
            {appendText=" inside the Firsthold Castle."},
        ["Defeat High Kinlady Estre"] =
            {appendText=" in the Refuge of Dread, which can be accessed through a portal located within the Firsthold Castle."},
        ["Destroy the Sigil Stone"] =
            {appendText=" in the Refuge of Dread, the portal to the Deadlands within the castle inside the courtyard."},
        ["Talk to Razum-dar"] =
            {appendText=" within the Firsthold Castle."},
        ["Talk to Queen Ayrenn"] =
            {appendText=" inside the Firsthold Courtyard."},
    },


-- Auridon SIDE QUESTS

	[GetQuestName(4208)] = { --"Silsailen Rescue"--@ARKANOBOT
   	   	["Talk to Elenwen 1"] =
         		   {appendText=" who is north of Vulkhel Guard, next to the bridge leading into the town of Silsailen.", stepTextKey="Sarodor asked me to speak to Elenwen about helping in Silsailen."},
     	  	["Talk to Teldur"] =
         		   {appendText=" next to the well in the center of Silsailen."},
     	  	["Save Villagers"] =
         		   {appendText=""},
    	   	["Talk to Elenwen 2"] =
    	     		   {appendText="", stepTextKey="I rescued the townspeople trapped in Silsailen. Now I should speak with Elenwen at the barn outside of town."},
 	   },

	[GetQuestName(5058)] = { --"All the Fuss"--@ARKANOBOT
       		 ["Report to a Watchman at Vulkhel Guard"] =
          		  {appendText=". He can be found guarding a gate north of the Fighters Guild Hall on a beaten path on the western side of the city."},
	},

	[GetQuestName(4223)] = { --"Corruption Stones"--@ARKANOBOT
		["Use the Altmer Holy Symbol on the Corruption Stone"] =
			{appendText=". The Stone can be found right next to Priestess Langwe on the southern side of Tanzelwil."},
		["Talk to Priestess Langwe 1"] =
			{appendText=". She can be found on the southern side of Tanzelwil.", stepTextKey="The Altmer Holy Symbol destroyed the mysterious stone. I should speak with Priestess Langwe to discuss our strategy for destroying the remaining stones."},
		["Destroy the Corruption Stones"] =
			{appendText=".\n They can be found in the following locations:\n\n1. Near the ruins of an Ayleid Tower on a hill on the southwestern side of Tanzelwil.\n\n2. Next to an Ayleid stone bridge on the western side of Tanzelwil.\n\n3. Next to a set of staircases leading to an Ayleid Structure in the upper central ruins of Tanzelwil.\n\n4. Near the eastern ruins of Tanzelwil."},
		["Talk to Priestess Langwe 2"] =
			{appendText=". She can be found on top of the Ayleid Tower ruins that are buried in a hill on the northwestern side of Tanzelwil.", stepTextKey="I should seek out Priestess Langwe and inform her that I've destroyed the Corruption Stones."},
		["Destroy the Final Crystal"] =
			{appendText=". It can be found next to Priestess Langwe on top of the Ayleid Tower ruins, on the northwestern side of Tanzelwil."},
		["Talk to Priestess Langwe 3"] =
			{appendText=". She is on top of the Ayleid Tower ruins, on the northwestern side of Tanzelwil.", stepTextKey="I have destroyed the last Corruption Stone at Tanzelwil. I should confer with Priestess Langwe."},
    },


[GetQuestName(4549)] = { --"Back to Skywatch"--@thepandalore
        ["Talk to Captain Tendil"] =
            {appendText=" at his post. He should be at the entrance of the city, just south of Skywatch Wayshrine, keeping guard while Skywatch Celebrants wait to join the festivities."},
    },

[GetQuestName(5055)] = { --"Missive to the Queen"--OneSkyGod
        ["Deliver the Message to the Vulkhel Watch"] =
            {appendText="woman Mandalime, who keeps watch over the crowds north of the Vulkhel Guard Wayshrine."},
  },
    [GetQuestName(4327)] = { --"Preventative Measure"--Mouch30
        ["Destroy the Arcane Supplies"] =
            {appendText="\nYou can find the crates near enemy encampments and along the shore."},
        ["Meet Delves-Deeply on the Ship"] =
            {appendText=" docked on the eastern shore. She should be waiting in the upper quarters."},
        ["Wait for Delves-Deeply to Prepare the Spell"] =
            {appendText=" in the upper quarters of the ship docked on the eastern shore."},
        ["Use the Crystal to Amplify the Spell"] =
            {appendText=" in the upper quarters of the ship docked on the eastern shore."},
        ["Talk to Delves-Deeply"] =
            {appendText=" in the upper quarters of the ship docked on the eastern shore."},
    },

    [GetQuestName(4219)] = { --"The Serpent's Beacon"--Mouch30
        ["Rescue Captain Ciranya"] =
            {appendText=", who has been taken captive by the Maormer pirates."},
        ["Rescue Legionary Uulion"] =
            {appendText=", tied up on the northern part of the beach."},
        ["Rescue Legionary Norfando"] =
            {appendText=", tied up near the docks."},
        ["Rescue Legionary Pandetuile"] =
            {appendText=", tied up on the southwest part of the camp."},
        ["Talk to Captain Ciranya 1"] =
            {appendText=", who waits with her crew on the northeastern shore of the lighthouse island.", stepTextKey="I rescued the remaining members of Captain Ciranya's patrol. I need to talk to her to figure out what's going at the lighthouse."},
        ["Collect Tildur's Kindlepitch"] =
            {appendText=", Captain Ciranya might have insight into this."},
        ["Collect Maormer Fire Salts"] =
            {appendText=", Captain Ciranya might have insight into this."},
        ["Talk to Captain Ciranya 2"] =
            {appendText=", back on the shores of the lighthouse.", stepTextKey="I need to talk to Captain Ciranya to find out the next step of the plan."},
        ["Collect Maormer Rune from Pirates"] =
            {appendText=". They won't give one up without a fight."},
        ["Use Maormer Rune on Maormer Barrier"] =
            {appendText=", further up the path to the lighthouse."},
        ["Destroy Lighthouse Beacon"] =
            {appendText=", guarded by a formidable duo."},
        ["Escape to Skylight Beach"] =
            {appendText=""},
        ["Talk to Captain Ciranya 3"] =
            {appendText=", who waits by her crew on the shores of the lighthouse.", stepTextKey="I should speak to Captain Ciranya."},
    },

    [GetQuestName(4524)] = { --"Repentant Son"--Mouch30
        ["Go to Mathiisen"] =
            {appendText=", a town in central Auridon. It sits in a wide bay, south of Skywatch."},
        ["Find Someone That Knew Vareldur"] =
            {appendText=". The townsfolk might have an idea."},
        ["Talk to Iriel"] =
            {appendText=" near the targets in Mathiisen's marketplace."},
    },

    [GetQuestName(4257)] = { --"Unaccounted Crew"--Mouch30
        ["Find Captain Erronfaire's Crew"] =
            {appendText="\nThey are scattered around Vulkhel Guard. Check inside the nearby inn, the shops south of the Guard's Forge, and around the Fighters Guild."},
        ["Find Degail"] =
            {appendText=", who was last seen walking towards the western beaches near Vulkhel Guard. There are rumors of Maormer pirates making camp along those shores - she could be in danger."},
        ["Return to Captain Erronfaire"] =
            {appendText=" back at the southern docks of Vulkhel Guard."},
        ["Talk to Captain Erronfaire"] =
            {appendText=" on the southern docks of Vulkhel Guard."},
    },

[GetQuestName(4264)] = { --"Plague of Phaer"--Mouch30
        ["Talk to Hendil 1"] =
            {appendText=", who tends to his patients on the west side of town.", stepTextKey="Hendil is using a barn near the edge of town as a hospice. If I'm going to help him out, I'll need to find him there."},
        ["Collect Salloweed"] =
            {appendText=", a large, maroon plant that grows near the Aldmeri ruin across the river."},
        ["Return to Hendil"] =
            {appendText="."},
        ["Collect Salloweed Aloe"] =
            {appendText=""},
        ["Give Aloe to Eryeril"] =
            {appendText=", who sits in his home just behind the barn."},
        ["Give Aloe to Nelulin"] =
            {appendText=", who hammers away at the sheds in the eastern part of town."},
        ["Give Aloe to Aninwe"] =
            {appendText=", who can be found toiling in the field or relaxing in the workhouse."},
        ["Talk to Hendil 2"] =
            {appendText=" back at the barn.", stepTextKey="I delivered the salve to the villagers of Phaer. I should report back to Hendil now."},
    },

	[GetQuestName(4266)] = { --"The First Patient"--Mouch30
		["Find a Way into Hendil's House"] =
			{appendText=", located in the eastern part of Phaer. There could be another entrance besides the door."},
		["Search Hendil's House"] =
			{appendText=". He might have kept a diary of some sort."},
		["Bring Journal to Velatosse"] =
			{appendText=", who waits outside her home in Phaer's southeastern plaza."},
		["Find a Way into the Cave"] =
			{appendText=" in the northwest corner of Phaer. Citizens aren't allowed inside, but access could be granted to you by one of the scouts in town."},
		["Follow Hendil"] =
			{appendText=" deeper into the Phaer catacombs."},
		["Talk to Nelulin"] =
			{appendText=", the Altmer lying on the floor, just beyond the entrance of the Phaer catacombs."},
		["Follow Hendil in the Catacombs"] =
			{appendText=", further into Phaer's mine."},
		["Defeat Amuur"] =
			{appendText=", who's blocking the way to the end of the Phaer catacombs."},
		["Find Hendil"] =
			{appendText=", who ran down the tunnel towards the south of the Phaer catacombs."},
		["Defeat Tancano"] =
			{appendText=", who beckons you from the behind the doors of the inner chamber in the Phaer catacombs."},
		["Talk to Hendil"] =
			{appendText=", who ran to the back of the inner chamber in the Phaer catacombs."},
		["Return to Phaer"] =
			{appendText=" using the door at the top of the stairs of the inner chamber, and exiting the mine."},
		["Talk to Velatosse 1"] =
			{appendText=" under the tree by the Phaer mine's entrance.", stepTextKey="Velatosse intercepted me at the cave's exit. I should tell her what's happened."},
		["Talk to Netanwe 1"] =
			{appendText=", the captain standing guard outside the barn in the western part of Phaer.", stepTextKey="I decided to stop Velatosse from exacting her revenge on Hendil. I need to report Hendil's crimes to Netanwe."},
		["Talk to Netanwe 2"] =
			{appendText=" the captain standing guard outside the barn in the western part of Phaer.", stepTextKey="I told Netanwe about Hendil's madness. I should speak to her one final time."},
		["Talk to Velatosse 2"] =
			{appendText=" under the tree by the Phaer mine's entrance.", stepTextKey="I decided to allow Velatosse to exact her revenge on Hendil. I should speak to her one final time."},
	},

    [GetQuestName(4326)] = { --"The Veiled Choice"--Mouch30
        ["Enter the South Ruins"] =
            {appendText=" by passing through the cave framed by an Ayleid arch. Rolancano gave us a note containing information on Palith's whereabouts."},
        ["Find Palith"] =
            {appendText=". She's being held prisoner in one of these chambers, no doubt guarded by Veiled Heritance soldiers."},
        ["Enter the North Ruins"] =
            {appendText=", found near the western shores."},
        ["Find Eranamo"] =
            {appendText=", further into the ruins. He seems to be the only one here."},
        ["Take the Disguise"] =
            {appendText=" hidden in the cot behind Eranamo in the north ruins. Seeing the state of the ruins themselves, the uniform might be itchy but it's better than getting attacked."},
        ["Enter the Ship's Lower Deck"] =
            {appendText=" wearing the enemy's disguise. It should fit well, concealing your distinct features. The Tribunal's Spear waits on the eastern shore. Beware the wandering sentries, who can see right through your act."},
        ["Recover the Dominion Information"] =
            {appendText=" Eranamo should know more about this task."},
        ["Leave the Ship"] =
            {appendText=" to get back to the deck."},
        ["Talk to Eranamo"] =
            {appendText=" on the ship's deck, docked on the eastern shore of Quendeluun."},
        ["Talk to Rolancano Outside of Quendeluun"] =
            {appendText=", beyond the cave's entrance by the wayshrine."},
        ["Witness the Reunion"] =
            {appendText=" between father and son, next to the Quendeluun wayshrine."}, 
	["Talk to Rolancano 1"] =
            {appendText=" about his son's fate, near the Quendeluun wayshrine.", stepTextKey="Rolancano wasn't happy to see his son and threatened his life. His daughter asked me to intervene."},
        ["Witness Eranamo's Sentencing 1"] =
            {appendText=" near the Quendeluun wayshrine.", stepTextKey="I spoke to Rolancano and convinced him to spare his son's life."},
        ["Talk to Rolancano 2"] =
            {appendText=" near the Quendeluun wayshrine.", stepTextKey="Now that Eranamo is gone, I should speak to Rolancano."},
        ["Witness Eranamo's Sentencing 2"] =
            {appendText=" near the Quendeluun wayshrine.", stepTextKey="I spoke to Rolancano and agreed that he should carry out Eranamo's death sentence himself."},
        ["Talk to Rolancano 3"] =
            {appendText=" near the Quendeluun wayshrine.", stepTextKey="Now that Eranamo is dead, I should speak to Rolancano."},
    },

    [GetQuestName(4221)] = { --"An Act of Kindness" --Mouch30
        ["Use Sirinque's Crystal on Weakened Spirits"] =
            {appendText="\nThe ghostly figures that haunt the ruins need to be put to rest."},
        ["Talk to the Spirit at the Ancient Vault"] =
            {appendText=", at the northernmost edge of Ezduiin."},
        ["Solve the Puzzle"] =
            {appendText=" in the Ezduiin vault, at the northernmost edge of the ruins."},
        ["Collect the Relic"] =
            {appendText=" from the ancient chest in the center of the Ezduiin vault, at the northernmost edge of the ruins."},
        ["Talk to Sirinque 1"] =
            {appendText=", who waits outside the Ezduiin vault, at the northernmost edge of the ruins.", stepTextKey="Now that I've retrieved the relic, I can give it Sirinque."},
        ["Watch Sirinque Lift the Curse"] =
            {appendText=". It seems like it's calming the spirits all around Ezduiin!"},
        ["Talk to Sirinque 2"] =
            {appendText=" outside the Ezduiin vault, at the northernmost edge of the ruins.", stepTextKey="I should speak to Sirinque now that she's finished her spell."},
    },

    [GetQuestName(4410)] = { --"Assisting the Assistant"--Test
        ["Collect Dwemer Ring"] =
            {appendText=". <---The first objective you should write with a player-friendly approach, providing ample information and guidance. Make it as hand-holding as possible, ensuring players can easily understand where they need to go.\n"},
        ["Collect Dwemer Gear"] =
            {appendText=". <---The second objective you should write to make it challenging, requiring players to solve the quest with minimal written information. Provide only the bare minimum hints necessary for players to progress and complete the task.\n"},
        ["Collect Dwemer Tube"] =
            {appendText=". <---The third objective you can unleash your creativity! Use flavorful text to indicate where players should look or what they should explore, without giving direct instructions like the Cardinal Directions or other Named locations. Encourage the player to rely on their instincts and to explore the quest world to figure out how to proceed by adding flavorful directions.\n"},
        ["Talk to Neetra"] =
            {appendText=" Use directions that will guide the player where they need to go with your own twists or creativity."},
    },



    [GetQuestName(4409)] = { --"The Racer"--Mouch30
        ["Get a Frog 1"] =
            {appendText=" from the crowd of people around the racing track, east of the Watcher's Forge in Skywatch. You can spot the colorful frogs next to their trainers.", stepTextKey="I should get a frog from someone here at the race."},
        ["Put Frog in Starting Basket"] =
            {appendText=" - at the race track east of the Watcher's Forge in Skywatch - after feeding them some chow. The chow should be in a sack next to Firtoril. Remember to examine the frog carefully during feeding."},
        ["Win Race"] =
            {appendText=" with your chosen frog, and become the Skywatch champion of frog racing."},
        ["Talk to Firtoril"] =
            {appendText=" near the finishing baskets of the race track, east of the Watcher's Forge in Skywatch."},
        ["Get a Frog 2"] =
            {appendText=" from the crowd of people around the racing track, east of the Watcher's Forge in Skywatch. You can spot the colorful frogs next to their trainers.", stepTextKey="My frog didn't win the race. I should get another one."},
    },

    [GetQuestName(4301)] = { --"Relic Rescue"--Mouch30
        ["Recover Relics"] =
            {appendText="\nFrom various reliquaries perched on stone altars, found in the expansive hills of the ruins."},
        ["Talk to Nenaron"] =
            {appendText=", who still stands on the ledge behind the southeast shrine."},
    },

[GetQuestName(4300)] = { --"Blessings of the Eight"--Mouch30
        ["Talk to the Aldarch"] =
            {appendText=", who can be found behind the southeast shrine."},
        ["Restore the Shrines"] =
            {appendText="\nThey occupy the four points around Torinaan. There must be clues as to how to cleanse the shrines. Try searching for holy objects or notes left by the shrine monastics."},
        ["Enter the Central Shrine"] =
            {appendText=", an unassuming structure draped with lush vines of ivy, in the heart of Torinaan."},
        ["Destroy the Source of Corruption"] =
            {appendText=" brought forth by a Daedra desecrating the central shrine in the heart of the ruins."},
        ["Talk to Aldarch Colaste 1"] =
            {appendText=" by going through the ornate doors of the central shrine, in the heart of the ruins.", stepTextKey="Colaste ran in just as I defeated the Daedra. She wants to speak to me."},
        ["Follow Aldarch Colaste"] =
            {appendText=" down the hall to a small room housing a simple altar, in the central shrine."},
        ["Watch the Vision"] =
            {appendText=" in front of the altar in the central shrine, in the heart of the ruins."},
        ["Talk to Aldarch Colaste 2"] =
            {appendText=" in the center shrine, in the heart of the ruins.", stepTextKey="It's done. The Divines have showed me the depths to which Estre has fallen. I should speak to Colaste one last time."},
    },

[GetQuestName(4210)] = { --"Real Marines"--Rosque
        ["Enter the Cellar"] =
            {appendText=" where the marines are being held. It must be located somewhere inside the town."},
        ["Talk to Captain Tendil"] =
            {appendText=" inside the cellar at the north end of town."},
        ["Recover Armor"] =
            {appendText=" for the marines. The imposters likely stowed it inside a shed in town, out of the elements."},
        ["Recover Weapons"] =
            {appendText=" for the marines. The imposters likely stowed them in an undamaged crate near a shed, but being composed of metal, they may not have been worried about embers ruining them."},
        ["Recover Supplies"] =
            {appendText=" for the marines. The imposters likely stowed them in an undamaged crate very close to a shed."},
        ["Talk to Tendil"] =
            {appendText=" in the cellar at the north end of town."},
    },

[GetQuestName(4209)] = { --"Teldur's End"--Rosque
        ["Find a Way Into Valano Manor"] =
            {appendText=". Elenwen, in a barn southwest of Silsailen, may know of a way in."},
        ["Find Teldur"] =
            {appendText=" inside the Valano Manor in Silsailen."},
        ["Stop Valano"] =
            {appendText=". Teldur's dying words implied he was still inside the Valano Manor in Silsailen."},
        ["Talk to Elenwen 1"] =
            {appendText=". With the fighting over, she may have come to the Valano Manor in Silsailen to find Teldur and her father.", stepTextKey="I've slain Canonreeve Valano. I have the sad duty to inform his daughter."},
        ["Talk to Elenwen 2"] =
            {appendText=". With the fighting over, she may have come to the Valano Manor in Silsailen to find Teldur and her father.", stepTextKey="Canonreeve Valano is dead. I should return to Elenwen and break the news to her."},
    }, 

    [GetQuestName(4441)] = { --"The Toothmaul Ploy"--mouch30
        ["Investigate the Gully"] =
            {appendText=". It smells dank, due to the dense foliage and former Goblin slaves making it their home. Watch your step as you descend further into the cave."},
        ["Talk to Byz"] =
            {appendText=", who was found in the first cave of Toothmaul Gully. A Goblin who can speak? How strange! What does it have to say?"},
        ["Find Evidence of Nelanya's Bargain"] =
            {appendText=". The contract is further down in the southern dens of Toothmaul Gully. The Veiled Heritance working with Goblins could pose quite a threat."},
        ["Find Byz"] =
            {appendText=", waiting for you in the eastern caves of Toothmaul Gully."},
        ["Talk to Pirondil 1"] =
            {appendText=" before he has the chance to hurt Byz. They're right outside the chief's den in Toothmaul Gully.", stepTextKey="Pirondil is here threatening Byz. I should have words with him."},
        ["Talk to Chief Koth"] =
            {appendText=", waiting for you behind the eastern doors in Toothmaul Gully."},
        ["Confront Nelanya"] =
            {appendText=" who retreated back into her cave just north of the chief's den in Toothmaul Gully."},
        ["Talk to Pirondil 2"] =
            {appendText=". Hopefully Nelanya keeps her word and doesn't attack him again.", stepTextKey="The Toothmaul Goblins have renounced their alliance with the Veiled Heritance. I should find Pirondil back at the entrance to Toothmaul Gully."},
        ["Talk to Pirondil 3"] =
            {appendText=". He should be happy with your decision to serve swift justice.", stepTextKey="Nelanya is dead and the Toothmaul Goblins have renounced their alliance with the Veiled Heritance. I should find Pirondil back at the entrance to Toothmaul Gully."},
    },

   [GetQuestName(4450)] = { --"Well-Armed Savages"--mouch30
        ["Talk to Jilan-dar"] =
            {appendText=" at the southmost den."},
        ["Steal the Cache of Blades"] =
            {appendText=". Goblins learned the art of sword fighting by watching their Elven masters train."},
        ["Steal the Cache of Staves"] =
            {appendText=". If they're unenchanted, they're just wooden sticks to the Goblins."},
        ["Steal the Cache of Spears"] =
            {appendText=", a Goblin's favorite weapon. Perfect for skewering skeevers and Elves."},
        ["Leave the Gully"] =
            {appendText=". You might need to clean your boots when this is all over."},
        ["Talk to Jilan-dar Outside of Toothmaul Gully"] =
            {appendText=". He said he would be waiting near his boat, moored somewhere along the shore."},
    },

[GetQuestName(4220)] = { --"The Mallari-Mora"--mouch30
        ["Talk to Telenger the Artificer 1"] =
            {appendText=", situated in the southwest edge of Ezduiin.", stepTextKey="I should speak to Telenger at the main camp."},
        ["Find Andewen"] =
            {appendText=" and the rest of her team. She must have taken the path towards the heart of the ruins."},
        ["Collect Runes"] =
            {appendText=". They must be stashed in chests on the eastern and western altars."},
        ["Talk to Andewen at the Undercroft"] =
            {appendText=", which can be found to the north. The imposing Ayleid structure is flanked by crumbling walls and fierce spirits."},
        ["Wait for Andewen to Unlock the Door"] =
            {appendText=" of the Ezduiin undercroft, north of where you first found her."},
        ["Enter the Ezduiin Undercroft"] =
            {appendText=", found in the northern part of the ruins."},
        ["Search for Missing Researchers"] =
            {appendText=", staying close to Andewen as she traverses through the Ezduiin undercroft."},
        ["Talk to Meldil"] =
            {appendText=", who was found kneeling in pain next to a glowing Ayleid gate, in the Ezduiin undercroft."},
        ["Release Assistants"] =
            {appendText=", who are bound by magical chains all around the Ezduiin undercroft. Beware of the Thirsters, that will force you to the start of the undercroft if you get too close!"},
	["Talk to Andewen"] =
            {appendText=", who moved to the large chamber in the center of the Ezduiin undercroft. The gate to the south seems to have stopped glowing."},
        ["Enter the Inner Sanctum"] =
            {appendText=", through the now unlocked Ayleid gates to the south of the central chamber in the Ezduiin undercroft."},
        ["Talk to Uricantar's Projection"] =
            {appendText=", standing menacingly at the top of the stairs past the southern gate in the Ezduiin undercroft."},
        ["Seek out Uricantar"] =
            {appendText=", who has fled to the inner sanctum of the Ezduiin undercroft. He should be just behind the large stone door."},
        ["Recover the Mallari-Mora"] =
            {appendText=", the ancient relic that Uricantar holds near. Another foe stands by his side, ready to defend the mage at all costs."},
        ["Talk to Telenger the Artificer 2"] =
            {appendText=", waiting for news back at the main camp, near the southwestern edge of Ezduiin. There might be a shorter way out of the undercroft.", stepTextKey="Now that I've recovered the artifact, I should return it to Telenger the Artificer at the main camp."},
        ["Talk to Telenger the Artificer 3"] =
            {appendText="", stepTextKey="I should speak to Telenger."},
    },

    [GetQuestName(4338)] = { --"Eye of the Ancients"--mouch30
        ["Find Scout Lorumel"] =
            {appendText=" somewhere in the ruins of the town. She must be hiding in one of the abandoned buildings."},
        ["Talk to Scout Lorumel"] =
            {appendText=" in the stable, on the eastern side of town. She's badly wounded, and a note lies in front of her."},
        ["Get a Welkynd Stone from the Maormer Captain"] =
            {appendText=", kept close for safekeeping."},
        ["Collect Welkynd Stone"] =
            {appendText=" from the buildings in the northwest part of town. They should be in chests for safekeeping."},
        ["Place Welkynd Stones in Sconces"] =
            {appendText=" at the top of Greenwater Cove's highest peak. The path to the sconces starts south of the local tavern, marked by a narrow arch set in a stone wall. Overlooking the view are five empty sconces surrounding what must be the ancient weapon."},
        ["Use the Eye of the Ancients"] =
            {appendText=" by going back to the arch and following the dirt path to west, taking the stone steps at the fork, and aiming the glowing beam of magic towards the Maormer ships."},
        ["Talk to Captain Cirenwe"] =
            {appendText=", who waits for your triumphant return on the path outside Marranya's Tap Room."},
    },

    [GetQuestName(4277)] = { --"Silent Village"--mouch30
        ["Enter Shattered Grove"] =
            {appendText=", a cozy little hamlet that is suspiciously void of activity."},
        ["Talk to Merormo 1"] =
            {appendText=", an Altmer donning Mages Guild robes, standing next to the well.", stepTextKey="The village is filled with statues and a very distracted mage. Perhaps he knows what happened to these people? I should speak with him."},
        ["Dispel Southeastern Monolith"] =
            {appendText=", surrounded by bears with menacing red auras."},
        ["Dispel Northern Monolith"] =
            {appendText=". A lumberjack was frozen in the middle of his work next to this one."},
        ["Dispel Southwestern Monolith"] =
            {appendText=". Tendrils of tainted magic emanate from the engraved stone."},
        ["Dispel Western Monolith"] =
            {appendText=". It sits next to a tall tower, encased between a small grove of trees."},
        ["Talk to Merormo 2"] =
            {appendText=", who follows you with further instructions.", stepTextKey="Merormo teleported to me once I finished with the monoliths. I should speak to him."},
        ["Use Binding Gem on Weakened Bear"] =
            {appendText=", taking care not to hurt the poor animal too much."},
        ["Go to Merormo 's Tower"] =
            {appendText=", piercing the sky in the western part of the forest."},
        ["Watch the Banishing Ritual"] =
            {appendText=" happening in his tower, west of Shattered Grove."},
        ["Talk to Merormo 3"] =
            {appendText=" in his tower, west of Shattered Grove. His worried demeanor does not inspire hope.", stepTextKey="Something went wrong with the banishing spell and a Flame Atronoch was released from the bear. I should speak to Merormo."},
    },

       [GetQuestName(4278)] = { --"A Village Awakened"--mouch30
        ["Find the Cave"] =
            {appendText=". Merormo could feel the threat lurking to the north of his tower in Shattered Grove."},
        ["Talk to Anenwen"] =
            {appendText=", north of Merormo's tower in Shattered Grove. She sits propped up against the cavern entrance, forehead damp with sweat as she tries to control her breathing."},
        ["Kill the Daedra Leader"] =
            {appendText=". Scorching heat pulses from the flame atronachs wandering in the cavern northwest of Shattered Grove."},
        ["Return to Anenwen"] =
            {appendText=", back at the entrance of the cave north of Merormo's tower in Shattered Grove."},
        ["Confront Merormo"] =
            {appendText=" in Shattered Grove to learn the truth behind the rabid animals and daedric beasts."},
        ["Watch Anenwen Confront Merormo"] =
            {appendText=" in the center of Shattered Grove. Best not to get in the way of her anger."},
        ["Talk to Canonreeve Pinanande 1"] =
            {appendText=" in the center of Shattered Grove to determine what fate befalls Merormo. It might be wise to listen to his side of the story as well.", stepTextKey="When Anenwen spoke to Merormo, he claimed his intentions were noble. I should speak to Canonreeve Pinanande. Perhaps I can influence what will happen to the misguided mage."},
        ["Talk to Merormo"] =
            {appendText=", now free from Aranwen's binds. He waits in the center of Shattered Grove, no doubt relieved to be spared."},
        ["Talk to Canonreeve Pinanande 2"] =
            {appendText=" in the center of Shattered Grove. Merormo might have been trying to help, but he went about it in the wrongest way possible. Death is the only path to redemption for this poor mage.", stepTextKey="I spoke to Merormo, who claimed that his intentions were noble. I now need to speak to Canonreeve Pinanande."},
    },
    [GetQuestName(4361)] = { --"Rightful Inheritance"--mouch30
        ["Talk to Elanwe 1"] =
            {appendText=". These skeleton infested ruins are no place for reckless citizens.", stepTextKey="I should talk with Elanwe near the bridge into Castle Rilis"},
        ["Find Sorondil"] =
            {appendText=" before he makes his ancestors upset. The entrance lies in the middle of the crumbling ruins."},
        ["Lower Eastern Ward"] =
            {appendText=". It is protected by Captain Arame, following orders even after death."},
        ["Lower Southern Ward"] =
            {appendText=", guarded by the loyal Captain Ralimbar."},
        ["Lower Western Ward"] =
            {appendText=". Captain Taarulae, an arcane master, keeps an eye out for intruders."},
        ["Return to Vault Entrance"] =
            {appendText=" in the center of the ruins. Let's see if Sorondil has anything to say."},
        ["Enter Castle Vault"] =
            {appendText=", northwest of the central platform."},
        ["Follow Sorondil"] =
            {appendText=" through the Vault of Exile."},
        ["Defeat Sorondil"] =
            {appendText=" in the main chamber of the Vault of Exile."},
        ["Return to Elanwe"] =
            {appendText=", waiting for her son on the center platform of the ruins. The ghosts of previous Rilis lords fill the vault's halls."},
        ["Talk to Elanwe 2"] =
            {appendText=" on the central platform of the ruins.", stepTextKey="I should tell Elanwe something about the fate of her son."},
        ["Talk to Elanwe 3"] =
            {appendText=". No matter what you say, she's grateful for the help.", stepTextKey="I should speak to Elanwe once more."},
    },

 [GetQuestName(4408)] = { --"Spirited Away"--mouch30
        ["Pray for Ancalin's Children"] =
            {appendText="\n\nElanduya's shrine sits in the shade of a twisting laurel tree, to the east of the bustling port city.\n\nWirande's shrine overlooks the sea, gazing at the homeland of his ancestors, just west of Tanzelwil.\n\nMendol's shrine is safe from harm, north of the Soulfire Plateau.\n\nSoraperil's shrine is protected by a Troll, who prowls around on the northernmost tip of Auridon."},
        ["Return to Ancalin"] =
            {appendText=" on the northern wall of Skywatch."},
    },

	[GetQuestName(4272)] = { --"Depths of Madness"--Rosque
		["Investigate the Vale"] =
			{appendText=". Eminelya said the entrance is a cave just off the road west of Mathiisen."},
		["Talk to Lanitaale"] =
			{appendText=" in the tower in the vale, the entrance to which is through the cave just off the road west of Mathiisen."},
		["Talk to Projection of Sanessalmo"] =
			{appendText=" in the tower of the Glister Vale."},
		["Find Minantille"] =
			{appendText=" through the portal in the tower of the Glister Vale."},
		["Destroy Minantille's Rage"] =
			{appendText=" within the portal in the tower of the Glister Vale."},
		["Talk to Minantille"] =
			{appendText=" within the portal in the tower of the Glister Vale."},
		["Leave Minantille's Rage"] =
			{appendText=" Realm into the Realm of Sanessalmo's Experiments. The portal to reach it is in the tower of the Glister Vale."},
		["Talk to Merion 1"] =
			{appendText=" within the portal in the tower of the Glister Vale.", stepTextKey="I've entered a strange cavern full of mushrooms and monsters. I should try to find Merion as soon as I can."},
		["Search Merion's Backpack"] =
			{appendText=" within the portal in the tower of the Glister Vale."},
		["Collect Bloodcrown Spores"] =
			{appendText=", clusters of which can be found within the portal in the tower of the Glister Vale."},
		["Collect Lavendercap Mushrooms"] =
			{appendText=", clusters of which can be found within the portal in the tower of the Glister Vale."},
		["Collect Gleamcap Spores"] =
			{appendText=", clusters of which can be found within the portal in the tower of the Glister Vale."},
		["Dispel Malevolent Spirit"] =
			{appendText=" with Merion's potion within the portal in the tower of the Glister Vale."},
		["Talk to Merion 2"] =
			{appendText=" within the portal in the tower of the Glister Vale.", stepTextKey="Merion seems to be more lucid. I should speak to him."},
		["Leave Merion's Bliss"] =
			{appendText=" to the tower of the Glister Vale."},
		["Enter Nuulehtel's Despair"] =
			{appendText=" in the tower of the Glister Vale."},
		["Talk to Nuulehtel 1"] =
			{appendText=" within the portal in the tower of the Glister Vale.", stepTextKey="I entered a strange world of ice and freezing rain. I should find Nuulehtel as soon as I can."},
		["Collect Flint and Tinder"] =
			{appendText=" inside portal in the tower of the Glister Vale. Only another person would be carrying something like this."},
		["Collect Oil"] =
			{appendText=" within the portal in the tower of the Glister Vale. It's possible some might have survived in an undamaged container."},
		["Collect Straw"] =
			{appendText=" within the portal in the tower of the Glister Vale. Nuulehtel said that he saw some in the cave."},
		["Start a Fire"] =
			{appendText=" within the portal in the tower of the Glister Vale."},
		["Talk to Nuulehtel 2"] =
			{appendText=" within the portal in the tower of the Glister Vale.", stepTextKey="Nuulehtel seems to be warming up. I should talk to him to see if he's returned to sanity."},
		["Leave Nuulehtel's Despair"] =
			{appendText=" to the tower of the Glister Vale."},
		["Confront Sanessalmo"] =
			{appendText=" in the tower of the Glister Vale. He must be lurking somewhere nearby to so easily create all those portals."},
		["Return to Eminelya"] =
			{appendText=" just off the road west of Mathiisen."},
		["Talk to Eminelya"] =
			{appendText=" off the road west of Mathiisen."},
	},

    [GetQuestName(4362)] = { --"The Jester's Joke"--mouch30
        ["Collect Soul Totem"] =
            {appendText=""},
        ["Defeat Falarel"] =
            {appendText=". You can hear faint maniacal laughter coming through the antechamber's door."},
        ["Collect Lisondor's Soul"] =
            {appendText=". The cerulean fire burns bright with anticipation."},
        ["Return to Lisondor"] =
            {appendText=", eagerly waiting outside the antechamber."},
        ["Talk to Lisondor"] =
            {appendText=" outside the antechamber."},
    },

    [GetQuestName(4309)] = { --"Eye Spy"--mouch30
        ["Find Covenant Uniforms"] =
            {appendText=", stored in the supply building in the eastern section."},
        ["Support the Troops"] =
            {appendText=" dotted around the town by tending to their wounds and giving out uniforms to help them blend in and escape the battlefield. The supply building to the west has been seeing lots of activity; there might be a chance for sabotage."},
        ["Talk to Arfanel on the Bluff"] =
            {appendText=". The marines have made camp next to the lighthouse, which can be reached by taking the southwestern stone path leading out of town and up the staircases."},
    },

    [GetQuestName(4295)] = { --"The Wayward Dagger"--mouch30
        ["Find the Covenant Defector"] =
            {appendText=", tied up in The Talon's Grasp docked at the northern piers."},
        ["Burn East Trebuchet"] =
            {appendText=", stationed near a gnarled maple tree."},
        ["Burn North Trebuchet"] =
            {appendText=", next to the sea wall."},
        ["Burn West Trebuchet"] =
            {appendText=", which faces the Castle Rilis bridge."},
        ["Find the North Beacon Barracks"] =
            {appendText=", in the upper level of the western section. Captain Bernardine needs to die in order to scatter the Covenant."},
        ["Kill Captain Bernardine"] =
            {appendText=" in the North Beacon Barracks and free the Orc couple from the chains of the Covenant."},
        ["Escort Lakhazga to the Lighthouse"] =
            {appendText=", taking the winding stone path leading south from the barracks. Lakhazga would appreciate attacking any Covenant soldiers you come across."},
        ["Talk to Lakhazga gro-Rimat"] =
            {appendText=" in the lighthouse."},
    },



    [GetQuestName(4532)] = { --"Take Me Home"--mouch30
        ["Talk to Gaireth in Skywatch"] =
            {appendText="."},

    },


	[GetQuestName(4329)] = { --"Harsh Lesson"--mouch30
		["Talk to Tanion 1"] =
			{appendText=" on the steps of the main school building, in the center of the college grounds.", stepTextKey="Baham told me to begin my investigation by talking to Tanion, the headmaster of the college. I imagine I could also ask Baham some follow-up questions as well."},
		["Observe Khajiit Classroom"] =
			{appendText=" on the upper level of the school building. Talk to Ilara for more information."},
		["Observe Bosmer Classroom"] =
			{appendText=", taking place on the lower level of the school building. Maybe the students have something to say."},
		["Spar with Proctors"] =
			{appendText="\nThey are overseeing the training sessions in the school courtyard. Challenge them to a brawl and show them how to really fight."},
		["Talk to Tanion 2"] =
			{appendText=", who keeps watch on the steps of the main school building in the center of the college grounds.", stepTextKey="I had a chance to look around and see the abusive conditions firsthand. Time to talk to Tanion again."},
		["Talk to Baham 1"] =
			{appendText=", who beckons to you from the western bridge from the center of the college grounds.", stepTextKey="Baham came running up, saying she could show me the real version of the college."},
		["Give Healing Supplies to Students"] =
			{appendText=".\nThe dorms are on the western grounds of the college. Nurad stocks bandages and salves in his dorm that will help fellow dorm students in need."},
		["Talk to Baham 2"] =
			{appendText=", nervously pacing back and forth by the well on the western grounds of the college.", stepTextKey="I distributed the bandages and healing supplies Nurad gave me. Time to speak to Baham again."},
		["Meet with Zaban"] =
			{appendText=" at the Baandari outpost on the side of the northern path leading out of the college."},
		["Talk to Baham 3"] =
			{appendText=" at the Baandari outpost north of the college grounds.", stepTextKey="Baham came running up with some of her fellow students. I should speak to her again."},
		["Go to Saltspray Cave"] =
			{appendText=", a miserable and damp grotto used to punish the students. The entrance lies on the dirt path to the west, underneath the wooden bridge to the north of the college."},
		["Defeat Tanion"] =
			{appendText=" and the two instructors, Malangwe and Piromir, taking refuge in the tunnels underneath the wooden bridge to the north of the college."},
		["Talk to Ilara"] =
			{appendText=", who ran further down the the tunnels underneath the wooden bridge to the north of the college."},
		["Return to the College"] =
			{appendText=" by exiting the caves through the wooden doors."},
		["Talk to Baham 4"] =
			{appendText=", who waits with Ilara outside the cave entrance, underneath the wooden bridge to the north of the college.", stepTextKey="I should report back to Baham outside of Saltspray Cave."},
	},

    [GetQuestName(4526)] = { --"Lost Bet"--mouch30
        ["Talk to the Ghost"] =
            {appendText=" next to the relic, in the depths of Bewan."},
        ["Talk to Angrel in Vulkhel Guard 1"] =
            {appendText=". She should be at the Mages Guild located in the western district.", stepTextKey="I should seek out and speak to Angrel, the ghost's friend in Vulkhel Guard."},
        ["Talk to Angrel in Vulkhel Guard 2"] =
            {appendText=" at the Mages Guild, in the western district.", stepTextKey="I should speak to Angrel one more time."},
    },

[GetQuestName(4411)] = { --"Final Blows"--OneSkyGod
        ["Find the Veiled Heritance Leaders"] =
            {appendText="\nEgranor is stationed at the Skywatch Wayshrine, keeping a watchful eye. He has given me a list of names, along with their last known whereabouts. From my inventory, I can use the list to track them down. \n\nIf I inquire, Egranor may have more information about the targets.\n\nHelonel's boots were always caked in mud, as he constantly sought to avoid the main road and towns, believing the shortcuts would keep his footsteps silent. \n\nKarulae was fond of picturesque locations adorned with cherry blossoms. He always kept his fishing rod within reach, in case the opportunity to fish presented itself. \n\nAranias, an avid reader, kept her diary nearby to jot down her thoughts, even during tense times. \n\nRumor has it that Calanyeese had the most unique equipment. She had a talent for spotting exquisite ways of maintaining her gear."},
        ["Return to Egranor"] =
            {appendText=""},
    },

[GetQuestName(4107)] = { --"Banishing the Banished"--OneSkyGod
        ["Find the First Keeper"] =
            {appendText=". Keeper Cirion may hold the secret to their whereabouts."},
        ["Find Keeper Areldur"] =
            {appendText=" in the eastern reaches of the dungeon."},
        ["Find the Second Keeper"] =
            {appendText=". Keeper Cirion may possess knowledge on them in the the eastern reaches of the dungeon."},
        ["Find Keeper Voranil"] =
            {appendText=" in a chamber that can be found by always keeping to the left, from the dungeon’s entrance onwards."},
        ["Find the Third Keeper"] =
            {appendText=". Keeper Cirion may possess knowledge on them in a chamber that can be found by always keeping to the left, from the dungeon’s entrance onwards."},
        ["Find Keeper Imiril"] =
            {appendText=" in the fathom depths of the abyssal dungeon."},
        ["Speak with Keeper Cirion"] =
            {appendText=" in the northmost depths of the abyssal dungeon."},
        ["Search for Rilis' Binding Stone Prison"] =
            {appendText=" by delving deep into the abyssal dungeon's farthest reaches."},
        ["Kill the Daedra around Rilis' Binding Stone Prison"] =
            {appendText=" deep within the abyssal dungeon's farthest reaches."},
        ["Kill High Kinlord Rilis"] =
            {appendText=" in farthest reaches of the abyssal dungeon."},
        ["Wait for the Keepers to Bind High Kinlord Rilis"] =
            {appendText=" in the last chamber where Oblivion begins to reveal itself."},
        ["Talk to Keeper Cirion"] =
            {appendText=" in the last chamber where Oblivion begins to reveal itself."},
    },

[GetQuestName(4597)] = { --"The Plan"--OneSkyGod
        ["Deactivate the First Binding Stone"] =
            {appendText=""},
        ["Deactivate the Second Binding Stone"] =
            {appendText=""},
        ["Deactivate the Third Binding Stone"] =
            {appendText=""},
        ["Talk to Keeper Cirion"] =
            {appendText=" in the last chamber where Oblivion begins to reveal itself."},
        ["Use the Final Binding Stone"] =
            {appendText=" in the last chamber where Oblivion begins to reveal itself."},
        ["Kill High Kinlord Rilis"] =
            {appendText=""},
        ["Check Cirion for Signs of Life"] =
            {appendText=" in the last chamber where Oblivion begins to reveal itself."},
    },



--GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD --GRAHTWOOD 

[GetQuestName(4896)] = { --"The Great Tree"--OneSkyGod
        ["Talk to Captain Jimila in Skywatch"] =
            {appendText=", Auridon. She is likely spellbound by the famous enchanting voice of Lorais as she sings and plucks the strings of her lute, leading the Malukah Quintet on stage during all the celebrations."},
        ["Talk to Captain Jimila in Vulkhel Guard"] =
            {appendText=" Docks on The Prowler in Auridon."},
        ["Talk to King Camoran Aeradan in Elden Root"] =
            {appendText=". It is a city built within The Elden Tree located in the center of the lush forests of Gratwood. The Elden Tree's titanic size and towering heights have earned it a place of reverence among the people of Valenwood, and its uppermost areas are reserved for royalty."},
    },


[GetQuestName(4396)] = { --"Unsafe Haven"--OneSkyGod
        ["Talk to Khajiit Soldier"] =
            {appendText=". They can be found currently examining The Prowler on the southeastmost part of the isle from Haven."},
        ["Ask Refugees about Lord Gharesh-ri"] =
            {appendText=". They can be found on the southeastmost part of the isle from Haven."},
        ["Talk to Lord Gharesh-ri 1"] =
            {appendText=". He is never found far from his faithful retinue of Khajiit, known as the fearsome Ghaja Fang, who are ever ready to defend and lay down their lives at his command.", stepTextKey="The refugees said Lord Gharesh-ri was last seen crossing the marsh toward the outer walls of Haven. I should see if I can catch up with him."},
        ["Investigate Artificer Hlana"] =
            {appendText=", who is a seeker of knowledge constantly rummaging through magical tomes or artifacts in pursuit of expanding their understanding of the mystical world.\n"},
        ["Investigate Warleader Yngold"] =
            {appendText=", who is a commander that has a habit of prioritizing shelter for his soldiers.\n"},
        ["Investigate Jeer-Tei"] =
            {appendText=",  who is a sea captain and master strategist known for devising his best plans while holed up in the captain's quarters aboard his ship."},
	["Locate Aquifer Entrance"] =
            {appendText=" which is visible when taking the helm of The First Witness."},
        ["Talk to Lieutenant Kazargi 1"] =
            {appendText=" who can be found portside of The First Witness.", stepTextKey="While searching for the aquifer entrance, I spotted Lieutenant Kazargi. I should speak with her and see what she's doing here."},
        ["Enter Aquifer"] =
            {appendText="  which is portside of The First Witness."},
        ["Enter Fort"] =
            {appendText=" from the Aquifer portside of The First Witness."},
        ["Open Gate"] =
            {appendText=" at the fort, which is reachable from the Aquifer portside of The First Witness."},
        ["Talk to Lord Gharesh-ri 2"] =
            {appendText=" outside of the Gatehouse, which is reachable from the Aquifer portside of The First Witness.", stepTextKey="I opened the gate, and Lord Gharesh-ri arrived with his soldiers. I should talk to the Speaker about his plan to stop the pirates' necromantic ritual."},
        ["Enter the Abandoned Fighters Guild"] =
            {appendText="."},
        ["Stop the Invaders' Ritual"] =
            {appendText=" within the Abandoned Fighters Guild."},
        ["Talk to Lieutenant Kazargi 2"] =
            {appendText=" outside the Abandoned Fighters Guild.", stepTextKey="The pirate leader is dead and her undead army disintegrated before me. I should inform Lieutenant Kazargi of my success."},
        ["Talk to Lord Gharesh-ri 3"] =
            {appendText=" in the center town of Haven by the water fountain.", stepTextKey="The pirate attack on Haven has failed. I should inform Lord Gharesh-ri that I defeated the pirate leader and her plan."},
    },

[GetQuestName(4943)] = { --"The Honor of the Queen"--OneSkyGod
        ["Talk to Prince Naemon 1"] =
            {appendText=" in the Throne Room.", stepTextKey="King Camoran Aeradan says the discontent lies with Queen Ayrenn's pledge of assistance to build the embassy, none of which has been forthcoming. He directed me to speak with Prince Naemon to find out why."},
        ["Go to the Altmer Embassy"] =
            {appendText=" located southwest of the Undaunted Enclave in Elden Root."},
        ["Talk to Ambassador Tarinwe"] =
            {appendText=" inside the Altmer Embassy in the southern part of Elden Root."},
        ["Investigate the Storeroom"] =
            {appendText=" at the southmost point of Elden Root."},
        ["Search Food Sack"] =
            {appendText="s in the Storehouse at the southmost point of Elden Root."},
        ["Search Supply Crate"] =
            {appendText="s in the Storehouse at the southmost point of Elden Root."},
        ["Return to the Altmer Embassy"] =
            {appendText=", located in the southern part of Elden Root."},
        ["Go to the Ancient Ruins"] =
            {appendText=" in the western lands of Elden Root."},
        ["Search the Ancient Ruins"] =
            {appendText=" in western lands of Elden Root"},
        ["Talk to Azareth 1"] =
            {appendText=" in the western ruins of Elden Root.", stepTextKey="The work party was ambushed! As I determined this was no accident, I was approached by a Wood Elf. It seems he wishes to speak with me."},
        ["Find the Middens Entrance"] =
            {appendText=". Rumors have spread of the refuge causing unease amongst passing travel caravans in that area."},
        ["Talk to Azareth 2"] =
            {appendText=" north of the Great Tree Stables.", stepTextKey="Azareth was waiting for me at the Middens. I should see if he has any more information about Ambassador Tarinwe."},
	["Enter the Middens"] =
            {appendText=" through a rooted wall entrance found by traveling north from the Great Tree Stables, passing Indithil's brewery stand, and keeping to the left on the unpaved road."},
        ["Search the Middens for Ambassador Tarinwe"] =
            {appendText=" by entering them through a rooted wall entrance found by traveling north from the Great Tree Stables, passing Indithil's brewery stand, and keeping to the left on the unpaved road."},
        ["Return to Elden Root"] =
            {appendText="."},
        ["Return to the Elden Root Throne Room"] =
            {appendText=" within the titanic Elden Tree."},
        ["Talk to King Camoran Aeradan"] =
            {appendText=" in the Throne Room within the titanic Elden Tree."},
        ["Talk to Prince Naemon 2"] =
            {appendText=" in the Throne Room within the titanic Elden Tree.", stepTextKey="King Camoran Aeradan seems relieved this matter has been resolved. The king also mentioned Prince Naemon wishes to have a word with me. I should speak with him and see what he wants."}, 
	["Capture Ambassador Tarinwe"] =
	 {appendText=" in the deepest parts of the Middens by entering them through a rooted wall entrance found by traveling north from the Great Tree Stables, passing Indithil's brewery stand, and keeping to the left on the unpaved road."}
     },

[GetQuestName(4951)] = { --"Fit to Rule"--OneSkyGod
        ["Talk to Meleras 1"] =
            {appendText=" who awaits patiently in the Throne Room within the Elden Tree in Elden Root.", stepTextKey="Prince Naemon asked me to speak with Meleras, an expert on the Orrery."},
        ["Find Conservator Daraneth"] =
            {appendText=". \nMeleras, who awaits patiently in the Throne Room within the Elden Tree in Elden Root may know of their location.\n"},
        ["Recover the Heart of Anumaril"] =
            {appendText=" north of Elden Root.\nMeleras, who awaits patiently in the Throne Room within the Elden Tree in Elden Root has more information on the matter.\n"},
        ["Retrieve Rajhin's Mantle"] =
            {appendText=" east of the Elden Tree.\nMeleras, who awaits patiently in the Throne Room within the Elden Tree in Elden Root may give us a clue on its wearabouts."},
        ["Talk to Meleras 2"] =
            {appendText=" in the Throne Room within the Elden Tree in Elden Root.", stepTextKey="I recovered everything the Orrery needs to function. I should return to Meleras and inform him of my success."},
    },

[GetQuestName(4868)] = { --"The Grip of Madness"--OneSkyGod
        ["Talk to Captain Elonthor"] =
            {appendText=" at the small encampment near the road leading into Southpoint, near Glothozug, the Guild Trader."},
        ["Talk to Daraneth 1"] =
            {appendText=", she has been keeping watch at the barricaded entrance of the only road leading into Southpoint", stepTextKey="I should speak with Daraneth, a Southpoint resident who offered to help find missing Dominion scouts."},
        ["Find the Scouts"] =
            {appendText=""},
        ["Talk to Daraneth 2"] =
            {appendText="", stepTextKey="I found one of the missing scouts, who said the \"mayor\" of Southpoint somehow turned his companions into bears. I should speak with Daraneth about what can be done about this."},
        ["Save the Scouts"] =
            {appendText=""},
        ["Go to Daraneth's Laboratory"] =
            {appendText=""},
        ["Talk to Daraneth 3"] =
            {appendText="", stepTextKey="Daraneth's basement laboratory was sealed by a powerful electrical storm. Perhaps Daraneth knows what can be done to stop this storm."},
	["Climb the Colovian Tower"] =
            {appendText=" on top of one of the tallest structures - the Colonvian tower."},
        ["Talk to Rufinus"] =
            {appendText=" on top of one of the tallest structures - the Colonvial tower."},
        ["Collect the Old Scroll"] =
            {appendText=""},
        ["Enter the Cathedral"] =
            {appendText=""},
        ["Confront the Mayor 1"] =
            {appendText="", stepTextKey="We entered the cathedral. Daraneth seems to recognize the \"mayor\" and hopes to talk some sense into him."},
        ["Talk to Daraneth 4"] =
            {appendText="", stepTextKey="It seems Sheogorath inhabited Daraneth's body the entire time we traveled through Southpoint. I awoke in some kind of jail cell, accompanied by a very weary Daraneth. I should speak with her and try to make sense of what happened."},
        ["Talk to Sheogorath 1"] =
            {appendText="", stepTextKey="Sheogorath appeared outside of the jail cell. He won't stop staring at me. I should speak with him."},
        ["Find a Way Out of the Catacombs"] =
            {appendText=""},
        ["Lower the Bridge"] =
            {appendText=""},
        ["Cross the Bridge"] =
            {appendText=""},
        ["Destroy Free Will"] =
            {appendText=""},
        ["Confront the Mayor 2"] =
            {appendText="", stepTextKey="The path to the cathedral is open. I should make my way there and confront Mayor Aulus."},
        ["Kill Mayor Aulus"] =
            {appendText=""},
        ["Talk to Sheogorath 2"] =
            {appendText=" inside the cathedral.", stepTextKey="I killed Mayor Aulus. If Sheogorath keeps his word, he will leave Southpoint. However, it seems the Daedric Prince wants to speak with me before he departs."},
    },

[GetQuestName(4385)] = { --"Lost in Study"--OneSkyGod
        ["Talk to Laranalda 1"] =
            {appendText=". She is researching within the Reliquary Ruins northwest of the Mages Guild camp. Nondor might also have information about her whereabouts.", stepTextKey="Nondor asked me to check in with Laranalda, a colleague of his who is exploring the Reliquary of Stars."},
        ["Talk to Laranalda 2"] =
            {appendText="", stepTextKey="Laranalda, a Mages Guild scholar studying the texts in the Reliquary of Stars, asked for my help with her current predicament."},
        ["Find Behelir"] =
            {appendText=" within the vast chambers and halls of the Reliquary Ruins.\n"},
        ["Find Tedryni"] =
            {appendText=" within the vast chambers and halls of the Reliquary Ruins."},
        ["Return to Laranalda"] =
            {appendText=" in the first chamber of the Reliquary of Stars."},
        ["Talk to Laranalda 3"] =
            {appendText=" in the first chamber of the Reliquary Ruins, at Reliquary of Stars.", stepTextKey="I've rescued both Behelir and Tedryni for Laranalda."},
    },

[GetQuestName(4386)] = { --"Heart of the Matter"--OneSkyGod
        ["Follow Laranalda"] =
            {appendText=" at the campsite within the ruins."},
        ["Talk to Laranalda"] =
            {appendText=" at the campsite within the ruins."},
        ["Explore the Hall of Might"] =
            {appendText=". Cunning is Behelir's gift, for he possesses the keen ability to unearth hidden secrets. As we venture forth, he may alert us when we arrive at a chamber of intrigue."},
        ["Investigate the Reliquary"] =
            {appendText=" accessed through the secret entrance in the library in the Halls of Might."},
        ["Pursue Ukaezai"] =
            {appendText=". Within the Halls of Might lies a secret chamber concealed in the library. She may hold knowledge of other passages that no living soul can access."},
        ["Confront Ukaezai"] =
            {appendText=" inside the Reliquary Vault within the Halls of Might."},
        ["Recover the Heart of Anumaril"] =
            {appendText=" in the collapsed chamber inside the Reliquary Vault within the Halls of Might."},
        ["Defeat Ukaezai"] =
            {appendText=" in the collapsed chamber inside the Reliquary Vault within the Halls of Might."},
        ["Bring the Heart of Anumaril to Laranalda"] =
            {appendText=" near the exit of the collapsed chamber inside the Reliquary Vault within the Halls of Might."},
    },



[GetQuestName(4885)] = { --"A Lasting Winter"--OneSkyGod
        ["Talk to Brelor 1"] =
            {appendText=". Follow the only paved path near the site to reach Brelor's campsite. The location was chosen due to its proximity to the luminous skyshard and other glowy crystals.", stepTextKey="Brelor seems very concerned with General Endare's plans. I should speak with him and learn why."},
        ["Bring Brelor to the Welkynd Stones"] =
            {appendText=" that glow a sky blue. Only the perfectly intertwined clusters possess the power to be utilized."},
        ["Talk to Brelor 2"] =
            {appendText="", stepTextKey="The Welkynd stones revealed the presence of a vault beneath the Falinesti Winter Site. I should speak with Brelor about this."},
        ["Find Falinesti Faithful Camp"] =
            {appendText=" that is distinguished by its yellow, black, and white colored encampments that the tents on the fringes have a bird's-eye view of the dig site."},
        ["Talk to Cirtor"] =
            {appendText=" at the Falinesti Faithful Camp that is distinguished by its yellow, black, and white colored encampments that the tents on the fringes have a bird's-eye view of the dig site."},
        ["Enter the Dig Site"] =
            {appendText=" referred by the soldiers as the big frost troll death pit."}, 
	["Search the Northern Cave"] =
            {appendText=""},
        ["Talk to the Frost Creature"] =
            {appendText=" in the northern cave of the dig site."},
        ["Enter the Vault"] =
            {appendText=" within the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Talk to Nairume 1"] =
            {appendText=" within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site.", stepTextKey="Nairume opened the way to her vault, a combination prison and palace. I should speak with her about Rajhin's Mantle."},
        ["Enter the Inner Vault"] =
            {appendText=" within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Locate Rajhin's Mantle"] =
            {appendText=" in the Inner Vault within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Talk to General Endare"] =
            {appendText=" deep inside the Inner Vault within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Defeat General Endare"] =
            {appendText=" deep inside the Inner Vault within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Search General Endare's Corpse"] =
            {appendText=" deep inside the Inner Vault within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
	["Talk to Nairume 2"] =
            {appendText=" within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site.", stepTextKey="I hold Rajhin's Mantle. I should return to Nairume's prison and see what must be done to free her."},
        ["Use Rajhin's Mantle on Brazier"] =
            {appendText=" at the heart of Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site."},
        ["Talk to Nairume 3"] =
            {appendText=" within Nairume's Prison inside the icy cave that is surrounded by elevated wooden pathways at the dig site.", stepTextKey="I should speak with Nairume to see if the curse is truly broken."},
        ["Talk to Brelor 3"] =
            {appendText=" at the Falinesti Faithful Camp that is distinguished by its yellow, black, and white colored encampments that the tents on the fringes have a bird's-eye view of the dig site.", stepTextKey="I've recovered Rajhin's Mantle and freed Nairume. I should deliver the relic to Brelor so it can be properly contained."},
        ["Talk to Brelor 4"] =
            {appendText=" at the Falinesti Faithful Camp that is distinguished by its yellow, black, and white colored encampments that the tents on the fringes have a bird's-eye view of the dig site.", stepTextKey="I found Brelor.  I should deliver Rajhin's Mantle to him so it can be properly contained."},
    },

[GetQuestName(4922)] = { --"The Orrery of Elden Root"--OneSkyGod
        ["Enter the Orrery"] =
            {appendText=" by traveling along the road that winds beneath the towering roots of the Elden Tree, which can be accessed by passing through the bustling stalls of the Trunkshade Traders."},
        ["Talk to Conservator Daraneth 1"] =
            {appendText="", stepTextKey="I should speak with Conservator Daraneth."},
        ["Use Rajhin's Mantle on the Pillars"] =
            {appendText=""},
        ["Talk to Conservator Daraneth 2"] =
            {appendText="", stepTextKey="I activated the pillars. I should speak with Daraneth and see what I need to do next."},
        ["Activate the Pillar of Welke with the Heart of Anumaril"] =
            {appendText=""},
        ["Watch the Orrery"] =
            {appendText=""},
        ["Use Rajhin's Mantle to Free Yourself"] =
            {appendText=""},
        ["Kill Prince Naemon"] =
            {appendText=""},
        ["Talk to Queen Ayrenn 1"] =
            {appendText="", stepTextKey="Prince Naemon is dead. I should speak with Queen Ayrenn about her intentions."},
        ["Wait for Queen Ayrenn's Emergence"] =
            {appendText=""},
        ["Talk to Queen Ayrenn 2"] =
            {appendText="", stepTextKey="Queen Ayrenn has emerged from the Orrery, surrounded by a strange radiance. I should speak with her."},
    },

[GetQuestName(4953)] = { --"Trouble at the Tree"--OneSkyGod
        ["Talk to King Camoran Aeradan"] =
            {appendText=" in the city of Elden Root that is nestled within the mythical Elden Tree in the center of Gratwood. The Elden Tree's titanic size and mystical heights have earned it a place of reverence and wonder among the people of Valenwood, with its uppermost regions reserved for royalty."},
    },

----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD----- SIDEQUESTS GRAHWOOD

	[GetQuestName(4833)] = { --"Bosmer Insight"--Rosque
		["Talk to Glaras 1"] =
			{appendText=". She meditates in her tree home, among the trophies of past hunts.", stepTextKey="I need to speak with the leader of the Brackenleaf's Briars, Glaras."},
		["Perform the Initiation Ritual"] =
			{appendText="."},
		["Talk to Glaras 2"] =
			{appendText=" in Brackenleaf.", stepTextKey="I lit the ritual basins and learned of the animals of the forest. I should speak with Glaras to see what's next."},
		["Capture a Falinesti Peeper"] =
			{appendText=". They live in the deepest parts of the marshes near Brackenleaf."},
		["Start Your Vision Journey"] =
			{appendText=" inside Sacred Leap Grotto."},
		["Talk to the Spriggan Spirit 1"] =
			{appendText=" inside Sacred Leap Grotto.", stepTextKey="I consumed the Falinesti peeper and was transported to a strange version of the forest. A spriggan appeared. I should speak with it."},
		["Find Brackenleaf"] =
			{appendText=" in the swamps near Sacred Leap Grotto."},
		["Choose Your Spirit Animal"] =
			{appendText=", and reveal it to Brackenleaf in the center of the swamps near Sacred Leap Grotto."},
		["Hunt Your Prey 1"] =
			{appendText=" at the riverbed of the western edge of the swamps near Sacred Leap Grotto.", stepTextKey="I chose the Wolf as my spirit animal. The first trial is to hunt the prey in the forest."},
		["Talk to the Spriggan Spirit 2"] =
			{appendText=" at the edge of the swamps near Sacred Leap Grotto where I killed my prey.", stepTextKey="I killed my prey and the spriggan appeared again. I should speak with her to learn of my next trial."},
		["Confront Your Predator 1"] =
			{appendText=" at the shrine just past the northwestern edge of the swamps near Sacred Leap Grotto.", stepTextKey="After killing my prey I spoke to the spriggan that appeared before me. She stated that Brackenleaf was pleased but now I need to confront my predator. I need to light the Wolf brazier at the edge of the forest to draw out my predator."},
		["Talk to Brackenleaf"] =
			{appendText=" in the center of the swamps near Sacred Leap Grotto."},
		["Take a Piece of Brackenleaf's Heart"] =
			{appendText=" inside Brackenleaf's Trunk in the center of the swamps near Sacred Leap Grotto."},
		["Listen to Brackenleaf"] =
			{appendText=" within his trunk in the center of the swamps near Sacred Leap Grotto."},
		["Return to Glaras"] =
			{appendText=" in Brackenleaf."},
		["Pray at the Wolf Shrine"] =
			{appendText=" in Brackenleaf."},
		["Talk to Glaras 3"] =
			{appendText=" in Brackenleaf.", stepTextKey="I prayed at the Wolf brazier and received a blessing, fueled by the flame of Brackenleaf that now resides within me. I must speak with Glaras one final time."},
		["Hunt Your Prey 2"] =
			{appendText=" at the beach of the southern edge of the swamps near Sacred Leap Grotto.", stepTextKey="I chose the Tiger as my spirit animal. The first trial is to hunt the prey in the forest."},
		["Confront Your Predator 2"] =
			{appendText=" at the shrine just south of Sacred Leap Grotto.", stepTextKey="After killing my prey I spoke to the spriggan that appeared before me. She stated that Brackenleaf was pleased but now I need to confront my predator. I need to light the Tiger brazier at the edge of the forest to draw out my predator."},
		["Pray at the Tiger Shrine"] =
			{appendText=" in Brackenleaf."},
		["Talk to Glaras 4"] =
			{appendText=" in Brackenleaf.", stepTextKey="I prayed at the Tiger brazier and received a blessing, fueled by the flame of Brackenleaf that now resides within me. I must speak with Glaras one final time."},
		["Hunt Your Prey 3"] =
			{appendText=" at the watering hole on the northwestern edge of the swamps near Sacred Leap Grotto.", stepTextKey="I chose the Snake as my spirit animal. The first trial is to hunt the prey in the forest."},
		["Confront Your Predator 3"] =
			{appendText=" at the shrine just north of Sacred Leap Grotto.", stepTextKey="After killing my prey I spoke to the spriggan that appeared before me. She stated that Brackenleaf was pleased but now I need to confront my predator. I need to light the Snake brazier at the edge of the forest to draw out my predator."},
		["Pray at the Snake Shrine"] =
			{appendText=" in Brackenleaf."},
		["Talk to Glaras 5"] =
			{appendText=" in Brackenleaf.", stepTextKey="I prayed at the Snake brazier and received a blessing, fueled by the flame of Brackenleaf that now resides within me. I must speak with Glaras one final time."},
	},

[GetQuestName(4974)] = { --"Brackenleaf's Briars"--Rosque
        ["Talk to Glaras in Brackenleaf"] =
            {appendText=". Gerweruin said that it was outside of Haven, bordered by the Long Coast."},
    },

[GetQuestName(4976)] = { --"Carnival Conundrum"--OneSkyGod
        ["Talk to Sarandel 1"] =
            {appendText=" at Sarandel's Carnival - a new and unknown carnival that has appeared on the road between Elden Root and Haven. Its blank banners and empty attractions suggest that it is a new addition to the realm of traveling carnivals, but few have ventured forth to explore its wonders.", stepTextKey=""},
        ["Talk to Vindare the Magnificent"] =
            {appendText="\nI should find Vindare the Magnificent, Bug Wrangler Cornar t them waiting for me at the carnival south of Elden Root after I have completed their requests."},
        ["Talk to Bug Wrangler Cornar"] =
            {appendText=" at the carnival south of Elden Root."},
        ["Talk to Storyteller Noryon"] =
            {appendText=" at the carnival south of Elden Root."},
        ["Aid Carnival Performers"] =
            {appendText="\nI should find Vindare the Magnificent, Bug Wrangler Cornar, and Storyteller Noyron waiting for me at the carnival south of Elden Root after I have completed everything required to fulfill their requests."},
        ["Talk to Sarandel 2"] =
            {appendText=" at the entrance of the carnival.", stepTextKey="All of the carnival's performers have what they need to please the crowds. I should inform Sarandel."},
    },

[GetQuestName(4445)] = { --"Forever Bound"--OneSkyGod
        ["Find Arria's Skull"] =
            {appendText=""},
        ["Find Teldius's Skull"] =
            {appendText=""},
        ["Find Musius's Skull"] =
            {appendText=""},
        ["Talk to Decius 1"] =
            {appendText=" within the trapped catacombs.", stepTextKey="I found the skulls of the Imperial mages who performed the ritual. I should bring them to Decius."},
        ["Disrupt the Ritual"] =
            {appendText="\nThe lever, though not physically apparent, may be found within the trapped catacombs."},
        ["Talk to Decius 2"] =
            {appendText=" within the secret ritual room by interacting with a lever that, though not physically apparent, may be found within the trapped catacombs.", stepTextKey="I seem to have banished the spirits of the Imperial mages and stopped the ritual. I should speak with Decius."},
    },

[GetQuestName(4406)] = { --"Forgotten Soul" --Rosque 
        ["Find Door to Sirdor"] =
            {appendText="."},
        ["Rescue Sirdor"] =
            {appendText=" from the lower level, accessible from the room with the large welkynd stone growths."},
        ["Read Sirdor's Journal"] =
            {appendText=" at the bottom of the lower level, accessible from the room with the large welkynd stone growths."},
        ["Pick up Attunement Stone"] =
            {appendText=" at the bottom of the lower level, accessible from the room with the large welkynd stone growths."},
        ["Escape to the Welkynd Stones"] =
            {appendText="."},
        ["Attune Surrounding Welkynd Stones"] =
            {appendText=" inside the ruins."},
        ["Use Attunement Stone on Central Welkynd Stone"] =
            {appendText="."},
        ["Talk to Root Sunder"] =
            {appendText=" within the welkynd stone room."},
    },

[GetQuestName(4339)] = { --"If the Dead Could Talk" --Rosque 
        ["Recover the Research Journals"] =
            {appendText=". Torches, skyshards, and welkynd stones would all be likely lures to attract predators, but if Root Sunder is as dangerous as Tandare thinks, the researchers can't have gotten more than a few rooms in."},
        ["Bring the Journals to Tandare"] =
            {appendText=" just outside Root Sunder Ruins."},
    },

[GetQuestName(4773)] = { --"Keeper of Bones" --Rosque 
		["Recover Dringoth's Bones from the Worm Cult"] =
			{appendText=" in the Bone Orchard."},
		["Assemble Dringoth"] =
			{appendText="."},
		["Talk to Dringoth 1"] =
			{appendText=" inside the Bone Orchard.", stepTextKey="I reassembled Dringoth. I should see if he knows anything about the Worm Cult's plans for the Bone Orchard."},
		["Investigate Dig Site"] =
			{appendText=" near the Bone Orchard. Dringoth said it was hard to miss."},
		["Talk to Dringoth 2"] =
			{appendText=" in the Bone Orchard.", stepTextKey="Goradir, a much larger talking skull, informed us that the Worm Cult was asking questions about \"the roots.\" I should see if Dringoth knows what they're after."},
		["Talk to Spinner Amariel"] =
			{appendText=". Dringoth said she was up on the northern ridge overlooking the Bone Orchard."},
		["Enter the Barrowbough"] =
			{appendText=", the great tree in the middle of the Bone Orchard."},
		["Awaken Nirenan"] =
			{appendText=" inside the great tree in the middle of the Bone Orchard. Spinner Amariel said sounding the horn before the gate will open it."},
		["Enter the Heart of the Barrowbough"] =
			{appendText=", the great tree in the center of the Bone Orchard."},
		["Witness the Gathering of Old Bones"] =
			{appendText=" beneath the great tree in the center of the Bone Orchard."},
		["Talk to Olphras"] =
			{appendText=" beneath the great tree in the center of the Bone Orchard."},
		["Repel the Worm Cult 1"] =
			{appendText=" beneath the great tree in the middle of the Bone Orchard.", stepTextKey="Dringoth has returned to his bones beneath the Barrowbough. I should join Olphras and the other old bones as they defend against the Worm Cult invaders."},
		["Talk to Olphras Outside"] =
			{appendText=" the tree in the middle of the Bone Orchard."},
		["Repel the Worm Cult 2"] =
			{appendText=" beneath the great tree in the middle of the Bone Orchard.", stepTextKey="Olphras will allow Dringoth to stand with the old bones as they defend the Barrowbough, but afterward he must return to his exile in the world above."},
		["Talk to Dringoth Outside 1"] =
			{appendText=" the tree in the middle of the Bone Orchard.", stepTextKey="With Ethruin defeated, the Worm Cult attack was repelled. I should speak with Dringoth before he heads off to his exile."},
		["Repel the Worm Cult 3"] =
			{appendText=" beneath the great tree in the middle of the Bone Orchard.", stepTextKey="Olphras will allow Dringoth to stand with the old bones as they defend the Barrowbough."},
		["Talk to Dringoth Outside 2"] =
			{appendText=" the tree in the middle of the Bone Orchard.", stepTextKey="With Ethruin defeated, the Worm Cult attack was repelled. I should speak with Dringoth to see what's next for the peculiar residents of the Barrowbough."},
	},


[GetQuestName(4405)] = { --"A Little on the Side"--Rosque 
        ["Collect Moon Sugar Cane"] =
            {appendText="\nAmong other places, Khezuli climbed on top of the pack merchant's kiosk to find a good hiding spot in Haven."},
        ["Collect Hist Sap"] =
            {appendText="\nAmong other places, Khezuli hid some in plain sight behind the stables in Haven."},
        ["Collect Mangrove Juice"] =
            {appendText="\nAmong other places, Khezuli stashed some behind Sharan-Jo's home in Haven."},
        ["Find Khezuli's Contact in the Mages Guild"] =
            {appendText=" in Haven. She's supposed to be waiting just inside the entry hall."},
        ["Mix Ingredients"] =
            {appendText=" inside the Haven Mage's Guild. The note from Khezuli's contact may be able to help."},
        ["Meet the Buyer on the Beach"] =
            {appendText=". The note from Khezuli's contact marked a map location just west of the Haven docks."},
    },

[GetQuestName(4404)] = { --"Lost Treasures" --Rosque 
        ["Rescue Workers in Marsh"] =
            {appendText="\nOutside the east Haven City Gates."},
        ["Talk to Khezuli"] =
            {appendText=". One of the tavern workers I rescued thought she ran to Haven for help, so she may be hiding somewhere indoors, likely in an unused building away from the fighting."},
    },

[GetQuestName(4436)] = { --"Luck of the Albatross"--OneSkyGod
        ["Talk to Captain Linwen 1"] =
            {appendText=" up the road behind Engor. It seems that there may have been a miscommunication due to his injuries. However, he did mention that he and an Albatross Crewman will be waiting at their campsite which is located west of Haven.", stepTextKey="The captain of the Albatross can tell me more about the mutiny than Engor, her wounded crewman. I should speak with her."},
        ["Talk to Captain Linwen 2"] =
            {appendText=" up the road behind Engor. It seems that there may have been a miscommunication due to his injuries. However, he did mention that he and an Albatross Crewman will be waiting at their campsite which is located west of Haven.", stepTextKey="If I plan to help Captain Linwen rescue her crew, I'll need to know more about what's going on inside the Cave of Broken Sails."},
        ["Enter the Cave of Broken Sails"] =
            {appendText=" up the road behind Engor. It seems that there may have been a miscommunication due to his injuries. However, he did mention that he and an Albatross Crewman will be waiting at their campsite which is located west of Haven."},
        ["Search for Survivors"] =
            {appendText=" within the cave."},
        ["Locate the Survivor"] =
            {appendText=""},
        ["Locate the Imperial Vault"] =
            {appendText=" within the trapped Halls of Treasures."},
        ["Investigate Southern Room"] =
            {appendText=" within the west side of the trapped Halls of Treasures."},
	["Investigate Northern Room"] =
            {appendText=" within the west side of the trapped Halls of Treasures."},
        ["Talk to Nuttall"] =
            {appendText=" within of the trapped Halls of Treasures."},
        ["Follow Nuttall"] =
            {appendText=" within of the trapped Halls of Treasures."},
        ["Enter the Great Cavern"] =
            {appendText=""},
        ["Talk to Captain Linwen 3"] =
            {appendText=" before going further into the Great Cavern.", stepTextKey="I distracted the mutineers and met up with Captain Linwen in the great cavern. I should speak with her about stopping Brauti Bloodshark's plans."},
        ["Get Kindlepitch"] =
            {appendText=" within the Great Cavern."},
        ["Distract the Mutineers"] =
            {appendText="\nWithin the Great Cavern."},
        ["Kill Brauti Bloodshark"] =
            {appendText=" as he prepares his attack west of the entrance of the Great Cavern."},
        ["Rescue Faenir"] =
            {appendText=""},
        ["Talk to Captain Linwen 4"] =
            {appendText=" by the beached ship in the center of the Great Cavern.", stepTextKey="Faenir was shaken up but otherwise all right. I should find Captain Linwen and let her know Brauti Bloodshark is no longer a threat."},
        ["Talk to Bulag"] =
            {appendText=" by the northern exit within the Great Cavern."},
    },

[GetQuestName(4963)] = { --"Passage Denied"--Rosque
        ["Shut Down the Covenant Portal"] =
            {appendText=" inside the ruins of Ne Salas."},
        ["Talk to Cirmo"] =
            {appendText=" just outside Ne Salas."},
    },

[GetQuestName(4768)] = { --"Scars Never Fade"--Rosque
        ["Talk to Officer Parwinel 1"] =
            {appendText=" near the road.", stepTextKey="A Dominion soldier told me Officer Parwinel has work for outsiders. I should see what she has to say."},
        ["Question Tribal Leadership"] =
            {appendText=": Uta Tei, a spiritual leader, No-Fingers, an animal minder, and Slim-Jah, a fisherwoman."},
        ["Attend the Meeting"] =
            {appendText="  of the argonian tribal leaders. The bell is probably sounding from the meeting location."},
        ["Observe the Meeting"] =
            {appendText=" in the middle of the Gray Mire."},
        ["Talk to No-Fingers 1"] =
            {appendText=" in the middle of the Gray Mire.", stepTextKey="Slim-Jah, one of the Argonian leaders, murdered Uta-Tei and fled the tribal meeting. I should speak with No-Fingers, the remaining Argonian leader of the Gray Mire."}, 
	["Track Down and Kill Slim-Jah's Hunters"] =
            {appendText=". Comes-When-Called may be able to track them from their things."},
        ["Meet No-Fingers"] =
            {appendText=". The sea cave should be near the southmost edge of the Gray Mire."},
        ["Kill Slim-Jah and Mother Lightning"] =
            {appendText=" in the sea cave southwest of the Gray Mire."},
        ["Return to the Gray Mire"] =
            {appendText="."},
        ["Talk to No-Fingers 2"] =
            {appendText=" near the animal pen.", stepTextKey="I've defeated Slim-Jah and stopped her plans. I should speak with No-Fingers in the Gray Mire."},
        ["Decide the Fate of the Tribe"] =
            {appendText=" by talking to Officer Parwinel near the animal pens."},
        ["Talk to Officer Parwinel 2"] =
            {appendText=" near the animal pens.", stepTextKey=""},
    },

[GetQuestName(4946)] = { --"A Silken Garb"--Rosque
        ["Rescue Firaelion"] =
            {appendText=". Mendil, at the north edge of Brackenleaf, can pick out where he was going."},
        ["Talk to Firaelion"] =
            {appendText=" north of Brackenleaf."},
    },

[GetQuestName(4882)] = { --"The Wandering Minstrel"--OneSkyGod 
        ["Find Sorion in Southpoint"] =
            {appendText=". The southernmost paved road of Gratwood leads to Haven by traveling on it to the east and to Southpoint by traveling on it to the west, respectively."},
        ["Find Sorion at Sweetbreeze Cottage"] =
            {appendText=" that is nestled under a mountain, tucked in between an excavation site rumored to contain an enormous skull and an Ayleid ruin."},
        ["Find Key to Hatch"] =
            {appendText=""},
        ["Use Laundered Key on Hatch"] =
            {appendText=" in the Sweetbreeze Cottage."},
        ["Examine Minstrel's Lute"] =
            {appendText=" in the Sweetbreeze Cottage."},
        ["Talk to Enda 1"] =
            {appendText=" by taking the second dirt road to my left when traveling from the west gate of Haven to Southpoint.", stepTextKey="Sorion is dead. I should inform Enda."},
        ["Talk to Enda 2"] =
            {appendText=" by taking the second dirt road to my left when traveling from the west gate of Haven to Southpoint.", stepTextKey="I told Enda the truth about Sorion's death. I should see if she has anything else to say."},
    },

[GetQuestName(4917)] = { --"The Blacksap's Hold"--Rosque
		["Enter the Portal"] =
			{appendText=" next to Forinor."},
		["Talk to Maeroth 1"] =
			{appendText=" inside Forinor's portal.", stepTextKey="I stepped through Forinor's portal to what seems to be an old ruin. There doesn't appear to be a way out. A Vinedusk named Maeroth asked me to speak with him."},
		["Leave the Secure Location"] =
			{appendText="."},
		["Meet Treethane Iirdel"] =
			{appendText=" in her audience"},
		["Talk to Treethane Iirdel"] =
			{appendText=" in her audience hall at the top of the central tree in Cormount, the town at the northeastern end of Grahtwood."},
		["Collect Iirdel's Journal"] =
			{appendText=" in her audience hall at the top of the central tree in Cormount."},
		["Secure a Meeting with Lorchon"] =
			{appendText=""},
		["Meet Treethane Iirdel in the Center of Cormount"] =
			{appendText="."},
		["Find the Site of the Massacre"] =
			{appendText=" near Cormount. An event of this magnitude must have a commemoration of some kind at its location."},
		["Talk to Lorchon"] =
			{appendText=""},
		["Locate Gorinir"] =
			{appendText=". If his plan is as bloody as Lorchon implied, the cave will need to be in an area where lots of soldiers can easily reach it."},
		["Talk to Gorinir"] =
			{appendText=""},
		["Defend Dominion Camps from Blacksap Constructs"] =
			{appendText=""},
		["Rendezvous with the Vinedusk in Cormount"] =
			{appendText="."},
		["Talk to Maeroth 2"] =
			{appendText=" inside the portal near Cormount.", stepTextKey="I captured the leaders of the Blacksap and defeated the constructs sent to attack Dominion soldiers. I should speak to Maeroth and determine the fate of the Blacksap leaders."},
		["Talk to Maeroth 3"] =
			{appendText=" inside the portal near Cormount.", stepTextKey="Maeroth seems convinced that Gelthiorand his sons will spend the rest of their days in the Vinedusk's hidden prison. I should speak with him and see if there's anything else he needs."},
		["Talk to Maeroth 4"] =
			{appendText=" inside the portal near Cormount.", stepTextKey="I convinced Maeroth that the Blacksap leaders deserve justice. He will advise the king to give Gelthior and his sons a public trial. I should speak with him and see if there's anything else he needs."},
	},

[GetQuestName(4854)] = { --"Eyes of Azura"--Rosque
		["Investigate Laeloria"] =
			{appendText=" the ruin north of Elden Root for clues."},
		["Search Laeloria Ruins"] =
			{appendText=" for a way into Molag Bal's realm. Contacting the Daedric Prince Azura, at her shrine near the edge of the ruins, may offer a lead."},
		["Talk to Irrai"] =
			{appendText=" inside Vastarie's Tower in the ruins."},
		["Obtain a Sigil Geode"] =
			{appendText=" inside Vastarie's Tower in the ruins."},
		["Fill the Sigil Geode"] =
			{appendText="."},
		["Use Sigil Geode on the Twilit Heart"] =
			{appendText=". Irrai may be able to reveal more about it."},
		["Find Culanwe"] =
			{appendText=" inside Laeloria Ruins."},
		["Defeat Irrai"] =
			{appendText=" inside Laeloria Ruins."},
		["Pursue Irrai"] =
			{appendText=" inside Laeloria Ruins."},
		["Talk to Vastarie 1"] =
			{appendText=" inside Laeloria Ruins.", stepTextKey="Irrai revealed herself to be a servant of Molag Bal. Now that I've determined the Daedra's fate, I should speak with Vastarie about what we can do to find Culanwe."},
		["Close Portal to Coldharbour"] =
			{appendText=" inside Laeloria Ruins. Vastarie said that ending Culanwe's torment will break the connection between worlds."},
		["Talk to Vastarie 2"] =
			{appendText=", deep within the portal to Coldharbour inside Laeloria Ruins.", stepTextKey="Removing Culanwe's Bones from the altar closed the portal, but now Vastarie and I are trapped in Coldharbour. I should speak with Vastarie and see if she has any ideas about how we can escape."},
		["Return to Azura Shrine 1"] =
			{appendText=" in Laeloria.", stepTextKey="In order to escape Coldharbour, Vastarie opened a portal using a connection to her own phylactery. Doing so meant she was unable to return with me.\n\nI should return Culanwe's Bones to Azura Shrine."},
		["Return to Azura Shrine 2"] =
			{appendText=" in Laeloria.", stepTextKey="Upon returning the Culanwe's Bones to Azura Shrine, the Daedric Prince seemed pleased. I should speak with her while I am able."},
		["Return to Azura Shrine 3"] =
			{appendText="  in Laeloria. Vastarie, in front of the Laeloria Ruins, also seems interested in speaking.", stepTextKey="In order to escape Coldharbour, Vastarie opened a portal using Irrai's connection to the Daedra's summoning tablet.\n\nI should return Culanwe's Bones to Azura Shrine."},
	},

[GetQuestName(4387)] = { --"Forbidden Love"--OneSkyGod 
        ["Find the Second Half of the Letter"] =
            {appendText=". I kept the page on me, to reread it if I need a clue. The next page must be near some books or ink and paper."},
        ["Find What the Mates of Metal Unlock"] =
            {appendText=". I kept the page on me, to reread it if I need a clue."},
        ["Follow the Voice"] =
            {appendText=" from the chest in the northwest chamber in the Halls of Wisdom."},
        ["Talk to the Spirit of Erraduure"] =
            {appendText=" by the obstructed tunnel inside the Halls of Wisdom."},
    },

	[GetQuestName(4815)] = { --"Pact Advocate"--Mouch30
		["Talk to Treethane Rolon 1"] =
			{appendText=", Karthdar's leader. The village rests at the top of a hill to the east, cradled by a massive grove of trees. The faint rush of a waterfall calls from a sloping valley, where the sacred cave must be.", stepTextKey="I've been directed to speak with the Treethane of Karthdar to get details on what's happening. He and the rest of the town are holed up in a nearby cave."},
		["Collect Testimony and Evidence"] =
			{appendText=" against the three suspects. Speak to the villagers in the sacred cave to secure an eyewitness, and search through the houses and belongings of the accused for proof of their crime, as well as any magical anomalies that might strengthen your case."},
		["Talk to Treethane Rolon 2"] =
			{appendText=" back at the sacred cave near the waterfall of Karthdar's valley, on the northeastern edge of Grahtwood.", stepTextKey="I have collected all the testimony and evidence I need to accuse any of the suspected pact breakers. I need to decide who I feel is responsible and present my case before Treethane Rolon."},
		["Prove Aranak's Guilt"] =
			{appendText=" by presenting the correct evidence you have collected. From what you gathered, Aranak was the one to harvest the plant, and lightning struck close to his cart."},
		["Listen to the Verdict"] =
			{appendText=" in the trial room, at the back of the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood."},
		["Talk to Aranak"] =
			{appendText=", gathered near the other suspects, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood. His whiskers tremble with fear, and his tail finds refuge between his legs."},
		["Escort Aranak to the Judgment Chamber"] =
			{appendText=", found behind a door south of the first chamber, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood."},
		["Witness Judgment 1"] =
			{appendText=". A massive strangler sits atop a pile of bones, while ghostly spriggans watch the scene with cold, vengeful eyes.", stepTextKey="I brought the guilty to the judgment chamber, and shall now watch his fate."},
		["Return to Treethane Rolon 1"] =
			{appendText=", waiting for you in the central chamber of the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood.", stepTextKey="Aranak has met his fate. I should return to Treethane Rolon and let him know the deed is done."},
		["Prove Spinner Eranas's Guilt"] =
			{appendText=" by presenting the correct evidence you have collected. From what you gathered, Eranas was the one to use the plant in his potion, and his broken sigil could be the Green's way of stripping him from his duties."},
		["Talk to Spinner Eranas"] =
			{appendText=", gathered near the other suspects, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood. He appears calm, staying strong for his people and his wife. There's a hint of sadness in his eyes."},
		["Escort Spinner Eranas to the Judgment Chamber"] =
			{appendText=", found behind a door south of the first chamber, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood."},
		["Witness Judgment 2"] =
			{appendText=". A massive strangler sits atop a pile of bones, while ghostly spriggans watch the scene with cold, vengeful eyes.", stepTextKey="I have brought the guilty to the judgment chamber, and shall now watch his fate."},
		["Return to Treethane Rolon 2"] =
			{appendText=", waiting for you in the central chamber of the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood.", stepTextKey="Spinner Eranas has met his fate. I should return to Treethane Rolon and let him know the deed is done."},
		["Prove Gathiel's Guilt"] =
			{appendText=" by presenting the correct evidence you have collected. From what you gathered, Gathiel orchestrated the cutting of the plant, knowing that it would break the Green Pact. Her sign, the Lady, shines in the sky like a spotlight upon her."},
		["Talk to Gathiel"] =
			{appendText=", gathered near the other suspects, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood. She's frantic, grasping at her husband's arm and shying away from the villagers."},
		["Escort Gathiel to the Judgment Chamber"] =
			{appendText=", found behind a door south of the first chamber, in the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood."},
		["Witness Judgment 3"] =
			{appendText=". A massive strangler sits atop a pile of bones, while ghostly spriggans watch the scene with cold, vengeful eyes.", stepTextKey="I have brought the guilty to the judgment chamber, and shall now watch her fate."},
		["Return to Treethane Rolon 3"] =
			{appendText=", waiting for you in the central chamber of the sacred cave near Karthdar's waterfall, a village on the northeastern edge of Grahtwood.", stepTextKey="Gathiel has met her fate. I should return to Treethane Rolon and let him know the deed is done."},
	},

[GetQuestName(4895)] = { --"Phantom Guilt"--Rosque
        ["Investigate the Area"] =
            {appendText=" around Forked Root Camp."},
        ["Go to Goldfolly Cemetery"] =
            {appendText=" near the town of Goldfolly. To reach it, go along the north road out of Elden Root and head west towards the edge."},
        ["Find Name of Deceased from Tombstone"] =
            {appendText=". If the journal is to be believed, the grave beneath it should be relatively new."},
        ["Talk to Azabesh"] =
            {appendText=" at the graveyard south of Goldfolly."},
        ["Find the Jeweler in Cormount"] =
            {appendText=", north of Elden Root."},
        ["Find the Jeweler"] =
            {appendText="."},
        ["Talk to Rondrin 1"] =
            {appendText=" in his house in Cormount.", stepTextKey="I found Rondrin, the amulet's creator. When I told him what happened, he seemed distraught it had harmed so many people. I should decide whether to let him punish himself or encourage him to destroy the amulet."},
        ["Talk to Rondrin 2"] =
            {appendText=" in his house in Cormount.", stepTextKey="I convinced Rondrin to wear the amulet, as a just punishment for the deaths he caused."},
        ["Witness the Amulet's Destruction"] =
            {appendText=" in his house in Cormount."},
        ["Talk to Rondrin 3"] =
            {appendText=" in his house in Cormount.", stepTextKey="I convinced Rondrin to destroy the amulet, ending its threat forever."},
    },


[GetQuestName(4908)] = { --"Rare Imports"--OneSkyGod
        ["Talk to Enthoras 1"] =
            {appendText=", a Wood Elf alchemist peddling wares on an Aldmeri-built lookout platform north of Elden Root, which provides an excellent view of the surrounding area, including the nearby lake that is infested with crocodiles.", stepTextKey="I should speak with Enthoras about this opportunity."},
        ["Go to Redfur Trading Post"] =
            {appendText=", a trading outpost known for its leniency towards thieves who steal from the wealthy, distribute the stolen goods to the poor, and possess the skill to evade capture."},
        ["Talk to Aranecarne"] =
            {appendText=". She is rumored to have the best carrots and radishes and has a stall where she sells them. Although they are pricey, they are well worth the cost, especially in an area where the green pact is practiced."},
        ["Collect Crate"] =
            {appendText=" near Redfur Trading Post's waterfall."},
	["Talk to Enthoras 2"] =
            {appendText=" a dubious Wood Elf alchemist who peddles his questionable wares from an Aldmeri-built lookout platform located north of Elden Root. From this vantage point, he can keep an eye on the surrounding area, including the nearby lake infested with crocodiles, and take advantage of unsuspecting customers with his manipulative tactics.", stepTextKey="Enthoras's missing shipment was infested with kwama from Stonefalls. I should bring him what's left of the shipment."},
        ["Deliver the Crate to Alyxe"] =
            {appendText=". Travel west on the road from Enthoras's Aldmeri-built lookout north of Elden Root until you reach a cemetery, then head east into the woods until you see Alyxe's hut."},
        ["Stir the Contents of the Crate into the Earthenware Pot"] =
            {appendText=" in Alyxe's hut east of the Gil-Var-Delle Wayshrine."},
        ["Talk to Alyxe"] =
            {appendText=" in her hut east of the Gil-Var-Delle Wayshrine."},
    },

[GetQuestName(4950)] = { --"Storgh's Bow" --Rosque
        ["Search for Storgh"] =
            {appendText=" in Vinedeath Cave. Orthelos mentioned it casually by name, so it may be a well-known location near a thoroughfare."},
        ["Take Storgh's Bow"] =
            {appendText=" in Vinedeath Cave, near a skyshard."},
        ["Deliver the Bow to Orthelos"] =
            {appendText=" on an eastern root."},
    },

	[GetQuestName(4842)] = { --"The Unquiet Dead" --kayreb
		["Talk to Andewen 1"] =
			{appendText=" who is seated inside a grey and yellow tent in the encampment that lays just east of the Ossuary of Telacar.", stepTextKey="I found a map of the area on the body of a Mages Guild explorer. It mentioned someone named \"Andewen\" in a nearby base camp. I should try to find Andewen and learn what's going on."},
		["Rescue Acolytes"] =
			{appendText=" who are ensnared by purple spectral chains in the ruins encircling the base of the Ossuary of Telacar. One awaits rescue in the ruins along the northern edge, another is trapped along the western edge, and the final acolyte can be found chained on the southern edge."},
		["Talk to Kelurmend"] =
			{appendText=", a researcher who crouches next to one of the sets of stairs that climb the southeastern slopes towards the center of the Ossuary of Telacar."},
		["Find the Bone Scepter in the Base Camp"] =
			{appendText=" to the east of the Ossuary, where you first met Andewen. If you ask her, she will inform you that you will find the scepter in her pack, which lays outside the tent."},
		["Talk to Andewen 2"] =
			{appendText=", who remains seated in her tent at the encampment to the east of the Ossuary of Telacar.", stepTextKey="Andewen may know more about this bone scepter that seems to have awakened the shades. I should speak with her."},
		["Defeat the Pale Sentinel"] =
			{appendText=", who takes the form of a possessed soldier that attacks those headed towards the center of the Ossuary of Telacar."},
		["Talk to the Pale Sentinel 1"] =
			{appendText=", who has retreated into the center of the Ossuary of Telacar.", stepTextKey="The Pale Sentinel fled to the center of the ruins after I tried to control it with the bone scepter. I should pursue it in its weakened state and attempt to control it completely."},
		["Enter Ossuary Crypt"] =
			{appendText=" through the entrance at the bottom of the stairs found in the very center of the Ossuary of Telacar."},
		["Talk to the Pale Sentinel 2"] =
			{appendText=", who is waiting just inside the entrance of the crypt at the Ossuary of Telacar's center.", stepTextKey="I entered the ossuary crypt. I should speak with the Pale Sentinel about how to prevent Telacar from waking."},
		["Collect Glowy Vial"] =
			{appendText=" from the room at the bottom of the stairs that are located on your left when you reach the end of the eastern corridor in the Ossuary's crypt. A ghostly alchemist guards its location on a stone table."},
		["Collect Old Skull"] =
			{appendText=" from the dungeon at the bottom of the stairs that are located on your right when you reach the end of the eastern corridor in the Ossuary's crypt. A ghostly bailiff guards its location on a stone table."},
		["Collect Vastarie's Journal"] =
			{appendText=" by heading due south upon entering the Ossuary's crypt and turning right upon reaching the two stone bookcases. Enter the room guarded by a ghostly seneschal to find the journal on a wooden table."},
		["Collect Milky Rock"] =
			{appendText=", which is carried by the spectral spirits inhabiting the Ossuary's crypt."},
		["Reinforce Inner Sanctum Ward"] =
			{appendText=" which can be found at the end of the long southern corridor in the Ossuary's crypt. Reinforce the ward by placing the milky stone upon The Atronach's altar, the old skull upon the The Lord's altar, and the glowy vial upon The Apprentice's altar.\n"},
		["Talk to Telacar's Projection 1"] =
			{appendText=", which hovers in front of the tree-adorned doorway that blocks the way leading deeper into the southern reaches of the Ossuary's crypt.", stepTextKey="Despite reinforcing the ward, Telacar forced his spirit through and captured the Pale Sentinel! He demanded I speak with him."},
		["Enter the Inner Sanctum"] =
			{appendText=" through the tree-adorned doorway that leads deeper into the southern reaches of the Ossuary's crypt."},
		["Defeat Calion's Husk"] =
			{appendText=", a giant creature who guards the entrance to the throne room as you venture further into the southern chambers of the Ossuary's crypt."},
		["Enter the Throne Room"] =
			{appendText=" through the second tree-adorned doorway that leads into the southernmost chamber of the Ossuary's crypt."},
		["Talk to Telacar's Projection 2"] =
			{appendText=", which hovers in front of the throne in the southernmost chamber of the Ossuary's crypt.", stepTextKey="I don't know what Telacar plans, but the Pale Sentinel seems to be in agony. If I hope to stop this, I should speak with Telacar."},
		["Decide who to bind with the Bone Scepter"] =
			{appendText=" by using it on Calion's Husk, which stands in the throne room located at the southern end of the Ossuary's crypt, or by using it on Telacar, whose body sits on the throne.\n"},
		["Talk to Calion"] =
			{appendText=", whose spirit hovers in the throne room located at the southern end of the Ossuary's crypt."},
		["Talk to Telacar's Projection 3"] =
			{appendText=", which hovers in the throne room located at the southern end of the Ossuary's crypt.", stepTextKey="I reunited Calion's spirit with his body. I should speak with Telacar about putting his shades to rest."},
	},

[GetQuestName(4939)] = { --"Until Death"--OneSkyGod
        ["Use Dog Whistle"] =
            {appendText=" at the fork of the road west of the Elden Root Temple Wayshrine."},
        ["Pet Eat Eat"] =
            {appendText=" at the fork of the road west of the Elden Root Temple Wayshrine."},
        ["Follow Eat Eat"] =
            {appendText=" from the fork of the road west of the Elden Root Temple Wayshrine."},
        ["Talk to Ninglenel"] =
            {appendText=" underneath a cliff on the side of the road northwest of the Elden Root Temple Wayshrine."},
    },

[GetQuestName(4966)] = { --"Wanted: Sgolag"--Rosque
        ["Collect Sgolag's Head"] =
            {appendText=" inside Mobar Mine."},
        ["Talk to Curinaire"] =
            {appendText=" near the Altmer Embassy, south of Elden Root."},
    }, 

[GetQuestName(4977)] = { --"Ancient Stones, Ancient Words"--Rosque
        ["Find the Corner Fragment"] =
            {appendText=" near the submerged Ayleid ruin off the western coast of Grahtwood. There may be other ruins near the main one that are still above the water level."},
        ["Find the Bottom Fragment"] =
            {appendText=" near the submerged Ayleid ruin off the western coast of Grahtwood. While many fragments may exist, they're only helpful if they can be found on the islands near the main ruin."},
        ["Find the Upper Fragment"] =
            {appendText=" near the submerged Ayleid ruin off the western coast of Grahtwood. A fragment may have survived near the main ruin itself."},
        ["Find the Center Fragment"] =
            {appendText=" near the submerged Ayleid ruin off the western coast of Grahtwood. If the fisherman Eminaire met found a fragment near the coast, it's possible another piece is close by on an island."},
        ["Talk to Eminaire 1"] =
            {appendText=" at the ayleid ruin northeast of the Falinesti Winter Site.", stepTextKey="I found several Ayleid fragments that might be what Eminaire is looking for. I should bring them to her back at her camp."},
        ["Find a Scholar of Ayleid Language"] =
            {appendText=". There is an ayleid ruin northeast of the Falinesti Winter Site that may be frequented by scholars."},
        ["Talk to Eminaire 2"] =
            {appendText=" at the ayleid ruin northeast of the Falinesti Winter Site.", stepTextKey="I should see if Eminaire has any interest in the fragments I recovered."},
    },

[GetQuestName(4915)] = { --"Blood Hunt"--Rosque
        ["Talk to Sabonn 1"] =
            {appendText=", south of Goldfolly.", stepTextKey="Sabonn has suggested I introduce myself to the rest of his team. I may simply ask him to go over the plan instead."},
        ["Listen to the Plan"] =
            {appendText=", south of Goldfolly."},
        ["Get Into Position"] =
            {appendText=". Sabonn tasked me with luring the vampires out into the middle of Goldfolly."},
        ["Activate the Fountain"] =
            {appendText=" in the middle of Goldfolly. Dropping the bloodstone into it should be enough."},
        ["Defeat All Feral Vampires"] =
            {appendText=" in Goldfolly."},
        ["Talk to Sabonn 2"] =
            {appendText=" in Goldfolly.", stepTextKey="We've successfully executed the plan, but the vampire lord failed to show himself. I should regroup with the others and speak with Sabonn to determine our next step."},
        ["Check on Agalir at the East Gate"] =
            {appendText=" of Goldfolly."},
        ["Examine Agalir's Body"] =
            {appendText=" outside of Goldfolly."},
        ["Talk to Sabonn 3"] =
            {appendText=" outside the east gate of Goldfolly.", stepTextKey="The plan seems to have had unintended consequences. The Redguard's body is a burnt husk, and Sabonn has returned without Zungarg. I should talk to him to see what he found."},
        ["Listen to Zungarg"] =
            {appendText=" outside the east gate of Goldfolly."},
        ["Find the Vampire Lord's Lair"] =
            {appendText=" near Goldfolly. Sabonn might be able to remind me where to look."},
        ["Kill the Vampire Lord"] =
            {appendText=" inside Faltonia's Mine."},
        ["Talk to Sabonn 4"] =
            {appendText=" outside Faltonia's Mine.", stepTextKey="We've defeated the vampire lord but at a heavy cost. Sabonn has lost both of his companions. I should speak with him."},
    },


[GetQuestName(4968)] = { --"Caring for Kwama"--Rosque
        ["Recover Nimriell's Research"] =
            {appendText=" from her camp. She said that it was at the bottom, near the kwama nest."},
        ["Talk to Nimriell"] =
            {appendText=" at her camp outside Burroot Kwama Mine."},
    },


[GetQuestName(4398)] = { --"A Chief Concern"--Rosque
        ["Search for Gargak"] =
            {appendText=" north of the wood orc stronghold in Reman's Bluff."},
        ["Talk to Gargak"] =
            {appendText=" north of the wood orc stronghold in Reman's Bluff."},
        ["Challenge Gargak to Fight"] =
            {appendText=" north of the wood orc stronghold in Reman's Bluff."},
        ["Convince Gargak to End His Feud"] =
            {appendText=" to stop the attacks on Barkbite Stronghold."},
        ["Meet Gargak at Base of Tower"] =
            {appendText=" north of the wood orc stronghold in Reman's Bluff."},
        ["Kill Gargak"] =
            {appendText=" inside the tower north of the wood orc stronghold in Reman's Bluff."},
        ["Return to Moramat"] =
            {appendText=". She should still be in the Chief's Longhouse in Reman's Bluff."},
        ["Tell Chief Dushkul that Gargak is dead"] =
            {appendText=". He'll be in the Chief's Longhouse in Reman's Bluff."},
        ["Meet Gargak's Ally in Abandoned Iron Mine"] =
            {appendText=". The entrance to the mine should be east of the imperial tower in Reman's Bluff."},
        ["Talk to Rakhaz"] =
            {appendText=" inside the imperial iron mine. The entrance to the mine should be east of the imperial tower in Reman's Bluff."},
        ["Find Ore Vein"] =
            {appendText=" inside the mine. The entrance to the mine should be east of the imperial tower in Reman's Bluff."},
        ["Wait for Rakhaz's Findings"] =
            {appendText=" inside the mine. The entrance to the mine should be east of the imperial tower in Reman's Bluff."},
        ["Return to Gargak"] =
            {appendText=" at the imperial tower in Reman's Bluff."},
    },


[GetQuestName(4395)] = { --"Enemies at the Gate"--Rosque
        ["Go to Barkbite Stronghold"] =
            {appendText=". The map on the back side of the note shows its location as down the road southwest from Redfur Trading Post."},
        ["Talk to Sharnag"] =
            {appendText=" at the gate."},
        ["Talk to Shaman Bogham 1"] =
            {appendText=" in the Chief's Longhouse.", stepTextKey="Sharnag thinks Barkbite Stronghold has been cursed. I should speak with Shaman Bogham to see if I can lend a hand."},
        ["Take Well Water from the Village Well"] =
            {appendText="."},
        ["Take Chunk of Meat from Table"] =
            {appendText="."},
        ["Take Clothing from the Clothing Chest"] =
            {appendText=" near the east side of the forge."},
        ["Give the Items to Shaman Bogham"] =
            {appendText=" in the Chief's Longhouse."},
        ["Wait for Shaman Bogham to Complete His Testing"] =
            {appendText=" in the Chief's Longhouse."},
        ["Talk to Shaman Bogham 2"] =
            {appendText=" in the Chief's Longhouse.", stepTextKey="Shaman Bogham appears to have finished his evaluation of the items. I should ask him what he's found."},
        ["Collect Venom Sac from Broodmother"] =
            {appendText=" deep within the mine. The mine entrance is inside the wood orc stronghold."},
        ["Return to Reman's Bluff"] =
            {appendText=" to find the shaman."},
        ["Talk to Namoroth"] =
            {appendText=" at the entrance to the mine inside the stronghold."},
        ["Kill the Red Sun Bandits"] =
            {appendText=" at the north end of the stronghold."},
        ["Give the Venom Sac to Shaman Bogham"] =
            {appendText=" in the Chief's Longhouse."},
    },

[GetQuestName(4397)] = { --"The Enemy Within"--Rosque
        ["Talk to Moramat"] =
            {appendText=" in the Chief's Longhouse inside the wood orc stronghold in Reman's Bluff."},
        ["Question Reman's Bluff Citizens"] =
            {appendText=". The shaman, forgewives, cook, and gate guards may be candidates."},
        ["Find Evidence of the Poisoner's Identity"] =
            {appendText=". If there's any evidence in the mine, the entrance is within the stronghold."},
        ["Consult with Moramat"] =
            {appendText=". She should still be in the Chief's Longhouse in Reman's Bluff."},
        ["Ask Shakul About the Knife"] =
            {appendText=" in Reman's Bluff."},
        ["Confront Rakhaz 1"] =
            {appendText=" at the forge in Reman's Bluff.", stepTextKey="It's very odd that Rakhaz's blade would be in a spider in the mine. I should confront her."},
        ["Tell Moramat that Rakhaz was the Poisoner"] =
            {appendText=". She should still be in the Chief's Longhouse in Reman's Bluff."},
        ["Confront Rakhaz 2"] =
            {appendText=" at the forge in Reman's Bluff.", stepTextKey="After reviewing everyone's alibis with Moramat, it looks like Rakhaz has been lying. I should confront her."},
    },

[GetQuestName(4893)] = { --"Flipping the Coin"--Rosque
		["Talk to Tulira 1"] =
			{appendText=".", stepTextKey="I agreed to speak to the guard pursuing Cinder-Tail."},
		["Talk to Cinder-Tail"] =
			{appendText="."},
		["Redeem Hollow Moon Token"] =
			{appendText=" in Redfur Trading Post. Somebody near the temple may be able to better explain its significance."},
		["Talk to Valirr 1"] =
			{appendText=" in the ruined temple, inside Redfur Trading Post. Fadi explained that the Hollow Moon is a charity that steals from the wealthy, and their tokens allow them to identify the impoverished to offer them aid. She suggested that Valirr might be able to use some help.", stepTextKey="The Hollow Moon informed me that their token is only to be used by the desperate and needy. Their representative indicated that Valirr, their leader in Redfur, might have some work for me."},
		["Talk to Valirr 2"] =
			{appendText=" inside the ruined temple.", stepTextKey="Valirr may need my help with an issue at Redfur Trading Post."},
		["Talk to Tulira 2"] =
			{appendText=". Being the leader of Jode's Chariot, she'll probably be somewhere near the stockades in Redfur.", stepTextKey="Valirr asked me to recover a lost relic from the Tomb of Anahbi beneath the headquarters of Jode's Chariot in Redfur. Tulira, their leader, holds the key to this trap-infested ruin."},
		["Enter the Tomb of Anahbi"] =
			{appendText=" in the temple behind the stockades in Redfur. Tulira asked me to be careful when searching for its treasure."},
		["Survive the Gauntlet"] =
			{appendText=" in Anahbi's Tomb, beneath the temple behind the stockades in Redfur."},
		["Unlock the Reliquary"] =
			{appendText=" in Anahbi's Tomb, beneath the temple behind the stockades in Redfur."},
		["Plunder the Reliquary"] =
			{appendText=" in Anahbi's Tomb, beneath the temple behind the stockades in Redfur."},
		["Return to the Surface"] =
			{appendText=". There may be an easy way out of the tomb to return to Redfur."},
		["Meet Shan-ra"] =
			{appendText=" in the middle of Redfur Trading Post."},
		["Talk to Shan-ra"] =
			{appendText=" in the middle of Redfur Trading Post."},
		["Talk to Valirr 3"] =
			{appendText=" in the middle of Redfur Trading Post.", stepTextKey="When Shan-ra offered me my choice of reward, I asked him to call off the Thalmor inspection. I should speak with Valirr to find out what happens next."},
		["Talk to Valirr 4"] =
			{appendText=" in the middle of Redfur Trading Post.", stepTextKey="Valirr seems quite pleased with the outcome, though Jode's Chariot will also receive a token of Shan-ra's appreciation.\n\nI should speak with him to see if he has anything else for me in Redfur."},
	},

[GetQuestName(4786)] = { --"The Innkeeper's Daughter"--OneSkyGod
        ["Go to Bandit Camp"] =
            {appendText=" located near the trading post's thundering waterfall. The camp is shrouded in secrecy as the deafening noise of the water conceals some of their activities, keeping them hidden from plain sight."},
        ["Untie Larasel"] =
            {appendText=" at the bandit's camp located south of the trading post's thundering waterfall."},
        ["Defeat Ambushers"] =
            {appendText=" at the bandit's camp located south of the trading post's thundering waterfall."},
        ["Find Proof of Nellor's Involvement"] =
            {appendText=" at the bandit's camp located south of the trading post's thundering waterfall."},
        ["Talk to Nellor 1"] =
            {appendText=". He may still be waiting cluelessly at his shop The Heary Hoarvor, unaware of my fortunate circumstances.", stepTextKey="I found proof Nellor sent many travelers such as myself into bandit ambushes. I should confront him immediately."},
        ["Bring Nellor to the Authorities"] =
            {appendText=". It seems that they have a policy of displaying criminals in a large open-air cage.\n"},
        ["Bring Nellor to His Stash"] =
            {appendText=". Below the small tavern owned by Chef Boeuf Sterone, known as Meat, Mimics, and More, lies an area that is unlikely to be searched by anyone due to the disposal of what some say is poisonous food waste in the back."},
        ["Talk to Nellor 2"] =
            {appendText=" below the small tavern owned by Chef Boeuf Sterone, known as Meat, Mimics, and More.", stepTextKey="I decided to bring Nellor to his \"stash\" instead of the guard captain. I should talk to Nellor about my reward for staying silent."},
        ["Speak to Captain Halakalal About Reward"] =
            {appendText="."},
    },

[GetQuestName(4954)] = { --"Light in the Darkness"--Rosque
        ["Fill the Gem at the Ayleid Well"] =
            {appendText=". It'll likely be in a heavily guarded grand chamber, inside Wormroot Depths."},
        ["Talk to Archimbert Dantaine"] =
            {appendText=" outside of Wormroot Depths."},
    },

[GetQuestName(4984)] = { --"A Lucrative Scheme"--Rosque
        ["Bring the Journal to Moramat"] =
            {appendText=". Wood orcs live in strongholds, and the journal implies that this one shouldn't be too far north from the Tarlain Bandit Camp."},
        ["Talk to Moramat"] =
            {appendText=" in Reman's Bluff, inside the Chief's Longhouse."},
    },

[GetQuestName(4914)] = { --"The Wakening Dark"--Rosque
        ["Search for Survivors"] =
            {appendText=" in the forests outside of Gil-Var-Delle. It's a large area, so it may be worthwhile to look through side roads for a place they may have taken shelter in."},
        ["Talk to Meva Nelenim"] =
            {appendText=" in the Abandoned Cave northeast of Gil-Var-Delle."},
        ["Talk to High Ordinator Danys 1"] =
            {appendText=" in the Abandoned Cave northeast of Gil-Var-Delle.", stepTextKey="Meva told me the group failed to put an end to the Dark Anchor because it was being empowered by strange devices. I should see what Danys has to say about this."},
        ["Destroy Western Fang"] =
            {appendText=" at the end of a creek outside of Gil-Var-Delle."},
        ["Destroy Northern Fang"] =
            {appendText=" on a ledge outside of Gil-Var-Delle."},
        ["Destroy Eastern Fang"] =
            {appendText=" near the ramp outside of Gil-Var-Delle."},
        ["Destroy Southern Fang"] =
            {appendText=" on the path outside of Gil-Var-Delle."},
        ["Shut Down the Dark Anchor"] =
            {appendText=" inside of Gil-Var-Delle."},
        ["Talk to High Ordinator Danys 2"] =
            {appendText=" inside of Gil-Var-Delle.", stepTextKey="The Dark Anchor has been banished for now. I should speak with High Ordinator Danys."},
    },

[GetQuestName(4975)] = { --"The Wounded Wood"--Rosque
        ["Draw Water from the Shrine Basin"] =
            {appendText=" at the Temple of the Eight."},
        ["Dispense Water at Upper Crest"] =
            {appendText=" falls, near to where the water just starts to flow out of the hillside."},
        ["Dispense Water at Middle Crest"] =
            {appendText=" falls, where it flows out from a natural lake."},
        ["Dispense Water at Lower Crest"] =
            {appendText=" falls, just after the whitewater rapids become calm again."},
        ["Talk to Erthonor"] =
            {appendText=" at the falls due northeast of Gil-Var-Delle."},
    },





--GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE --GREENSHADE

[GetQuestName(4735)] = { --"The Staff of Magnus"--Rosque
	["Find Captain Sarandil"] =
 		{appendText=" in the marketplace."},
	["Follow Captain Sarandil to the Mages Guild"] =
            {appendText=" from the Marbruk markets."},
        ["Wait for Captain Sarandil to Unlock the Vault"] =
            {appendText=" in the Marbruk Mages Guild."},
        ["Enter Marbruk's Vault"] =
            {appendText=" inside the Mages Guild."},
        ["Enter the Relic Room"] =
            {appendText=" inside the Mages Guild Primary Vault."},
        ["Enter the Inner Vault"] =
            {appendText=" inside the Mages Guild Primary Vault."},
        ["Secure the Staff of Magnus"] =
            {appendText=" inside the Mages Guild Primary Vault."},
        ["Talk to Captain Sarandil 1"] =
            {appendText=" inside the Mages Guild Primary Vault.", stepTextKey="The Staff of Magnus in the vault was a fake! Captain Sarandil must know more about the theft."},
        ["Return to the Grand Hall"] =
            {appendText=" of the Mages Guild."},
        ["Talk to Captain Sarandil 2"] =
            {appendText=" in the Mages Guild.", stepTextKey="I have returned to the Grand Hall. Captain Sarandil is here, questioning the soldiers on watch."},
        ["Listen to the Herald"] =
            {appendText=""},
        ["Talk to Queen Ayrenn"] =
            {appendText=" outside the Mages Guild in Marbruk."},
        ["Talk to Captain Sarandil 3"] =
            {appendText=" in the Mages Guild.", stepTextKey="I should talk to Captain Sarandil in the Mages Guild to follow up on the staff's disappearance."},
    },

[GetQuestName(4573)] = { --"Frighten the Fearsome"--Rosque
        ["Talk to Hazazi"] =
            {appendText=" just south of Marbruk."},
        ["Talk to the Treethane 1"] =
            {appendText=". The leaders of any culture are usually found in the fanciest house.", stepTextKey="I should speak to the Bramblebreach treethane to find out why they're opposed to the Dominion."},
        ["Find the Shimmering Tree"] =
            {appendText=" at the eastern edge of Bramblebreach."},
        ["Talk to Aranias"] =
            {appendText=" at the eastern edge of Bramblebreach."},
        ["Gather Seeds"] =
            {appendText=" from the Shimmering Kollopi Tree at the eastern edge of Bramblebreach."},
        ["Gather Kollopi Essence"] =
            {appendText=""},
        ["Plant Northern Seed"] =
            {appendText=" in the Wood Orcs' camp east of Bramblebreach. Treethane Niriel said to plant the seeds in soft peat; there may be some near the northern edge of the camp."},
        ["Plant Southern Seed"] =
            {appendText=" in the Wood Orcs' camp east of Bramblebreach. Treethane Niriel said to plant the seeds in soft peat; there may be some near the southern edge of the camp."},
        ["Plant Central Seed"] =
            {appendText=" in the Wood Orcs' camp east of Bramblebreach. Treethane Niriel said to plant the seeds in soft peat. Sometimes, peat can be revealed when trees have been felled nearby."},
	["Plant Northeastern Seed"] =
            {appendText=" in the Wood Orcs' camp east of Bramblebreach. Treethane Niriel said to plant the seeds in soft peat. Sometimes, peat can be revealed when trees have been felled nearby."},
        ["Kill the Orc Chieftain"] =
            {appendText=" in the deepest part of the Wood Orcs' camp."},
        ["Talk to the Treethane 2"] =
            {appendText=" in the Treethane's Chambers.", stepTextKey="I planted Kollopi Seeds to sprout guardians within the Wood Orcs' camp and I killed their chieftain to drive them away. I should return and speak to the Bramblebreach treethane."},
    },

[GetQuestName(4593)] = { --"Audience with the Wilderking"--Rosque
        ["Touch the Petitioning Stone"] =
            {appendText=". Treethane Niriel said that it was just south of Bramblebreach."},
        ["Talk to the Wilderking 1"] =
            {appendText=" at the Petitioning Stone, south of Bramblebreach.", stepTextKey="I touched the Petitioning Stone and the Wilderking appeared. I should speak to him."},
        ["Defeat Apparition"] =
            {appendText=" at the Stone Pillar, above the Petitioning Stone, south of Bramblebreach."},
        ["Talk to the Wilderking 2"] =
            {appendText=" at the Petitioning Stone, south of Bramblebreach.", stepTextKey="I summoned and defeated an apparition of the late Veiled Heritance member, Advisor Norion. I must speak to the Wilderking to find out if he now recognizes our common enemies."},
        ["Learn the Veiled Heritance Member's Identity"] =
            {appendText=" at the Petitioning Stone, south of Bramblebreach."},
        ["Talk to the Wilderking 3"] =
            {appendText=" at the Petitioning Stone, south of Bramblebreach.", stepTextKey="The vision revealed that the Veiled Heritance sent Aranias and Andur here to kill the Wilderking, yet he still doesn't consider them enemies. I must speak to him about this."},
    }, 

[GetQuestName(4657)] = { --"The Spinner's Tale"--Rosque
        ["Talk to Maruin"] =
            {appendText=" at his cottage, overlooking a great labyrinth."},
    },



[GetQuestName(4586)] = { --"The Witch of Silatar"--Rosque
		["Talk to Maruin 1"] =
			{appendText=" in the Spinner's Cottage.", stepTextKey="Maruin can explain to me how I will change Aranias' story."},
		["Ask Maruin to Begin the Story"] =
			{appendText=" in the Spinner's Cottage."},
		["Talk to Aranias 1"] =
			{appendText=" inside the Spinner Maruin's story.", stepTextKey="I've been sent into Aranias' past, when she lived with her parents on an island near Summerset. Maruin told me to talk with her and become her friend."},
		["Reach the Lighthouse"] =
			{appendText=". I should be able to find it if I chase after Aranias inside the Spinner Maruin's story."},
		["Talk to Aranias 2"] =
			{appendText=" at the lighthouse at the south end of the island inside the Spinner Maruin's story.", stepTextKey="Bramble vines grabbed my legs to slow me down, and Aranias easily won the race. I should ask her whether she had anything to do with the vines."},
		["Clear the Farm of Bandits"] =
			{appendText=" inside the Spinner Maruin's story."},
		["Talk to Aranias 3"] =
			{appendText=" inside the Spinner Maruin's story.", stepTextKey="After we killed a bandit within the burnt farmhouse, Aranias seemed more agitated. I should talk to her to make sure she's all right."},
		["Talk to Maruin 2"] =
			{appendText=" at the farm inside his Spinner's story.", stepTextKey="Aranias lost her temper with me, but just as quickly became contrite. She told me to meet her at the manor house, but Maruin's appeared within the story. I should talk with him first."},
		["Witness Aranias' Story"] =
			{appendText=" at the lake on Silatar inside the Spinner's Cottage."},
		["Talk to Maruin 3"] =
			{appendText=" at the lake island on Silatar inside the Spinner's Cottage.", stepTextKey="Although Aranias was proud of her ability to sculpt the ground, her parents were less pleased. I should talk to Maruin about this story's significance."},
		["Find the Lighthouse Story"] =
			{appendText=" at the south end of Silatar inside the Spinner's Cottage."},
		["Find the Great Hall Story"] =
			{appendText=" in the Silatar Manor inside the Spinner's Cottage."},
		["Use the Dresser to Change Clothes"] =
			{appendText=" in the Manor inside the Spinner Maruin's story."},
		["Talk to Aranias in the Manor Garden"] =
			{appendText=" in the Spinner Maruin's story."},
		["Eavesdrop on Veiled Heritance Party-Goers"] =
			{appendText=" at the manor gardens inside the Spinner Maruin's story."},
		["Talk to Andur in the Field"] =
			{appendText=" west of the manor in Spinner Maruin's story."},
		["Kill Andur"] =
			{appendText=" west of the manor in Spinner Maruin's story."},
		["Talk to Salalin"] =
			{appendText=" west of the manor in Spinner Maruin's story."},
		["Talk to Maruin 4"] =
			{appendText=" west of the manor inside the story in the Spinner's Cottage.", stepTextKey="The Veiled Heritance plans to use a Bosmer woman as a target for Aranias' power. I must talk to Maruin to find out what we can do to prevent this senseless murder."},
		["Watch Aranias' Demonstration 1"] =
			{appendText=" in the manor gardens inside the Spinner Maruin's story.", stepTextKey="Aranias will soon be demonstrating her power for the Veiled Heritance. I need to reach her before her demonstration can occur."},
		["Watch Aranias' Demonstration 2"] =
			{appendText=" in the manor gardens inside the Spinner Maruin's story.", stepTextKey="Aranias will begin her demonstration for the Veiled Heritance. I need to watch, to see whether she took my words to heart."},
		["Talk to Maruin 5"] =
			{appendText=".", stepTextKey="The vision of the past has ended and I am returned to the Spinner's Cottage. I should speak to Maruin."},
	},

[GetQuestName(4750)] = { --"Throne of the Wilderking"--Rosque
		["Travel to Greenheart"] =
			{appendText=", the deep forest south of a great labyrinth."},
		["Talk to the Wilderking 1"] =
			{appendText=" at the Greenheart Wayshrine.", stepTextKey="The Wilderking has appeared on the path. I should speak with him."},
		["Follow the Trail of Fire"] =
			{appendText="."},
		["Talk to the Wilderking 2"] =
			{appendText=" in the ruined manor in Greenheart.", stepTextKey="The Wilderking has appeared in my path. I should speak with him."},
		["Enter the Throne Tunnels"] =
			{appendText=" in the ruined manor in Greenheart."},
		["Find Aranias and Andur"] =
			{appendText=" in the Throne Tunnels beneath the ruined manor in Greenheart."},
		["Talk to Aranias 1"] =
			{appendText=" past the Throne Tunnels beneath the ruined manor in Greenheart.", stepTextKey="The Wilderking says he's dying and that Aranias is destined to replace him. I finally caught up and discovered that she's turned against Andur but needs my help to defeat him."},
		["Follow Aranias"] =
			{appendText=" deeper into Greenheart. It seems likely that the Wilderking's throne is at the top of the mountain, through the Throne Tunnels in the manor and higher along the path."},
		["Reach the Wilderking's Throne"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path."},
		["Find the Wilderking"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path."},
		["Kill Andur"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path."},
		["Enter the Throne Tower"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path."},
		["Talk to the Wilderking 3"] =
			{appendText=" in the Throne Tower at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path.", stepTextKey="I should speak to the Wilderking."},
		["Climb up the Tower 1"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path.", stepTextKey="The Wilderking says that he will soon die and that Aranias must accept the responsibility to take his place. I should climb the tower and speak to her."},
		["Talk to Aranias 2"] =
			{appendText=" atop the Throne Tower at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path.", stepTextKey="The Wilderking says that he will soon die and that Aranias must accept the responsibility to take his place. I should speak to her."},
		["Climb up the Tower 2"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path.", stepTextKey="The Wilderking is dying and Aranias has accepted that she must take his place. She's asked me to place the Wilderking's crown at the top of the tower to allow for her transformation."},
		["Place the Wilderking's Crown"] =
			{appendText=" in the gardens at the top of the Throne Tower."},
		["Talk to the Wilderqueen"] =
			{appendText=" at the top of the mountain in Greenheart, through the Throne Tunnels in the manor and past the fire on the path."},
	},

[GetQuestName(4853)] = { --"Woodhearth"--Rosque
        ["Go to Woodhearth"] =
            {appendText=". To reach it, head to the road north of Greenheart, and go as far west as is possible."},
        ["Talk to Yanaril"] =
            {appendText=" at the southern entrance of the city."},
    },


[GetQuestName(4574)] = { --"Veil of Illusion"--Rosque
        ["Talk to Razum-dar 1"] =
            {appendText=" inside the Thalmor Headquarters in Woodhearth.", stepTextKey="I should speak to Razum-dar to find out what he's learned about Pelidil's plans."},
        ["Talk to Treethane Fariel 1"] =
            {appendText=" inside the Thalmor Headquarters in Woodhearth.", stepTextKey="Razum-dar has devised a plan to flush out the traitors who are working with Pelidil. I need to speak to Treethane Fariel to get more of the details."},
        ["Talk to Razum-dar 2"] =
            {appendText=" inside the Thalmor Headquarters in Woodhearth. He... she? Razum-dar must know where the Imperial Underground is.", stepTextKey="To expose the traitors working with Pelidil, I am to escort Razum-dar disguised as Queen Ayrenn to the Old Imperial Underground, where we're expecting an assassination attempt. I should speak to Razum-dar when I'm ready to go."},
        ["Enter the Imperial Underground"] =
            {appendText=". Razum-dar, inside the Thalmor Headquarters in Woodhearth, must know where it is."},
        ["Meet Asteril"] =
            {appendText=" in the Imperial Underground, beneath the watchtower, north of Five Claws."},
        ["Talk to Razum-dar 3"] =
            {appendText=" in the Imperial Underground, beneath the watchtower, north of Five Claws.", stepTextKey="As expected, the Thalmor officer attempted to assassinate Razum-dar while he was disguised as the queen. Her attack knocked Razum-dar to the ground. I should speak to him to make sure he's all right."}, 
	["Search the Old Imperial Tunnels for Asteril"] =
            {appendText=", beneath the watchtower, north of Five Claws."},
        ["Retrieve Pelidil's Orders"] =
            {appendText=" in the Imperial Underground, beneath the watchtower, north of Five Claws."},
        ["Talk to Razum-dar 4"] =
            {appendText=" in the Imperial Underground, beneath the watchtower, north of Five Claws.", stepTextKey="I found orders from Pelidil in the Old Imperial Tunnels suggesting there is a larger force of Veiled Heritance somewhere near Woodhearth. I should bring the orders back to Razum-dar."},
        ["Talk to Treethane Fariel 2"] =
            {appendText=" inside the Thalmor Headquarters in Woodhearth.", stepTextKey="I found orders from Pelidil in the Old Imperial Tunnels suggesting there is a larger force of Veiled Heritance somewhere near Woodhearth. I should bring the orders back to Treethane Fariel."},
    },

[GetQuestName(4580)] = { --"Double Jeopardy"--Rosque
        ["Talk to Oromin 1"] =
            {appendText=" inside the Thalmor Headquarters in Woodhearth.", stepTextKey="To find Pelidil's location, I must confront Asteril, the Thalmor officer who was spying on Pelidil's behalf. I need to speak to Oromin about accompanying me to the Thalmor Residence."},
        ["Enter the Thalmor Residence"] =
            {appendText=". Oromin ran off too quickly to easily follow, but it's likely a large building, close to the Thalmor Headquarters in Woodhearth."},
        ["Examine Asteril's Corpse"] =
            {appendText=" inside the Thalmor Residence in Woodhearth."},
        ["Talk to Oromin 2"] =
            {appendText=" inside the Thalmor Residence in Woodhearth.", stepTextKey="Inexplicably, it appears as if Pelidil's spy, Asteril, has been dead for some time. I should speak with Oromin."},
        ["Explore the Hidden Passage"] =
            {appendText=" inside the Thalmor Residence in Woodhearth."},
        ["Search for Clues"] =
            {appendText=" in the hidden passage, inside the Thalmor Residence in Woodhearth."},
        ["Reach the Imperial Prison"] =
            {appendText=" from the passage, inside the Thalmor Residence in Woodhearth."},
        ["Search for Laryaril"] =
            {appendText=" deep inside the passage, under the Thalmor Residence in Woodhearth."},
        ["Talk to Laryaril"] =
            {appendText=" deep inside the passage, under the Thalmor Residence in Woodhearth."},
        ["Return to Woodhearth"] =
            {appendText="."},
        ["Talk to Treethane Fariel"] =
            {appendText=" inside the Thalmor Headquarters."},
    },

[GetQuestName(4744)] = { --"Before the Storm"--Rosque
        ["Reach Serpent's Grotto"] =
            {appendText=" by heading north, out of Woodhearth, and following the road north."},
        ["Travel to Seaside Sanctuary"] =
            {appendText="."},
        ["Talk to Major Cirenwe"] =
            {appendText="."},
    },

[GetQuestName(4765)] = { --"Pelidil's End"--Rosque
        ["Launch the Ship"] =
            {appendText=" from the Seaside Sanctuary harbor."},
        ["Go to the Ship's Deck"] =
            {appendText="."},
        ["Repel Maormer Boarders"] =
            {appendText="."},
        ["Use the Ballista to Shoot the Serpent"] =
            {appendText="."},
        ["Defeat the Serpent Using the Ballistae"] =
            {appendText="."},
        ["Repel Maorrmer Boarders"] =
            {appendText="."},
        ["Kill Vicereeve Pelidil"] =
            {appendText=". The dominion soldiers have forced the maormer's portal open. It should lead to Pelidil's ship."},
        ["Return to Seaside Sanctuary"] =
            {appendText="."},
        ["Talk to Captain Jimila"] =
            {appendText=" at the Seaside Sanctuary harbor."},
    },


[GetQuestName(4821)] = { --"Report to Marbruk"--Rosque
        ["Travel to Marbruk"] =
            {appendText="."},
        ["Talk to Queen Ayrenn"] =
            {appendText="."},
    },

[GetQuestName(5088)] = { --"Naemon's Return"--Rosque
        ["Talk to Scout Catannie at Driladan Pass"] =
            {appendText=", through the northern gate of Marbruk."},
    },

	[GetQuestName(4546)] = { --"Retaking the Pass"--Rosque
		["Find Mane Akkhuz-ri"] =
			{appendText=". Bodring said that he was stranded in the tunnels up the northern path from Marbruk."},
		["Allow Akkhuz-ri and Indaenir to Speak"] =
			{appendText=" in the tunnels up the northern path from Marbruk."},
		["Talk to Indaenir 1"] =
			{appendText=" in the tunnels up the northern path from Marbruk.", stepTextKey="Mane Akkhuz-ri is returning to Marbruk for reinforcement and suggested that I join Indaenir in trying to determing what the Shade's true motivations might be in ordering the attack on Marbruk."},
		["Meet Indaenir Outside"] =
			{appendText=" the Old Merchant Caves in Driladan Pass."},
		["Find the Skull of Ethril"] =
			{appendText=", around signs of Bosmer architecture."},
		["Find the Skull of Ollion"] =
			{appendText=", around signs of Bosmer architecture."},
		["Find the Skull of Thraul"] =
			{appendText=", around signs of Bosmer architecture."},
		["Take Skulls to Indaenir at Stone Table"] =
			{appendText=". Indaenir is likely preparing it in the middle of Driladan Pass."},
		["Interrogate the Skulls with Indaenir"] =
			{appendText=" in the middle of Driladan Pass."},
		["Close the Shadow Rifts"] =
			{appendText=". The Shadow Rifts might be hidden, but they are likely guarded; getting an overview of the river valley from a bridge may be a good way to search for necromantic activity."},
		["Defeat the Servant of Naemon"] =
			{appendText=". They may be controlling this realm from a central point of power."},
		["Talk to Indaenir 2"] =
			{appendText=" in the middle of Driladan Pass.", stepTextKey="I defeated the Servant of Naemon and escaped from the Shadow Wood. I need to talk to Indaenir to determine what's next."},
		["Talk to Bodring"] =
			{appendText=". He's likely still around the northern gate of Marbruk."},
	},

[GetQuestName(4850)] = { --"Shades of Green"--Rosque
        ["Drive the Undead from Driladan Pass"] =
            {appendText=", which connects Marbruk to the northern half of Valenwood."},
        ["Cleanse Verrant Morass"] =
            {appendText=", the grove to the northwest, past Driladan Pass."},
        ["Cleanse Dread Vullain"] =
            {appendText=", the town west of Verrant Morass. Maybe someone down the road knows what kind of corruption is afflicting the area."},
        ["Travel to Hectahame"] =
            {appendText=", the Ayleid ruin, northwest of Verrant Morass."},
        ["Talk to Queen Ayrenn at Hectahame"] =
            {appendText="."},
    },

	[GetQuestName(4608)] = { --"The Blight of the Bosmer"--Rosque
		["Activate East Standing Stone"] =
			{appendText=". If it's supposed to protect against the forest, it may be near a massive tree on the east side of the grove."},
		["Activate Central Standing Stone"] =
			{appendText=". If it's as ancient as Indaenir says, it may be difficult to distinguish from other ruins, but it'll have to be in a central location."},
		["Activate West Standing Stone"] =
			{appendText=". The Bosmer likely would have wanted protection near their homes, so it may be close to signs of civilization."},
		["Approach Eldest Den"] =
			{appendText=". It should be on the path somewhere around Verrant Morass."},
		["Talk to Indaenir 1"] =
			{appendText=".", stepTextKey="We've reached the entrance to the Eldest Den. I should speak to Indaenir about what to expect inside."},
		["Kill the Eldest and Extract Its Heart"] =
			{appendText=". The Eldest's Den is on the path north of Verrant Morass."},
		["Talk to Indaenir 2"] =
			{appendText=" in Verrant Morass.", stepTextKey="When I extracted the Eldest's heart, I was pulled into the realm of the Shadow Wood. I should speak with Indaenir about what to do next."},
		["Kill East Corrupted Tree Spirit"] =
			{appendText=". It may be near the standing stone and ruins at the east of the grove."},
		["Kill Central Corrupted Tree Spirit"] =
			{appendText=". It may be near the standing stone and ruins at the center of the grove."},
		["Kill West Corrupted Tree Spirit"] =
			{appendText=". It may be near the standing stone and ruins up the stairs at the west of the grove."},
		["Find Indaenir"] =
			{appendText=". He's likely near the Eldest Den off the path north of Verrant Morass."},
		["Defeat the Servant of Naemon"] =
			{appendText=""},
		["Talk to Indaenir 3"] =
			{appendText=" near the Eldest Den off the path north of Verrant Morass.", stepTextKey="I defeated the Servant of Naemon and escaped from the Shadow Wood. I should speak to Indaenir."},
	},

	[GetQuestName(4601)] = { --"Right of Theft"--Rosque
		["Talk to Indaenir 1"] =
			{appendText=" at the camp south of Dread Vullain.", stepTextKey="I was told that Indaenir may have a plan for returning the Blackroot clan warriors to their rest. I should speak with Indaenir."},
		["Watch Scenes of the Past"] =
			{appendText=". Indaenir implied it was the spirits of Bosmer that were trying to make contact, so it's likely that they'll be close to the town itself."},
		["Find the Nereid Temple"] =
			{appendText=". It must be located along a body of water, like a lake or a river."},
		["Talk to Indaenir 2"] =
			{appendText=" in front of the Nereid Temple at the top of Dread Vullain's waterfall.", stepTextKey="It seems the Vullain Villagers poisoned themselves to kill General Malgoth and the Blackroot clan. The general's spirit is compelled to fight now because something has stolen his bow and invoked the Right of Theft. I should speak to Indaenir."},
		["Enter the Nereid Temple"] =
			{appendText=" at the top of Dread Vullain's waterfall."},
		["Find General Malgoth's Remains"] =
			{appendText=" in the Nereid Temple at the top of Dread Vullain's waterfall."},
		["Take the Bow from the Servant of Naemon"] =
			{appendText=". Indaenir, outside of the waterfall cave, might be able to help, but otherwise searching through the forest around Dread Vullain is the only option."},
		["Talk to Indaenir 3"] =
			{appendText=" past the bridge northwest of Dread Vullain.", stepTextKey="I slew the Servant of Naemon and reclaimed General Malgoth's bow. I should speak to Indaenir about what to do next."},
		["Talk to General Malgoth"] =
			{appendText=" past the bridge northwest of Dread Vullain."},
		["Talk to Indaenir 4"] =
			{appendText=" past the bridge northwest of Dread Vullain.", stepTextKey="After speaking to General Malgoth, I should now talk to Indaenir and find out what to do next."},
	},

[GetQuestName(4690)] = { --"Striking at the Heart"--Rosque
        ["Talk to Indaenir 1"] =
            {appendText=".", stepTextKey="I should speak to Indaenir. Queen Ayrenn said he was near the main gate to Hectahame."},
        ["Wait for Indaenir to Cast"] =
            {appendText=" at the gates of Hectahame."},
        ["Talk to Indaenir 2"] =
            {appendText=" at the gates of Hectahame.", stepTextKey="Indaenir has used his connection to the Green to pull us into the Shadow Wood. He's hoping we can bypass the Shade's defenses in this realm. I should talk to him before we go in."},
        ["Enter the Hectahame Grotto"] =
            {appendText="."},
        ["Search for the Shade in Hectahame"] =
            {appendText=". It looks like there's an entrance in Hectahame Grotto."},
        ["Wait for Indaenir to Assess"] =
            {appendText=" in Hectahame Grotto."},
        ["Talk to Indaenir 3"] =
            {appendText=" in Hectahame Grotto.", stepTextKey="It seems the Shade has somehow blocked our path. I should speak to Indaenir about what to do next."},
        ["Retrieve and Place the Keystones"] =
            {appendText=" inside Hectahame Grotto. It's likely that Naemon's Shade placed them far apart."},
        ["Wait for Indaenir to Unseal the Door"] =
            {appendText=" in Hectahame Grotto."},
	["Enter Valenheart"] =
            {appendText=" in Hectahame Grotto."},
        ["Obtain the Staff of Magnus from the Shade"] =
            {appendText=", deep within Valenheart in Hectahame."},
        ["Talk to Indaenir 4"] =
            {appendText=", deep within Valenheart in Hectahame.", stepTextKey="The Shade is defeated and I've recovered the Staff of Magnus. I should speak to Indaenir."},
        ["Wait for Indaenir to Heal the Heart"] =
            {appendText=", deep within Valenheart in Hectahame."},
        ["Talk to Mane Akkhuz-ri"] =
            {appendText=", deep within Valenheart in Hectahame."},
        ["Witness the Ritual"] =
            {appendText=", deep within Valenheart in Hectahame."},
        ["Talk to Indaenir 5"] =
            {appendText=", deep within Valenheart in Hectahame.", stepTextKey="Indaenir was brought back from death. I should speak to him."},
        ["Talk to Queen Ayrenn 1"] =
            {appendText=" outside of Hectahame.", stepTextKey="I need to speak to Queen Ayrenn and let her know what happened."},
        ["Allow Queen Ayrenn to Speak to Indaenir"] =
            {appendText=" outside of Hectahame."},
        ["Talk to Queen Ayrenn 2"] =
            {appendText=" outside of Hectahame.", stepTextKey="I need to speak with Queen Ayrenn."},
    },

[GetQuestName(5006)] = { --"To Velyn Harbor"--Rosque
        ["Go to Velyn Harbor"] =
            {appendText=". To reach it, head north up the road from Hectahame, along the coast."},
        ["Talk to Someone In Charge"] =
            {appendText=". A good rule of thumb is to look for the fanciest clothes or suit of armor."},
    },

[GetQuestName(5072)] = { --"Aid for Bramblebreach"--Rosque
        ["Go to Bramblebreach"] =
            {appendText=". To reach it, head north from Greenheart, and follow the roads towards Marbruk. It will be on the way."},
        ["Speak to Gosellaneth"] =
            {appendText=" at Bramblebreach, near the northern fork in the road."},
    },


[GetQuestName(4790)] = { --"Breaking the Ward"--Rosque
        ["Talk to Dinwenel"] =
            {appendText=" at the front gates of Hectahame."},
        ["Talk to Bodring at Driladan Pass"] =
            {appendText=". To reach it, head down the road due east Hectahame, then trend southeast towards Marbruk."},
        ["Talk to Nara at Dread Vullain"] =
            {appendText=". To reach it, head south from Hectahame, and follow the road to the fork. If something really is troubling the Vinedusk Rangers though, she may be scouting around nearby."},
        ["Talk to Girin at Verrant Morass"] =
            {appendText=". To reach it, head due east from Hectahame, down along the rocky path, and follow the road east along the top of the grove. If Verrant Morass really is making Bosmer go feral, he might be holed up near somewhere safer, like a nearby landmark."},
    },

[GetQuestName(4739)] = { --"A Storm Upon the Shore"--Rosque
        ["Talk to Razum-dar and Select a Task"] =
            {appendText=". He's waiting just before the southern bridge to Seaside Sanctuary."},
        ["Rescue Meratille"] =
            {appendText="."},
        ["Rescue Bashshi-ra"] =
            {appendText="."},
        ["Rescue Ulmion"] =
            {appendText="."},
        ["Enter the Lighthouse"] =
            {appendText="."},
        ["Talk to Telonde"] =
            {appendText="."},
        ["Light the Beacon to Signal the Dominion Troops"] =
            {appendText="."},
        ["Talk to Major Cirenwe"] =
            {appendText=". If the fight's been started, she'll likely be at the southern bridge coordinating her forces."},
        ["Talk to Captain Jimila at the Prowler"] =
            {appendText=". She should still have it docked in the Seaside Sanctuary harbor."},
        ["Kill Commander Linundil"] =
            {appendText=". The siege equipment, overlooking the Seaside Sanctuary harbor, may be strategically significant enough to warrant direct supervision."},
        ["Kill Commander Ilyria"] =
            {appendText=". It can be difficult for many soldiers to resist the urge to loot the temples of opposing faiths."},
        ["Kill Commander Norevalion"] =
            {appendText=". It looks like the maormer have set up tents near the northern edge of the sanctuary. That may be the center of their command."},
    },
 

--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST--GREENSHADE SIDE QUEST
 

	[GetQuestName(4791)] = { --"The Artisan" --kayreb
		["Read Cinnar's Notes"] =
			{appendText=" for clues pertaining to the Artisan's identity. It also contains a list of citizens I should question."},
		["Deduce the Artisan's Identity"] =
			{appendText=". The various craftsmen and merchants around town have dealings with many of the citizens. I should see if any of them know anything. Marbruk's labourers and beggars likely pick up on details that others miss as well. I should be sure to carefully review my notes to ensure I don't confront the wrong person."},
		["Talk to Cinnar 1"] =
			{appendText=", he is poring over a book under one of Marbruk's blossoming trees.", stepTextKey="I discovered that Nidras is the Artisan. I should tell Cinnar."},
		["Find Earrastel's Item"] =
			{appendText=". Earrastel thinks that Calastil stole his heraldic cane in an attempt to impress the queen at court."},
		["Find Quertasse's Item"] =
			{appendText=". Quertasse has been blaming Earrastel for taking the drinking horn that was given to her and Cassirion as a wedding gift."},
		["Find Laurosse's Item"] =
			{appendText=". Laurosse heard that Quertasse's wedding gift has gone missing and thinks she took the censer that commemorated his own marriage out of spite. After all, she has always disapproved of his marriage to Erinel, proclaiming at every chance that the Altmer shouldn't mix with the Bosmer."},
		["Find Calastil's Item"] =
			{appendText=". Calastil has been extremely upset that the pelt of his beloved dog, Pluck, has been stolen. His wife, Tarie, has hinted that Laurosse took it as revenge for an altercation she had with Laurosse's wife, Erinel. Tarie has insinuated that illicit deeds are to be expected when an Altmer gets involved with a Bosmer."},
		["Talk to Hendare"] =
			{appendText=", a member of the guard who has been alerted by Marbruk's nobles that someone has been breaking into their homes."},
		["Return to Cinnar"] =
			{appendText=", who awaits my return at his favorite reading spot in Marbruk. He certainly isn't expecting to see Hendare accompanying me with all the eagerness of a child running to show his mother an insect he has caught."},
		["Talk to Cinnar 2"] =
			{appendText=", who is sitting in his favorite reading spot in Marbruk with a rather perturbed expression on his face.", stepTextKey="I returned to Cinnar with the stolen items. I should tell him what happened."},
	},


	[GetQuestName(4699)] = { --"The Fading Tree"--kayreb
		["Explore Shrouded Hollow"] =
			{appendText=". It's entrance is a woven thicket of of roots and branches hidden within a cave in the Shrouded Vale."},
		["Talk to Laniriel 1"] =
			{appendText=", a Bosmer who approaches me when I enter the village in Shrouded Hollow.", stepTextKey="I entered the cave. I should find someone at the village itself who can tell me how it came to exist."},
		["Talk to Erunor 1"] =
			{appendText=" at the site of the ceremony. I should explore the Shrouded Hollow to find the entrance to the Fading Tree, where the ceremony takes place.", stepTextKey="One of the village's residents, Laniriel, told me a bit about the strange village, and said her husband Erunor can answer my questions about the village. He's at the Fading Tree for the village's ceremony."},
		["Talk to Henodras"] =
			{appendText=" at the Fading Tree in Shrouded Hollow. He should be able to tell me more about the oath that intertwines the Wilderking, the Fading Tree, and the village."},
		["Watch the Choosing of the Caretaker"] =
			{appendText=" at the Fading Tree in Shrouded Hollow. This ceremony happens only once every few centuries; I should really take in this moment."},
		["Talk to Laniriel 2"] =
			{appendText=", she ran up to the Fading Tree from the village of Shrouded Hollow. She sounded quite distressed, so I had better find out what is going on.", stepTextKey="Erunor, chosen as the next caretaker, asked me to find his wife, Laniriel."},
		["Kill War Captain Muzgash"] =
			{appendText=". I should search for him in the camp the Orcs have set up outside Shrouded Hollow's southern entrance."},
		["Burn Orc Tents"] =
			{appendText=" \nI need to destroy the camp the Orcs have set up outside of Shrouded Hollow's southern entrance."},
		["Return to Shrouded Hollow 1"] =
			{appendText="", stepTextKey="With War Captain Muzgash dead, the remaining Wood Orcs will need to regroup. I need to get back to Shrouded Hollow to tell Laniriel and the others."},
		["Talk to Laniriel 3"] =
			{appendText=" at Shrouded Hollow's village. I should let her know that I have taken care of the Orc camp, and that she can finally relax and celebrate Erunor being chosen as the new caretaker.", stepTextKey="Laniriel confided her pregnancy to me. She recently found out, and has yet to tell her husband. She asked me to convince Erunor to return to the Wilderking's realm with the rest of the village.\n\n Erunor remains at the Fading Tree to begin his duty as caretaker."},
		["Watch the Changing of the Caretaker"] =
			{appendText=" at Shrouded Hollow's Fading Tree. I need to alert him of his wife's pregnancy as soon as it's over."},
		["Talk to Erunor 2"] =
			{appendText=" at Shrouded Hollow's Fading Tree, and bring him the news that he will soon be a father.", stepTextKey="Laniriel asked me to convince her husband Erunor to return with the village due to her unexpected pregnancy. I should go to the Fading Tree and learn what his decision will be."},
		["Return to Shrouded Hollow 2"] =
			{appendText=". As difficult as it will be, I need to tell Laniriel that her husband has chosen to fulfill his oath to the Wilderking.", stepTextKey="I agreed with Erunor that he should stay behind and fulfill his oath to guard the Fading Tree. I should return to Laniriel and tell her."},
		["Meet Erunor inside Shrouded Hollow"] =
			{appendText=", where he is going to meet Laniriel and let her know that he has chosen to stay and be present to raise their child."},
		["Talk to Erunor 3"] =
			{appendText=" at Shrouded Hollow's village.", stepTextKey="I convinced Erunor to return with his wife Laniriel and the other villagers to the forest realm. I should meet him in the south end of the Shrouded Hollow."},
	},

    [GetQuestName(5080)] = { --"The Flower of Youth"--kayreb
        ["Collect Nereid's Smile Seeds"] =
            {appendText="\nIt seems the time when these flowers could be found all around Greenheart is quickly fleeting, as are the lives of Hartmin and his husband. However, even fleeting moments leave us with precious memories. Perhaps the ruins up the hill towards Greenheart have protected a few of the precious memories sown there."},
        ["Talk to Hartmin 1"] =
            {appendText=", who has remained by Mirilir's side just northeast of the Greenheart Wayshrine.", stepTextKey="I've collected seeds from the Nereid's Smile flowers. I should bring them back to Hartmin."},
        ["Talk to Hartmin 2"] =
            {appendText=", who has remained at Mirilir's side, even in death, just northeast of the Greenheart Wayshrine. These seeds seem to represent all the love and memories shared between the two of them.", stepTextKey="I've collected seeds from the Nereid's Smile flowers. I should give them to Hartmin."},
    },


    [GetQuestName(4770)] = { --"Forthor's Cursed Axe"--kayreb
        ["Go to Marbruk"] =
            {appendText=""},
        ["Talk to Forthor 1"] =
            {appendText=" inside Marbruk's Mages Guild.", stepTextKey="I've reached Marbruk. I should look for Forthor and return his axe."},
        ["Watch Forthor Remove the Curse"] =
            {appendText=" inside Marbruk's Mages Guild."},
        ["Talk to Forthor 2"] =
            {appendText=" inside Marbruk's Mages Guild.", stepTextKey="Forthor removed the axe's curse. I should talk to him one more time."},
    },

    [GetQuestName(4596)] = { --"Handmade Guardian"--kayreb
        ["Collect Dew Bugs"] =
            {appendText=" \nI can gather them from the rain flowers that dot the area to the north of the Labyrinth Wayshrine."},
        ["Collect Thunderbug Bellies"] =
            {appendText=" \nI can gather them from the bodies of thunderbugs found near Benduin's clearing."},
        ["Collect Hive Seeds"] =
            {appendText=" \nI can gather them from the porous rocks found near the nests that the swarming wasps have built to the north of the Labyrinth Wayshrine."},
        ["Talk to Benduin 1"] =
            {appendText=" in his clearing north of the Labyrinth Wayshrine.", stepTextKey="I collected the requested ingredients. I should speak to Benduin now to see what's next."},
        ["Create a Guardian"] =
            {appendText=" from the husk Benduin gave me. Benduin should be able to guide me in the process if I forget the steps. Should I need him, he can be found in his clearing to the north of the Labyrinth Wayshrine next to the guardian husk."},
        ["Have Your Guardian Defeat Two Other Guardians"] =
            {appendText="\nThe guardian opponents can be found in Benduin's clearing to the north of the Labyrinth Wayshrine. He has also given me some healing roots that I can use to aid my guardian in the fight."},
        ["Talk to Benduin 2"] =
            {appendText=" in his clearing to the north of the Labyrinth Wayshrine.", stepTextKey="My guardian defeated two of the other guardians. I should talk to Benduin."},
    },

    [GetQuestName(4828)] = { --"Hunting the Wasp"--kayreb
        ["Track the Wasp"] =
            {appendText=", which has become rather notorious in the area between Greenheart and Hollow Den. I should make sure to stay low and remain vigilant, the wasp is known as Tazel the 'Sting' after all."},
        ["Collect the Wasp's Head"] =
            {appendText=" from its location near the small pond between Greenheart and Hollow Den. Killing it seems more likely to achieve the desired result than simply asking it politely."},
        ["Talk to Radreth"] =
            {appendText=" at her location to the east of the pond between Hollow Den and Greenheart where I found the wasp."},
    },

    [GetQuestName(5063)] = { --"Stone Cold" --Kalindria
        ["Talk to Indanas 1"] =
            {appendText=". She can be found within a hollowed tree among the ruins.", stepTextKey="I've agreed to find the Bosmer leader, Indanas, and help fight against the Hollow."},
        ["Collapse Western Hole"] =
            {appendText=""},
        ["Collapse Northern Hole"] =
            {appendText=""},
        ["Collapse Southern Hole"] =
            {appendText=""},
        ["Go to the Clan Holdfast"] =
            {appendText=" in the cave north of Shadows Crawl."},
        ["Listen to the Hollow Watchman"] =
            {appendText=""},
        ["Follow Indanas"] =
            {appendText=". After entering the cave to the north of the ruins with me, she headed for the hole within. Continuing south-southwest across the marsh seems like my best option to find her."},
        ["Talk to the Hollow Watchman 1"] =
            {appendText=". I found him when I discovered Indanas to the southwest of Shadows Crawl.", stepTextKey="The Hollow Watchman has subdued Indanas. I should speak to him about the clan's desire to settle here."},
        ["Tell the Hollow Watchman to Let Them Stay"] =
            {appendText=". He remains standing beside Indanas to the west of Shadows Crawl."},
        ["Tell Indanas That Her Clan Must Leave"] =
            {appendText=""},
        ["Find and Destroy the Hollow Watchman"] =
            {appendText=". The holes and Hollow continuing west of Shadows Crawl may lead me to him."},
        ["Talk to Indanas 2"] =
            {appendText=". I could even use a shortcut to this cave to the north of Shadows Crawl.", stepTextKey="I've destroyed the Hollow Watchman and the Bosmer should now be safe to settle here. I should return to the Clan Holdfast and speak to Indanas."},
        ["Return to the Clan Holdfast"] =
            {appendText=" in the cave to the north of Shadows Crawl."},
        ["Confront Indanas"] =
            {appendText=", who stands ready for battle north of Shadows Crawl."},
        ["Leave the Clan Holdfast"] =
            {appendText=""},
        ["Talk to the Hollow Watchman 2"] =
            {appendText=", who waits in the area north of Shadows Crawl.", stepTextKey="I defeated the clan leader and those Bosmer determined to settle on these forbidden grounds. I should speak with the Hollow Watchman."},
    },

    [GetQuestName(4792)] = { --"A Tangled Knot"--kayreb
        ["Talk to Sumiril 1"] =
            {appendText=" at the entrance to the Labyrinth.", stepTextKey="I should speak to Sumiril."},
        ["Read Sumiril's Book"] =
            {appendText=". According to Sumiril, the book and the Labyrinth are closely intertwined. I cannot understand one without the other."},
        ["Follow Words 1"] =
            {appendText=" from Sumuril's book. They seem to be leading me deeper into the Labyrinth...", stepTextKey="The words of the book flew up, off the page. To continue reading, I must catch them."},
        ["Read the Next Passage"] =
            {appendText=" of Sumiril's book. The words that flew away led me to a structure that appears to have teleported me to a new area of the Labyrinth. Something about this structure seems to have drawn the words to it, as it seems they have found their way back into Sumiril's book."},
        ["Follow Words 2"] =
            {appendText=" through the Labyrinth. What part of the Wilderking's story and Sumiril's past will I discover next?", stepTextKey="To continue reading, I should follow the words."},
        ["Follow Words 3"] =
            {appendText=" through the Labyrinth. What part of the Wilderking's story and Sumiril's past will I discover next?", stepTextKey="I should follow the words."},
        ["Talk to Sumiril 2"] =
            {appendText=". He said he would wait for me at the other end of the Labyrinth.", stepTextKey="I should speak to Sumiril"},
    },


    [GetQuestName(4824)] = { --"Troublemakers"--kayreb
        ["Collect Rat Parts"] =
            {appendText=" from the corpses of Marbruk's rat population."},
        ["Talk to Adamir outside the Fighters Guild"] =
            {appendText=" in Marbruk."},
        ["Place Rats in Bag"] =
            {appendText=" left outside Marbruk's Fighters Guild."},
        ["Talk to Adamir"] =
            {appendText=" who is waiting for you alongside Timiwe near Marbruk's Fighters Guild."},
    },

    [GetQuestName(4779)] = { --"The Amronal of Valenwood" --Kalindria --kayreb
        ["Defeat the Amronal Wispmother"] =
            {appendText=". Following the path northeast, out of Woodhearth, will likely lead me there. The mire, near the ruins of Rootwatch Tower, seems the most likely place."},
        ["Talk to Elaldor"] =
            {appendText=". He is northwest of the Rootwatch Tower, overlooking where I slew the Wispmother."},
    },

    [GetQuestName(4462)] = { --"The Dead King" --Kalindria
        ["Examine Ayleid Warlord"] =
            {appendText=", likely located in the deepest part of the ruins."},
        ["Follow Nanwen"] =
            {appendText=""},
        ["Talk to Nanwen"] =
            {appendText=". Last I saw him, he ran towards the platform overlooking his resting place deep within the ruins."},
        ["Talk to Endarwe"] =
            {appendText=". I last saw him near the entrance within the ruins."},
        ["Return to Endarwe"] =
            {appendText=" in the room beside the entrance to the ruins."},
    },

    [GetQuestName(4848)] = { --"Deadly Ambition"--Kalindria
        ["Read the Bloodstained Note"] =
            {appendText=" laying beside Ancalmo's body to the southeast of Shademist Moors."},
        ["Uncover the Fate of the Mages in Shademist Enclave"] =
            {appendText=", which lays southeast of Shademist Moors."},
        ["Find Lucretia Fortunatus in Longhaven"] =
            {appendText=", northeast of Shademist Moors."},
    },

    [GetQuestName(4575)] = { --"The Flooded Grove"--Kalindria
        ["Talk to Orthenir 1"] =
            {appendText="", stepTextKey="Fongoth saw a priest in the middle of Rootwater Grove. I should talk to this priest to find out what's happening."},
        ["Activate Wardstones"] =
            {appendText="\nOrthenir may have some clue as to where they're located."},
        ["Return to Orthenir"] =
            {appendText=""},
        ["Defeat the Watcher"] =
            {appendText=" in the center of the Grove."},
        ["Complete the Ritual"] =
            {appendText=""},
        ["Talk to Orthenir 2"] =
            {appendText=" in the center of the Grove.", stepTextKey="I should talk to Orthenir in Rootwater Grove now that the ward is re-established."},
        ["Find the Vault of Memories"] =
            {appendText=" within Ilmyris, on the eastern side of the Grove."},
        ["Talk to Saromir 1"] =
            {appendText="", stepTextKey="I should talk to the caretaker Saromir within Ilmyris in Rootwater Grove to determine the source of the unbound Daedra."},
        ["Activate Hermaeus Mora's Shrine 1"] =
            {appendText="", stepTextKey="I should talk to Hermaeus Mora at his shrine within Ilmyris in Rootwater Grove to learn how to rebind the Daedra."},
        ["Defeat the Altmer Soul"] =
            {appendText=""},
        ["Defeat the Imperial Soul"] =
            {appendText=""},
        ["Defeat the Khajiit Soul"] =
            {appendText=""},
        ["Activate Hermaeus Mora's Shrine 2"] =
            {appendText="", stepTextKey="I should talk to Hermaeus Mora at his shrine within Ilmyris in Rootwater Grove to learn the location of the missing Bosmer soul."},
        ["Defeat Orthenir"] =
            {appendText=""},
        ["Activate Hermaeus Mora's Shrine 3"] =
            {appendText="", stepTextKey="I should return to Hermaeus Mora at his shrine within Ilmyris in Rootwater Grove to finish the Daedric binding ritual."},
        ["Talk to Saromir 2"] =
            {appendText="", stepTextKey="I must confront Saromir within Ilmyris in Rootwater Grove to harvest his soul for the Daedric binding ritual."},
        ["Defeat Saromir"] =
            {appendText=""},
        ["Activate the Ayleid Crystal"] =
            {appendText=""},
        ["Activate Hermaeus Mora's Shrine 4"] =
            {appendText="", stepTextKey="I should return to Hermaeus Mora at his shrine within Ilmyris in Rootwater Grove now that I have seen Naemon and Pelidil in Saromir's memories."},
        ["Activate Herma-Mora's Shrine"] =
            {appendText=""},
    },

    [GetQuestName(4827)] = { --"Hunting the Troll"--Kalindria
        ["Track down the Troll"] =
            {appendText=". By the looks of it, the troll seems to be headed towards Woodhearth, which could spell trouble for the citizens there. I should make sure to deal with it carefully and swiftly, it sounds like it means business!"},
        ["Collect Manglemaw's Arm"] =
            {appendText=". He's a rather nasty looking brute. I might have my work cut out for me, but I'm just glad he didn't make it to Woodhearth."},
        ["Talk to Ledronor"] =
            {appendText=" and present him with Manglemaw's arm. He should still be waiting for me near the marshes northeast of Woodhearth."},
    },

    [GetQuestName(4794)] = { --"In the Belly of the Sea Hawk"--Kalindria
        ["Steal the Bundle of Silks"] =
            {appendText=" that Angore owes the Khajiit trader Kunira-daro. They should be somewhere aboard the Sea Hawk - a ship anchored in Woodhearth. I should be on my guard, this Angore fellow sounds like quite the scoundrel. Who knows what sort of unsavory company may be lurking in the ship's hold?"},
        ["Deliver the Silk to Kunira-daro"] =
            {appendText=", the Khajiit trader who awaits my return near Woodhearth's docks."},
    },

    [GetQuestName(4615)] = { --"Lost in the Mist"--Kalindria
        ["Search for Elsenia"] =
            {appendText=" near the center of Shademist Moors."},
        ["Talk to Elsenia 1"] =
            {appendText="", stepTextKey="Thorinor's wife, Elsenia, appeared to me in the moors. I should talk to her."},
        ["Find the Wild Witch of Shademist"] =
            {appendText=""},
        ["Find Galereth's Hovel"] =
            {appendText=". Doralin has suggested she's to the southwest. Perhaps in the far west of Shademist Moors?"},
        ["Talk to Galereth 1"] =
            {appendText=", last seen in the Hovel in the west of Shademist Moors.", stepTextKey="I have found Galereth, the Wild Witch. I should talk to her about a potion for Elsenia."},
        ["Collect Hoarvor Blood"] =
            {appendText="\nI know I've seen these creatures throughout Shademist."},
        ["Talk to Galereth 2"] =
            {appendText="", stepTextKey="I collected the Hoarvor blood that the Wild Witch asked for. I should talk to her about getting a potion for Elsenia."},
        ["Deliver the Cure to Elsenia"] =
            {appendText=" northwest of the Witch. She was last near the island with the large tree within Shademist."},
        ["Talk to Elsenia 2"] =
            {appendText="", stepTextKey="I should talk to Elsenia and see her off safely."},
    },

    [GetQuestName(4793)] = { --"Manthir's Debt"--kayreb
        ["Talk to Manthir 1"] =
            {appendText=" at his dwelling in Woodhearth. His debt to Cold-Eyes isn't going to pay itself.", stepTextKey="The Bosmer who owes the debt, Manthir, lives near the market square in Woodhearth. I should go and talk to him to see if he'll pay the debt."},
        ["Deliver the Debt to Cold-Eyes"] =
            {appendText=". I last saw him catching a breath of fresh air at Woodhearth's Five-Claws Inn. He should be pleased that I have his money."},
        ["Talk to Farwen"] =
            {appendText=", Manthir's neighbor in Woodhearth. The Bosmer might believe in the Right of Theft, but Farwen has landed Manthir in some pretty hot water. Perhaps Farwen would be willing to return the coin in return for something."},
        ["Meet Manthir with Farwen"] =
            {appendText=" in the walkway between their homes in Woodhearth. I wonder if Manthir will accept Farwen's hand in marriage? Farwen seems to have been waiting for him to ask her for quite some time."},
        ["Talk to Manthir 2"] =
            {appendText=" in the walkway between his and Farwen's homes. He didn't seem all too pleased with the thought of marrying Farwen...at least he is no longer riddled with debt I suppose.", stepTextKey="Now that Manthir has agreed to marry Farwen, he'll have his coin back and can pay his debt. I should talk to him and collect it."},
    },

[GetQuestName(4463)] = { --"The Merethic Collection" --Rosque
        ["Recover Hidden Treasures"] =
            {appendText=". One is in a bookcase just before the southwestern-most room. One is under a loose tile next to a brazier on the eastern most side of the large southern room. One is buried beneath rubble next to a skyshard. The last is hidden in a vase in the northwestern-most passage, next to a display on Nedic Dueling Swords."},
        ["Talk to Orthuna"] =
            {appendText="."},
    },

    [GetQuestName(4611)] = { --"Mist and Shadow"--Kalindria
        ["Talk to Breduin 1"] =
            {appendText=" in his home in Longhaven, a village in the northeast of Shademist Moors.", stepTextKey="The residents of Longhaven report that people have been disappearing into the fog over the moors. I've been told to talk to Breduin for more information."},
        ["Search for the Dunmer in the Moors"] =
            {appendText=""},
        ["Reach the Vampire Lair"] =
            {appendText=" southeast of Shademist Moors."},
        ["Talk to Mel Adrys"] =
            {appendText="in the lair southeast of Shademist Moors."},
        ["Talk to Gadinas"] =
            {appendText="in the lair southeast of Shademist Moors."},
        ["Convince Mel Adyris to Spare Gadinas"] =
            {appendText=""},
        ["Allow Mel Adrys to Kill Gadinas"] =
            {appendText=""},
        ["Defeat Athraedal"] =
            {appendText=""},
        ["Defeat Faenir Blood-Letter"] =
            {appendText=""},
        ["Defeat Lathriel the Pale"] =
            {appendText=""},
        ["Destroy the Skull of Vargarion"] =
            {appendText=" in the north of the ruins to the southeast of Shademist Moors."},
        ["Return to Longhaven"] =
            {appendText=", a village in the northeast of Shademist Moors."},
        ["Talk to Breduin 2"] =
            {appendText=" in his home in Longhaven, a village in the northeast of Shademist Moors.", stepTextKey="I ended the enchantment that was luring people into the mist. I should tell Breduin of my success."},
    },

    [GetQuestName(4846)] = { --"The Misuses of Knowledge" --kayreb
        ["Go to Woodhearth"] =
            {appendText=", the city on Greenshade's western coast. The journal's writer, Mercano, seems to have been heading there after his wife's death. Based on where I found the journal, it seems the experiments he ran to try to save her ended up being used for a far more sinister cause..."},
        ["Talk to Mercano"] =
            {appendText=". I know from the journal that he is a mage. I should search for him in the places that mages often frequent in Woodhearth."},
    },

    [GetQuestName(4795)] = { --"Scaled Captors"--kayreb
        ["Rescue Nineclaws"] =
            {appendText=", a Khajiit who is trying to free herself on a small cliff that overlooks the Reconnaissance Camp. She holds onto hope knowing that Nivrilin would not abandon her."},
        ["Rescue Draulduin"] =
            {appendText=", a Bosmer who stands struggling to unbind his hands beside a rock near the Reconnaissance Camp. Even when captured, he has a strong fighting spirit."},
        ["Rescue Zavierry"] =
            {appendText=", a Breton who is bound outside a small tent near the Reconnaissance Camp. He is not particularly fond of this soggy predicament with only crocodiles to keep him company."},
        ["Meet Nivrilin in Longhaven"] =
            {appendText=", southwest of the Reconnaissance Camp. Nivrilin and her companions have reunited near the village's local weaponsmith."},
    },

[GetQuestName(4681)] = { --"The Serpent Lord"--kayreb
		["Repair Elain's Seal"] =
			{appendText=", a stone well under a roaring waterfall in Serpent's Grotto. It is named after Elain, the courageous warrior who was the first to volunteer to sacrifice her life to save the land from the Great Serpent."},
		["Repair Ralos's Seal"] =
			{appendText=", a stone well that sits in the center of one of the great caverns of Serpent's Grotto. It is named after the warrior, Ralos, who agreed with Elain that fighting would not defeat the Great Serpent. He too gave his life for the greater good."},
		["Repair Valir's Seal"] =
			{appendText=", a stone well standing in one of Serpent's Grotto's caverns where sunlight shines down from a small hole at the top of the cave. It is named after Valir, the prophet whose dream provided the clan with a vision of how the Great Serpent could be defeated. Were it not for his dream and sacrifice, the Great Serpent would never have been sealed away."},
		["Meet Priestess Sendel"] =
			{appendText=""},
		["Talk to Priestess Sendel 1"] =
			{appendText=", who has made her way deeper into the craggy tunnels and caverns of Serpent's Grotto.", stepTextKey="I repaired the three seals. Now I need to speak to Priestess Sendel at the gate leading to the Binding Pool."},
		["Go out to the Binding Pool"] =
			{appendText=" that stands on the shore overlooking the sea to the west of Serpent's Grotto."},
		["Defeat the Maormer Mage"] =
			{appendText=" known as Eilgun the Serpent Lord. He stands casting dark spells at the Binding Pool that lays on the shores west of Serpent's Grotto."},
		["Repair the Final Seal"] =
			{appendText=" that overlooks the sea west of Serpent's Grotto, where the Great Serpent writhes menacingly."},
		["Talk to Priestess Sendel 2"] =
			{appendText=" at the Binding Pool that stands on the shore to the west of Serpent's Grotto.", stepTextKey="The ritual is complete and the sea serpent is bound once more. I should speak with Priestess Sendel."},
	},

	[GetQuestName(4771)] = { --"Beasts of Falinesti"--kayreb
		["Enter Falinesti Cave"] =
			{appendText=", its entrance a tangle of roots and branches that stands beneath the Falinesti Spring Site northwest of Marbruk."},
		["Find Pariel"] =
			{appendText=" in the cave beneath the Falinesti Spring Site. I should look carefully for any signs of her - such as disturbed vegetation or bodies of the Wood Orcs she attacked. The cave has very deep caverns, so I will need to find a safe way to descend if needed. From what Thonoras said, she is wild and unpredictable in this state, so I should approach with caution."},
		["Subdue Pariel"] =
			{appendText=" in the lower caverns of the cave beneath the Falinesti Spring Site. I will need to fight Pariel in order to subdue her."},
		["Track Down Pariel"] =
			{appendText=" through the passages of the cave under the Falinesti Spring Site. After our fight she ran up a cave tunnel that seemed to lead upward."},
		["Talk to Thonoras"] =
			{appendText=", who kneels next to Pariel in the cave beneath the Falinesti Spring Site."},
		["Let Thonoras Join His Wife"] =
			{appendText=" as a beast in the cave beneath the Falinesti Spring Site. It is clear that Thonoras and Pariel love each other deeply. This cruel twist of fate hasn't changed their love in the slightest."},
		["Force Thonoras to Kill Her"] =
			{appendText=" in the cave beneath the Falinesti Spring Site. This is the only way for him to remain loyal to the Green Pact."},
		["Find Thonoras' Backpack 1"] =
			{appendText=". It should be outside the other entrance to the cave beneath the Falinesti Spring Site. I hope that Thonoras and Pariel are able to happily live their lives together, even in their new forms.", stepTextKey="Thonoras has decided to join his wife as a wild beast. I should leave him to complete his prayer to Hircine."},
		["Search Backpack"] =
			{appendText=" that Thonoras left for me outside the other entrance to the cave beneath the Falinesti Spring Site."},
		["Find Thonoras' Backpack 2"] =
			{appendText=" outside the other entrance to the cave beneath the Falinesti Spring Site. I hope convincing Thonoras to keep the Green Pact was the right decision, as painful as it was.", stepTextKey="Thonoras has kept to the Green Pact and killed the monster that was once his wife. I should leave him to his grief."},
	},

	[GetQuestName(4788)] = { --"The Falinesti Faithful"--kayreb
		["Rescue Falinesti Faithful"] =
			{appendText="\nNielas, Halalin, and Fanrel have all been captured by the Wood Orcs. I should look for them in the stronghold of the Lhurgash clan found at the base of the Falinesti Spring Site, just southeast of The Atronach. I should rescue them swiftly as there is no telling what horrors have befallen them since Egannor saw them last."},
		["Find Fanrel"] =
			{appendText=" at the entrance to the Lhurgash stronghold, just northeast of the Falinesti Spring Site. She seems determined not to let the Wood Orcs go unpunished for the atrocities they committed."},
		["Talk to Fanrel 1"] =
			{appendText=" at the entrance to the Lhurgash camp, just northeast of the Falinesti Spring Site. Fanrel's plan is certainly a cruel one, but she claims it is necessary after the cruelty the Wood Orcs treated the Falinesti Faithful with.  It seems she is determined to follow through on her plan...with or without my help.", stepTextKey="Fanrel wants vengeance on the orcs who captured, tortured, and killed her friends. The first step is to kill Chief Gorzesh's family. She insists he must share her pain.\n\nI can either help her exact vengeance, or return to Egannor and leave."},
		["Collect Roog's Head"] =
			{appendText=", Gorzesh's son. He stands on a watchtower overlooking the Green's Marrow Dolmen east of the Falinesti Spring Site."},
		["Collect Grashla's Head"] =
			{appendText=", Gorzesh's Hearth-Wife. She is tending to the Hearth-Home in the Lhurgash stronghold southeast of the Falinesti Spring Site."},
		["Bring Heads to Fanrel"] =
			{appendText=", she crouches at the entrance to the Lhurgash stronghold northeast of the Falinesti Spring Site."},
		["Reach Ritual Site"] =
			{appendText=" to carry out the blood ritual and send Chief Gorzesh's family into the Ooze. The site can be found on a cliff to the northeast of The Atronach."},
		["Mount Roog's Head"] =
			{appendText=" on a pike at the ritual site northeast of The Atronach."},
		["Mount Grashla's Head"] =
			{appendText=" on a pike at the ritual site northeast of The Atronach."},
		["Mount Thushbeg's Head"] =
			{appendText=" on a pike at the ritual site northeast of The Atronach."},
		["Mount Dushgor's Head"] =
			{appendText=" on a pike at the ritual site northeast of The Atronach."},
		["Kill Warchief Gorzesh"] =
			{appendText=" I can complete the blood ritual by touching the sacrifice stone at the ancient Bosmeri ritual site to the northeast of The Atronach. Once I do Warchief Gorzesh will likely come to the ritual site in an attempt to save his family from their fate of being cast into the Ooze."},
		["Talk to Fanrel 2"] =
			{appendText=" at the ancient Bosmeri ritual site to the northeast of The Atronach. I hope she feels satisfied in the revenge we have enacted on Chief Gorzesh. It was certainly an awful end for him and his family.", stepTextKey="Chief Gorzesh and his family are dead. Fanrel has her revenge."},
		["Talk to Egannor"] =
			{appendText=" where he awaits my return behind a large boulder to the southeast of The Atronach. I hope he understands why I refused to work with Fanrel to enact her cruel plan for revenge on Gorzesh's family. I can understand wanting to avenge her friends, but I've done my part in rescuing those still alive."},
	},

    [GetQuestName(4826)] = { --"Hunting the Mammoth"--kayreb
        ["Track the Mammoth"] =
            {appendText=" in the area around Falinesti Wayshrine. A giant creature like a mammoth should be easy enough to spot. Narion did mention it was quite skittish though, so I should approach carefully so as not to frighten it away."},
        ["Collect the Mammoth Tusk"] =
            {appendText=". It seems a shame to kill such a majestic creature, but I will do what I must."},
        ["Return to Narion 1"] =
            {appendText=" and present her with the mammoth's tusk as proof of my success. She should still be waiting next to the small ponds that dot the area west of Falinesti Wayshrine.", stepTextKey="I've defeated the mammoth. I should return to Narion west of the Falinesti Wayshrine with its tusk."},
        ["Return to Narion 2"] =
            {appendText=" and present her with the mammoth's tusk as proof of my success. She should still be waiting next to the small ponds that dot the area west of Falinesti Wayshrine.", stepTextKey="I've defeated the mammoth. I should return to Narion at the shore of the pond west of Falinesti Wayshrine with its tusk."},
    },


	[GetQuestName(4636)] = { --"Moonhenge's Tear"--kayreb
		["Rescue Scout Kilolemar"] =
			{appendText=". Based on his last known position, he should be somewhere nearby. It's possible the Daedra have hidden him just out of sight."},
		["Rescue Scout Thiirel"] =
			{appendText=". I should check along the path leading to Moonhenge."},
		["Rescue Scout Khurra"] =
			{appendText=", a khajiit who was sent to scout the area around the base of Moonhenge, I should check for her there."},
		["Rescue Sergeant Galandir"] =
			{appendText=". Something tells me he never quite reached the top of Moonhenge."},
		["Talk to Sergeant Galandir 1"] =
			{appendText=". He wanted me to follow him to the ruins of Moonhenge.", stepTextKey="I rescued Sergeant Galandir. I should talk to him to find out what happened at the Moonhenge."},
		["Unseal the Daedric Portal"] =
			{appendText=" at the center of Moonhenge. I should watch out for the Dremora who seem to be intently guarding three nearby crystals."},
		["Enter the Daedric Portal"] =
			{appendText=" at the heart of Moonhenge."},
		["Rendezvous with Captain Ethrel's Squad"] =
			{appendText=". I heard a voice when I entered the Isles of Torment, and it sounded much softer than the voices of the Dremora who were guarding the portal. Perhaps the owner of the voice knows where I can find Captain Ethrel."},
		["Collect the Key of Strife"] =
			{appendText=" that is held by the Dremora known as Overseer Atris."},
		["Collect the Key of Discord"] =
			{appendText=" that is held by the Dremora known as Codaermet the Wicked."},
		["Find the Scout"] =
			{appendText=". She is most likely hiding from the Daedra that inhabit the Isles of Torment, so I should be sure to check along the edges of the ruins and behind any large debris for her."},
		["Find the Soldier"] =
			{appendText=" who was last seen looking for the Key of Strife. He should be hiding somewhere near the key's location."},
		["Activate the Pillar of Discord"] =
			{appendText=", it should be somewhere along the western edge of the Isles of Strife."},
		["Activate the Pillar of Strife"] =
			{appendText=", it should be somewhere along the western edge of the Isles of Strife."},
		["Find the Sigil Stone"] =
			{appendText=" on the other side of the unlocked portal in the Isles of Torment."},
		["Defeat the Harvester"] =
			{appendText=", a Daedra who appears when Captain Ethrel's team tries to destroy the crystals that guard the sigil stone found in Coldharbour's Moonhenge."},
		["Take the Sigil Stone"] =
			{appendText=" from heart of Coldharbour's Moonhenge."},
		["Gather the Strike Team"] =
			{appendText=", which is waiting within Coldharbour's Moonhenge. I should speak to the mage I first met when I entered the Isles of Torment, she seems to be the leader of the group."},
		["Cast the Scroll"] =
			{appendText=" at the heart of Coldharbour's Moonhenge."},
		["Escape the Isles of Torment"] =
			{appendText=" through the portal that opened on the northern end of the island."},
		["Talk to Sergeant Galandir 2"] =
			{appendText=", who awaits my return in the encampment near Moonhenge.", stepTextKey="The Daedric portal in Moonhenge is sealed. I should tell Sergeant Galandir of my success."},
		["Return to Moonhenge"] =
			{appendText=" through the portal on the northern end of the island."},
		["Talk to Sergeant Galandir 3"] =
			{appendText=", who awaits my return in the encampment near Moonhenge.", stepTextKey="The Daedric portal to Moonhenge is sealed. I should tell Sergeant Galandir of my success."},
	},

    [GetQuestName(4785)] = { --"The Senche"--kayreb
        ["Find the Dead Hound Hunter"] =
            {appendText=" just north of Lanalda Pond. His remains lie beneath the shade of an enormous tree."},
        ["Track the Pale Senche"] =
            {appendText=". The trail seems to lead from the area near Hectahame towards Greenshade's western shore. I should approach cautiously so as to not end up like the unfortunate hunter whose remains I found."},
        ["Collect the Pale Senche's Hide"] =
            {appendText=". The creature sits proudly on Greenshade's western edge. As majestic as he is, I don't want anyone else to end up like that unfortunate hunter."},
        ["Talk to Haras"] =
            {appendText=" and present him with the Pale Senche's pelt. He is wearily awaiting my return to the southwest of Hectahame."},
    },


[GetQuestName(4784)] = { --"Swift Justice" --Silmurilliam
        ["Defeat Aldolin"] =
            {appendText=", he might be hiding somewhere near the road."},
        ["Talk to Sorderion"] =
            {appendText=", he is probably still patrolling the road."},
    },

   [GetQuestName(4849)] = { --"The Unfilled Order" -@ARKANOBOT
        ["Collect Speckled Stinkhorn Cap"] =
            {appendText=""},
        ["Collect Radish"] =
            {appendText="\n\nI should check the small pouches next to the adventurer's remains near the trench entrance."},
        ["Collect Blanched Russula Cap"] =
            {appendText=""},
        ["Travel to Woodhearth"] =
            {appendText=". The town is located in the southwest region of Greenshade."},
        ["Talk to Vadelen Indothan"] =
            {appendText=""},
    },





-- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- -- MALABAL TOR -- 


[GetQuestName(4193)] = { --"House and Home"--Rosque
        ["Rescue Civilians"] =
            {appendText="."},
        ["Talk to Sergeant Linaarie"] =
            {appendText=". She may know where Lieutenant Ehran is."},
        ["Talk to Lieutenant Ehran 1"] =
            {appendText=". Sergeant Linaarie, at the Fighters Guild, may know where he is.", stepTextKey="Lieutenant Ehran took the most fervent civilians with him to search for his missing captain, who he believes is still alive. I should speak with him right away."},
        ["Sound Lieutenant Ehran's Horn When the Upper Gate Is Clear"] =
            {appendText=". The upper gate covers the southeastern road out of Velyn Harbor."},
        ["Locate Lieutenant Ehran's Headquarters"] =
            {appendText=". Hopefully his militia will be with him."},
        ["Talk to Lieutenant Ehran 2"] =
            {appendText=" in the burnt-out building east of the bridge.", stepTextKey="I located Lieutenant Ehran's headquarters. I should tell him the runner is safely headed to Deepwoods."},
    }, 

[GetQuestName(4194)] = { --"One Fell Swoop"--Rosque
        ["Enter the Town Hall"] =
            {appendText=". Sergeant Linaarie said that it survived the fire, on the east side of Velyn Harbor."},
        ["Defeat Chief Makhug"] =
            {appendText=" in the Town Hall, at the east end of Velyn Harbor."},
        ["Talk to Sergeant Linaarie 1"] =
            {appendText=" by the northern bridge.", stepTextKey="Now that I've killed Chief Makhug, I should meet Sergeant Linaarie by the bridge."},
        ["Enter the Warehouse District"] =
            {appendText=". It was established near the docks to accommodate ships loading and unloading, as they came in from the harbor."},
        ["Burn Ra Gada Supplies"] =
            {appendText=". Sergeant Linaarie said that she saw them being unloaded into the warehouses near the docks."},
        ["Get to the Docks"] =
            {appendText=" in Velyn Harbor."},
        ["Talk to Sergeant Linaarie 2"] =
            {appendText=".", stepTextKey="I should speak with Sergeant Linaarie. If the militia's attack went well, she'll be somewhere near the lighthouse."},
        ["Enter the Lighthouse"] =
            {appendText=" in Velyn Harbor."},
        ["Defeat the Ra Gada Captain"] =
            {appendText=" in the Velyn Harbor lighthouse."},
        ["Talk to Sergeant Linaarie 3"] =
            {appendText=" outside the Velyn Harbor lighthouse.", stepTextKey="I slew the Ra Gada captain. I should inform Sergeant Linaarie."},
        ["Talk to the Captain"] =
            {appendText="."},
        ["Talk to Sergeant Linaarie in the Warehouse District"] =
            {appendText=" near the docks."},
    },

[GetQuestName(4458)] = { --"The Drublog of Dra'bul"--Rosque
        ["Talk to the Green Lady in Dra'bul 1"] =
            {appendText=". To reach it, head east out of Velyn Harbor, and continue east until the crossroad trading sign. The Wood Orc stronghold is just north of it.", stepTextKey="I should speak to the Green Lady in Dra'bul."},
        ["Talk to the Green Lady in Dra'bul 2"] =
            {appendText=", outside the front gates to the south.", stepTextKey="The Green Lady wants me to meet her in Dra'bul. She's going to travel there at supernatural speed, but I have to take a longer road."},
    },

[GetQuestName(4452)] = { --"Reap What Is Sown"--Rosque
        ["Obtain a Drublog Lock of Hair"] =
            {appendText=". Wood Orcs are not likely to give such a thing up without a fight."},
        ["Find the Green Lady in Dra'bul"] =
            {appendText="."},
        ["Talk to Chieftain Agrakh"] =
            {appendText=" in the Chieftain's Longhouse."},
        ["Get the Drublog Glamor from the Green Lady"] =
            {appendText=" in the Chieftain's Longhouse."},
        ["Eavesdrop on the Drublog Shaman"] =
            {appendText=" at the beach bordering Dra'bul. It may be possible to find a hiding spot near a path he's likely to walk past."},
        ["Activate the Ritual atop the Watchtower"] =
            {appendText=" on the beach bordering Dra'bul."},
        ["Talk to the Hound"] =
            {appendText=" atop the watchtower on the beach bordering Dra'bul."},
        ["Talk to Roku"] =
            {appendText=" atop the watchtower on the beach bordering Dra'bul."},
        ["Convince Shaman Glazulg to Aid the Green Lady"] =
            {appendText=". The homes of Wood Orc shamans are often adorned with bones and gristly trophies that aid in their rituals."},
        ["Talk to Roku at the Arena Entrance"] =
            {appendText=". If she's waiting to talk, she'll likely be at the entrance with the fewest other orcs around."},
        ["Rescue the Green Lady"] =
            {appendText=". Roku, at the arena entrance in the middle of Dra'bul, can open the gate to where she's being held. She might even know how to use her father's gift to free her."},
	["Confront the Hound"] =
            {appendText=" inside the Dra'bul arena."},
        ["Leave the Arena"] =
            {appendText="."},
        ["Talk to the Green Lady 1"] =
            {appendText=" at the entrance to the Dra'bul arena.", stepTextKey="I need to talk to the Green Lady about her next plan of attack. With the Silvenar possibly in captivity and her city occupied by this \"Hound\" she may need my help once more."},
        ["Talk to the Green Lady 2"] =
            {appendText=" at the entrance to the Dra'bul arena.", stepTextKey="I need to talk to the Green Lady about her plans. With the Silvenar possibly in captivity and her city occupied by the Hound, she may need my help once more."},
    },

[GetQuestName(4456)] = { --"The Hound's Plan"--Rosque
        ["Find the Silvenar in Jathsogur"] =
            {appendText=", a small town at the southeastern edge of Malabal Tor, just north from Grahtwood. Shaman Glazulg warned that Drublog forces were ordered there."},
    },

[GetQuestName(4124)] = { --"The Prisoner of Jathsogur"--Rosque
        ["Free Ambassador Raen"] =
            {appendText=". He's likely being held in one of the larger buildings in Jathsogur."},
        ["Free Ambassador Sariel"] =
            {appendText=". She's likely being held in one of the larger buildings in Jathsogur."},
        ["Find the Ritual of Unbinding"] =
            {appendText=". Sariel said that she saw what happened while she and the Silvenar were being dragged off, near the north edge of Jathsogur."},
        ["Talk to Ambassador Sariel 1"] =
            {appendText=".", stepTextKey="The Silvenar said the people I rescued would be clever. Ambassador Sariel knows something about the ritual book I've just found. Now that I have it in my hands, perhaps she can tell me more."},
        ["Find the Runestone of Malacath"] =
            {appendText=" in Jathsogur, opposite to the daedric shrine at the north entrance."},
        ["Talk to Ambassador Raen 1"] =
            {appendText=".", stepTextKey="Ambassador Sariel has told me about the Ritual of Unbinding and the runestone. Perhaps Ambassador Raen has some idea what we should do now that we have both of them."},
        ["Enter the Southern Longhouse"] =
            {appendText=", at Ambassador Raen's suggestion."},
        ["Talk to Ambassador Sariel 2"] =
            {appendText=" in the Southern Longhouse.", stepTextKey="Now that we're under cover, I can read the ritual book if I want, but I must talk to the ambassadors. The book and the runestone hold the key to saving the Silvenar, but I need to know what to do with them."},
	["Talk to Ambassador Raen 2"] =
            {appendText=" in the Southern Longhouse.", stepTextKey="Now that we're under cover, I can read the ritual book if I want, but I must talk to the ambassadors. The book and the runestone hold the key to saving the Silvenar, but I need to know what to do with them."},
        ["Sacrifice Ambassador Raen"] =
            {appendText=" in the Southern Longhouse."},
        ["Sacrifice Ambassador Sariel"] =
            {appendText=" in the Southern Longhouse."},
        ["Talk to Ambassador Raen 3"] =
            {appendText=" in the Southern Longhouse.", stepTextKey="I chose to sacrifice Ambassador Sariel. I hope Ambassador Raen will still help me."},
        ["Disrupt Spirit Stone"] =
            {appendText=". It should be somewhere around the centre of Jathsogur."},
        ["Disrupt Magicka Stone"] =
            {appendText=". It should be somewhere around the centre of Jathsogur."},
        ["Disrupt Memory Stone"] =
            {appendText=". It should be somewhere around the centre of Jathsogur."},
        ["Disrupt Essence Stone"] =
            {appendText=". It should be somewhere around the centre of Jathsogur."},
	["Enter the Silvenar's Prison"] =
            {appendText="."},
        ["Talk to the Silvenar 1"] =
            {appendText=" inside the compound, on the hill of Jathsogur.", stepTextKey="The Silvenar's Psijic projection appeared again. It ran downstairs, beckoning me to follow."},
        ["Defend the Silvenar"] =
            {appendText=" inside the compound, on the hill of Jathsogur."},
        ["Talk to the Silvenar 2"] =
            {appendText=" inside the compound, on the hill of Jathsogur.", stepTextKey="Our enemies have been defeated and Chief Nagoth is dead, but can the Silvenar escape? I must talk to him and find out."},
        ["Talk to The Silvenar"] =
            {appendText=" outside the northern exit of Jathsogur."},
        ["Talk to Ambassador Sariel 3"] =
            {appendText=" in the Southern Longhouse.", stepTextKey="I chose to sacrifice Ambassador Raen. I hope Ambassador Sariel will still help me."},
    },

[GetQuestName(4477)] = { --"A Wedding to Attend"--Rosque
        ["Go to Silvenar"] =
            {appendText=". To reach it, head north along the road out of Jathsogur. Follow the river before taking a left over the bridge. The longer, but more scenic, route runs further north - through the Bandaari Trading Post. It then circles the lake and heads back south, along the other side."},
        ["Talk to The Silvenar in Silvenar"] =
            {appendText=", up past the four-way crossroads, to the north of the town entrance"},
    },


[GetQuestName(4143)] = { --"Restore the Silvenar"--Rosque
		["Collect Silver Shards"] =
			{appendText=". The Silvenar said that he saw them being carried by the Hound's forces."},
		["Talk to Scout Anglith"] =
			{appendText=" about what to do next. He was scouting the ravine close to the northern bridge to Silvenar near the crossroads, so he'll likely be close by there still."},
		["Defeat the Guardian of Silvenar"] =
			{appendText=" near the northern entrance to Silvenar."},
		["Talk to the Silvenar's Psijic Projection"] =
			{appendText=" near the northern entrance to Silvenar."},
		["Learn About Spinner Einrel"] =
			{appendText=" in Silvenar."},
		["Learn About Spinner Caerllin"] =
			{appendText=" in Silvenar."},
		["Learn About Spinner Dothriel"] =
			{appendText=" in Silvenar."},
		["Talk to the Silvenar 1"] =
			{appendText=".", stepTextKey="I interrogated some of the bewitchers and learned a little about the spinners. The Silvenar told me to meet him at the base of the Great Tree in the center of the city. Hopefully, he has more information."},
		["Free Spinner Einrel"] =
			{appendText=". She lives in the southeastern tree, connected by a branch path from the great tree in the center of Silvenar."},
		["Free Spinner Caerllin"] =
			{appendText=". She lives in the northwestern tree, connected by a branch path from the great tree in the center of Silvenar."},
		["Free Spinner Dothriel"] =
			{appendText=". She lives in the eastern tree, connected by a branch path from the great tree in the center of Silvenar."},
		["Talk to the Silvenar 2"] =
			{appendText=" in the middle of Silvenar.", stepTextKey="The spinners' bonds are broken. I can return to the Silvenar and find out what he needs me to do next. He should be at the base of the Great Tree."},
		["Enter the Audience Hall"] =
			{appendText=", at the very top of the great tree in the middle of Silvenar."},
		["Defeat the Hound"] =
			{appendText=" in the audience hall, at the very top of the great tree in the middle of Silvenar."},
		["Talk to the Green Lady"] =
			{appendText=" at the very top of the great tree in the middle of Silvenar."},
		["Wait for Scout Anglith to Deliver the Handfast"] =
			{appendText=" at the very top of the great tree in the middle of Silvenar."},
		["Attend the Wedding"] =
			{appendText=" at the very top of the great tree in the middle of Silvenar."},
		["Talk to Spinner Dothriel"] =
			{appendText=" at the very top of the great tree in the middle of Silvenar."},
	},

[GetQuestName(4544)] = { --"The Dark Mane"--Rosque
        ["Wait for Lord Gharesh-ri"] =
            {appendText=" atop the great tree in the middle of Silvenar."},
        ["Talk to Lord Gharesh-ri"] =
            {appendText=" atop the great tree in the middle of Silvenar."},
        ["Go to Fort Grimwatch"] =
            {appendText=". To reach it, head to the other side of the lake - from Silvenar to the Baandari Trading Post. Then, head east into Reaper's March. The fort is north from there, up the road, nestled into the mountains. It might be a good idea to ask around the gates if anyone's seen Akkhuz-ri."},
    },

[GetQuestName(5009)] = { --"The Siege of Velyn Harbor"--Rosque
        ["Talk to Lieutenant Ehran in Velyn Harbor"] =
            {appendText=". To reach him, head north along the northern road, leaving Greenshade. Or travel west along Malabal Tor to the furthest coast."},
    },

--------------------------------SIDE QUESTS --------------------------------SIDE QUESTS --------------------------------SIDE QUESTS 

    [GetQuestName(4373)] = { --"Export Business" --Kalindria
        ["Free Bosmer Prisoners"] =
            {appendText="\nThough they are separated, they can all be found on the lower level of the Cove."},
        ["Talk to Peras Outside Crimson Cove"] =
            {appendText=""},
    },


	[GetQuestName(4089)] = { --"The Hound's Men" --kayreb
		["Talk to Treethane Nilara 1"] =
			{appendText=", a devout Bosmer who often can be found in prayer at the Green Lady's shrine in Deepwoods - a small village to the east of Velyn Harbor.", stepTextKey="The guard suggested Lanwaen might have been kidnapped by the Houndsmen. I should talk to Treethane Nilara and see what she can tell me."},
		["Search for Haron's Party"] =
			{appendText="\nNilara says Haron was last headed to the falls southeast of Deepwoods in search of his wife. They may also have moved on to the other areas just outside of Deepwoods. I should be careful, it sounds like the area they were headed to may not be safe...hopefully Haron and the rest of the search party are alright."},
		["Talk to Oraneth"] =
			{appendText=", Lanwaen's who is just to the west of Deepwoods. She looks pretty shaken up after what happened to Ungiras. Hopefully the same fate hasn't befallen Haron."},
		["Search for Haron"] =
			{appendText=", Oraneth last saw him on the trail heading to the south of Deepwoods."},
		["Talk to Haron 1"] =
			{appendText=" where he stands near the trail south of Deepwoods. Based on the bodies scattered around him, it looks like quite the fight has occurred.", stepTextKey="I followed the trail and found Haron. I should see if he has uncovered any clues."},
		["Search for Clues"] =
			{appendText="\nThe Houndsmen camp to the south of Greenwood might have signs of what happened to Lanwaen. According to Haron, she is a very skilled archer and was the one who slew the many bodies I saw lining the trail. Hopefully, she is still alive and safe from harm."},
		["Talk to Haron 2"] =
			{appendText=" to figure out our next move. He waits for me just outside of the Houndsmen camp to the south of Deepwoods.", stepTextKey="I found Lanwaen's bow and a note from Cirithor which indicates Lanwaen is being held in a nearby cave. I should tell Haron."},
		["Kill Cirithor"] =
			{appendText=" at the cave known as Starwalk Cavern. It's entrance can be found in the area to the southwest of Deepwoods."},
		["Talk to Haron 3"] =
			{appendText=" inside of Starwalk Cavern. Thankfully Lanwaen is still alive, although she is injured.", stepTextKey="With Cirithor dead, this pack of Houndsmen should be much less organized and easier to defend against. I should see if Haron and Lanwaen are ready to go back to the village."},
		["Lead Haron and Lanwaen Back to the Village"] =
			{appendText=" of Deepwoods from Starwalk Cavern. Due to her injury, I don't think Lanwaen will be able to defend herself if we get into a fight, so I'll need to protect her."},
		["Talk to Lanwaen"] =
			{appendText=" just outside of Deepwoods."},
		["Talk to Treethane Nilara 2"] =
			{appendText=" in her home at Deepwoods.", stepTextKey="Lanwaen is back in the village. I should talk to Treethane Nilara and let her know Haron and Lanwaen are safe."},
	},

    [GetQuestName(4497)] = { --"Lost Daughter"--Kalindria
        ["Bring the Vase to Ganwen in Vulkwasten"] =
            {appendText=", in the Tall Trunk Tavern."},
        ["Talk to Ganwen"] =
            {appendText=" in Vulkwasten, in the Tall Trunk Tavern."},
    },



    [GetQuestName(4464)] = { --"Nature's Best Friend"--Kalindria
        ["Find Feluz"] =
            {appendText=". If I follow this path east, I should come upon the shrine she Liane mentioned. The fallen tree to its south seems as good a place as any to begin my search."},
        ["Find the Lost Goods"] =
            {appendText=" south of Dra'Bul wayshrine. I see a cave south of where Feluz is hiding in a tree stump. I should follow the path that leads there - and perhaps the river bank to the south of it - and search for these clues."},
        ["Talk to Feluz"] =
            {appendText=" hiding in a tree stump south of Dra'Bul wayshrine ."},
        ["Talk to Liane 1"] =
            {appendText=" south of Dra'Bul wayshrine.", stepTextKey="Feluz was very happy to get his bag of goods and lucky pouch back. He said to talk to his wife, Liane, about my reward."},
        ["Talk to Liane 2"] =
            {appendText=" south of Dra'Bul wayshrine.", stepTextKey="Liane saw me give Feluz his lucky pouch, and she isn't very happy about it. I should talk with her before I continue on my way."},
        ["Talk to Liane 3"] =
            {appendText=" south of Dra'Bul wayshrine.", stepTextKey="I returned the bag of goods to Feluz, but not his lucky pouch. He seemed ungrateful. He said to talk to his wife, Liane, about my reward."},
        ["Talk to Liane 4"] =
            {appendText=" south of Dra'Bul wayshrine.", stepTextKey="Liane was happy with how I handled Feluz. I should talk to her about my reward."},
    },

    [GetQuestName(4378)] = { --"Naval Intelligence"--Kalindria
        ["Steal Coded Rutter"] =
            {appendText=", laying atop the bar found within the southern path of the Cove."},
        ["Meet Glanir"] =
            {appendText=" to the north of the bar where I found the rutter."},
        ["Kill Captain Siro and the Worm Cultist"] =
            {appendText=". If I head northeast to the easternmost path in the Cove, I'm likely to find them."},
        ["Talk to Glanir"] =
            {appendText=" to the west. Alternatively, meet him outside of the Cove."},
    },


    [GetQuestName(4500)] = { --"A Nord in Need"--Kalindria
        ["Find the Owner of the Battered Shield"] =
            {appendText=". Look for those who seem to be searching for something near the Baandari Trading Post Weaponsmith and Wayshrine, located in the far east."},
        ["Talk to Fuldir"] =
            {appendText=""},
    },


    [GetQuestName(4112)] = { --"Raise the Curtain"--Kalindria
        ["Release Zainat-ri from Captivity"] =
            {appendText=" found south, on the western side of Fuller's Break."},
        ["Talk to Elandora 1"] =
            {appendText=", whose voice seemed to be coming from the east of Fuller's Break.", stepTextKey="When I released the senche from his bonds, I heard Elandora call out from nearby. I should find her and speak with her."},
        ["Get the Hold Key"] =
            {appendText=" in the camp east of Fuller's Break."},
        ["Bring the Hold Key to Elandora"] =
            {appendText=", who waits for me to the northwest, by the docks of Fuller's Break."},
        ["Retrieve the Troupe's Props"] =
            {appendText="\nI should check the building by the docks of Fuller's Break."},
        ["Talk to Elandora 2"] =
            {appendText=". She was headed belowdecks of the large docked ship at Fuller's Break., the Flencing Beak.", stepTextKey="Elandora will be waiting for me below the deck of the Steel Shrikes' ship. I should tell her I've recovered her supplies."},
        ["Kill the Captain"] =
            {appendText=", belowdecks at the front of the ship at Fuller's Break."},
        ["Talk to Elandora 3"] =
            {appendText=", who's waiting at the helm of the ship at Fuller's Break.", stepTextKey="The Steel Shrikes' ship is taken. I should speak to Elandora and see when she plans to set sail."},
    },


[GetQuestName(4111)] = { --"The Show Must Go On"--Kalindria
        ["Rescue the Perfomers"] =
            {appendText="\nI can follow the path where I met Elandora towards the northern direction leading me to the small village to the west of Fuller's Break, which is northeast of Velyn Harbor. I should keep an eye out for a Nord, High Elf, and monkey."},
        ["Talk to Elandora 1"] =
            {appendText=". I noticed a forge in the center of the village west of Fuller's Break, where I rescued the other performers.", stepTextKey="I found the performers and told them to head to the forge. I should meet Elandora and see if they arrived."},
        ["Burn the Buildings"] =
            {appendText="\nLocated west of Fuller's Break."},
        ["Meet the Performers at the Docks"] =
            {appendText=" in the western harbor of Fuller's Break."},
        ["Talk to Elandora 2"] =
            {appendText=" on the dock in the west.", stepTextKey="The area is ablaze, thanks to a few well-placed fires. Unfortunately, \"Sal\" never appeared. I should speak with Elandora about other ideas for locating her performer."},
        ["Find Salgaer"] =
            {appendText=" across the water to the east of the docks. I'll likely have to take the long way around."},
        ["Talk to Salgaer"] =
            {appendText=" across the water to the east of the docks. Maybe he can tell me why I found him on an altar of some sort."},
    },

[GetQuestName(4119)] = { --"The Storm's Call"--Rosque
        ["Recover the Sky-Key"] =
            {appendText=" in the Sea Vipers' camp tents. Something of the key's importance should likely be kept somewhere distinctive."},
        ["Talk to Mariel the Ironhand at the Ruins' Entry"] =
            {appendText="."},
        ["Enter the Stormwarden Undercroft in Ilayas Ruins"] =
            {appendText=" at the entrance to the ruins."},
        ["Find the Stormwarden Sanctuary"] =
            {appendText=" inside Ilayas Ruins."},
        ["Solve the Puzzle by the Sanctuary Door"] =
            {appendText=" inside Ilayas Ruins. Some of the constellation panels look like they can be pushed in."},
        ["Enter the Stormwarden Sanctuary"] =
            {appendText=", deep within Ilayas Ruins."},
        ["Talk to the Stormwardens"] =
            {appendText=" in their sanctuary, deep within Ilayas Ruins."},
        ["Collect Thunderstones from the Storm Atronachs"] =
            {appendText="\nThey may be located past the Stormwarden Sanctuary."},
        ["Place Thunderstones in the Receptacles"] =
            {appendText="\nGiven the prominence of the crackling central pillar, the Ayleids likely positioned the receptacles where they had a good view of the entire room."},
        ["Leave the Main Chamber"] =
            {appendText="."},
        ["Kill Firras"] =
            {appendText=" inside Ilayas Ruins."},
        ["Leave Ilayas Ruins"] =
            {appendText="."},
        ["Talk to Mariel the Ironhand near Ilayas Ruins"] =
            {appendText="."},
    },

	[GetQuestName(4291)] = { --"The Summer Site"--kayreb
		["Explore the Valley"] =
			{appendText=" that lays just northwest of the Falinesti Summer Site."},
		["Talk to the Projection"] =
			{appendText=" that hovers over a pile of bones lay beneath the great dolmen in the valley just west of the Falinesti Summer Site."},
		["Find the Source of the Projection"] =
			{appendText=". The projection said to meet her in the cave. I should be able to find the cave's entrance in the west end of the valley near the Falinesti Summer Site."},
		["Help with Farandare's Ritual"] =
			{appendText=" in the valley near the Falinesti Summer Site. I will need to seal the four tears to Oblivion that have opened up around the valley's dolmen."},
		["Talk to Farandare in the Cave"] =
			{appendText=" on the north end of the valley near the Falinesti Summer Site."},
		["Defeat the Daedra from the Portal"] =
			{appendText=" that has opened in the cave's recesses at the northern end of the Falinesti Summer Site's valley."},
		["Talk to Farandare 1"] =
			{appendText=" in the cave at the northern end of the valley near the Falinesti Summer Site.", stepTextKey="I must talk to Farandare again. The portal she opened will allow more Daedra to enter. She needs to realize this is no way to save Falinesti."},
		["Talk to Farandare 2"] =
			{appendText=" in the cave at the northern end of the valley near the Falinesti Summer Site.", stepTextKey="Falinesti Summer Site still contains open portals from Oblivion, but the largest one is shut. Whether Falinesti is actually in Oblivion is anyone's guess. I should bid farewell to Farandare and let her get on with her work."},
		["Talk to Farandare 3"] =
			{appendText=" in the cave at the northern end of the valley near the Falinesti Summer Site.", stepTextKey="Falinesti Summer Site still contains open portals from Oblivion, but the largest one is shut. Whether Falinesti is actually in Oblivion is anyone's guess. I hope I can still talk somes sense into Farandare."},
	},

    [GetQuestName(4108)] = { --"The Tale of the Green Lady"--kayreb
        ["Go to the Shrine of the Green Lady"] =
            {appendText=", a tree in the form of a woman."},
        ["Talk to Oraneth 1"] =
            {appendText=". She awaits me under the boughs of the Green Lady's shrine in Deepwoods.", stepTextKey="In order to begin the tour, I should go to the shrine of the Green Lady at the center of Deepwoods and talk with Oraneth."},
        ["Go to the Falls"] =
            {appendText=" that cascade into pools southeast of Deepwoods."},
        ["Talk to Oraneth 2"] =
            {appendText=" at the waterfall southeast of Deepwoods.", stepTextKey="We've reached the next place important to the Green Lady's history. It's the waterfall outside the village.\n\nWe should be cautious, as there are still werewolves and Houndsmen around."},
        ["Go to the Archery Range"] =
            {appendText=" found to the east of Deepwoods, near Matthild's Last Venture. I wonder if it was at this same archery range that Lanwaen became so skilled."},
        ["Talk to Oraneth 3"] =
            {appendText=" at the archery range near Matthild's Last Venture.", stepTextKey="We arrived at the archery range, where Oraneth will continue the story of the current Green Lady."},
        ["Return to the Village"] =
            {appendText=" of Deepwoods."},
        ["Talk to Oraneth 4"] =
            {appendText=" just outside of her home in Deepwoods.", stepTextKey="After learning about Gwaering's childhood prowess, I'm ready to hear the final part of the Gwaering's story."},
        ["Talk to Oraneth 5"] =
            {appendText="", stepTextKey="I heard the story of Deepwoods and some its the key sites related to Gwaering and her selection as the new Green Lady. I should thank Oraneth for her time."},
    },

    [GetQuestName(4195)] = { --"The Unkindest Cut"--iggy
        ["Recover Angardil's Work Tools"] =
            {appendText="\n\nThey could be scattered in bags or even Drublog pockets around the residential area in the eastern part of town, barely recognizable now that it is all charred and burnt."},
        ["Talk to Angardil 1"] =
            {appendText=", probably hidden among the plants of the northeast warehouse district, out of sight.", stepTextKey="I recovered Angardil's specialized tools. He said he'd meet me somewhere in the warehouse district near the docks to retrieve them."},
        ["Kill Ilwan at-Nazim"] =
            {appendText=", known for his twisted enjoyment of killing younglings, below deck of the Ra Gada's ship at the western docks of town."},
        ["Kill Dh'andsa"] =
            {appendText=", known for her merciless torturing of innocents after every raid, at the Ra Gada's ship main chamber at the western docks of town."},
        ["Talk to Angardil 2"] =
            {appendText=", still hidden among the plants of the northeast warehouse district, out of sight.", stepTextKey="The invader lieutenant is dead. I'll return to Angardil and see what he thinks of the situation."},
    },

[GetQuestName(4155)] = { --"Arithiel"--Rosque
		["Rescue Arithiel"] =
			{appendText=" from Abamath, the Ayleid ruins at the southmost edge of Malabal Tor. If the Worm Cult only set up recently, they may not have anything more than wooden cages to hold their captives in."},
		["Collect the Welkynd Stones"] =
			{appendText="\nArithiel said their glow would be visible from the camps outside Abamath. Most appear to have been set up north near the water's edge, but there may be one around back behind the ruins to the east as well."},
		["Place the Welkynd Stones in the Sconces"] =
			{appendText="\nThe entrance to Ayleid ruins is often in the center of their structures."},
		["Talk to Arithiel 1"] =
			{appendText=" in the center of Abamath.", stepTextKey="I unlocked the door to Abamath by placing the welkynd stones in the sconces. I should check with Arithiel about our plan."},
		["Enter Abamath"] =
			{appendText=", at the center of the ruins."},
		["Place Welkynd Stones"] =
			{appendText="\nArithiel said the sconces would likely be at two opposite ends of the passageways near the sanctum inside Abamath Ruins."},
		["Enter the Shrine of Mauloch"] =
			{appendText=" inside the Abamath Ruins."},
		["Talk to Arithiel 2"] =
			{appendText=" inside the Abamath Ruins.", stepTextKey="An energy barrier blocks the way into the sanctum, where the Worm Cult is preparing a ritual to summon Mauloch. I should ask Arithiel for guidance."},
		["Examine the Pedestal"] =
			{appendText=" near the sanctum inside the Abamath Ruins."},
		["Talk to Arithiel 3"] =
			{appendText=" inside the Abamath Ruins.", stepTextKey="A soul is required to shatter the Animus Geode and clear the path into the shrine. Boethiah says Arithiel is a traitor, but I should talk to Arithiel before I decide to sacrifice her to this stone."},
		["Use the Animus Geode on Arithiel"] =
			{appendText=" inside the Abamath Ruins."},
		["Use the Animus Geode on a Worm Cultist"] =
			{appendText=" inside the Abamath Ruins."},
		["Stop the Dark Ritual 1"] =
			{appendText=" inside the Shrine of Mauloch within the Abamath Ruins.", stepTextKey="I sacrificed Arithiel's soul to the Animus Geode. With Boethiah's Blessing, I must kill the summoners in the Shrine of Mauloch, before they can create a portal to Mauloch's realm."},
		["Slay Cassia Varo and Igozai"] =
			{appendText=" inside the Shrine of Mauloch within the Abamath Ruins."},
		["Talk to Arithiel 4"] =
			{appendText=" outside Abamath, around the southeastern ruins.", stepTextKey="I've prevented the Worm Cult's ritual, which pleased Boethiah, but sacrificed Arithiel.\n\nArithiel's spirit appeared outside the shrine's exit. I should talk with her to see what she wants."},
		["Talk to Arithiel 5"] =
			{appendText=" inside the Abamath Ruins.", stepTextKey="I spared Arithiel's life and used the Animus Geode on a Cultist. I should talk to Arithiel about what to do next."},
		["Stop the Dark Ritual 2"] =
			{appendText=" inside the Shrine of Mauloch within the Abamath Ruins.", stepTextKey="Arithiel is summoning a flame atronach to help me stop the ritual. I need to kill the summoners in the Shrine of Mauloch, before they can create a portal to Mauloch's realm."},
		["Talk to Arithiel 6"] =
			{appendText=" outside Abamath. She may have gone back towards her friends east of the ruins.", stepTextKey="I've prevented the Worm Cult's ritual, and spared Arithiel's life. I should talk with her to see what she plans to do now."},
	},

[GetQuestName(4285)] = { --"A Father's Promise"--Rosque
		["Search for Tanglehaven Militia"] =
			{appendText=". There are three roads out of Tanglehaven; one of them might have clues as to their whereabouts. The treethane said they were heading for the Drublog to seek revenge."},
		["Find the Survivor"] =
			{appendText=" off the western road from Tanglehaven."},
		["Talk to Firwin 1"] =
			{appendText=" off the western road from Tanglehaven.", stepTextKey="Firwin is alive! I should speak with her."},
		["Examine the Spring"] =
			{appendText=" off the western road from Tanglehaven."},
		["Talk to Firwin 2"] =
			{appendText=" off the western road from Tanglehaven.", stepTextKey="A spirit at Hircine's shrine said Firwin \"took the gift willingly.\" It said she was lost, but that she could save Treethane Dailithil from the same fate with her \"sire's heartblood.\"\n\nI should speak to Firwin and find out exactly what it meant."},
		["Talk to Treethane Dailithil"] =
			{appendText=" in Tanglehaven. If she isn't there, she may have grown tired of waiting and tried to find her daughter herself. She knew the direction the militia left, so she may be searching somewhere off one of the western paths from the village."},
		["Talk to Firwin 3"] =
			{appendText=" west across the river from Tanglehaven.", stepTextKey="Treethane Dailithil is unwell. As Firwin feared, her mother was bitten by Thulendor. If nothing is done, the treethane will become a werewolf as well.\n\nNow that Firwin has regained control of herself, I should speak with her and see what must be done."},
		["Kill Thulendor"] =
			{appendText=". Firwin ran towards a shrine west of Tanglehaven."},
		["Follow Firwin"] =
			{appendText=""},
		["Talk to Firwin 4"] =
			{appendText=". She ran off to find her mother along the dirt paths off Tanglehaven.", stepTextKey="Firwin brought her father's heartblood to Treethane Dailithil. I should speak with her and see if we arrived in time."},
	},

[GetQuestName(4137)] = { --"For Everything a Season"--Rosque
        ["Collect Thunderbug Hearts"] =
            {appendText="\nThey should be down the hill east of Vulkwasten."},
        ["Collect Thunderbug Maggots"] =
            {appendText="\nThe nests should be close to the thunderbugs."},
        ["Talk to Alphrost at Cold Cave"] =
            {appendText=". One of the pathways in Vulkwasten must lead to it."},
        ["Kill Igudhan"] =
            {appendText=" in the Cold Cave beneath the Vulkwasten Fighters Guild."},
        ["Talk to Alphrost"] =
            {appendText=" outside of the Cold Cave beneath the Vulkwasten Fighters Guild."},
    },

[GetQuestName(4101)] = { --"Payment In Kind"--Rosque
		["Talk to Dalaneth 1"] =
			{appendText=". Bloodtoil Valley is a valley that stretches across a river east of Tanglehaven. The Bosmer village is on the cliffs on the north side of the river.", stepTextKey="Mathragor asked me to speak with his daughter, Dalaneth, to see if there is a way to stop the bloodshed between the Drublog and Bosmer of Bloodtoil Valley. I can find her in the Bosmer village in Bloodtoil Valley."},
		["Help Ulagash"] =
			{appendText=". The Drublog village is on the southern side of the Bloodtoil Valley river. Orcish shamans often decorate sites of importance with impressive bones or other animal trophies."},
		["Talk to Mathragor 1"] =
			{appendText=", south of the Bloodtoil Valley river.", stepTextKey="I should tell Mathragor that Shaman Yarnag and the chief's son are dead. He's probably waiting near the Drublog side of the valley."},
		["Search for Villagers"] =
			{appendText="\nThe Bosmer Village is north of the Bloodtoil Valley river. If any survivors need aid, they likely fled into wilderness too close to their homes and became trapped by Drublog, or hidden themselves from view as best they could inside the village."},
		["Talk to Mathragor 2"] =
			{appendText=". He's likely still praying to Z'en for his daughter's safety around the Bloodtoil Valley bridge.", stepTextKey="I saved a few villagers, but was unable to locate Dalaneth. I should tell Mathragor."},
		["Kill Chief Ulukhaz"] =
			{appendText=". The Drublog live on the cliffs on the southern side of the Bloodtoil Valley river."},
		["Talk to Dalaneth 2"] =
			{appendText=" in the chieftain's longhouse on the cliffs south of the Bloodtoil Valley river.", stepTextKey="I killed the chief, but not before she gravely wounded Dalaneth. I need to check if she can make it back to the valley."},
		["Talk to Mathragor 3"] =
			{appendText=". He said that he would be praying for guidance at the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="I was too late to save Dalaneth, despite killing Chief Ulukhaz. I should speak with Mathragor and let him know his daughter didn't survive."},
		["Talk to the Emissary of Z'en 1"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="A strange spirit appeared in the Shrine of Z'en. I should speak to it."},
		["Talk to Mathragor 4"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="The Emissary of Z'en has asked that I dissuade Mathragor from cursing the Drublog. I must choose how to deal with Mathragor."},
		["Witness Z'en's Judgment"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river."},
		["Talk to the Emissary of Z'en 2"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="The Emissary of Z'en killed Mathragor. I need to learn why."},
		["Talk to the Emissary of Z'en 3"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="With Mathragor's death, the violence in Bloodtoil Valley is over. I should speak to The Emissary of Z'en and find out what will happen to this shrine."},
		["Talk to Mathragor 5"] =
			{appendText=" in the shrine of Z'en at the northwestern edge of the Bloodtoil Valley river.", stepTextKey="I managed to dissuade Mathragor from continuing the violence. I should speak to him and find out what he plans to do next."},
	},

[GetQuestName(4475)] = { --"Shock to the System"--Rosque
        ["Find the Argonian's Camp"] =
            {appendText="."},
        ["Look for Instructions on the Alchemist Table"] =
            {appendText=", at the Argonian's camp along the river south of Silvenar."},
        ["Take Control of a Thunderbug"] =
            {appendText=" near the river south of Silvenar."},
        ["Bring the Thunderbug to the Argonian"] =
            {appendText=" at the southern branch of the river south of Silvenar, just past the falls."},
        ["Talk to the Argonian"] =
            {appendText=" at the river falls southeast of Bloodtoil Valley."},
        ["Talk to Yinz-Hei"] =
            {appendText=" at the river falls southeast of Bloodtoil Valley."},
    },


[GetQuestName(4134)] = { --"Something Rotten"--Rosque
        ["Rouse the Drunken Timber Mammoths"] =
            {appendText="\nThey're big enough to be visible from the center of Vulkwasten."},
        ["Return to Galithor"] =
            {appendText=" at the mammoth pens in north Vulkwasten."},
        ["Talk to Alphrost"] =
            {appendText=" at the mammoth pens in north Vulkwasten."},
        ["Search the Brewery"] =
            {appendText=" in Vulkwasten. Galithor, at the mammoth pens on the north end of town, may be able to offer more details about what they brew and where it's kept."},
        ["Stop the Thieves"] =
            {appendText="."},
        ["Read the Note from Firuin"] =
            {appendText=" in the Brewery above the Vulkwasten tavern."},
        ["Talk to Galithor 1"] =
            {appendText=". If he's not back at the mammoth pens, he may have come to the Tall Trunk Tavern to see what's going on for himself.", stepTextKey="Galithor will want to know what's happened. Maybe he has an idea where the Daedra might have gone, or why they're here in the first place."},
        ["Save the Rotmeth"] =
            {appendText=". Galithor said that they took the mammoths out behind the pens to graze on Balding Hill; the trampled down dirt paths may be a good place to start looking for daedric activity."},
        ["Talk to Galithor 2"] =
            {appendText=". He said that he would stay behind at Tall Trunk Tavern to see what was stolen.", stepTextKey="With the Daedra dealt with, I should talk to Galithor."},
    },

[GetQuestName(4156)] = { --"The Soul Trap"--Rosque
        ["Unlock The Warrior"] =
            {appendText="."},
        ["Unlock The Mage"] =
            {appendText="."},
        ["Unlock The Thief"] =
            {appendText="."},
        ["Talk to Khanni"] =
            {appendText="."},
    },

[GetQuestName(4103)] = { --"Z'en and Mauloch"--Rosque --kayreb
        ["Search for Ancient Journals"] =
            {appendText="\nThe journal may be able to point to likely places that other Bosmer following Z'en may have left recordings of their findings, but Bloodtoil Valley is split into two. Just as the Z'en priest's journal was left at the shrine on the northern side of the river, it's possible important figures in the Drublog left recordings of their history as well."},
        ["Give the Journals to Spinner Sandaenion"] =
            {appendText=". It's common practice for spinners surveying the story of an area to do so from the source of the water that flows through it. It may be possible to catch one interested in Bloodtoil Valley by searching for one doing so."},
        ["Talk to Spinner Sandaenion"] =
            {appendText=" at the top of the waterfalls east of Bloodtoil Valley."},
    },

[GetQuestName(4142)] = { --"Awakening"--Rosque
        ["Find the Hengekeeper"] =
            {appendText=" inside the Roots of Treehenge."},
        ["Awaken the Matrons"] =
            {appendText="\nLara said that disturbing Treehenge's roots would wake them up."},
        ["Enter Treehenge"] =
            {appendText=", deep within the roots."},
        ["Talk to a Matron"] =
            {appendText=", deep within the center of Treehenge."},
        ["Warn Finoriell of the Cult's Plans"] =
            {appendText=", deep within the center of Treehenge."},
        ["Talk to Hengekeeper Lara 1"] =
            {appendText=", deep within the center of Treehenge.", stepTextKey="Finoriell has been trapped by some magical bond. She urged me to ask Hengekeeper Lara for guidance to save her."},
        ["Gather Moon-Kissed Droplets"] =
            {appendText="\nLara said that the moon kisses the rivers flowing through Treehenge in beams from the sky."},
        ["Catch Starry Torchbugs"] =
            {appendText="\nLara said that the stars travel on gossamer wings, in torchbugs gracing frond and leaf in Treehenge."},
        ["Cleanse the Altar"] =
            {appendText=". The elegant archways in the center of Treehenge likely mark the paths towards it."},
        ["Talk to Finoriell's Soul"] =
            {appendText=", at the alter through the western path from the center of Treehenge."},
        ["Talk to Hengekeeper Lara 2"] =
            {appendText=" in the center of Treehenge.", stepTextKey="Finoriell told me more about the Worm Cult's intentions - to use her soul to corrupt all of the matrons of Treehenge.\n\nI should inform Hengekeeper Lara immediately."},
    },

[GetQuestName(4092)] = { --"Back to Rest"--Rosque 
        ["Stop the Cultists from Tormenting Ouze's Spirits"] =
            {appendText="\nThe worm cult doesn't appear to be keeping subtle about it."},
        ["Cleanse the Southeast Altar"] =
            {appendText=" that imprisons the oathbreakers."},
        ["Cleanse the Northeast Altar"] =
            {appendText=" that imprisons the oathbreakers."},
        ["Cleanse the Western Altar"] =
            {appendText=" that imprisons the oathbreakers."},
        ["Talk to the Moranda Gem Array"] =
            {appendText=" in the Worm Cult camp tent west of Ouze."},
        ["Talk to the Voice of Ouze"] =
            {appendText=" in the Worm Cult camp tent west of Ouze."},
    },

[GetQuestName(4288)] = { --"Blind Man's Bluff"--Rosque 
        ["Convince Deros to Transport Captain Khammo"] =
            {appendText=", on Horseshoe Island. Captain Khammo gave the impression that they were harassing him frequently, so they're likely to be on the same island that he is."},
        ["Talk to Captain Khammo 1"] =
            {appendText=" on the east edge of Horseshoe Island.", stepTextKey="As expected, Deros agreed to transport Captain Khammo for a share of the treasure. Now to get the treasure from Captain Khammo."},
        ["Dig up the Treasure"] =
            {appendText="\nKhammo said that Rania warned him away from the Maormer, so they're likely preventing her from reaching the dig sites."},
        ["Talk to Captain Khammo 2"] =
            {appendText=" on the east edge of Horseshoe Island.", stepTextKey="The chests buried around Horseshoe Island were filled with garbage. I should tell Captain Khammo the bad news."},
        ["Talk to Deros"] =
            {appendText=" on the east edge of Horseshoe Island."},
        ["Talk to Captain Khammo 3"] =
            {appendText=" on the east edge of Horseshoe Island.", stepTextKey="Deros refused to take Captain Khammo to Anvil. I should let him know the bad news."},
        ["Talk to Captain Khammo 4"] =
            {appendText=" on the east edge of Horseshoe Island.", stepTextKey="Deros refused to take Captain Khammo to Island. I should let him know the bad news."},
        ["Talk to Captain Khammo 5"] =
            {appendText=" on the east edge of Horseshoe Island.", stepTextKey="Deros may not like the treasure he received, but he agreed to take Captain Khammo to Anvil. I should tell Captain Khammo the good news."},
    },


[GetQuestName(4503)] = { --"Brothers and Bandits"--Rosque 
        ["Find Dariel"] =
            {appendText=" inside Black Vine Ruins. Daine said that he hadn't seen him in a while, so he may be quite far in."},
        ["Talk to Dariel 1"] =
            {appendText=" at the eastern edge of Black Vine Ruins.", stepTextKey="I found Dariel near the back of the ruins. He seems to be injured. I should speak to him and see if he's able to walk."},
        ["Escort Dariel to Safety 1"] =
            {appendText=" inside Black Vine Ruins.", stepTextKey="I found Dariel at the back of the ruins. Now I need to escort him to the entrance."},
        ["Talk to Dariel 2"] =
            {appendText=" inside Black Vine Ruins.", stepTextKey="I found Dariel at the back of the ruins and managed to escort him to the entrance. I should speak to Dariel to see what he plans to do next."},
        ["Collect the Plant Sap"] =
            {appendText=" next to the Ayleid well in Black Vine Ruins. Dariel described it as small and reddish."},
        ["Bring the Sap to Dariel"] =
            {appendText=" at the eastern edge of Black Vine Ruins."},
        ["Escort Dariel to Safety 2"] =
            {appendText=" inside Black Vine Ruins.", stepTextKey="I found Dariel at the back of the ruins and collected the plant sap that should help heal Daine. Now I need to escort Dariel back to the entrance of the ruins."},
        ["Talk to Dariel 3"] =
            {appendText=" inside the entrance of Black Vine Ruins.", stepTextKey="I found Dariel at the back of the ruins, collected the plant sap that should help heal Daine and escorted Dariel to safety. I should speak to Dariel to see what he plans to do next."},
    },

[GetQuestName(4130)] = { --"The Captain's Honor"--Rosque 
        ["Meet the Thalmor Striker in the Cave"] =
            {appendText=" at Ogrim's Yawn, somewhere northeast of Jode's Pocket."},
        ["Kill Arch-Wizard Sameht"] =
            {appendText=" inside Ogrim's Yawn."},
        ["Destroy the Animus Geode"] =
            {appendText=" inside Ogrim's Yawn."},
        ["Talk to Captain Seritenya 1"] =
            {appendText=" inside Ogrim's Yawn.", stepTextKey="I destroyed the animus geode the Maormer Arch-Wizard used to drain the captain's memories. I should talk to her to see if she is all right."},
        ["Meet the Crew at the Cave's Exit"] =
            {appendText=", at the top of the path south of Ogrim's Yawn."},
        ["Talk to Captain Seritenya 2"] =
            {appendText=", at the top of the path south of Ogrim's Yawn.", stepTextKey="I rescued Captain Seritenya and a number of her crew from their Maormer captors. I should see if the captain requires any more assistance."},
    },


[GetQuestName(4165)] = { --"The Dark Night of the Soul"--Rosque 
        ["Kill the Spriggans' Tormentors"] =
            {appendText="\nSome of the lights from their rituals are visible from the western arch at the center of Treehenge."},
        ["Talk to the Spriggan Matron"] =
            {appendText=". The voice said to come to the waterfall, and follow the light. There may be a prominent waterfall within Treehenge."},
        ["Retrieve the Seed of the Henge"] =
            {appendText=". The Spriggan Matron said that it was somewhere in the Roots of Treehenge, the cavern that spills out from Malabal Tor into Treehenge."},
        ["Talk to Hengekeeper Lara 1"] =
            {appendText=" in the middle of Treehenge.", stepTextKey="I've recovered the seed from the roots of Treehenge. This, combined with the fresh power of Finoriell's soul, may fortify Treehenge against the Worm Cult's attacks."},
        ["Collect Finoriell's Soul in the Seed"] =
            {appendText=". Hengekeeper Lara said that she could feel it was still nearby, inside Treehenge."},
        ["Talk to Hengekeeper Lara 2"] =
            {appendText=" in the middle of Treehenge.", stepTextKey="Though I've recovered Finoriell's soul, it has been weakened severely. If it's to survive, I'll need to find a way to mend it before it's too late."},
        ["Watch the Matrons Heal Finoriell"] =
            {appendText=" in the middle of Treehenge."},
        ["Talk to Finoriell"] =
            {appendText=" in the middle of Treehenge."},
    },


[GetQuestName(4196)] = { --"Enemy of My Enemy"--Rosque
        ["Talk to Eraral-dro"] =
            {appendText=" in the Trade Stalls of Baandari Trading Post."},
        ["Intercept the Gold Coast Missive"] =
            {appendText=". Eraral-dro mentioned that the courier would be arriving from the north, at a small camp located just outside the gates of Baandari Trading Post."},
        ["Bring the Gold Coast Missive to Eraral-dro by the Gates"] =
            {appendText=" of Baandari Trading Post."},
        ["Make a Plan of Action with Eraral-dro in His Office"] =
            {appendText=". He walked into the building near the Baandari Trading Post Wayshrine with the especially twisty trees flanking the door."},
        ["Deliver the Altered Missive to the Captain"] =
            {appendText=". The mercenaries are camped out west of Baandari Trading Post. The dead mercenary in Rejmina's house may be able to provide a disguise that will fool the captain."},
        ["Talk to Tabil"] =
            {appendText=". He appeared at the captain's tent west of Baandari Trading Post, seemingly eager to speak about something."},
        ["Remove a Paw from a Werewolf"] =
            {appendText=". They're known to be inhabiting Four Quarry Islet near Baandari Trading Post."},
        ["Assassinate the Gold Coast Commanders"] =
            {appendText="\nThey're coordinating the werewolf fighting on Four Quarry Islet. The werewolf paw can be used after they are taken out to frame the werewolves for their deaths."},
        ["Talk to Eraral-dro by the Gates"] =
            {appendText=", near Baandari Trading Post."},
    },

[GetQuestName(4091)] = { --"Fulfilling One's Fate"--Rosque
		["Talk to Spinner Indinael 1"] =
			{appendText=". The other spinner said they saw her on an altar in the water.", stepTextKey="I need to find Spinner Indinael and find out what can be done to stop the Worm Cult."},
		["Burn the Southern Spriggan Corpses"] =
			{appendText=". It likely is not too far off the road if the Worm Cult had to haul them all there."},
		["Burn the Central Spriggan Corpses"] =
			{appendText=". They may be piled up in one of the camps bordering the center of Ouze."},
		["Burn the Northwestern Spriggan Corpses"] =
			{appendText=". There's a large camp of Worm Cult near Ouze that may likely hold important items."},
		["Talk to Spinner Indinael 2"] =
			{appendText=" in the center of Ouze.", stepTextKey="I should tell Spinner Indinael that I've burned the spriggans' corpses, keeping their heartwood out of the hands of the Worm Cult."},
		["Investigate the Sack"] =
			{appendText=" in the center of Ouze."},
		["Talk to Spinner Indinael 3"] =
			{appendText=" in the center of Ouze.", stepTextKey="I need to find out what the Totem of Y'ffre does and why Spinner Indinael wanted me to get it."},
		["Charge the Totem with Guardian Celonron's Energy"] =
			{appendText="\nThe southernmost altar in Ouze should be on the road."},
		["Talk to Guardian Celonron"] =
			{appendText=" at southernmost altar in Ouze, just off the road."},
		["Talk to Spinner Indinael 4"] =
			{appendText=" in the center of Ouze.", stepTextKey="Guardian Celonron didn't seem to hold a grudge against me for draining part of his spiritual essence. However, he did say I need to get back to Spinner Indinael quickly."},
		["Examine the Stone Altar"] =
			{appendText=" in the center of Ouze."},
		["Search for Clues to Spinner Indinael's Location"] =
			{appendText="\nIt looks like there are drag marks from a cart heading west from the center of Ouze, towards the large Worm Cult camp there. There may be something worth checking along the way. The northern camp barely visible from the center of Ouze may be worth a look, as well."},
		["Locate the Cave's Entrance"] =
			{appendText=", somewhere along the eastern ridge."},
		["Talk to Spinner Endrith"] =
			{appendText=" southeast of the center of Ouze."},
		["Destroy the Worm Cult's Creation"] =
			{appendText=" inside the cave southeast of the center of Ouze."},
		["Talk to Spinner Indinael outside the Cave"] =
			{appendText=", on the road north of Ouze."},
		["Talk to Spinner Gwilon"] =
			{appendText=" on the road north of Ouze."},
	},

[GetQuestName(4131)] = { --"The Maormer's Vessels"--Rosque
        ["Burn Maormer Sailboats"] =
            {appendText="\nMost are likely along the shore, but there may be some further out as well."},
        ["Talk to Striker Aldewe at the Overlook"] =
            {appendText=". It has an excellent view of her ship's wreck, as well as the Maormer's ship."},
    },


[GetQuestName(4144)] = { --"The Misfortunate Minstrels"--Rosque
        ["Find Buzul"] =
            {appendText=" in the ravine north of Silvenar. Laen can see him from her hiding place, but he likely doesn't have the courage to reach her on his own."},
        ["Find Dadazi"] =
            {appendText=" in the ravine north of Silvenar. She's a wily one, so she may be hiding behind something."},
        ["Find Alanaire"] =
            {appendText=" in the ravine north of Silvenar. She likely hasn't left the ravine, but if she tried to flee, she may be near one of the eastern exits."},
        ["Collect Lute"] =
            {appendText=" in the ravine north of Silvenar."},
        ["Collect Drums"] =
            {appendText=" in the ravine north of Silvenar."},
        ["Collect Flute"] =
            {appendText=" in the ravine north of Silvenar. The Houndsmen may have been amusing themselves by balancing it on its end."},
        ["Collect Harp"] =
            {appendText=" in the ravine north of Silvenar."},
        ["Go to Musicians' Camp"] =
            {appendText=". It should be on the path, a camp of buildings made from vines hanging from the trees, nestled west between Silvenar and the Chancel of Divine Entreaty."},
        ["Talk to Laen the Doorwalker"] =
            {appendText=" at the minstrels' camp, west of Silvenar on the southern end of the path."},
        ["Kill Grimclaw"] =
            {appendText=" at the minstrels' camp, west of Silvenar on the southern end of the path."},
        ["Talk to Laen"] =
            {appendText=" at the minstrels' camp, west of Silvenar on the southern end of the path."},
    },

[GetQuestName(4161)] = { --"A Novel Idea"--Rosque
        ["Collect Hoarvor Blood"] =
            {appendText="\nHoarvor can be found in the story world inside the Caverns of Valeguard."},
        ["Get Old Tusk's Flesh"] =
            {appendText=" from the story world inside the Caverns of Valeguard, near the hoarvor."},
        ["Talk to Farandor outside the Cave"] =
            {appendText=", in the uppermost reaches of Valeguard. There should be a path that leads up there south of the entrance to the Caverns of Valeguard."},
        ["Splash Blood onto the Animal Skins"] =
            {appendText="\nFarandor said that the ramp south of the entrance to the Caverns of Valeguard would lead up to the skins."},
        ["Seal the Words at the Fire Pit"] =
            {appendText=" near the center of Valeguard."},
        ["Take the Book to the Khajiit Bard in Valeguard"] =
            {appendText=". Shandi is likely somewhere near the center of Valeguard."},
        ["Talk to Shandi"] =
            {appendText=" near the middle of Valeguard."},
    },


[GetQuestName(4229)] = { --"Sacred Prey, Hunt Profane"--Rosque
        ["Retrieve the Carved Mammoth Tusks from the Cultists"] =
            {appendText="\nIt's hard to tell who might be carrying them, but there are Worm Cultists all over Treehenge."},
        ["Talk to Vanendil 1"] =
            {appendText=". Anaste was at the furthest northeastern edge inside Treehenge; if she was separated from her research partner and couldn't find him, he likely went somewhere opposite to where she was.", stepTextKey="Aniaste mentioned another Altmer in the area, whom she was doing research for. I should seek him out."},
        ["Take the Ceremonial Carving Knife from the Camp"] =
            {appendText=". Vanendil is located at the southwestern-most edge inside Treehenge, and he said there was a Worm Cult camp nearby."},
        ["Put the Ivory in the Fire Pit"] =
            {appendText=" at the southwestern-most point inside Treehenge."},
        ["Add the Knife to the Fire Pit"] =
            {appendText=" at the southwestern-most point inside Treehenge."},
        ["Talk to Vanendil 2"] =
            {appendText=" at the southwestern-most point inside Treehenge.", stepTextKey="I've destroyed the ivory carvings and attracted the attention of the mammoth spirits. There's no telling if they understand, but perhaps Vanendil has more insight into their reaction."},
    },


[GetQuestName(4129)] = { --"Shipwrecked Sailors"--Rosque
        ["Rescue the Quartermaster"] =
            {appendText="."},
        ["Rescue the Carpenter"] =
            {appendText="."},
        ["Rescue the Bosun"] =
            {appendText="."},
        ["Rescue the Striker"] =
            {appendText="."},
        ["Rescue the First Mate and Captain"] =
            {appendText=". One of the survivors said something about them being taken towards the cliffs east of Jode's Pocket. Another mentioned someone called Arch-Wizard Sameht, who is apparently the Maormer's leader."},
        ["Talk to First Mate Valion 1"] =
            {appendText=" at the cage northeast of Jode's Pocket.", stepTextKey="The Maormer kept the first mate in a cage, but I've freed him from his prison. He may know where to find the captain."},
        ["Burn the Thalmor Fleet Manifest"] =
            {appendText=". First Mate Valion said that their ship ran aground north of Jode's Pocket, not far from the wreck of another ship. He also mentioned that the manifest was disguised as a regular book somewhere in the ship's hold."},
        ["Find First Mate Valion"] =
            {appendText=". Hopefully he's somewhere close to the ship moored north of Jode's Pocket."},
        ["Talk to First Mate Valion 2"] =
            {appendText=" on board The Lambent Peregrine, the ship moored north of Jode's Pocket.", stepTextKey="It looks like First Mate Valion caught a Maormer on the ship and is interrogating him. I should see what he's learned about the captain."},
    },

[GetQuestName(4085)] = { --"A Tale Forever Told"--Rosque
        ["Talk to Elilor"] =
            {appendText=" near the great tree in Valeguard."},
        ["Examine the Handfast"] =
            {appendText=", the wooden idol near the great tree in Valeguard."},
        ["Confront Spinner Indraseth"] =
            {appendText=" in Valeguard."},
        ["Follow Spinner Indraseth"] =
            {appendText=". Shandi ran off towards the northeast end of Valeguard. She seems to think that being part of the story, I can enter the Caverns of Valeguard where others could not."},
        ["Retell the Story of the Silvenar"] =
            {appendText=" inside the Caverns of Valeguard."},
        ["Defeat Spinner Indraseth"] =
            {appendText=" inside the Caverns of Valeguard."},
        ["Talk to Spinner Indraseth"] =
            {appendText=" inside the Caverns of Valeguard."},
        ["Retell the Story of the Green Lady"] =
            {appendText=" inside the Caverns of Valeguard. It is possible that not all the wilds have been corrupted by the Hound yet, and some of its entities could be willing to assist in correcting the story."},
        ["Defeat the Hound"] =
            {appendText=" inside the Caverns of Valeguard."},
        ["Talk to the Green Lady"] =
            {appendText=" inside the Caverns of Valeguard."},
        ["Talk to Spinner Indraseth at Valeguard"] =
            {appendText="'s uppermost reaches, south from the entrance to the Caverns of Valeguard."},
        ["Imbue the Handfast with the Essences of the Story"] =
            {appendText=", in the center of Valeguard."},
        ["Talk to Spinner Parwaen"] =
            {appendText=" in Valeguard."},
    },


[GetQuestName(4199)] = { --"A Tangled Net"--Rosque
        ["Add the Powder to the Mercenaries' Kegs"] =
            {appendText="\nThe mercenaries are camped west of Baandari Trading Post. They're known to be particular about their alcohol, though, so sneaking the powder in may be tricky."},
        ["Talk to Eraral-dro 1"] =
            {appendText=" outside the gates of Baandari Trading Post.", stepTextKey="I've added the powder to the Gold Coast's kegs. I should speak with Eraral-dro to see what he plans to do with this advantage."},
        ["Collect \"Support\" from the Other Traders"] =
            {appendText="\nThey should all be near the Trade Stalls in Baandari Trading Post. Eraral-dro said to simply ask nicely."},
        ["Find Eraral-dro"] =
            {appendText=" inside Baandari Trading Post. If he isn't around, Tabil might know where to find him."},
        ["Talk to Captain Aurelia Blasio"] =
            {appendText=" west of Baandari Trading Post."},
        ["Talk to Eraral-dro 2"] =
            {appendText=" in the captain's tent west of Baandari Trading Post.", stepTextKey="The captain knows something is amiss. I should talk to Eraral-dro to find out what he wants to do."},
	["Talk to Tabil 1"] =
            {appendText=" near the stables of Baandari Trading Post.", stepTextKey="Eraral-dro's sent me to meet his assistant, and finish the plan we've set in motion."},
        ["Buy off the Colovian Mercenaries"] =
            {appendText=" inside Fazaddu's House near the stables of Baandari Trading Post. Tabil, outside, may have a suggestion."},
        ["Talk to Tabil 2"] =
            {appendText=" inside Fazaddu's House near the stables of Baandari Trading Post.", stepTextKey="Eraral-dro's sent me to meet his assistant, and finish the plan we're set in motion."},
        ["Confront Captain Aurelia Blasio"] =
            {appendText=" at her tent west of Baandari Trading Post."},
        ["Talk to Eraral-dro at the Gates"] =
            {appendText=" of Baandari Trading Post."},
        ["Talk to Eraral-dro 3"] =
            {appendText=" of Baandari Trading Post.", stepTextKey="Eraral-dro is free, and the Gold Coast is leaderless. It's only a matter of time before they break apart and, hopefully, wander back to Colovia. I should speak to Eraral-dro about this matter."},
    }, 

[GetQuestName(4515)] = { --"The Ties that Bind"--Rosque
        ["Investigate the Attack Site"] =
            {appendText=". The road Nilaendril was referring to goes west from the wayshrine deeper into Wilding Run."},
        ["Find Captain Trelano"] =
            {appendText=". The path through Wilding Run has three forks. Corporal Brelinith noted there were four campsites, all on or just off the pathways. She also mentioned the ruins at the southwestern-most end of the path, and the overlook at the western-most end of the path. Apparently, no surveyors went as far as the beach."},
        ["Talk to the Shade of Ulthorn 1"] =
            {appendText=" in the overlook ruins on the western cliffs of Wilding Run.", stepTextKey="The lieutenant is injured and Captain Trelano appears mesmerized by some manner of spirit. It doesn't appear hostile. I should find out what it wants."},
        ["Talk to the Shade of Ulthorn 2"] =
            {appendText=", from the ruins west of Wilding Run.", stepTextKey="After speaking with the Shade of Ulthorn, I was transported to a wooded glade. I should talk to the Shade of Ulthorn and determine what must be done to find the soldiers."},
        ["Rescue Captain Trelano"] =
            {appendText=" inside the Shade of Ulthorn's trance in the ruins west of Wilding Run. The Shade of Ulthorn might know how to proceed."},
        ["Talk to Captain Trelano"] =
            {appendText=" at Hircine's shrine, on the path loop just west of Wilding Run Wayshrine."},
    },

[GetQuestName(4337)] = { --"Buyer Beware"--Rosque
        ["Talk to Jurak-dar 1"] =
            {appendText=". To reach Belarata, first head north from Grahtwood and continue westward along the road until you cross the river. Once you have crossed the second bridge, you should be able to spot the ruins towards the east.", stepTextKey="I should speak with Jurak-dar and see if there is any truth to his claims."},
        ["Persuade Customers to Leave"] =
            {appendText=" around Belarata."},
        ["Talk to Jurak-dar 2"] =
            {appendText=" in front of Belarata.", stepTextKey="Some of Jurak-dar's wares seem quite dangerous. I should speak with him about gaining access to the ruin."},
        ["Enter the Ruin"] =
            {appendText=" of Belarata."},
        ["Talk to Jurak-dar 3"] =
            {appendText=" inside Belarata.", stepTextKey="Jurak-dar wants to speak with me before we proceed into the ruin."},
        ["Release the Barrier"] =
            {appendText="."},
        ["Talk to Jurak-dar 4"] =
            {appendText=" inside Belarata.", stepTextKey="The spirit haunting Belarata is no more. I should speak with Jurak-dar."},
        ["Put Spirits to Rest"] =
            {appendText=" inside Belarata."},
        ["Talk to Jurak-dar 5"] =
            {appendText=" inside Belarata.", stepTextKey="The spirits haunting Belarata have been put to rest. I should speak with Jurak-dar."},
    },




--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH--REAPERS MARCH

[GetQuestName(5092)] = { --"The Champions at Rawl'kha"--Rosque
        ["Speak to a Moon Priest of Rawl'kha"] =
            {appendText=". To get there, head east along the road that connects Malabal Tor and Fort Grimwatch, then head south down the road from Greenhill all the way across the river."},
    },

[GetQuestName(4799)] = { --"To Saifa in Rawl'kha"--Rosque
        ["Talk to Saifa 1"] =
            {appendText=" in Rawl'kha. To get there, head north along the road out of Moonmont and follow the curve of the river. If she's a priest like the others, she'll likely be dressed the same as the acolytes in Moonmont.", stepTextKey="A moon priest at Moonmont told me that an acolyte in Rawl'kha would know more of the \"paths\" that I'm supposed to walk. I should speak to her there."},
        ["Talk to Saifa 2"] =
            {appendText=" in front of the temple in Rawl'kha.", stepTextKey="The moon priestess Saifa is being very coy. I should speak to her again to see what she wants me to do."},
    },


[GetQuestName(5093)] = { --"Moons Over Grimwatch"--Rosque
        ["Talk to Englor at Fort Grimwatch"] =
            {appendText=". To get there, cross the river west out of Rawl'kha, then head north along the road until you see Greenhill's windmill. The fort is just to the west, along the road leading to Malabal Tor."},
    },


[GetQuestName(4460)] = { --"Grim Situation"--Rosque
        ["Follow Englor"] =
            {appendText=". He was shouting as he sprinted into the tree on the right, just inside the ruined gates."},
        ["Talk to Shazah 1"] =
            {appendText=" in the upper room of the tree on the right, just inside the ruined gates.", stepTextKey="I should speak to Shazah and learn more about what has happened at Fort Grimwatch."},
        ["Seal the Western Corruption"] =
            {appendText=". A corrupted spirit well likely formed near Khajiiti temple iconography."},
        ["Seal the Northern Corruption"] =
            {appendText=". A corrupted spirit well likely formed near Khajiiti temple iconography."},
        ["Seal the Southern Corruption"] =
            {appendText=". Shazah said that the ground split open beneath them; it's likely that this event caused a corrupted spirit well to form."},
        ["Get to the Central Tree"] =
            {appendText="."},
        ["Wait for Shazah"] =
            {appendText=" in the central tree."},
        ["Talk to Rid-Thar-ri'Datta"] =
            {appendText=" in the central tree."},
        ["Receive the Blessing of the First Mane"] =
            {appendText=" in the central tree."},
        ["Talk to Shazah 2"] =
            {appendText=" in the central tree.", stepTextKey="The First Mane has gifted me with his blessing. I should speak to Shazah again."},
        ["Pass Through the Dark Fire Barrier"] =
            {appendText=" deep within the crevice in Fort Grimwatch."},
        ["Talk to Khali"] =
            {appendText=" deep within the crevice in Fort Grimwatch."},
    },



[GetQuestName(4461)] = { --"Grimmer Still"--Rosque
		["Touch Barrier"] =
			{appendText=" deep within the crevice inside Fort Grimwatch."},
		["Explore the Temple"] =
			{appendText=" deep within the crevice inside Fort Grimwatch."},
		["Talk to Khali 1"] =
			{appendText=" inside Khaj Rawlith located in Fort Grimwatch.", stepTextKey="Another barrier blocks our way. I should speak to Khali."},
		["Reach the Door's Far Side"] =
			{appendText=" deep within the crevice inside Fort Grimwatch. Khali mentioned that she saw a ruined doorway on the south wall, which she thinks we could slip into."},
		["Disrupt the Ritual"] =
			{appendText=" on the other side of the door, deep within the crevice inside Fort Grimwatch. Khali suggested I get the senche statues to stop."},
		["Wait for Khali"] =
			{appendText=" on the other side of the door, deep within the crevice inside Fort Grimwatch."},
		["Talk to Khali 2"] =
			{appendText=" deep within the crevice inside Fort Grimwatch.", stepTextKey="We did it! I should speak to Khali again."},
		["Talk to Shazah 1"] =
			{appendText=" deep within the crevice inside Fort Grimwatch.", stepTextKey="Shazah has arrived with reinforcements. I should speak to her."},
		["Choose Khali"] =
			{appendText=" deep within the crevice inside Fort Grimwatch."},
		["Choose Shazah"] =
			{appendText=" deep within the crevice inside Fort Grimwatch."},
		["Purge the Dro-m'Athra Energy 1"] =
			{appendText=" in the deepest recess of the crevice inside Fort Grimwatch.", stepTextKey="I found the font of darkness that allowed the Dro-m'Athra into the fort. Time to seal it up."},
		["Talk to Khali 3"] =
			{appendText=" in the deepest recess of the crevice inside Fort Grimwatch.", stepTextKey="We capped off the source of the Dro-m'Athra. I need to talk to Khali."},
		["Talk to Shazah 2"] =
			{appendText=" deep within the crevice inside Fort Grimwatch.", stepTextKey="Khali suggested we head back and speak to Shazah."},
		["Purge the Dro-m'Athra Energy 2"] =
			{appendText=" in the deepest recess of the crevice inside Fort Grimwatch.", stepTextKey="I've found the font of darkness allowed the Dro-m'Athra into the fort. Time to seal it up."},
		["Talk to Shazah 3"] =
			{appendText=" in the deepest recess of the crevice inside Fort Grimwatch.", stepTextKey="We've capped off the source of the Dro-m'Athra. I need to talk to Shazah."},
		["Talk to Khali 4"] =
			{appendText=" deep within the crevice inside Fort Grimwatch.", stepTextKey="Shazah suggested we head back and speak to Khali."},
	},

[GetQuestName(4689)] = { --"A Door Into Moonlight"--Rosque
        ["Go to the Moonlit Clearing"] =
            {appendText=". Senalana is the enormous Ayleid ruin at the northernmost edge of Reaper's March."},
        ["Talk to Kauzanabi-jo 1"] =
            {appendText=" in the clearing north of Senalana.", stepTextKey="A Moon Priestess by the name of Kauzanabi-jo was in the clearing when I entered. I should speak with her."},
        ["Pray at the Altar"] =
            {appendText=" in the clearing north of Senalana."},
        ["Talk to Kauzanabi-jo 2"] =
            {appendText=" in the clearing north of Senalana.", stepTextKey="The First Mane appeared and confirmed that I'm this Moon Hallowed person. I should speak to the priestess again to see what she thinks about this."},
    },



[GetQuestName(4710)] = { --"Hallowed To Arenthia"--Rosque
        ["Talk to Cariel in Arenthia"] =
            {appendText=", on the road outside of the city. To get there, head south from the ruin of Senalana to find the road, and follow it due northeast."},
    },



[GetQuestName(4759)] = { --"Hallowed to Rawl'kha"--Rosque
        ["Talk to Hadam-do at Rawl'kha"] =
            {appendText=". To get there, follow the river that runs through the middle of Reaper's March until you reach the center of the region."},
    },


[GetQuestName(5091)] = { --"Hallowed To Grimwatch"--Rosque
        ["Find Englor at Fort Grimwatch"] =
            {appendText=". To get there, cross the river west out of Rawl'kha, then head north along the road until you see Greenhill's windmill. The fort is just to the west, along the road leading to Malabal Tor."},
    },


[GetQuestName(4652)] = { --"The Colovian Occupation"--Rosque
		["Listen to a Magical Projection"] =
			{appendText="."},
		["Talk to Kazirra 1"] =
			{appendText=" inside the resistance base.", stepTextKey="I saw Lavinia's speech to the Arenthians. Cariel told me to head to one of the huts in the market to meet up with the resistance. I'll know it by the statue of a lion at the base of the stair."},
		["Search the Tower District"] =
			{appendText="\nKazirra said the district was named for the large tower at the back. Any applicable materials and correspondences will likely be found somewhere indoors."},
		["Meet Cariel Behind the Tower"] =
			{appendText=" in the Tower District."},
		["Enter the Tower"] =
			{appendText=" in the Tower District."},
		["Wait for Gavo"] =
			{appendText=" in the Overwatch Tower in the Tower District."},
		["Talk to Gavo"] =
			{appendText=" in the Overwatch Tower in the Tower District."},
		["Talk to Cariel"] =
			{appendText=" in the Overwatch Tower in the Tower District."},
		["Wait for Cariel to Prepare Gavo"] =
			{appendText=" in the Overwatch Tower in the Tower District."},
		["Wear the Earring"] =
			{appendText=" in the Overwatch Tower in the Tower District."},
		["Return to Kazirra With Gavo"] =
			{appendText=". She's in the hut in the marketplace with the lion statue at the base of the stairs."},
		["Talk to Kazirra 2"] =
			{appendText=" inside the hut in the marketplace with a lion statue at the base of the stairs.", stepTextKey="I'm back among the resistance. I should speak to Kazirra about what to do with Gavo."},
		["Use Crystal on Gavo"] =
			{appendText=" inside the hut in the marketplace with a lion statue at the base of the stairs."},
		["Witness the Confession"] =
			{appendText=" inside the hut in the marketplace with a lion statue at the base of the stairs."},
		["Talk to Kazirra 3"] =
			{appendText=" inside the hut in the marketplace with a lion statue at the base of the stairs.", stepTextKey="Now that we have Gavo's confession imprinted, I should speak to Kazirra about what she plans to do with it."},
		["Imprint Projections"] =
			{appendText="."},
		["Kill Lavinia"] =
			{appendText=". Clan mother Kazirra said that she took over her favorite inn, which is likely in the Residential District."},
		["Return to the Town Center"] =
			{appendText=" of Arenthia."},
	},


[GetQuestName(4653)] = { --"Stonefire Machinations"--Rosque
        ["Stop the Stonefire Ritual"] =
            {appendText="."},
        ["Enter the Temple to the Divines"] =
            {appendText=" in Arenthia's Temple District."},
        ["Find and Defeat Mane Akkhuz-ri"] =
            {appendText=" inside the Temple to the Divines in Arenthia's Temple District."},
        ["Listen to Akkhuz-ri"] =
            {appendText=" inside the undercroft of the Temple to the Divines in Arenthia's Temple District."},
        ["Talk to Mane Akkhuz-ri"] =
            {appendText=" inside the undercroft of the Temple to the Divines in Arenthia's Temple District."},
        ["Talk to Cariel"] =
            {appendText=" in Arenthia's Temple District."},
        ["Talk to Kazirra"] =
            {appendText="."},
    },


[GetQuestName(4697)] = { --"To Rawl'kha"--Rosque
        ["Talk to a Moon Priest of Rawl'kha"] =
            {appendText=". To get there, follow the river that runs through the middle of Reaper's March until you reach the center of the region."},
    },


[GetQuestName(4712)] = { --"The First Step"--Rosque
		["Enter Rawl'kha Temple"] =
			{appendText="."},
		["Talk to Kauzanabi-jo 1"] =
			{appendText=".", stepTextKey="Within the temple at Rawl'kha, the elite of the Aldmeri Dominion have gathered to see the Champions begin the ritual. I should speak to Kauzanabi-jo to get started."},
		["Watch Ceremony 1"] =
			{appendText=" taking place inside Rawl'kha Temple.", stepTextKey="Kauzanabi-jo has commenced the cleansing ceremony. I should wait and watch."},
		["Drink Elixir"] =
			{appendText=" inside Rawl'kha Temple."},
		["Talk to Shazah 1"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="I prepared for the ritual by drinking the moon-sugar elixir. I should speak to either Shazah or Khali to begin walking the path."},
		["Talk to Khali 1"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="I prepared for the ritual by drinking the moon-sugar elixir. I should speak to either Shazah or Khali to begin walking the path."},
		["Walk the Path with Shazah"] =
			{appendText=" inside Rawl'kha Temple."},
		["Fight Through the Visions 1"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple.", stepTextKey="We walked into a vision of a hut and strange, lurching creatures. Shazah thinks the creatures are supposed to represent victims of the Knahaten flu. We need to fight our way through to move on."},
		["Watch Shazah's Vision"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple."},
		["Use Full Moon Shrine 1"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple..", stepTextKey="Shazah's father appeared to her and spoke to her about her relationship with Khali. He instructed us to pray at the three lunar shrines to learn more about his past."},
		["Use Waxing Moon Shrine 1"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple.", stepTextKey="Shazah's father appeared to her and spoke to her about her relationship with Khali. He instructed us to pray at the three lunar shrines to learn more about his past."},
		["Use Waning Moon Shrine 1"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple.", stepTextKey="Shazah's father appeared to her and spoke to her about her relationship with Khali. He instructed us to pray at the three lunar shrines to learn more about his past."},
		["Talk to Shazah 2"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple.", stepTextKey="The visions seem to have rattled Shazah. I should speak to her."},
		["Survive the Dead"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple."},
		["Talk to Shazah 3"] =
			{appendText=" in the West Temple Hall inside Rawl'kha Temple.", stepTextKey="We survived. I should speak to Shazah once again."},
		["Return to Temple Sanctuary 1"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="Shazah's vision journey is complete. We need to return to the Temple Sanctuary."},
		["Talk to Khali 2"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="I walked the path with Shazah. I need to speak to Khali to begin her part of the ritual."},
		["Walk the Path with Khali"] =
			{appendText=" inside Rawl'kha Temple."},
		["Fight Through the Visions 2"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple.", stepTextKey="We walked into a vision of crumbling fortifications. Khali thinks the soldiers here are supposed to represent the military forces that slew her mother. We need to fight our way through to move on."},
		["Watch Khali's Vision"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple."},
		["Use Waning Moon Shrine 2"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple.", stepTextKey="Khali's mother appeared to her and spoke of her relationship with Shazah. She instructed us to pray at the three lunar shrines to learn more about her past."},
		["Use Waxing Moon Shrine 2"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple.", stepTextKey="Khali's mother appeared to her and spoke of her relationship with Shazah. She instructed us to pray at the three lunar shrines to learn more about her past."},
		["Use Full Moon Shrine 2"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple.", stepTextKey="Khali's mother appeared to her and spoke of her relationship with Shazah. She instructed us to pray at the three lunar shrines to learn more about her past."},
		["Talk to Khali 3"] =
			{appendText="", stepTextKey="The visions seem to have rattled Khali. I should speak to her."},
		["Defeat General Quintilius"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple."},
		["Talk to Khali 4"] =
			{appendText=" in the East Temple Hall inside Rawl'kha Temple.", stepTextKey="We won the day against the vision of the Colovian General. I should speak to Khali once again."},
		["Return to Temple Sanctuary 2"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="Khali's vision journey is complete. We need to return to the Temple Sanctuary."},
		["Talk to Kauzanabi-jo 2"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="I emerged from the vision quest with the Champions. I should speak to the lunar priest again."},
		["Watch Ceremony 2"] =
			{appendText=" taking place inside Rawl'kha Temple.", stepTextKey="Kauzanabi-jo will now complete the Sacrament of the First Step. I should watch Shazah and Khali's final cleansing."},
		["Talk to Kauzanabi-jo 3"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="The Sacrament of the First Step is complete. I need to talk to Kauzanabi-jo."},
		["Talk to Shazah 4"] =
			{appendText=" inside Rawl'kha Temple.", stepTextKey="I walked the path with Khali. I need to speak to Shazah to begin her part of the ritual."},
	},


[GetQuestName(4709)] = { --"The Path to Moonmont"--Rosque
        ["Meet the Champions at Moonmont"] =
            {appendText=". To get there, head south out of Rawl'kha along the road, and stay on the cobblestones until you pass a small, broken Ayleid ruin. On a clear day, the temple's wayshrine is visible from there. The Lunar Champions should be waiting near the temple gates."},
    },

[GetQuestName(4802)] = { --"To Moonmont"--Rosque
        ["Talk to Someone at Moonmont"] =
            {appendText=". To reach it, follow the path west out of Dune and then continue south towards the edge of Reaper's March. On a clear day, you can see the temple's wayshrine from the furthest gates of a Wood Elf meadery."},
        ["Talk to Nabira"] =
            {appendText=" at the frontmost gates of Moonmont."},
    },


[GetQuestName(4479)] = { --"Motes in the Moonlight"--Rosque
        ["Purify the NE Beacon"] =
            {appendText=". Shazah described them as large pillars around the temple, but their exact positions may be relative to each other rather than particular directions."},
        ["Purify the NW Beacon"] =
            {appendText=". Shazah described them as large pillars around the temple, so they will likely be close by and near the path for the acolytes to access."},
        ["Purify the SE Beacon"] =
            {appendText=". Shazah described them as large pillars around the temple, so they will likely be close by and near the path for the acolytes to access."},
        ["Purify the SW Beacon"] =
            {appendText=". Shazah described them as large pillars around the temple, but their exact positions may be relative to each other rather than particular directions."},
        ["Dispel the Temple Ward"] =
            {appendText=". Khali and Shazah said that they would meet me there."},
        ["Enter Moonmont"] =
            {appendText="."},
        ["Explore the Temple"] =
            {appendText=" interior of Moonmont."},
        ["Enter Moonmont's Inner Chamber"] =
            {appendText=". Rid-Thar-ri'Datta's spirit inside Moonmont Temple may know of a way to use the altars to our advantage."},
        ["Find the Dark Mane"] =
            {appendText=", deep within Moonmont Temple."},
        ["Defeat the Dark Mane"] =
            {appendText=", deep within Moonmont Temple."},
        ["Talk to Rid-Thar-ri'Datta"] =
            {appendText=", deep within Moonmont Temple."},
        ["Choose Shazah to Contain the Dark Mane"] =
            {appendText=", deep within Moonmont Temple."},
        ["Choose Khali to Contain the Dark Mane"] =
            {appendText=", deep within Moonmont Temple."},
        ["Talk to Shazah"] =
            {appendText=", deep within Moonmont Temple."},
        ["Talk to Khali"] =
            {appendText=", deep within Moonmont Temple."},
    },



[GetQuestName(4711)] = { --"To Dune"--Rosque
        ["Reach the City of Dune"] =
            {appendText=". Head east on the road north of Moonmont, then trend north until the road becomes windy. Once it does, take the eastern path at the fork."},
        ["Investigate the Attack"] =
            {appendText=". There appears to be a sizable gathering in the barn just north of the camp for Hidden Moon Brewing."},
    },


[GetQuestName(4550)] = { --"The Fires of Dune"--Rosque
		["Find the Champion 1"] =
			{appendText=". Ayrenn saw her enter the city near the western-most entrance, so it may be possible to find traces of her by following her route.", stepTextKey="The Queen said that the Champion has entered the city to face the Daedric threat. I should find her."},
		["Charge the Fang"] =
			{appendText="\nBoth flame and frost atronachs should be equally able to charge it."},
		["Close the Portal 1"] =
			{appendText=" near the center of Dune's residential areas.", stepTextKey="The Fang is charged with Daedric energy. I should use it to close the portal."},
		["Talk to the Champion 1"] =
			{appendText=" near the center of Dune's residential areas.", stepTextKey="The portal is closed. I need to talk to the Champion to see what to do next."},
		["Find Esan"] =
			{appendText=". The Champion said the Mages Guild was in the merchant's district, which should be in the northeastern region of Dune."},
		["Defeat Bayya"] =
			{appendText=". The inn is in Dune's merchant district, near the Mages Guild."},
		["Destroy the Totem"] =
			{appendText=" inside the inn near the Mages Guild."},
		["Close the Portal 2"] =
			{appendText=".", stepTextKey="A new portal has opened outside the Mages Guild. I should use the Fang on the portal to close it."},
		["Check on the Mages"] =
			{appendText="."},
		["Find the Champion in the Temple District"] =
			{appendText=", located in the southeastern region of Dune. If she's preparing to assault the daedra there, she may be waiting somewhere close inside for backup."},
		["Cleanse Shrine of Jone"] =
			{appendText=" in the temple district in southeast Dune. Being a shrine of the twin moons, it'll likely be positioned opposite its partner."},
		["Cleanse Shrine of Jode"] =
			{appendText=" in the temple district in southeast Dune. Being a shrine of the twin moons, it'll likely be positioned opposite its partner."},
		["Find the Champion 2"] =
			{appendText=". It looks like a Dark Anchor has appeared above the shrine of Lorkhaj.", stepTextKey="I should meet the Champion at the shrine of Lorkhaj as she instructed."},
		["Face Down Javad Tharn"] =
			{appendText=" inside the Shrine of Lorkhaj."},
		["Talk to the Champion 2"] =
			{appendText=" inside the Shrine of Lorkhaj in the southeastern temple district of Dune.", stepTextKey="I defeated the dark anchor. I should talk to the Champion to see if she's all right."},
		["Follow the Champion"] =
			{appendText=" from the Shrine of Lorkhaj in the southeastern temple district to the Two Moons Temple in eastern Dune."},
		["Talk to Khali"] =
			{appendText=" in front of the Two Moons Temple in eastern of Dune."},
	},

[GetQuestName(4719)] = { --"The Moonlit Path"--Rosque
        ["Enter the Temple"] =
            {appendText=" of the Dance, the Two Moons Path in Dune."},
        ["Talk to Rid-Thar-ri'Datta"] =
            {appendText=" inside the Two Moons Path in Dune."},
        ["Align the Reflectors"] =
            {appendText=" inside the Two Moons Path in Dune. The crystals surrounding them appear to be key components of the mechanism."},
        ["Align the Final Reflector"] =
            {appendText=" inside the Two Moons Path in Dune. The last crystal appears operational now."},
        ["Enter the Portal"] =
            {appendText=" inside the Two Moons Path in Dune."},
        ["Talk to the Champion 1"] =
            {appendText=" through the portal in the Two Moons Path in Dune.", stepTextKey="We entered a mystical plane of existence. I should talk to the Lunar Champion to see where she would like to go next."},
        ["Follow the Path 1"] =
            {appendText=" up the stairs, through the portal in the Two Moons Path in Dune.", stepTextKey="The vision ran up the path and into a spinning portal. Obviously, I'm meant to follow."},
        ["Talk to Spinner Elilor"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune."},
        ["Defend the Silvenar and the Green Lady"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune."},
        ["Talk to the Green Lady 1"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune.", stepTextKey="I should talk with the Green Lady and Silvenar to ensure they are all right."},
        ["Wait for the Silvenar"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune."},
        ["Kill the Silvenar"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune."},
        ["Talk to the Green Lady 2"] =
            {appendText=" in the portal up the stairs, inside the portal in the Two Moons Path in Dune.", stepTextKey="I defeated the Silvenar. I should talk to the Green Lady to ensure her safety."},
        ["Return to the Temple 1"] =
            {appendText=" inside the portal in the Two Moons Path in Dune.", stepTextKey="I should return to the exterior of the Temple of the Dance and confer with the Lunar Champion."},
        ["Talk to the Champion 2"] =
            {appendText=" up the stairs, through the portal in the Two Moons Path in Dune.", stepTextKey="I should confer with the Lunar Champion outside the Temple of the Dance."},
        ["Follow the Path 2"] =
            {appendText=" to the portal across a bridge, inside the portal in the Two Moons Path in Dune.", stepTextKey="The second vision ran up the path and into a spinning portal. Obviously, I'm meant to follow."},
        ["Talk to Cariel"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune."},
        ["Find Razum-dar"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune."},
	["Talk to Razum-dar"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune."},
        ["Find the Queen"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune. Urcelmo ran into some ruins."},
        ["Save the Queen"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune."},
        ["Talk to Queen Ayrenn"] =
            {appendText=" within the portal across a bridge, inside the portal in the Two Moons Path in Dune."},
        ["Return to the Temple 2"] =
            {appendText=" inside the portal in the Two Moons Path in Dune.", stepTextKey="I should return to the exterior of the Temple of the Dance."},
        ["Talk to the Lunar Champion"] =
            {appendText=" across a bridge, inside the portal in the Two Moons Path in Dune."},
        ["Talk to Khali"] =
            {appendText=" across a bridge, inside the portal in the Two Moons Path in Dune."},
    },


[GetQuestName(4720)] = { --"The Den of Lorkhaj"--Rosque
        ["Follow the Projection to the Portal"] =
            {appendText=" at the top of the stairs within the portal inside the Two Moons Path in Dune."},
        ["Talk to the Lunar Champion 1"] =
            {appendText=" at the top of the stairs within the portal inside the Two Moons Path in Dune.", stepTextKey="I should talk to the Lunar Champion before we go into the Den of Lorkhaj."},
        ["Enter the Portal to Den of Lorkhaj"] =
            {appendText=" at the top of the stairs within the portal inside the Two Moons Path in Dune."},
        ["Follow the Lunar Champion"] =
            {appendText=" inside the Den of Lorkhaj, the topmost portal inside the Two Moons Path in Dune."},
        ["Protect the Lunar Champion"] =
            {appendText=" inside the Den of Lorkhaj, the topmost portal inside the Two Moons Path in Dune."},
        ["Wait for the Lunar Champion to Complete the Ritual"] =
            {appendText=" inside the Den of Lorkhaj, the topmost portal inside the Two Moons Path in Dune."},
        ["Return to Dune"] =
            {appendText="."},
        ["Talk to the Lunar Champion 2"] =
            {appendText=" at the Two Moons Path in Dune.", stepTextKey="I should talk to the Lunar Champion in Dune."},
        ["Witness the Mane's Ascension"] =
            {appendText=" at the Two Moons Path in Dune."},
        ["Talk to the Mane"] =
            {appendText=" at the Two Moons Path in Dune."},
    },


[GetQuestName(4798)] = { --"Eye on Arenthia"--Rosque
        ["Talk to Orthoron at Arenthia"] =
            {appendText=". To get there, head west across the river from Rawl'kha and follow the river all the way north. Orthoron mentioned he would rush ahead to inform his superior, so he'll likely be waiting on the road for my arrival."},
    },

--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS

--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS
--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS
--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS
--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS
--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS
--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS


--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS--SIDE QUESTS --- SIDE QUESTS --SIDE QUESTS



	[GetQuestName(4487)] = { --"The Arbordawn Cult"--iggy
		["Talk to Andewen"] =
			{appendText=" at the Dominion's scholar camp, near the Falinesti Autumn Site on the road leading west from the town of Rawl'kha at the heart of Reaper's March."},
		["Destroy the Stones"] =
			{appendText="\n\nCultists have planted these all over the Falinesti Autumn Site, south of the Dominion's scholar camp.\n\nCultists wouldn't want outsides meddling with their rituals, therefore the smaller caves would make for a good hiding spot."},
		["Enter the Halls of Ichor"] =
			{appendText=" through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp."},
		["Find Telenger"] =
			{appendText="'s whereabouts somewhere along the Halls of Ichor. Telenger is reckless but also smart, he wouldn't vanish without leaving a trace.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Talk to Telenger 1"] =
			{appendText=" somewhere deeper in the Halls of Ichor. \nThe note he left mentioned some wizardly gibberish... but those purple stones in pedestals likely have something to do with it.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March.", stepTextKey="Telenger is at a new camp deeper inside the Falinesti tunnels. I should speak to him there."},
		["Find Telenger Again"] =
			{appendText=", through the vinewall on the far side of the main cavern of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Protect Telenger"] =
			{appendText=" while he channels his spell to unlock the temple's door at the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Enter the Temple"] =
			{appendText=" of the daedra within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Clear the Temple of Daedra"] =
			{appendText=", located within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Follow Telenger"] =
			{appendText=" deeper into the Inner Temple, within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Talk to Mephala"] =
			{appendText=", the Daedric Prince of deception and secrets, at the Inner Temple of Daedra, within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Talk to Telenger 2"] =
			{appendText=", at the Inner Temple of Daedra, within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March.", stepTextKey="Mephala seemed to say that Telenger allowed her to claim part of the Falinesti Faithful as new cultists. I should talk to him about the situation."},
		["Wait for Telenger to Seal the Temple"] =
			{appendText=", at the Inner Temple of Daedra, within the depths of the Halls of Ichor.\n\nThe entrance to the Halls of Ichor is through the vinewall in the southernmost cave of the Falinesti Site, south of the Dominion's scholar camp in Reaper's March."},
		["Talk to Telenger 3"] =
			{appendText=", surprisingly out in one piece, at the Dominion's scholar camp, near the Falinesti Autumn Site.", stepTextKey="Now that we're at Telenger's camp, I should speak to him about what happened."},
	},


[GetQuestName(4486)] = { --"Down the Skeever Hole"--chaos
        ["Talk to Sergeant Herdor"] =
            {appendText=" outside the tunel, at the base of the tree."},
        ["Traverse the Ayleid Tunnel"] =
            {appendText=". Pay close attention to Sergeant Herdor's commands to you, and then speak with her deeper into the tunnel."},
        ["Cause Chaos in the Colovian Encampment"] =
            {appendText=". Look for tents you can burn. They should be close to enemy soldiers."},
        ["Defeat Colovian Command"] =
            {appendText=". Go to Nadaer's Tomb, inside the encampment, close to the bigger tents."},
        ["Check on the Burial Chamber"] =
            {appendText=", beyond the wooden door."},
        ["Report to Captain Odreth"] =
            {appendText=""},
    },


[GetQuestName(4665)] = { --"Ezreba's Fate"--chaos
        ["Ask a Villager About Ezreba"] =
            {appendText=". Try looking for the ones you've saved before.\n\nYou only need to talk to one villager before deciding."},
        ["Decide Ezreba's Fate"] =
            {appendText=". Return to Treethane Bowenas."},
        ["Talk to Bowenas"] =
            {appendText=""},
    },

[GetQuestName(4501)] = { --"Gates of Fire"--chaos
        ["Talk to Annthiel"] =
            {appendText=", north of the ruins."},
        ["Talk to Panamar"] =
            {appendText=", east of the ruins."},
        ["Talk to Juluda-daro"] =
            {appendText=", at the center of the ruins."},
        ["Gather the Welkynd Stones"] =
            {appendText=" at the colovian camp."},
        ["Lower the Ward"] =
            {appendText=", southeast of the ruins."},
        ["Enter the Vault"] =
            {appendText=""},
        ["Find Razum-dar"] =
            {appendText=""},
        ["Talk to Razum-dar"] =
            {appendText=""},
        ["Unlock the Circlet"] =
            {appendText=""},
        ["Pick up the Circlet"] =
            {appendText=""},
        ["Destroy the Circlet in the Furnace [Raz Dies]"] =
            {appendText=""},
        ["Depower the Tower Rune [Raz Lives]"] =
            {appendText=""},
        ["Escape the Vault"] =
            {appendText=""},
        ["Return to Centurion Burri"] =
            {appendText=""},
    },


    [GetQuestName(4488)] = { --"Gentle Gardener"--iggy
        ["Collect Root Samples"] =
            {appendText=" \nSamples need to be healthy and humid, unaffected by the constant sunlight, at the dig site next to the Falinesti Autumn camp in Reaper's March."},
        ["Collect Soil Samples"] =
            {appendText="\nThese samples must be from soft dirt mounds, often accumulated around big isolated rock or bark, at the dig site next to the Falinesti Autumn camp in Reaper's March."},
        ["Collect Water Sample"] =
            {appendText="\nLikely from the big puddle in the middle of the dig site next to the Falinesti Autumn camp in Reaper's March."},
        ["Talk to Ongalion in Camp"] =
            {appendText=", next to the path leading out of the Falinesti Autumn Site."},
    },



    [GetQuestName(4812)] = { --"History's Song"--iggy
        ["Find a Nasica in Dune"] =
            {appendText=", being the biggest city in Reaper's March, asking around the outskirts would be the best option to start with.\n\nIf this Nasica is anything like her ancestor, she might play an instrument too."},
        ["Talk to Livia Nasica 1"] =
            {appendText=", a flute musician in the outskirts of the city of Dune, the easternmost city in Reaper's March.", stepTextKey="The ghost appeared to me again near a woman in Dune. No doubt she's a member of the Nasica family. I should speak to her."},
        ["Talk to Livia Nasica 2"] =
            {appendText=", a flute musician in the outskirts of the city of Dune, the easternmost city in Reaper's March.", stepTextKey="Livia told me of her ancestor and her struggles with her music. She seems very touched I've brought the instrument to her. I should speak with her again."},
    },


   [GetQuestName(4749)] = { --"How Few Remain"--iggy
        ["Search for Survivors"] =
            {appendText=" along Kuna's Delve.\n\nCreatures seem to be especially active in the north and west regions of the cave, there might still be living people over there getting their attention."},
        ["Leave the Mine"] =
            {appendText=" before the remaining creatures start looking for us."},
        ["Talk to Galbenel"] =
            {appendText=" outside of Kuna's Delve.\n\nHopefully the people I rescued made it out alive too..."},
        ["Talk to Kuna"] =
            {appendText=" about the slaughter that took place in her mine.\n\nShe owns a small office right next to the stables of the city of Rawl'kha, at the very heart of Reaper's March."},
    },

    [GetQuestName(4738)] = { --"Song of the Spinner"--@ARKANOBOT
        ["Unlock Chains"] =
            {appendText=""},
        ["Talk to Melrethel 1"] =
            {appendText="", stepTextKey="Melrethel is free. I should talk to her."},
        ["Find the Villagers' Belongings"] =
            {appendText="\n\nI should look for the remains of Thara, Fardel and Norvir."},
        ["Talk to Melrethel 2"] =
            {appendText="", stepTextKey="I recovered belongings from each of the deceased villagers. I should bring them to Melrethel at the docks outside the Manse."},
    },

    [GetQuestName(4480)] = { --"Oath of Excision"--@ARKANOBOT
        ["Talk to Captain Odreth"] =
            {appendText=". Scout Mengaer tells me that I can find the captain in his quarters in the Command tree, the graht-oak in the center of the village."},
        ["Talk to Glooredel"] =
            {appendText=". Her laboratory is located in the pod which sits upon a thick root west from the graht-oak in Vinedusk village"},
        ["Burn the Sap"] =
            {appendText=" in the Sap Vents found inside the Village Houses in Vinedusk Village."},
        ["Meet Glooredel"] =
            {appendText=" in her workshop, in the bulb houses that sits on the ancient Ayleid ruins North of the graht-oak in Vinedusk Village."},
        ["Ignite the Roots"] =
            {appendText=" by burning the Alchemical Igniter in Glooredel's Workshop located atop the Ayleid ruins north of the graht-oak in Vinedusk Village."},
        ["Report to Captain Odreth 1"] =
            {appendText=". He is in his quarters in the command tree, the graht-oak in the center of Vinedusk village.", stepTextKey="I should report back to Captain Odreth about the success of the mission."},
        ["Report to Captain Odreth 2"] =
            {appendText=". He is in his quarters in the command tree, the graht-oak in the center of Vinedusk village.", stepTextKey="I need to finish reporting to Captain Odreth about the mission."},
    },

[GetQuestName(4599)] = { --"On the Doorstep"--chaos
        ["Find Gonlas in His Home"] =
            {appendText=""},
        ["Destroy the Crystal"] =
            {appendText=""},
        ["Talk to Halindor 1"] =
            {appendText=" at the northen side of town.", stepTextKey="I need to find Halindor and tell him what I found in Gonlas' house."},
        ["Check on Halindor's Friends"] =
            {appendText=". They're all neightbors."},
        ["Talk to Halindor 2"] =
            {appendText="", stepTextKey="I should tell Halindor about what I found inside his friends' homes."},
        ["Reach Ezreba's House"] =
            {appendText=". She lives in a traditional khajiit house."},
        ["Destroy Crystal"] =
            {appendText=""},
        ["Talk to Bowenas 1"] =
            {appendText="", stepTextKey="Bowenas is free of the ritual. I should talk to her and see if I can get to the bottom of this."},
        ["Enter the Catacombs"] =
            {appendText=", behinf the temple's largest tree."},
        ["Talk to Halindor 3"] =
            {appendText="", stepTextKey="I've found Halindor looking fairly stunned on the ground in the Catacombs. I should speak to him."},
        ["Find Ezreba"] =
            {appendText=""},
        ["Stop the Dark Ritual"] =
            {appendText=""},
        ["Talk to Ezreba"] =
            {appendText=""},
        ["Return to Greenhill"] =
            {appendText=""},
        ["Talk to Bowenas 2"] =
            {appendText="", stepTextKey="I've made it out of the Greenhill Catacombs with Ezreba in tow. I should find Bowenas and explain what happened."},
        ["Talk to Bowenas 3"] =
            {appendText="", stepTextKey="I've explained what was happening in her village to Bowenas. I need to talk to her once more."},
    },


[GetQuestName(4578)] = { --"Over the Edge"--chaos
        ["Collect Medicinal Herbs"] =
            {appendText=""},
        ["Find Wooden Scroll Case"] =
            {appendText="\n\nThe river flows north to the Fishing Dock."},
        ["Search for the Scroll Case"] =
            {appendText=""},
        ["Talk to Estelin"] =
            {appendText=". She is fishing on top of the rock, by the fishing boat."},
        ["Find Egolor at Thizzrini Arena"] =
            {appendText=", south of Arenthia. He rented a traditional bosmer room during he's staying."},
        ["Examine Egolor's Corpse"] =
            {appendText=""},
        ["Look for Witnesses to Egolor's Murder"] =
            {appendText=".\n\nLungrun might have seen something. He usually stays by the camp right in front of the rented room."},
        ["Remind Debtors"] =
            {appendText="\n\nThey are west, east, southeast and south of were I spoke to her."},
        ["Talk to Many-Eyes"] =
            {appendText=""},
        ["Find the Stonefire Cultist Camp"] =
            {appendText=", north of the Apprentice stone."},
        ["Get the Scroll Case"] =
            {appendText=""},
        ["Find Zadala Outside of Dune"] =
            {appendText=""},
    },


    [GetQuestName(4737)] = { --"The Waking Dreamer"--@ARKANOBOT
        ["Enter the Cellar"] =
            {appendText=". The entrance should be somewhere near the kitchen."},
        ["Find Mysterious Tome"] =
            {appendText=". I should probably check the stacks of books, bookshelves, or **above **the crates around the cellar to find the mysterious tome."},
        ["Find a Way Beneath the Cellar"] =
            {appendText=". Hermaeus Mora has pointed out the existence of structural damages in the cellar, one of which leads to the caves below."},
        ["Take the Drop"] =
            {appendText=" at the cellar in The Vile Manse."},
        ["Climb Out"] =
            {appendText=" of the water. Get to the nearest land in the caves below the cellar of The Vile Manse and find clues as to Graccus' whereabouts."},
        ["Find Graccus"] =
            {appendText=". Hermaeus Mora told me that I should find Graccus in the ancient ruins in the caves below the cellar of the Vile Manse."},
        ["Stop Graccus"] =
            {appendText=". He is performing a ritual at the altar in the ancient ruins located in the caves below the cellar of The Vile Manse."},
        ["Examine the Oghma Infinium"] =
            {appendText=" at the altar. It should be in the ancient ruins located in the caves below the cellar of The Vile Manse."},
        ["Talk to Hermaeus Mora"] =
            {appendText=" near the altar in the ancient ruins located in the caves below the cellar of The Vile Manse."},
    },

[GetQuestName(4499)] = { --"Baan Dar's Bash"--chaos
        ["Cook and Collect Five Finger Chicken Dinners"] =
            {appendText=". Look around for the chickens."},
        ["Talk to Aniel 1"] =
            {appendText=" around the first camp.", stepTextKey="I need to talk to Aniel."},
        ["Tap the Baan Dar Stout Keg"] =
            {appendText=" in the first camp."},
        ["Serve Bar for Baan Dar"] =
            {appendText=""},
        ["Leave the Party"] =
            {appendText=""},
        ["Talk to Aniel 2"] =
            {appendText="", stepTextKey="I've returned to Reaper's March. I should speak to Aniel in the ruins at Thormar."},
    },

[GetQuestName(4440)] = { --"Baan Dar's Boast"--chaos
        ["Allow Aniel to Introduce Yanabir-ja"] =
            {appendText=", at the western ruins."},
        ["Allow Aniel to Introduce Dolirdor"] =
            {appendText=", at the easter ruins."},
        ["Lead Aniel Away"] =
            {appendText=""},
        ["Talk to Aniel 1"] =
            {appendText="", stepTextKey="Now that we have some privacy from Dolirdor, Aniel wants to speak to me."},
        ["Collect Dark Poison"] =
            {appendText=""},
        ["Collect Empty Rotmeth Barrel"] =
            {appendText=""},
        ["Collect Snake Glands"] =
            {appendText=", around the souhtern lake."},
        ["Collect Poisoned Strangler Stems"] =
            {appendText=" around the river."},
        ["Play Aniel's pranks on Yanabir-ja, and the Wood Elf camp"] =
            {appendText=""},
        ["Talk to Yanabir-ja"] =
            {appendText=""},
        ["Follow Aniel"] =
            {appendText=""},
        ["Talk to Aniel 2"] =
            {appendText="", stepTextKey="I need to talk to Aniel."},
        ["Enter the Five Finger Dance"] =
            {appendText=""},
        ["Talk to Aniel 3"] =
            {appendText="", stepTextKey="I stepped through a portal to a strange and interesting place. I should talk to Aniel again and figure out what's going on here."},
    },


[GetQuestName(4457)] = { --"Box of Riddles"--chaos
        ["Collect Rotmeth Starter"] =
            {appendText=", at the bosmer camp."},
        ["Collect Canis Root"] =
            {appendText="\n\n They grow around the lake."},
        ["Collect Riddle Box"] =
            {appendText=" past the khajiit tents, to the south."},
        ["Find Daifa in the Bosmer Camp"] =
            {appendText=""},
        ["Play a Trick on Aldeth"] =
            {appendText=". She's around the cooking fire."},
        ["Talk to Daifa"] =
            {appendText=""},
    },

[GetQuestName(4492)] = { --"Desecrated Ground"--chaos
        ["Retrieve the Ring of Rid-Thar-ri'Datta"] =
            {appendText=" at the south Moonmont."},
        ["Return to Jurak-dar"] =
            {appendText=". He should be at the same place as before."},
        ["Give the Ring to Jurak-dar"] =
            {appendText=""},
        ["Give the Ring to Fihada"] =
            {appendText=""},
        ["Talk to Fihada"] =
            {appendText=""},
    },

[GetQuestName(4571)] = { --"Fang Collector"--Rosque
        ["Senche-Tiger Fangs"] =
            {appendText="\nPanreth the Bold's request for fangs is likely because the tigers can be found scattered all over Reaper's March. Senche-tigers can be differentiated from the sapient Senche and Senche-raht Khajiit by their smaller size, inability to speak, and lack of clothing.\n\nIt's possible that others have received the same notice from Panreth."},
        ["Talk to Panreth"] =
            {appendText=". The Fighters Guild drinking hall is beneath the Fighters Guild building, so that members can drink in the shade."},
    },


[GetQuestName(4536)] = { --"The Golden Claw"--chaos
        ["Receive the Blessing of Jode"] =
            {appendText=" from Kansur-Jo. He is being held captive in a shrine, west from the Monastery's entrance."},
        ["Receive the Blessing of Jone"] =
            {appendText=" from Mahazi. She is being held captive in a shrine, east from the Monastery's entrance."},
        ["Explore Do'Krin"] =
            {appendText=" Temple."},
        ["Restore the Lunar Altars"] =
            {appendText="\n\nRid-Thar-ri'Datta might have something to say about it."},
        ["Talk to Rid-Thar-ri'Datta 1"] =
            {appendText="", stepTextKey="We've seen it through and restored the four lunar altars. I should speak to Rid-Thar again."},
        ["Quiet the Guardian Senche"] =
            {appendText=""},
        ["Retrieve the Golden Claw"] =
            {appendText=""},
        ["Talk to Rid-Thar-ri'Datta 2"] =
            {appendText="", stepTextKey="I need to speak to Rid-Thar once again, now that I've got the Claw."},
        ["Leave Do'Krin Monastery"] =
            {appendText=""},
        ["Talk to Azahrr"] =
            {appendText=""},
    },

[GetQuestName(4655)] = { --"Hadran's Fall"--chaos
        ["Loot Hadran's Uniforms"] =
            {appendText=""},
        ["Rescue Prisoners"] =
            {appendText=" around the camp."},
        ["Find Tand"] =
            {appendText=" to the south."},
        ["Rescue Tand"] =
            {appendText=""},
        ["Talk to Tand"] =
            {appendText=""},
        ["Defeat Hadran"] =
            {appendText=". His tent is west of Tand's cage."},
        ["Escape with Tand"] =
            {appendText=". Go west."},
        ["Return to Sind"] =
            {appendText=""},
    },


	[GetQuestName(4598)] = { --"Into the Vice Den"--@ARKANOBOT
		["Talk to Azum 1"] =
			{appendText=", Sind informs me that I can find her in one of the Khajiti tents near the tavern of Hadran's Caravan.", stepTextKey="Sind told me of a woman who apparently works directly for Hadran. She might know where Tand has gone. I should seek out this Azum."},
		["Talk to Dulan at the Lizard Races 1"] =
			{appendText=". The Races usually happen on the open grounds next to the Tavern.", stepTextKey="Azum told me that she's not supposed to talk about guests at the caravan, but the games-runners might not be so tight-lipped. Dulan, Khaba, and Bunul were the games-runners she called out as being my best bets. I should seek one of them out."},
		["Talk to Khaba at the Troll Fights 1"] =
			{appendText=". The Troll fights can be seen from the wooden tower in the northern part of the camp.", stepTextKey="Azum told me that she's not supposed to talk about guests at the caravan, but the games-runners might not be so tight-lipped. Dulan, Khaba, and Bunul were the games-runners she called out as being my best bets. I should seek one of them out."},
		["Talk to Bunul at the Spikeball Track 1"] =
			{appendText=". The Spikeball race begins right next to the Troll Fight Arena.", stepTextKey="Azum told me that she's not supposed to talk about guests at the caravan, but the games-runners might not be so tight-lipped. Dulan, Khaba, and Bunul were the games-runners she called out as being my best bets. I should seek one of them out."},
		["Talk to Khaba at the Troll Fights 2"] =
			{appendText=". The Troll fights can be seen from the wooden tower in the northern part of the camp.", stepTextKey="The game dealer at the Lizard Races told me that he saw Tand, and that he got into a drunken brawl. I should ask some of the other dealers if they saw anything."},
		["Talk to Bunul at the Spikeball Track 2"] =
			{appendText=". The Spikeball race begins right next to the Troll Fight Arena.", stepTextKey="The game dealer at the Lizard Races told me that he saw Tand, and that he got into a drunken brawl. I should ask some of the other dealers if they saw anything."},
		["Talk to Khaba at the Troll Fights 3"] =
			{appendText=". The Troll fights can be seen from the wooden tower in the northern part of the camp.", stepTextKey="I should to bet on the troll fights. The dealer there might know more about Tand's whereabouts."},
		["Talk to Azum 2"] =
			{appendText=". She should be inspecting the games either at the Wooden tower overlooking the Troll Fights or at the starting point of the Spikeball race or Under the wooden bridge near the Lizard Races", stepTextKey="After talking to the game dealers, it appears that Tand lost all of his gold and tried to borrow more. When he became belligerent, his outburst was reported to Azum, the games manager. I should talk to Azum again."},
		["Follow Azum"] =
			{appendText=""},
		["Talk to Hadran"] =
			{appendText=""},
		["Follow Hadran"] =
			{appendText=" out of the office."},
		["Defeat the Ambush"] =
			{appendText=""},
		["Talk to Azum 3"] =
			{appendText=", she is at the entrance of the broken tower next to Hadran's office.", stepTextKey="I survived the ambush to find Azum waiting for me. She wants to speak to me again."},
		["Talk to Dulan at the Lizard Races 2"] =
			{appendText=". The Races usually happen on the open grounds next to the Tavern.", stepTextKey="The spikeball game dealer told me that he saw Hadran's men chasing Tand. I should talk to another dealer."},
		["Talk to Khaba at the Troll Fights 4"] =
			{appendText=". The Troll fights can be seen from the wooden tower in the northern part of the camp.", stepTextKey="The spikeball game dealer told me that he saw Hadran's men chasing Tand. I should talk to another dealer."},
		["Talk to Dulan at the Lizard Races 3"] =
			{appendText=". The Races usually happen on the open grounds next to the Tavern.", stepTextKey="I should to bet on the lizard races. The dealer there might know more about Tand's whereabouts."},
		["Talk to Bunul at the Spikeball Track 3"] =
			{appendText=". The Spikeball race begins right next to the Troll Fight Arena.", stepTextKey="I should compete in Spikeball. The dealer there might know more about Tand's whereabouts."},
	},



-- Lizard Racing --needs nothing --not playtested yet--chaos



    [GetQuestName(4775)] = { --"A Night to Forget"--iggy
        ["Enter the Waxing Crescent Inn"] =
            {appendText=", the big and lively building in the northern side of Rawl'kha."},
        ["Talk to Duzal-ja"] =
            {appendText=", the Khajiti bartender behind the counter of the Waxing Crescent Inn in the city of Rawl'kha."},
        ["Get Meat Pies from Shasirba"] =
            {appendText=" at the western edge of town, across the bridge."},
        ["Return to Duzal-ja"] =
            {appendText=" with the pies, at the Waxing Crescent Inn: the big and lively building in the northern side of Rawl'kha."},
        ["Find Darius"] =
            {appendText=" at the Mages Guild building in Rawl'kha."},
        ["Talk to Darius 1"] =
            {appendText=" on the staircase of the Mages Guild in Rawl'kha.", stepTextKey="I found the hall. Now to speak to this Darius about one of Rollin's relics."},
        ["Capture Wisps with the Crystal"] =
            {appendText="\n\nWisps couldn't have gotten too far away, they are likely still within Rawl'kha."},
        ["Talk to Darius 2"] =
            {appendText=" at the Mages Guild in Rawl'kha.", stepTextKey="I did as the mage asked and captured a number of wisps. I should speak to him again at the guild hall."},
        ["Take the Urn"] =
            {appendText=" from Darius at the Mages Guild in Rawl'kha."},
        ["Find Khuzi"] =
            {appendText=" somewhere in the marketplace of Rawl'kha."},
        ["Talk to Khuzi"] =
            {appendText=" about the missing necklace.\n\nShe is at the marketplace in Rawl'kha."},
        ["Talk to Atrius"] =
            {appendText=" somewhere along the road leading south from Rawl'kha."},
        ["Find Weeping Wind Cave"] =
            {appendText=". The instructions from Atrius should help me locate this den.\n\nFinding the Willowgrove wayshrine would be a great start."},
        ["Find Claw Necklace"] =
            {appendText=" in the cave. \n\nLikely among the possessions or bags of a strong worshiper of Hircine."},
        ["Talk to Rollin 1"] =
            {appendText=" probably still at his campfire in the Rawl'kha Temple's courtyard.", stepTextKey="I have all three relics Rollin was looking for. I could return them to him, or go looking for this \"Meldil\" that he was so afraid of. I'm sure Telenger's assistant would be interested in why I have these relics."},
        ["Talk to Apprentice Meldil"] =
            {appendText=". Someone at the Rawl'kha Mages Guild would likely know more about him."},
        ["Talk to Rollin 2"] =
            {appendText=" at his campfire in the Rawl'kha Temple's courtyard.", stepTextKey="I decided to back Rollin in his goal to become an apprentice. I should speak to him once more."},
        ["Talk to Meldil"] =
            {appendText=" at the Rawl'kha Mages Guild."},
    },

[GetQuestName(4537)] = { --"An Offering"--chaos
        ["Talk to the Spirit"] =
            {appendText=""},
        ["Place the Offering at the Waxing Moon Shrine"] =
            {appendText=", south of the monastery's entrance."},
        ["Place the Letter at the Full Moon Shrine"] =
            {appendText=", southeast of the Waxing Moon Shrine."},
        ["Light a Candle at the Waning Moon Shrine"] =
            {appendText=", by the southern crossroad."},
    }, 




-- Spikeball --needs nothing --not playtested yet--chaos


[GetQuestName(4732)] = { --"To Honor the Fallen"--Rosque
        ["Talk to Nethrin 1"] =
            {appendText=". Felari, at the small temple north of Rawl'kha's wayshrine, should know where to find him.", stepTextKey="Felari has asked me to speak to her Wood Elf counterpart, a Greenspeaker named Nethrin."},
        ["Reach Thormar Dig Site"] =
            {appendText=". It is occluded by a large tree just east of the ruins."},
        ["Reach Willowgrove Dig Site"] =
            {appendText=". The dig site should be somewhere between Moonmont and Willowgrove, but if the bandits attacked, the researchers may have scattered near the roads for safety."},
        ["Collect Willowgrove Relics"] =
            {appendText=". The dig site should be somewhere between Moonmont and Willowgrove, but if the bandits attacked, the researchers may have scattered near the roads for safety."},
        ["Talk to Nethrin 2"] =
            {appendText=" near the dig site.", stepTextKey="Nethrin has arrived at the dig site and wants to speak to me."},
        ["Find Lorwen"] =
            {appendText=". The ancient Falinesti Autumn site was located south of Vinedusk Village. The pass on the hill would have been a good tactical pathway that would likely have invited conflict."},
        ["Reach Claw's Strike"] =
            {appendText=". From Deathsong Cleft, south of Vinedusk Village, is a rough pathway heading further south to the ruin."},
        ["Recover the Relics"] =
            {appendText=" inside Claw's Strike. They're likely being kept safe in a side room to one of the larger rooms, in a chest or other storage container."},
        ["Return the Relics to Felari"] =
            {appendText=" at the small temple north of Rawl'kha's wayshrine."},
        ["Talk to Felari"] =
            {appendText=" at the small temple north of Rawl'kha's wayshrine."},
        ["Collect Thormar Relics"] =
            {appendText=". It is occluded by a large tree just east of the ruins."},
    },

-- Troll Arena --needs nothing --not playtested yet--chaos

[GetQuestName(4740)] = { --"Questionable Contract"--Rosque
        ["Talk to Ranneth 1"] =
            {appendText=". Apparently, she lives in the only house in town made of two bulbs.", stepTextKey="The Willowgrove townsperson I spoke to directed me to speak with Ranneth, the village's Treethane."},
        ["Find Pircalmo's Tent"] =
            {appendText=". Being an outsider to Willowgrove, it probably has a distinct appearance from the rest of the Bosmer architecture."},
        ["Find Pircalmo's Ritual Notes"] =
            {appendText=" in his tent in south Willowgrove."},
        ["Talk to Pircalmo 1"] =
            {appendText=" in his tent in south Willowgrove.", stepTextKey="I found a note addressed to Pircalmo, from Telenger. It details a ritual, as well as casting some doubt on Pircalmo's spellcasting prowess. Pircalmo has come up behind me while I was reading it. I should speak with him."},
        ["Collect Hoarvor Chitin"] =
            {appendText=". Treethane Ranneth in her two-bulb house may have an idea where it could be obtained."},
        ["Collect Torchbug Thoraxes"] =
            {appendText=" in Willowgrove."},
        ["Collect Heartwood"] =
            {appendText=". Treethane Ranneth in her two-bulb house may have an idea where it could be obtained."},
        ["Talk to Pircalmo 2"] =
            {appendText=" up the hill.", stepTextKey="I collected the ritual components and should speak to Pircalmo, in the forest overlooking the town."},
        ["Watch Pircalmo's Ritual"] =
            {appendText=" on the hill south of Willowgrove."},
        ["Talk to Pircalmo 3"] =
            {appendText=" on the hill south of Willowgrove.", stepTextKey="Something appears to have gone wrong with the ritual. I need to speak to Pircalmo."},
        ["Collect Flame Atronach Core"] =
            {appendText=" from the forest south of Willowgrove."},
        ["Collect Frost Atronach Core"] =
            {appendText=" from the forest south of Willowgrove."},
        ["Collect Storm Atronach Core"] =
            {appendText=" from the forest south of Willowgrove."},
        ["Return to Pircalmo"] =
            {appendText=" on the hill south of Willowgrove."},
        ["Observe the Altercation"] =
            {appendText=""},
        ["Talk to Pircalmo 4"] =
            {appendText=" on the hill south of Willowgrove.", stepTextKey="Pircalmo is still maintaining the spell. I should talk to him, now that I have the cores he needs."},
        ["Find the Source of the Corruption"] =
            {appendText=" in the forest south of Willowgrove."},
        ["Explore the Cave"] =
            {appendText=" in the forest south of Willowgrove."},
        ["Talk to the Dog"] =
            {appendText=" in the forest cave south of Willowgrove."},
        ["Smash the Altar"] =
            {appendText=" in the forest cave south of Willowgrove."},
        ["Return to Town"] =
            {appendText="."},
        ["Talk to Ranneth 2"] =
            {appendText=" at the altar in Willowgrove.", stepTextKey="The atronachs are docile, and the forest is rapidly healing. The town is all gathered around an altar. I should stop Ranneth before she kills Alanya."},
        ["Talk to Pircalmo 5"] =
            {appendText=" inside Treethane Ranneth's two-bulbed home.", stepTextKey="I stopped Ranneth from killing Alanya. She informed me that Pircalmo is being held in her home."},
        ["Return to Ranneth"] =
            {appendText=" in her two-bulbed house in Willowgrove."},
        ["Observe the Conversation"] =
            {appendText=" in the two-bulbed house in Willowgrove."},
        ["Talk to Ranneth 3"] =
            {appendText=" in her two-bulbed house in Willowgrove.", stepTextKey="Pircalmo is free, Alanya is safe, and Ranneth has apologized to both of them. I should speak with her."},
    },

[GetQuestName(4676)] = { --"An Affront to Mara"--Rosque
        ["Talk to Priestess Marcella"] =
            {appendText=" outside the fortress ruins."},
        ["Enter Fort Sphinxmoth"] =
            {appendText="."},
        ["Find Phylactery of Mara"] =
            {appendText=". The sound of a key scraping against a trunk can be heard above a campfire in the room just beyond the entrance, along with a pining voice muttering about the value of a phylactery."},
        ["Find Circlet of Mara"] =
            {appendText=". Within the Fort Sphinxmoth Storage Vaults, just past a treacherous hole in the floor, are supplies stored in a side room. There may be loot from the temple of Mara in there if there were some way to get past the metal gates."},
        ["Find Dagger of Mara"] =
            {appendText=". In the Outer Court of Fort Sphinxmoth there's a crumbling tower on the periphery of the ruin. A more ruthless and paranoid bandit might consider it a good stashing place."},
        ["Find Chalice of Mara"] =
            {appendText=". Within the Inner Court of Fort Sphinxmoth is an opulent storeroom behind a heavy gate. It'd make for a well-defended treasury suitable for the most notable valuables."},
        ["Exit Fort Sphinxmoth"] =
            {appendText="."},
        ["Talk to Marcella Ammianus"] =
            {appendText=" outside Fort Sphinxmoth."},
    },

    [GetQuestName(4651)] = { --"The Champion Division"--iggy
        ["Talk to Ishalga 1"] =
            {appendText=" outside the main Arena, the largest, loudest and most prestigious building around.", stepTextKey="I should talk to Ishalga, the Grand Champion, in order to get her blessing to fight against her in the Grand Championships."},
        ["Go to Feluni's Office"] =
            {appendText=" at the great tower next to the main arena."},
        ["Collect Skooma"] =
            {appendText=" from the office. Something as valuable as skooma is likely to be the most luxurious room."},
        ["Talk to Ishalga 2"] =
            {appendText=" outside the main Arena, the largest, loudest and most prestigious building around.", stepTextKey="I should report back to Ishalga and notify her that I found the skooma she wanted in Feluni's office."},
        ["Enter Thizzrini Arena"] =
            {appendText=" when you are ready to fight."},
        ["Defeat the Grand Champion"] =
            {appendText=" Ishalga."},
        ["Talk to Feluni outside of Arena"] =
            {appendText=", the largest, loudest and most prestigious building around."},
    },


    [GetQuestName(4483)] = { --"Ezzag's Bandits"--iggy
        ["Talk to Ezzag 1"] =
            {appendText=" at his barn in the southeastern part of the town of S'ren-ja.", stepTextKey="I need to speak to Ezzag and find out what is going on."},
        ["Investigate the Field"] =
            {appendText=" just south of Ezzag's barn in the town of S'ren-ja, where he tends to his crops and sheep."},
        ["Find the Bandits' Hideout"] =
            {appendText=" near Ezzag's farm in the town of S'ren-ja."},
        ["Explore the Cave"] =
            {appendText=" of thieves near Ezzag's farm in the town of S'ren-ja."},
        ["Talk to Zurana"] =
            {appendText=" the mysterious khajiti, at the cave of thieves near Ezzag's farm in the town of S'ren-ja."},
        ["Talk to Ezzag 2"] =
            {appendText=" at his barn in the southeastern part of the town of S'ren-ja.", stepTextKey="I dealt with the bandits and their leader, one way or another. I should head back to Ezzag and tell him the good news."},
        ["Talk to Ezzag 3"] =
            {appendText=" at his barn in the southeastern part of the town of S'ren-ja.", stepTextKey="I need to speak to Ezzag one more time."},
        ["Follow Zurana"] =
            {appendText=" the mysterious khajiti, deeper at the cave of thieves near Ezzag's farm in the town of S'ren-ja."},
        ["Kill Zurana"] =
            {appendText=" the mysterious khajiti, deeper at the cave of thieves near Ezzag's farm in the town of S'ren-ja."},
    },

    [GetQuestName(4647)] = { --"A Foot in the Door"--iggy
        ["Gain Summoner Division Credentials"] =
            {appendText=" by impressing its champion outside their training arena."},
        ["Gain Sorcerer Division Credentials"] =
            {appendText=" by impressing its champion outside their training arena."},
        ["Gain Swordmaster Division Credentials"] =
            {appendText=" by impressing its champion outside their training arena."},
        ["Bring Credentials to Feluni"] =
            {appendText=" who is organizing the games right next to the main Thizzrini Arena.\n\nClearly the largest, loudest and most prestigious building around."},
        ["Talk to Feluni"] =
            {appendText=" once ready to officially register in the arena games.\n\nShe is located right outside the largest, loudest and most prestigious building around."},
    },


	[GetQuestName(4484)] = { --"Haunting of Kalari"--iggy
		["Talk to Kalari 1"] =
			{appendText=" outside her new house in the town of S'ren-ja.", stepTextKey="I need to talk to Kalari to see what's really going on."},
		["Enter Kalari's House"] =
			{appendText=" in the town of S'ren-ja."},
		["Search the House"] =
			{appendText=" of Kalari in the town of S'ren-ja."},
		["Search the Hidden Room"] =
			{appendText=" in Kalari's house in the town of S'ren-ja, for clues that might explain what is happening in the house."},
		["Talk to Kalari 2"] =
			{appendText=" outside her house in the town of S'ren-ja.", stepTextKey="I found evidence that Kalari's brother and dead uncle were running skooma in the area for the Clan Mother's former assistant, Rakhad. I should speak to Kalari about this."},
		["Confront Mathal in Rakhad's House"] =
			{appendText=" in the town of S'ren-ja."},
		["Stop the Ritual"] =
			{appendText=" of Mathal, in Rakhad's house in the town of S'ren-ja."},
		["Read the Note"] =
			{appendText=" at the desk at Rakhad's house in the town of S'ren-ja."},
		["Talk to Kalari 3"] =
			{appendText=" outside her house in the town of S'ren-ja.", stepTextKey="I need to tell Kalari what happened. Or do I? I could just lie to her and tell her Mathal has left town. I need to decide how to approach this."},
		["Talk to Kalari 4"] =
			{appendText=" outside her house in the town of S'ren-ja.", stepTextKey="I decided to tell Kalari the truth. She may have an idea of what I can do next to help the town."},
		["Talk to Kalari 5"] =
			{appendText=" outside her house in the town of S'ren-ja.", stepTextKey="I need to speak to Kalari once more."},
		["Talk to Kalari 6"] =
			{appendText=" outside her house in the town of S'ren-ja.", stepTextKey="I decided to lie to Kalari. She might as well thing Mathal is safe, somewhere. She may have an idea of what I can do next to help the town."},
	},



    [GetQuestName(4485)] = { --"Loose Ends"--iggy
        ["Talk to Clan Mother Shuzura 1"] =
            {appendText=" at her mansion in S'ren-ja. \n\nReport on everything that has happened in her little town.", stepTextKey="I should speak with Clan Mother Shuzura and let her know everything that's happened."},
        ["Find Rakhad's Cave"] =
            {appendText=" somewhere close to Shuzura's mansion in the town of S'ren-ja."},
        ["Find Rakhad"] =
            {appendText=" deeper within his cave before he tries to escape.\n\nRakhad's cave is located behind Shuzura's mansion in the town of S'ren-ja."},
        ["Kill Rakhad"] =
            {appendText=", betrayer of S'ren-ja.\n\nRakhad was last seen deep within his hideout, a cave behind Shuzura's mansion in the town of S'ren-ja."},
        ["Talk to Clan Mother Shuzura 2"] =
            {appendText=" at her mansion in S'ren-ja.", stepTextKey="I've done what I can for the town. Time to go back and speak to Shuzura again."},
        ["Talk to Tazia"] =
            {appendText=", Shuzura's assistant, always by her side, located in the mansion in S'ren-ja."},
    },

[GetQuestName(4717)] = { --"Prisoners of the Sphinx"--Rosque
        ["Talk to Eliana"] =
            {appendText=". Talania was in the first room from the entrance of Fort Sphinxmoth."},
        ["Rescue Eliana Salvius"] =
            {appendText=", in a dungeon past spikes in the first large room of the ruins."},
        ["Rescue Decanus Vulso"] =
            {appendText=", if he's even alive. If he isn't, the old sewers beneath Fort Sphinxmoth may be a good place to dispose of a body, though the Imperials would likely appreciate confirmation of his state."},
        ["Rescue Veranus Macatus"] =
            {appendText=". From the upper floor of the first room in the ruins comes the sound of a man shouting beyond the roar of fire."},
        ["Leave Fort Sphinxmoth"] =
            {appendText="."},
        ["Talk to Eliana Salvius"] =
            {appendText="."},
    },

    [GetQuestName(4482)] = { --"Rat Problems"--iggy
        ["Talk to Milk Eyes 1"] =
            {appendText=" at his cozy house on the eastern side of S'ren-ja.", stepTextKey="I need to speak to Milk Eyes in his house to understand what's actually going on."},
        ["Enter the Well"] =
            {appendText=" next to Milk Eye's house in the town of S'ren-ja."},
        ["Talk to Tazia 1"] =
            {appendText=" inside the well, next to Milk Eyes house in the town of S'ren-ja.", stepTextKey="It seems that the well opens up into a cave. A Khajiit is crouched near where I dropped into the water, and hissed for me to speak with her."},
        ["Smash Laboratory Tables"] =
            {appendText="\n\nThe laboratory is located inside the well, next to Milk Eyes house in the town of S'ren-ja."},
        ["Burn the Laboratory"] =
            {appendText=" down. There may be something flammable nearby.\n\nThe laboratory is located inside the well, next to Milk Eyes house in the town of S'ren-ja."},
        ["Exit the Laboratory"] =
            {appendText=""},
        ["Talk to Tazia 2"] =
            {appendText=" behind Ezzag's barn, in the southeastern part of S'ren-ja.", stepTextKey="The cave went up in flames and now I find myself outside the cave with Tazia. I should speak to her."},
        ["Talk to Milk Eyes 2"] =
            {appendText=" at his cozy house on the eastern side of S'ren-ja.", stepTextKey="I should tell Milk Eyes about what was really going on in his well."},
        ["Talk to Milk Eyes 3"] =
            {appendText=" at his cozy house on the eastern side of S'ren-ja.", stepTextKey="I need to speak to Milk Eyes one more time."},
    },

    [GetQuestName(4481)] = { --"Small Town Problems"--iggy
        ["Talk to Clan Mother Shuzura"] =
            {appendText=" who is listening to her people's concerns at her mansion in S'ren-ja."},
        ["Talk to Kalari"] =
            {appendText=" at her fancy new home in S'ren-ja."},
        ["Talk to Milk Eyes"] =
            {appendText=" at his cozy house on the eastern side of S'ren-ja."},
        ["Talk to Ezzag"] =
            {appendText=" at his barn in the southeastern part of the town of S'ren-ja."},
    },

    [GetQuestName(4649)] = { --"The Sorcerer Division"--iggy
        ["Talk to Malarel 1"] =
            {appendText=" the smug sorcerer champion, outside of the Sorcerer Division Arena.", stepTextKey="I've been directed to speak to Malarel. She'll help me begin my Sorcerer Division trials."},
        ["Enter Sorcerer Division Arena"] =
            {appendText=" when you are ready to fight."},
        ["Defeat the Sorcerer Division Contenders"] =
            {appendText=""},
        ["Talk to Malarel 2"] =
            {appendText=" the smug sorcerer champion, outside of the Sorcerer Division Arena.", stepTextKey="I should talk to Malarel, the Sorcerer Division Champion, before I face her in the main event."},
        ["Enter the Arena of Thizzrini"] =
            {appendText=", the largest, loudest and most prestigious arena around, to defeat the Sorcerer Division Champion: Malarel."},
        ["Defeat the Champion of the Sorcerer Division"] =
            {appendText=": Malarel."},
        ["Talk to Feluni Outside the Arena"] =
            {appendText=", the largest, loudest and most prestigious building around."},
    },


    [GetQuestName(4648)] = { --"The Summoner Division"--iggy
        ["Talk to Tholbor 1"] =
            {appendText=" the cheerful summoner champion, outside of the Summoner Division Arena.", stepTextKey="I've been directed to speak to Tholbor. He'll help me begin my Summoner Division trials."},
        ["Enter the Summoner Arena"] =
            {appendText=" when you are ready to fight."},
        ["Defeat the Summoner Contenders"] =
            {appendText=""},
        ["Talk to Tholbor 2"] =
            {appendText=" the cheerful summoner champion, outside of the Summoner Division Arena.", stepTextKey="I defeated the challengers at the Summoner Arena. I should talk to Tholbor before I fight him in the main event."},
        ["Enter the Arena of Thizzrini"] =
            {appendText=", the largest, loudest and most prestigious arena around, to defeat the Summoner Division Champion: Tholbor."},
        ["Defeat the Champions of the Summoner Division"] =
            {appendText=""},
        ["Talk to Feluni"] =
            {appendText=" outside the Arena, the largest, loudest and most prestigious building around."},
    },


    [GetQuestName(4650)] = { --"The Swordmaster Division"--iggy
        ["Talk to Zara 1"] =
            {appendText=" the flirty swordmaster champion, outside of the Swordmaster Division Arena.", stepTextKey="I've been directed to speak to Zara. She'll help me begin my Swordmaster Division trials."},
        ["Enter Swordmaster Arena"] =
            {appendText=" when you are ready to fight."},
        ["Defeat the Contenders in the Swordmaster Arena"] =
            {appendText=""},
        ["Talk to Zara 2"] =
            {appendText=" the flirty swordmaster champion, outside of the Swordmaster Division Arena.", stepTextKey="I should speak with Zara, the Swordmaster Division Champion, before I face her in the main arena."},
        ["Enter the Arena of Thizzrini"] =
            {appendText=", the largest, loudest and most prestigious building around, to defeat the Swordmaster Division Champion: Zara."},
        ["Become the Swordmaster Division Champion"] =
            {appendText=" by defeating the current champion: Zara."},
        ["Talk to Feluni outside of Arena"] =
            {appendText=", the largest, loudest and most prestigious building around."},
    },

    [GetQuestName(4808)] = { --"Test of Faith"--iggy
        ["Talk to Kala 1"] =
            {appendText=", Yenadar's sister in S'ren-ja, the small village east of Rawl'kha.\n\nThe journal in my pocket could tell me more about what happened to him.", stepTextKey="I should tell Kala what happened to her brother. I have a choice. I can tell her the truth, or I can lie to her. I don't know which would be kinder."},
        ["Talk to Kala 2"] =
            {appendText=" in S'ren-ja, the small village east of Rawl'kha.\n\nKala seems at peace with her brother's passing.", stepTextKey="I've decided to tell Kala the truth, and she took it very well. I should speak to her again."},
        ["Talk to Kala 3"] =
            {appendText=" in S'ren-ja, the small village east of Rawl'kha.\n\nMaybe lying was not ideal...", stepTextKey="I've decided to lie to Kala to spare her feelings, but she doesn't seem to be taking it well. I should speak to her again."},
    },


	[GetQuestName(4687)] = { --"A Traitor's Luck"--iggy
		["Read the Note"] =
			{appendText=" from a Bottle, which was found randomly on a tree in Reaper's March but is now in my pockets."},
		["Talk to the Spy"] =
			{appendText=", who acording to the note, is located in the main path towards the town of Pa'alat, west from the city of Dune."},
		["Follow Cariel"] =
			{appendText=" into the town of Pa'alat."},
		["Talk to Cariel 1"] =
			{appendText=", who is disguised as a commoner at the center of Pa'alat, the little town west of Dune.\n\nShe seems to need my help.", stepTextKey="Cariel and I have reached the center of Pa'alat. I should speak with her again to work out a plan."},
		["Search an Ebonheart Pact Lodge"] =
			{appendText=", easily told apart from the other houses by the brutish guards dressed in the Ebonheart's red colors, for evidence of betrayal against the Queen.\n\nLocated in Pa'alat, a small town west of the great city of Dune."},
		["Talk to Cariel 2"] =
			{appendText=", who is disguised as a commoner at the center of Pa'alat, the little town west of Dune.\n\nReport on your findings regarding the Ebonheart Pact.", stepTextKey="Next is the Daggerfall Covenant. Cariel is certain to have some ideas about how to get inside the Covenant lodges. I should speak with her."},
		["Search a Daggerfall Covenant Lodge"] =
			{appendText=", told apart from the other houses by the smug guards dressed in the Daggerfall Covenant's blue colors, for evidence of betrayal against the Queen.\n\nLocated in Pa'alat, a small town west of the great city of Dune."},
		["Talk to Cariel 3"] =
			{appendText=", who is disguised as a commoner at the center of Pa'alat, the little town west of Dune.\n\nReport on your findings regarding the Daggerfall Covenant.", stepTextKey="Both lodges have been searched. I should speak to Cariel."},
		["Set Fires"] =
			{appendText=" around Pa'alat, the little town west of Dune.\n\nEmpty crates on the eastern side of town seem perfect to be set ablaze. And big enough for a distraction."},
		["Enter Krin Ren-dro's Mansion"] =
			{appendText=": Easily the biggest and most luxurious building in Pa'alat, the small town west of Dune."},
		["Search Krin Ren-dro's Mansion"] =
			{appendText=" in the town of Pa'alat for any suspicious books or texts containing intel on the Dominion."},
		["Talk to Cariel Behind the Mansion"] =
			{appendText=", in its backyard, to discuss what we found, away from the prying eyes of the people of Pa'alat."},
		["Enter Krin Ren-dro's Secret Lair"] =
			{appendText=" through the hatch on his mansion's backyard, in the small town of Pa'alat."},
		["Find Krin Ren-dro"] =
			{appendText=", judging by the distant and echoed sound of his voice, he might be deep into the lair.\n\nThe entrance to the lair is located under a hatch in the backyard of Ren-dro's mansion, in the small town of Pa'alat."},
		["Kill Krin Ren-dro"] =
			{appendText=" and his collaborators, deep within his secret lair.\n\nThe entrance to the lair is located under a hatch in the backyard of Ren-dro's mansion, in the small town of Pa'alat."},
		["Exit the Secret Cave"] =
			{appendText=".\n\nThere might be another way out, besides the entry hatch."},
		["Talk to Cariel 4"] =
			{appendText=" outside of Ren-dro's lair, in the western side of Pa'alat.\n\nWe have made Queen Ayrenn proud this day.", stepTextKey="I helped Cariel get rid of Krin Ren-dro. I should speak with her."},
	},


-- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP -- EP -- EP --EP 
-- BLEAKROCK ISLE 



[GetQuestName(3990)] = { --"A Beginning at Bleakrock"--mouch30
        ["Talk to Liezl"] =
            {appendText=", the Ebonheart Pact boatswain."},
        ["Talk to Rana 1"] =
            {appendText="", stepTextKey="Mathor asked me to speak to Captain Rana, the Pact commander stationed on Bleakrock Island. I'll find her in her office off the central square."},
        ["Talk to Rana 2"] =
            {appendText=", on the upper level of her office in the central square.", stepTextKey="Captain Rana asked me to help her locate missing villagers. I must talk to her about where to go to begin my search."},
        ["Find Darj"] =
            {appendText=" at the Nordic ruin to the east of the village. Dragon shrines are known for their dangerous inhabitants, and if the dead have started walking, something evil is afoot..."},
        ["Find Eiman and Rolunda"] =
            {appendText=". The cave lies in the northern part of the isle. Wild animals and the icy terrain make it a very deadly place to hang out in, let alone spend the night as a dare."},
        ["Find Seyne"] =
            {appendText=", at the abandoned mine northwest of the village. The bandits might have found artifacts left behind by the Daedra-worshiping family."},
        ["Explore Bleakrock Island"] =
            {appendText=". Captain Rana said Darj went to Skyshroud Barrow, Eiman and his sister Rolunda were at Orkey's Hollow, and Seyne was out at Hozzin's Folly."},
        ["Talk to Seyne"] =
            {appendText=" at the southern entrance to Hozzin's Folly."},
        ["Talk to Rolunda"] =
            {appendText=" at the entrance of Orkey's Hollow."},
        ["Talk to Darj"] =
            {appendText=" just west of the front steps leading up towards Skyshroud Barrow."},

    },





    [GetQuestName(3987)] = { --"Hozzin's Folly"--mouch30
        ["Get a Disguise from a Corpse"] =
            {appendText=". A thin layer of snow has already started to blanket the body next to Seyne."},
        ["Investigate Hozzin's Folly"] =
            {appendText="\nThe raiders have destroyed most of the buildings and set up tiny camps in them. Search for any documents, relics, and proof of daedric activity."},
        ["Get Inside the Mine"] =
            {appendText=", located to the north of the area."},
        ["Find a Way into the Tomb"] =
            {appendText=". The lookout at the door mentioned scamps in the cavern halls."},
        ["Bypass the Fire Traps"] =
            {appendText=". Smoke wafts out of raised vents in the ground, signaling the imminent flames."},
        ["Use the Portal to Enter Oblivion"] =
            {appendText=", in the central tomb of the mine."},
        ["Destroy the Unspeakable Sigil"] =
            {appendText=". You can hear the sharp growls of more scamps up ahead."},
        ["Leave the Tomb"] =
            {appendText=". You feel a strong pull as the sigil shatters into pieces, filling the room with a blinding light."},
        ["Leave the Mine"] =
            {appendText=". Breaking the sigil seems to have put you back near the entrance."},
        ["Talk to Sergeant Seyne"] =
            {appendText=", waiting for you at the mine's entrance."},
    },



[GetQuestName(3995)] = { --"The Frozen Man"--mouch30
        ["Enter Orkey's Hollow"] =
            {appendText=", a cave on the northernmost part of the isle. The entrance resembles a gaping maw, lined with giant icicles for fangs and a slippery tunnel for a throat."},
        ["Find Eiman"] =
            {appendText=" in the cave on the northernmost part of the isle. It's so quiet here...maybe Eiman is stuck somewhere."},
        ["Find Clues to the Frozen Man's Identity"] =
            {appendText="\nHis voice rings loud and clear throughout the cavern, as if watching your every move. There seems to be many discarded belongings scattered around the cave on the northernmost part of the isle."},
        ["Talk to the Frozen Man"] =
            {appendText=", a ghostly figure waiting for you at the entrance of his lair."},
        ["Enter the Frozen Man's Lair"] =
            {appendText=", now accessible without the thick ice wall, in the cave on the northernmost part of the isle."},
        ["Find the Real Frozen Man"] =
            {appendText=" among the fake apparitions dancing around the lair, in the cave on the northernmost part of the isle."},
        ["Talk to The Frozen Man"] =
            {appendText=", who ran to the outer ledge of the lair, in the cave on the northernmost part of the isle."},
        ["Convince the Frozen Man to Free Eiman"] =
            {appendText=" from the ice wall, in the cave on the northernmost part of the isle."},
        ["Free Eiman"] =
            {appendText=" from the ice wall, in the cave on the northernmost part of the isle. He must be freezing!"},
        ["Talk to Rolunda"] =
            {appendText=", at the entrance of the cave on the northernmost part of the isle."},
    },

[GetQuestName(3992)] = { --"What Waits Beneath"--mouch30
        ["Summon the Dragon Priest"] =
            {appendText=" using the incense Darj gave you. Located in the northwest of the ruins, on the east side of the isle, the shrine should resemble a small brazier."},
        ["Talk to Dragon Priest Haldriin"] =
            {appendText=", who appeared above the lit brazier standing on the northwestern platform, in the ruins on the eastern part of the isle. The flames lick at his feet, casting an orange glow throughout his ghostly body."},
        ["Collect the Whale Runestone"] =
            {appendText=", on the southern platform of the ruins on the east side of the isle. Stuhn, the Nordic god of justice, uses the whale as his symbol."},
        ["Collect the Snake Runestone"] =
            {appendText=" on the western platform of the ruins on the east side of the isle. The snake is used to protect the Nords from less favorable gods, who test the Nords through warfare and death."},
        ["Collect the Eagle Runestone"] =
            {appendText=", on the northern platform of the ruins on the east side of the isle. The eagle joins hawks and owls to represent Kyne, goddess of the storm."},
        ["Place the Whale Runestone"] =
            {appendText=" on its respective pedestal at the entrance of the barrow, on the east side of the isle."},
        ["Place the Snake Runestone"] =
            {appendText=" on its respective pedestal at the entrance of the barrow, on the east side of the isle."},
        ["Place the Eagle Runestone"] =
            {appendText=" on its respective pedestal at the entrance of the barrow, on the east side of the isle."}, 
	["Enter Skyshroud Barrow"] =
            {appendText=". The ice has melted away, revealing a heavily carved stone door, at the entrance of the barrow on the east side of the isle."},
        ["Sanctify the Priest's Body"] =
            {appendText=" before the Covenant agent finishes his ritual, in the main chamber of the barrow on the east side of the isle."},
        ["Search for Evidence"] =
            {appendText=" around the chamber, in the barrow on the east side of the isle."},
        ["Talk to Darj the Hunter"] =
            {appendText=", waiting at the entrance of the barrow on the east side of the isle."},
    },

    [GetQuestName(4016)] = { --"The Missing of Bleakrock"--mouch30
        ["Find Missing Villagers"] =
            {appendText=". Captain Rana mentioned two other people to bring back home. Perhaps there are other villagers who need help as you explore the island."},
        ["Tell Captain Rana to Evacuate"] =
            {appendText=". She will be pleased to know that all the missing villagers have been found and sent home safely. Captain Rana should still be in her office — the large building on the eastern edge of the village."},
        ["Talk to Captain Rana"] =
            {appendText=", in her office on the eastern edge of the village."},
    },



    [GetQuestName(4002)] = { --"Sparking the Flame"--mouch30
        ["Light the Signal Fire"] =
            {appendText=" by taking the southern path out of the village to the watch tower."},
        ["Talk to Tillrani Snow-Bourne"] =
            {appendText=", who waits for you at the gate near the old Nordic tomb, on the southern edge of town. The distant sound of battle makes its way up the path. The Daggerfall Covenant has finally made their move."},
        ["Collect Bucket of Water"] =
            {appendText=" from the well near Captain Rana's office in the village."},
        ["Extinguish the House Fire 1"] =
            {appendText=", blazing brightly in the northwest quadrant of the village square.", stepTextKey="I've got the bucket filled. Tillrani said that Denskar headed into the bunkhouse. I need to extinguish the fire outside the building, so I can get inside."},
        ["Save Denskar"] =
            {appendText=", hiding in the Earth-Turner house."},
        ["Extinguish the House Fire 2"] =
            {appendText=" to the northeast of the village square. Thick black smoke chokes the air as the flames eat through the wooden structure.", stepTextKey="Aera returned to her home, hoping for protection. I need to extinguish the fire outside the building, so I can get inside and find her."},
        ["Save Aera"] =
            {appendText=", who hid in Tillrani Snow-Bourne's house."},
        ["Save Littrek"] =
            {appendText=", the local farmer. His barn still stands to the north of the village."},
        ["Save Trynhild"] =
            {appendText=", the apprentice blacksmith. A collection of marooned ships were attracting attention from the Covenant soldiers. They could be trying to find Trynhild."},
        ["Talk to Captain Rana"] =
            {appendText=", stationed outside the old tomb to the south of the village."},
    },

	[GetQuestName(3991)] = { --"Escape from Bleakrock"--mouch30
		["Enter Last Rest"] =
			{appendText=", the towering Nordic tomb to the south of the village."},
		["Talk to Captain Rana 1"] =
			{appendText=" at the entrance of Last Rest.", stepTextKey="I need to talk to Captain Rana and find out her plan."},
		["Use the Switch 1"] =
			{appendText=". Even after hundreds of years, the metal spikes still protect these halls.", stepTextKey="To disable the traps, I must flip a switch on the far wall of the first room."},
		["Wait for Refugees 1"] =
			{appendText=" to get to the other end of the first room.", stepTextKey="Captain Rana has disabled the traps and summoned the refugees. I should wait for the refugees to reach safety."},
		["Talk to Captain Rana 2"] =
			{appendText=", at the far end of the first room.", stepTextKey="I need to speak to Captain Rana to find out the next step."},
		["Unlock the Door for Captain Rana"] =
			{appendText=", going through the southern door to get deeper into the tomb."},
		["Talk to Captain Rana 3"] =
			{appendText=", waiting next to the southern staircase.", stepTextKey="I unlocked the door. I should catch up to Captain Rana and find out the next step in clearing the tomb."},
		["Open the Door 1"] =
			{appendText=" to the lower halls, down the southern stairs.", stepTextKey="Captain Rana will unlock the door at the bottom of the stairs. I must enter the room beyond."},
		["Use the Switch 2"] =
			{appendText=" between the two thrones, guarded by skeletal warriors.", stepTextKey="Captain Rana needs me to flip the switch in this room so she can enter the door above it."},
		["Open the Door 2"] =
			{appendText="", stepTextKey="Captain Rana has run into the room beyond. I should use the door on the far side of this room and follow her."},
		["Talk to Captain Rana 4"] =
			{appendText=". The snow on the ground means you're almost out of here!", stepTextKey="We must be close to the far side. I need to talk to Captain Rana."},
		["Wait for Refugees 2"] =
			{appendText=" to make it to the last door.", stepTextKey="Captain Rana wants me to wait for the refugees to leave the Last Rest before I move on."},
		["Talk to Captain Rana 5"] =
			{appendText=", aboard a quaint boat. The cool breeze and fresh air are a welcome sensation to the refugees.", stepTextKey="We're saved! Captain Rana is speaking with someone on one of the boats in the cove. I should speak with her."},
		["Talk to Captain Rana 6"] =
			{appendText=", on the western edge of the camp at the smaller dock in Bal Foyen.", stepTextKey="I made it to Stonefalls, along with Captain Rana and the refugees. I should check in with Captain Rana."},
	},

    [GetQuestName(3996)] = { --"At Frost's Edge"--mouch30
        ["Burn the Supplies"] =
            {appendText=". The camp lies to the northeast of the village. The supplies are stored in a wooden crate, with a tightly tied tarp around the top to keep the frost out."},
        ["Free the Captive"] =
            {appendText=", tied up somewhere in the camp, northeast of the village."},
        ["Talk to Bjorynolf"] =
            {appendText=", who is grateful for your arrival after being held hostage at the camp northeast of the village."},
    },

    [GetQuestName(3988)] = { --"Dangerous Webs"--mouch30
        ["Save Tethis"] =
            {appendText=", trapped in a cave on the northwestern part of the isle."},
        ["Save Naer"] =
            {appendText=", who is being held hostage by a spider in a cave on the northwestern part of the isle."},
        ["Save Hunts-in-Shadow"] =
            {appendText=", tightly bound in silk weaved by the spiders in a cave on the northwestern part of the isle."},
        ["Talk to Bura-Natoo"] =
            {appendText=" back at base camp, next to the crumbling tower in the northwestern part of the isle."},
    },

    [GetQuestName(3999)] = { --"Lost on Bleakrock"--mouch30
        ["Use Dog Whistle"] =
            {appendText=" near the mill to the north of Halmaera's house."},
        ["Pet Rexus"] =
            {appendText=", who appeared at the mill north of Halmaera's house. A gentle pat on the head should soothe him."},
        ["Follow Rexus"] =
            {appendText=", who waits for you near the mill north of Halmaera's house."},
        ["Talk to Geilund"] =
            {appendText=" lying down on the southwestern coast of the isle. He looks sopping wet and bruised, but very much alive."},
    },

    [GetQuestName(3985)] = { --"Tracking the Game"--mouch30
        ["Collect Deathclaw Talon"] =
            {appendText=" from the beast's soon-to-be corpse.\n\nThe trail snakes to the southeast of the isle, littered with droplets of blood and personal belongings. You should be able to find a carcass near the lair's entrance to lure Deathclaw out."},
        ["Talk to Hoknir"] =
            {appendText=" back at his camp, set up at the fork of the eastern path out of the village. He should be willing to go back to the village now."},
    },

[GetQuestName(3986)] = { --"Underfoot"--mouch30
        ["Follow Molla"] =
            {appendText=". She waits for you to the north of the village. She seems a little...twitchy."},
        ["Pick Up the Wand"] =
            {appendText=", sticking out of a snow bank near an abandoned tent, across from the guild trader to the north of the village."},
        ["Talk to Molla 1"] =
            {appendText=" at the abandoned tent across from the guild trader, north of the village.", stepTextKey="Molla finally seems ready to talk to me. I should see what her story is."},
        ["Save Faltha"] =
            {appendText=". Skeevers are known to be omnivores, eating both grains and fish. Perhaps Faltha got hungry and went to hunt for something to eat."},
        ["Save Runs-in-Wild"] =
            {appendText=". These little creatures are very common in Skyrim, and are quite comfortable in the snowy wilderness. Like most skeevers, Runs-in-Wild might be hanging out next to caverns or scavenging near camps."},
        ["Save Brend"] =
            {appendText=". Skeevers have been pests to the Nords for as long as they can remember, but don't actually enter houses that often. In fact, you can usually find skeevers on the outskirts of town, away from large crowds of people. Perhaps Brend has run away to find some peace and quiet in the forest."},
        ["Talk to Molla 2"] =
            {appendText=", who waits with her friends outside the large, Nordic barrow in the village.", stepTextKey="I've restored Molla's hunting party to its proper shapes and sizes. I should find her in the village and speak with her again."},
    },

-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN-- BAL FOYEN

[GetQuestName(4023)] = { --"If By Sea"--mouch30
        ["Get to the Dhalmora Watchtower"] =
            {appendText=". The Dunmeri architecture is a sharp contrast against the Argonian mud houses."},
        ["Search the Watchtower"] =
            {appendText=". Even though the place has been ransacked, there might be some valuable information in the mess."},
        ["Get Kindlepitch Powder at Fort Zeren"] =
            {appendText=", a large Dark Elf garrison located in the south, just beyond the swampy fields. The ledger mentioned a quartermaster who could help..."},
        ["Get Kindlepitch Powder at the Foyen Dockyards"] =
            {appendText=", on the northern coast. Another quartermaster there should be able to assist, as long as you don't spook her."},
        ["Head to the Signal Fires"] =
            {appendText=" using the underground tunnel, near the eastern cliffs of the Foyen docks. The kindlepitch radiates with a gentle warmth, felt even through all the layers of your pack."},
        ["Light the East Fire"] =
            {appendText=", overlooking the eastern shore."},
        ["Light the West Fire"] =
            {appendText=", accessible by crossing the wooden bridge to the southeast. Covenant soldiers stand guard near the signal fires to make sure no one interferes with their plan."},
        ["Return to Dhalmora"] =
            {appendText=". The southern path is clear of enemies and provides a safe way to return back to the village."},
        ["Talk to Aera Earth-Turner"] =
            {appendText=", standing near the Dhalmora Hall of Merchants."},
    },



[GetQuestName(4041)] = { --"Crossroads"--mouch30
        ["Help Rana at the Docks"] =
            {appendText=", to the north of Dhalmora. Captain Rana and her soldiers are certainly capable, but the docks are too exposed on all sides. Dockworkers and fisherfolk are trying to escape using the northern bridge, and might need assistance."},
        ["Help Darj at the Fort"] =
            {appendText=" to the west of Dhalmora. The fort is large and well equipped, but the villagers can't fight, and the Covenant is hitting hard...The defense is likely being coordinated from the keep."},
        ["Talk to Eleven-Skips"] =
            {appendText=", hunched up against the eastern side of the bridge leading to the Foyen docks. Blood pools underneath him, and the sound of a frenzied battle rises and falls like tidal waves."},
        ["Talk to Darj the Hunter"] =
            {appendText=", in the Fort Zeren Keep — the westernmost building. The keep is full of injured soldiers and scared civilians."},
    },

[GetQuestName(4028)] = { --"Breaking the Tide"--mouch30
        ["Free Fishermen"] =
            {appendText=" from the windmill. The ever-turning sails can be seen from the bridge, directly west. Fire has already started climbing along the walls."},
        ["Assist Sergeant Seyne at the Docks"] =
            {appendText=" on the northern shore."},
        ["Defend Fisherfolk"] =
            {appendText=" keeping the attention of the Covenant on you, while the citizens escape."},
        ["Find Trynhild and Rana"] =
            {appendText=". The overwhelming attacks must have forced them to hide."},
        ["Talk to Trynhild"] =
            {appendText=", catching her breath in a shed, on the western side of the docks."},
        ["Look for Captain Rana"] =
            {appendText=" at the northern end of the docks, and assist her with her plan."},
        ["Talk to Captain Rana"] =
            {appendText=" on the ship at the northern end of the docks."},
        ["Kill the Covenant Commander"] =
            {appendText=" hiding in the hold of King Casimir's Pride, docked at the northern end of the docks. It's time the Covenant paid for their crimes."},
        ["Talk to Centurion"] =
            {appendText=" in his quarters of the Velvet Lash — the boat moored in the center of the docks. The Pact held strong, and the docks are safe. No word has come from the fort yet..."},
    },

[GetQuestName(4026)] = { --"Zeren in Peril"--mouch30
        ["Defend Fort Zeren"] =
            {appendText=", the sprawling citadel in the south. The Covenant soldiers have breached the walls, threatening the wounded refugees."},
        ["Close Portals"] =
            {appendText="\nBright flashes of white can be seen all around; like sparks from a roaring fire. Shutting them down should quell the incoming forces."},
        ["Find Denskar and Littrek"] =
            {appendText=", fighting Covenant troops at the eastern staircase."},
        ["Defend Denskar and Littrek"] =
            {appendText=", aiding them in their battle against the Covenant, at the eastern staircase."},
        ["Talk to Aera Earth-Turner"] =
            {appendText=", peering through the opening of a small barrack, in the middle of the fort's courtyard."},
        ["Kill the Covenant General"] =
            {appendText=", who has set up headquarters in the Fort Zeren Manor — the southernmost building of the fort."},
        ["Talk to Darj the Hunter"] =
            {appendText=", waiting back at the Fort Zeren Keep with the refugees, in the western part of the courtyard. The battle at the fort has been won, but at the cost of leaving the docks to the mercy of the Covenant."},
    },

    [GetQuestName(4051)] = { --"Warning Davon's Watch"--mouch30
        ["Talk to Holgunn"] =
            {appendText=", one of Davon's Watch's commanders. He waits for news in Artisan's row, the city's crafting hub.\n\nThe door to Stonefalls lies in the west of Bal Foyen, guarded by Pact soldiers. The northern path will take you straight to eastern gates, just beyond a regal Dunmeri fountain."},
    },

    [GetQuestName(4024)] = { --"Finding the Family"--mouch30
        ["Send Corkie Home"] =
            {appendText=", a shy and skittish guar grazing near the bridge in the southern fields."},
        ["Send Rollie Home"] =
            {appendText=", a brave but reckless guar wading near the falls north of the plantation."},
        ["Send Pale-Hide Home"] =
            {appendText=", a very smart guar who found his way into a protected fortress."},
        ["Talk to Esqoo"] =
            {appendText=", tending to his family in a crude barn, at the western entrance of Dhalmora."},
    },

    [GetQuestName(4022)] = { --"Salt of the Earth"--mouch30
        ["Find Nolu-Azza"] =
            {appendText=", kneeling under the rocky faces of the cliffs bordering the southern edge of the plantation."},
        ["Find Batuus"] =
            {appendText=", resting in the shade of two giant mushrooms, casting shadows onto the fields from the western plain."},
        ["Find Vudeelal"] =
            {appendText=", crouching under spongy mushrooms, southeast of the plantation's windmill."},
        ["Find Wenaxi"] =
            {appendText=", huddling in a grove of shriveled trees, west of the watchtower."},
        ["Talk to the Survivors"] =
            {appendText=", gathered in the village square, just outside the Hall of Merchants."},
    },


    [GetQuestName(4067)] = { --"The Bard of Hounds"--mouch30
        ["Find Gena"] =
            {appendText=". Wild nix-hounds are no joke - these bloodsucking creatures are aggressive and won't hesitate to attack. The top of the nearby hill is the perfect place for these beasts to ambush reckless people."},
        ["Kill the Rabid Nix-Hound"] =
            {appendText=", lurking at the end of the path. It frantically prowls along the edge of the cliff."},
        ["Talk to Bishalus"] =
            {appendText=", who made her way to the top of the eastern path from the docks. She kneels next to Gena, tending to her wounds."},
    },

    [GetQuestName(4038)] = { --"Unorthodox Tactics"--mouch30
        ["Throw Treated Netch Eggs at the Covenant"] =
            {appendText="\nThe 'targets' can be found razing the saltrice plantation, standing menacingly under giant mushrooms, and getting their boots wet in the muddy fields."},
        ["Talk to Iron-Claws"] =
            {appendText=", who watches the carnage from a vantage point on the southwestern edge of Dhalmora."},
    },


-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS-- STONEFALLS



    [GetQuestName(3585)] = { --"Legacy of the Ancestors"--mouch30
        ["Talk to Holgunn"] =
            {appendText=", standing in the Artisan's Row — a crafting hub in the southeast district of the city."},
        ["Follow Holgunn"] =
            {appendText=" through the streets of the bustling city, as he leads you to the Indoril Manor, in the northern district."},
  	  ["Meet Holgunn"] =
      	    {appendText=", waiting for you in the Indoril Manor, in the northern part of the city."},
        ["Talk to Tanval Indoril 1"] =
            {appendText=", the leader of House Indoril. Apparently, he has a plan to help the city defend against the invading troops. He waits in his manor, in the northern part of the city.", stepTextKey="I've joined Holgunn at the manse in Davon's Watch. He's introduced me to Tanval Indoril. I should speak to him."},
        ["Collect the Skull of Nam Indoril"] =
            {appendText=", one of Tanval's ancestors, no doubt, hidden deep within the crypt."},
        ["Talk to Tanval Indoril 2"] =
            {appendText=". The spirit's angry words ring in your ears...what is Tanval planning?", stepTextKey="I've retrieved the Skull of Nam Indoril. I should speak to Tanval Indoril at the manse in Davon's Watch."},
    },


    [GetQuestName(3587)] = { --"Delaying the Daggers"--mouch30
        ["Talk to Holgunn 1"] =
            {appendText=". You can also ask Garyn Indoril, the Grandmaster's son, to accompany you.", stepTextKey="I should head to the west gate of Davon's Watch and speak with Holgunn."},
        ["Burn Siege Equipment"] =
            {appendText="\nThe beach should be accesible by passing through the western gate and following the path to the shores."},
        ["Talk to Holgunn 2"] =
            {appendText=", back at the western gate.", stepTextKey="I delayed the Covenant. Now I should return to Davon's Watch and meet Holgunn."},
    },

    [GetQuestName(3588)] = { --"City Under Siege"--mouch30
        ["Find Tanval Indoril"] =
            {appendText=", performing his ritual in the House Indoril Crypt,  in the northern district of the city.."},
        ["Defend Tanval Indoril"] =
            {appendText=" from being attacked, in the House Indoril inner crypt, situated in the north of the city."},
        ["Observe Balreth's Attack"] =
            {appendText=", using the portal in the House Indoril inner crypt, in the northern district of the city.."},
        ["Talk to Tanval Indoril"] =
            {appendText=" outside of his manor, in the northern district. His plan worked, and Balreth's attack left nothing but a smoldering ship, saving the city."},
    },

    [GetQuestName(3589)] = { --"Quiet the Ringing Bell"--mouch30
        ["Talk to Garyn Indoril"] =
            {appendText=", who waits at a small camp on a rocky islet, surrounded by flowing lava rivers. The volcano takes up most of the eastern plains, spewing black smoke and ashes into the sky."},
    },

    [GetQuestName(3855)] = { --"Mystery of Othrenis"--mouch30
        ["Find Onuja"] =
            {appendText=", who should be exploring the graveyard to the southeast of the Ash Mountain's base camp."},
    },

[GetQuestName(3615)] = { --"Wake the Dead"--mouch30
        ["Chant at Shrine of Veneration"] =
            {appendText=", letting Mavos know how much you admire him."},
        ["Chant at Shrine of Reverence"] =
            {appendText=", praying that Mavos can feel how much you respect him."},
        ["Talk to Onuja 1"] =
            {appendText="", stepTextKey="I've honored the memory of Mavos at the two shrines in Othrenis. I must find and speak to Onuja the scholar, who waits for me at the center of the burial ground."},
        ["Chant at Central Brazier"] =
            {appendText=", pouring all your awe and devotion into bringing forth Mavos's spirit."},
        ["Survive the Anger of the Dead"] =
            {appendText=", destroying the ghosts that swarm the central brazier."},
        ["Talk to Onuja 2"] =
            {appendText=", standing at the central brazier.", stepTextKey="The spirits of Othrenis have been satisfied. I should be able to find Mavos now. I should speak to Onuja and find Mavos' grave."},
        ["Talk to Mavos Siloreth"] =
            {appendText=", who has appeared as a golden spirit. Onuja was right - this tomb is very impressive."},
    },

	[GetQuestName(3616)] = { --"Rending Flames"--mouch30
		["Collect Candle"] =
			{appendText=" from the western shrine, in the southern part of Othrenis. The area glows with such vibrant colors."},
		["Collect Skull"] =
			{appendText=" from the eastern shrine, in the southern part of Othrenis. Large pillars of light flow from all sorts of braziers."},
		["Talk to Mavos 1"] =
			{appendText=", who waits for you back at his tomb, in the southern part of Othrenis.", stepTextKey="I have the candle and the skull. I must return to Mavos to enter the vision."},
		["Talk to the Acolyte"] =
			{appendText=", who you can hear calling for help as you descend the staircase. The cries appear to be coming from the east."},
		["Close Southern Portal"] =
			{appendText=", just west of the acolyte's resting place."},
		["Close Western Portal"] =
			{appendText=", which can be found further up the hill."},
		["Close Northern Portal"] =
			{appendText=", found just past the large, circular stone arch."},
		["Talk to Magister Enuse"] =
			{appendText=", clutching her arm in pain, on the northern platform of the ruins."},
		["Summon a Guardian at the Western Flame Well"] =
			{appendText=". Blaze should be willing to follow your orders."},
		["Summon a Guardian at the Eastern Flame Well"] =
			{appendText=". Ragebinder waits for your command."},
		["Talk to Mavos 2"] =
			{appendText=", at the northern end of the ruins. Even with both guardians, he struggles to keep his hold on Balreth.", stepTextKey="I summoned the guardians, just as Magister Enuse instructed. Now I should speak with Mavos."},
		["Use the Altar"] =
			{appendText=" at the northern end of the ruins."},
		["Talk to Mavos 3"] =
			{appendText=" at his tomb, in the southern part of Othrenis. He seems a little more somber now, passing a small flame from palm to palm.", stepTextKey="There was a large explosion before I was sent back to the present. This must be how Mavos died.\n\nI must talk to him."},
	},


    [GetQuestName(3618)] = { --"To Ash Mountain"--mouch30
        ["Talk to Garyn Indoril"] =
            {appendText=", at the base camp near Ash Mountain."},
    },

    [GetQuestName(3734)] = { --"Restoring the Guardians"--mouch30
        ["Collect Daedra Hearts"] =
            {appendText=" \nDefeating the various scamps and clannfears that prowl the path of Ash Mountain should grant you with more than enough."},
        ["Summon and Defeat Ragebinder"] =
            {appendText=". The altar can be found near the base of the mountain path, overlooking Garyn's camp."},
        ["Summon and Defeat Blaze"] =
            {appendText=". The altar lies to the east, facing the mouth of the lava river."},
        ["Talk to Walks-in-Ash"] =
            {appendText=", an Argonian mage who has vowed to help with the mission. She waits near the binding altar, at the northern end of the path."},
    },

[GetQuestName(3735)] = { --"The Death of Balreth"--mouch30
        ["Summon Blaze"] =
            {appendText=" at the western shrine."},
        ["Summon Ragebinder"] =
            {appendText=" at the eastern shrine."},
        ["Talk to Mavos Siloreth 1"] =
            {appendText=" near the binding altar at the end of the northern path. It's a suprise to see him here, especially when he seemed upset to be woken up.", stepTextKey="The portal stands open. The spirit of Mavos Siloreth has appeared once more at the portal entrance. I should speak to him to see if he has any advice for defeating Balreth."},
        ["Enter Ash Mountain"] =
            {appendText=" by using the portal near the binding altar, at the end of the northern path of Ash Mountain."},
        ["Defeat Balreth"] =
            {appendText=".  His footsteps mimic earthquakes, as he stomps towards lava pools, gathering strength."},
        ["Contain Balreth's Spirit"] =
            {appendText=", using the power from Blaze and Ragebinder to end the battle."},
        ["Imprison Balreth"] =
            {appendText=", but the guardians don't seem to be listening to you or Garyn. There has to be someone else that can make them obey."},
        ["Talk to Mavos Siloreth 2"] =
            {appendText=" in the Ash Mountain caldera.", stepTextKey="Mavos Siloreth has arrived. He helped me imprison Balreth, a Brother of Strife, forever. I should speak to him and see if anything else remains to be done."},
        ["Leave Ash Mountain"] =
            {appendText=" through the portal to the northwest, in the Ash Mountain caldera."},
        ["Talk to Walks-in-Ash"] =
            {appendText=", standing with Pact soldiers at Garyn Indoril's camp, at the base of Ash Mountain."},
    },


    [GetQuestName(3737)] = { --"In With the Tide"--mouch30
        ["Talk to Arethil"] =
            {appendText=", a Dark Elf soldier stationed at the historical battlefield of Vivec's Antlers."},
    },

	[GetQuestName(3584)] = { --"The Coral Heart"--mouch30
		["Talk to Captain Noris"] =
			{appendText=", who overlooks the coral forest from the outskirts of the camp."},
		["Search Mud Mounds for Survivors"] =
			{appendText="\nThe dreugh are known to bury living prey in mud cocoons as a means to feed their young. These large mud piles are usually built around similar looking rocks."},
		["Rescue Lieutenant Galyn from the Ship"] =
			{appendText=" docked near the Dagger's Point invasion camp. She should be in the ship's hold."},
		["Find Sings-With-Reed"] =
			{appendText=", crouching on a rocky outcrop near the southern cliffs."},
		["Place Egg in North Coral Cluster"] =
			{appendText=", closest to the shore. The amber branches seem to hum softly."},
		["Place Egg in Southwest Coral Cluster"] =
			{appendText=", huddled under the looming overhang of sharp rocks. The luminous bristles tremble as the dreugh continue to fight."},
		["Place Egg in South Coral Cluster"] =
			{appendText=", closest to the main path. The tentacles sway in nonexistent wind, as if reaching for the eggs in your hands."},
		["Enter Coral Heart Chamber"] =
			{appendText=", a cave in the southwest corner of the coral forest. It's marked by the tallest coral structure protruding from the top."},
		["Find the Coral Heart"] =
			{appendText=" within the Coral Heart Chamber, marked by the largest coral structure. Sings-With-Reed's voice echoes through the tunnel."},
		["Wait for Sings-With-Reed"] =
			{appendText=" as she ruminates on the next steps that need to be taken, in the Coral Heart Chamber located in the southwest of the coral forest."},
		["Kill Alexandra Conele"] =
			{appendText=", who appeared with the Coral Heart. The battle must take place in the Coral Heart Chamber, in the southwest of the coral forest. As a battlemage, she harnesses the power of all three elements, and won't go down so easily."},
		["Collect Coral Heart"] =
			{appendText=", pulsing and shimmering in the Coral Heart chamber, in the southwest of the coral forest."},
		["Give Coral Heart to Holgunn"] =
			{appendText=", waiting at the south side of the camp. Despite the holes in the delicate looking coral layers, it feels sturdy in your hands. Through the gaps of coral, a glint of metal can be seen."},
	},



    [GetQuestName(3671)] = { --"To Fort Virak"--mouch30
        ["Talk to Sergeant Gjorring"] =
            {appendText=", a Nord soldier who waits on the main path to Fort Virak. The formidable fort sits in the very northwest of Stonefalls."},
    },


    [GetQuestName(3632)] = { --"Breaking Fort Virak"--mouch30
        ["Talk to Garyn Indoril 1"] =
            {appendText=" at the camp, situated to the southwest of the main path to Fort Virak.", stepTextKey="A perimeter guard instructed me to speak with Garyn Indoril at the Pact's siege camp."},
        ["Examine Dead Soldiers"] =
            {appendText="\nThe southern path leading to the fort's entrance is littered with dead Covenant troops."},
        ["Talk to Garyn Indoril 2"] =
            {appendText=" back at the Pact camp, to the southwest of the fort's main path.", stepTextKey="I collected a number of putrified body parts from dead Covenant soldiers. Strangely, these specimens appear to be long dead—several days old, at least. Perhaps Garyn will know what it means."},
        ["Enter the Ruins"] =
            {appendText=", located to the northeast of the camp. The dome-like entrance sits right on the southern walls of the fort."},
        ["Talk to Walks-in-Ash 1"] =
            {appendText=" in the Fort Virak ruins, on the southern wall of the fort.", stepTextKey="I should speak to Walks-in-Ash inside the ruins."},
        ["Use a Transformation Potion"] =
            {appendText=" in the Fort Virak ruins, on the southern wall of the fort. Walks-in-Ash handed you a little glass vial, filled with a sparkling silver liquid."},
        ["Pass through the Wall"] =
            {appendText=" in the northern alcove, in the Fort Virak ruins. Your tiny, wispy body crackles with magicka."},
        ["Sneak through Ruined Corridors"] =
            {appendText=", taking care to stay out of the ghosts' lines of sight."},
        ["Unlock the Door"] =
            {appendText=" in the eastern corridor."},
        ["Talk to Walks-in-Ash 2"] =
            {appendText=" at the eastern door in the Fort Virak ruins.", stepTextKey="Now that we've entered the fort, I should speak to Walks-in-Ash."},
    },

    [GetQuestName(3633)] = { --"Evening the Odds"--mouch30
        ["Enter Fort Virak from the Ruins"] =
            {appendText=", bracing yourself for the battle to come."},
        ["Unbar the North Gate"] =
            {appendText=", aptly located at the northernmost edge of the fort."},
        ["Unbar the South Gate"] =
            {appendText=", at the southernmost point of the fort."},
        ["Find General Serien"] =
            {appendText=". The way to the keep is warded by some strange magic - there might be more evidence of the general's work in one of the towers in the fort's courtyard."},
        ["Find Tanval Indoril"] =
            {appendText=" with the rest of the Pact commanders in the central area of Fort Virak, south of the main courtyard."},
        ["Talk to Tanval Indoril"] =
            {appendText=" in the central area of Fort Virak, south of the main courtyard."},
    },


    [GetQuestName(3634)] = { --"The General's Demise"--mouch30
        ["Wait for the Indorils to Dispel the Ward"] =
            {appendText=" at the inner courtyard doors, in the southwest quadrant of Fort Virak."},
        ["Enter the Manor Gate"] =
            {appendText=" to the inner courtyard, in the southwest quadrant of Fort Virak."},
        ["Enter the Keep"] =
            {appendText=" by fighting your way to the western staircase, in the inner courtyard of Fort Virak."},
        ["Kill General Serien"] =
            {appendText=", kneeling before an altar in Virak Keep. The stench of rotting bodies and burnt flesh hangs heavily in the air."},
        ["Meet Holgunn outside Keep"] =
            {appendText=". The blast of magic from Tanval injured the Nord, so he couldn't have made it further from the Virak Keep platform."},
        ["Talk to Holgunn"] =
            {appendText=" outside Virak Keep."},
    },


   [GetQuestName(3635)] = { --"City at the Spire"--mouch30
        ["Travel to Kragenmoor"] =
            {appendText=", a lofty city ruled by House Dres. It is located in the southwest of Stonefalls - a lucrative position for dealing in the slavery business. Talk to any guards you can find on the northwestern path."},
    },


    [GetQuestName(3695)] = { --"Aggressive Negotiations"--mouch30
        ["Talk to Grandmaster Omin Dres"] =
            {appendText=" in the Grandmaster's palace. It's a tremendously ornate building in the north of the city."},
        ["Talk to Denu Faren 1"] =
            {appendText=" in the Grandmaster's palace, to the north of the city. She wears a grim expression, eyes locked on the Vanguard nearby.", stepTextKey="The grandmaster told me to talk to his seneschal, Denu Faren, if I need anything."},
        ["Talk to Nadras Hlor"] =
            {appendText=", who should be on the upper level of the Grandmaster's palace, north of the city."},
        ["Talk to Kaasha"] =
            {appendText=", manning a stall by the Grandmaster's palace."},
        ["Enter the Barracks"] =
            {appendText=" at the very south of Kragenmoor. The disguise Kasha gave you smells of boiled netch leather and smoke."},
        ["Search the Vanguard Barracks for Information"] =
            {appendText=". The common soldiers might not pay much attention to you, but the captains wandering about will know that you don't belong here."},
        ["Talk to Denu Faren 2"] =
            {appendText=", who hides on the western edge of the upper ring of the Grandmaster's palace in Kragenmoor.", stepTextKey="I need to find Denu Faren and tell her what I've learned."},
        ["Search the Vanguard Camp for Information"] =
            {appendText=", located to the east of Kragenmoor. The Vanguard don't look very organized, so the evidence must be scattered around the ruins."},
    },


    [GetQuestName(3696)] = { --"Saving the Son"--mouch30
        ["Find the Tunnel to the Tomb"] =
            {appendText=". Denu Faren mentioned it would be along the mountainside."},
        ["Find the Tomb Entrance"] =
            {appendText=" by traversing through the tunnel. The air is damp, and dust sticks to your skin."},
        ["Find and Free Sen Dres"] =
            {appendText=" from the House Dres crypts, tucked deep into the mountainside, near the western pass of Kragenmoor. Sen must be caged somewhere in the crypt."},
        ["Meet Sen Dres Outside the Daedric Tombs"] =
            {appendText=". A door leading to the city can be found in the room to the east."},
        ["Return to the Grandmaster's Chamber"] =
            {appendText=" in his palace to the north of the city."},
        ["Talk to Grandmaster Omin Dres"] =
            {appendText=" at the far end of the hall, in the Grandmaster's palace in the north of the city."},
    },

    [GetQuestName(3698)] = { --"To the Tormented Spire"--mouch30
        ["Travel to Tormented Spire"] =
            {appendText=", taking the eastern path from Kragenmoor until you reach a fork in the road. The way to the Spire is marked by a massive, circular gate."},
    },


	[GetQuestName(3826)] = { --"Climbing the Spire"--mouch30
		["Lower the Ritual Ward"] =
			{appendText=", using the key that Grandmaster Omin Dres gave you."},
		["Lower the Atronach Ward"] =
			{appendText=". The giant crystal shards float in a miasma of indigo and violet magicka."},
		["Enter Tormented Spire"] =
			{appendText=" using the trapdoor in the cave of the Spire's entrance."},
		["Talk to Walks-in-Ash"] =
			{appendText=", hiding behind the arch, north of the Spire's entrance. You can just spot her next to a tall, burnt tree."},
		["Enter the Southern Ruins"] =
			{appendText=", just beyond the northern arch from the Spire's entrance. The ruin sits next to a massive, rippling ward."},
		["Lower the Southern Ruins Ward"] =
			{appendText=" in the main chamber of the ruins."},
		["Find the Northern Ruins"] =
			{appendText=", located at the end of the northern path. The way is crowded with Vanguard soldiers, eager to stop you from completing your task."},
		["Enter the Northern Ruins"] =
			{appendText=", located at the end of the northern path."},
		["Lower the Northern Ruins Ward"] =
			{appendText=" in the main chamber of the ruins."},
		["Find the Pact Commanders"] =
			{appendText=". The southern tunnel is no longer warded, granting access to the volcano's main chamber."},
		["Talk to Tanval Indoril 1"] =
			{appendText=". He's lying on the ground, on the first platform of the volcano's caldera. The Pact commanders are gathered around him, and the air is heavy with tension.", stepTextKey="I've found Tanval. I should ask him why he's injured."},
		["Kill the Daedra and Collect Her Key"] =
			{appendText=". The western staircase will lead you further into the depths of the volcano, where you should be able to reach the ritual site past the central platform."},
		["Enter the Caldera Ruins"] =
			{appendText=", directly northwest of the central platform of the volcano's caldera."},
		["Lower the Caldera Ruins Ward"] =
			{appendText=". The crystal should be further into the ruins. You can hear faint whispering through the halls."},
		["Talk to Tanval Indoril 2"] =
			{appendText=", waiting for you outside of the Caldera ruins.", stepTextKey="The final ward has been lowered. We should be able to enter the prison holding the second Brother of Strife."},
	},


	[GetQuestName(3837)] = { --"Opening the Portal"--mouch30
		["Talk to Genvis Faledran 1"] =
			{appendText=", a Chimer battlemage. The ghostly blue figure stands with crossed arms.", stepTextKey="Tanval said the first spirit is waiting for me on the platform in the center of the caldera."},
		["Collect Focus Stone of Flame"] =
			{appendText=". Scorched dirt and ruined walls stick out from under the flowing lava."},
		["Talk to Genvis Faledran 2"] =
			{appendText=" back on the central platform of the caldera.", stepTextKey="I have the first Focus Stone. I must return it to Genvis Faledran."},
		["Talk to Levisii Gilvayn"] =
			{appendText=". Her translucent figure emits an unearthly blue glow."},
		["Collect Focus Stone of Wrath"] =
			{appendText=". It lies at the end of a tunnel, filled with the afterimages of the mages that bound Sadal. They seem to be engrossed in the ritual."},
		["Speak with Levisii Gilvayn"] =
			{appendText=" at the tunnel's entrance. She has followed you, hovering over the perilous edge of the cliff."},
		["Talk to Mavos Siloreth 1"] =
			{appendText=", floating on the precipice of a rocky spike.", stepTextKey="I must complete one final trial. I'll find the third spirit near a cave above the caldera."},
		["Collect Focus Stone of Binding"] =
			{appendText=", hidden in a tunnel flashing with red bursts of magicka."},
		["Talk to Mavos Siloreth 2"] =
			{appendText=" back at the entrance of the tunnel. He hasn't moved from his perch, staring at you with lifeless, golden eyes.", stepTextKey="I have the final Focus Stone. I must return to Mavos Siloreth."},
		["Place Focus Stone of Flame"] =
			{appendText=" on one of the panels. The stone feels hot in your hands, biting at your flesh."},
		["Place Focus Stone of Wrath"] =
			{appendText=" on one of the panels. Just holding this stone fills you with an intense anger."},
		["Place Focus Stone of Binding"] =
			{appendText=" on one of the panels. It's hard to put this stone down...a part of you wants to hold on forever."},
		["Wait for the Spirits"] =
			{appendText=" to conduct their ritual on the central platform of the caldera."},
		["Talk to Tanval Indoril"] =
			{appendText=" on the edge of the caldera's central platform."},
	},


[GetQuestName(3868)] = { --"Sadal's Final Defeat"--mouch30
        ["Enter Sadal's Prison"] =
            {appendText=" through the glowing portal on the center platform of the caldera. Somehow, it's hotter than being next to an actual river of lava."},
                ["Defeat Sadal"] =
            {appendText=" who waits for you at the center of his prison. Your team will stand beside you, ready to defend their homeland."},
        ["Channel Sadal to Summon Guardians"] =
            {appendText=", closing this chapter of Stonefalls' history once more."},
        ["Await Guardian Justice"] =
            {appendText=" as they fulfill their ancient duty to bind Sadal once more."},
        ["Leave Sadal's Prison"] =
            {appendText=" through Walks-in-Ash's portal. Tanval's body lies next to the unmoving monster, still smoldering from the confrontation. His son would be proud."},
        ["Talk to Walks-in-Ash"] =
            {appendText=", waiting at the entrance of the Tormented Spire."},
        ["Talk to Tanval's Spirit"] =
            {appendText=". His back is turned towards you, but you can recognize him by the way he carries himself, even in death."},
        ["Talk to Holgunn"] =
            {appendText=", at the entrance of the Tormented Spire."},
    },


    [GetQuestName(5042)] = { --"Assisting Davon's Watch"--mouch30
        ["Talk to Holgunn at Davon's Watch"] =
            {appendText=", a popular port city. The Nord commander should be waiting by the eastern entrance, in the Artisan's Row."},
    },


    [GetQuestName(5041)] = { --"To Aid Davon's Watch"--mouch30
        ["Talk to Holgunn at Davon's Watch"] =
            {appendText=", a popular port city. The Nord commander should be waiting by the eastern entrance, in the Artisan's Row."},
    },


    [GetQuestName(5044)] = { --"To the Mountain"--mouch30
        ["Report in at Ash Mountain"] =
            {appendText=", a volcano in the southeast part of Stonefalls. A base camp sits on a rocky isle in the center of a lava pit, where soldiers wait for their leaders to send them into battle."},
    },




[GetQuestName(5043)] = { --"A Higher Priority"--mouch30
        ["Report in at Vivec's Antlers"] =
            {appendText=", an ancient battlefield on the shores west of Ebonheart, a city in the central sea of Stonefalls. Ebonheart soldiers have set up camp by the road. Someone there should give you further instructions."},
    },

    [GetQuestName(5040)] = { --"Taking Precautions"--mouch30
        ["Talk to Sergeant Gjorring"] =
            {appendText=" at Fort Virak, an impressive fortress that guards the northwestern entrance to Stonefalls, a Pact camp gathers on the southern road to the fort, where you should be able to find the sergeant."},
    },

-- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests 
-- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests 
-- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests 
-- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests 
-- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests -- Side Quests 




[GetQuestName(3736)] = { --"Close the Scamp Caves"--mouch30
        ["Close South Scamp Cave"] =
            {appendText=", sitting across from a large, twisted tree."},
        ["Close Central Scamp Cave"] =
            {appendText=". If you find a bright blue flame, the cave entrance should be to the northwest."},
        ["Close North Scamp Cave"] =
            {appendText=", tucked away overlooking the mouth of the flowing lava river."},
        ["Talk to Captain Norra"] =
            {appendText=". She should be at the end of the northern path, on the large stone platform."},
    },

    [GetQuestName(3915)] = { --"Decree of the Court"--mouch30
        ["Talk to the Knave of Rooks"] =
            {appendText=", perched on the railing of a scorched house, located in the southwestern lagoon of Crow's Wood."},
        ["Pay the Toll of Flesh by Killing Bats"] =
            {appendText="\nThese monstrous beasts can be found in the northern part of Crow's Wood, just north of the marshy field."},
        ["Talk to the Seneschal of Carrion 1"] =
            {appendText=", who resides in a large clearing near the center of Crow's Wood.", stepTextKey="I paid the toll of flesh. The crows feasted on the remains of their monstrous foes. I should report to the Seneschal of Carrion in the Blackfeather Court."},
        ["Talk to the Duke of Crows"] =
            {appendText=", a regal crow overlooking an impressive pile of trinkets and treasures, in the large clearing near the center of Crow's Wood."},
        ["Pay the Toll of Silver by Finding Trinkets"] =
            {appendText="\nA silver buckle can be found near a damaged wall on the western edge of the woods, still holding up the pants of a dead man.\nA silver dagger glints from the entrance of a cave on the northern side of the southern lagoon.\nA silver arrow, still piercing the armor of a long lost soldier, lies a little to the southwest of the ruined cottage.\nA silver ring remains loyal to the remains of their master, who mistook a cave in the valley of wolves for a safe haven."},
        ["Talk to the Seneschal of Carrion 2"] =
            {appendText=", who resides in a large clearing near the center of Crow's Wood.", stepTextKey="I've collected silver trinkets the crows desire. I need to bring them to the Seneschal of Carrion in the Blackfeather Court."},
    },


    [GetQuestName(3670)] = { --"Desperate Souls"--mouch30
        ["Find the Firesap Gel"] =
            {appendText=", which should be stored somewhere near the campsites outside of Emberflint Mine. The mine is located near central Stonefalls, on the southern side of Ash Mountain's lava river."},
        ["Rescue Miners"] =
            {appendText="\nThe soul crystals containing Neposh's people are scattered around the cave tunnels to the south and west of Emberflint Mine's central campsite."},
        ["Talk to Neposh 1"] =
            {appendText=" back at the platform in Emberflint Mine's central campsite.", stepTextKey="I've freed several of the Argonian slaves from the depths of Oblivion. I should tell Neposh the good news."},
        ["Slay Fatestealer"] =
            {appendText=", the Daedra that the Dark Elves summoned in order to control the Argonians. Last-to-Water's soul crystal rests in the middle of Emberflint Mine's central campsite."},
        ["Talk to Neposh 2"] =
            {appendText=" back at the platform in Emberflint Mine's central campsite. As it turns out, Neposh was the one to summon Fatestealer!", stepTextKey="Last-to-Water has escaped from Oblivion. I should speak again with Neposh."},
    },

    [GetQuestName(3594)] = { --"Enslaved in Death"--mouch30
        ["Free Spectral Slave"] =
            {appendText="\nYou can spot the Argonian spirits still working from beyond the grave around the Starved Plain, the ancient battlefield south of Davon's Watch."},
        ["Talk to Ix-Utha 1"] =
            {appendText=", who waits for you on the road to the south of the Starved Plain.", stepTextKey="Now that the enslaved dead are free to move on, I should seek out the spirit of Ix-Utha."},
        ["Talk to Ix-Utha 2"] =
            {appendText=", who waits for you on the road to the south of the Starved Plain. She seems calm - not quite happy, but relieved that some of her people are now safe.", stepTextKey="I should speak to Ix-Utha once again to bid her farewell."},
    },

  [GetQuestName(3860)] = { --"Exquisite Tears"--mouch30
        ["Steal a Bottle of Tears of Amaya"] =
            {appendText=" from Hectur, the Nord who owns and runs The Fish Stink, an open air inn near the Davon's Watch docks."},
        ["Bring the Tears of Amaya to Naril Heleran"] =
            {appendText=", waiting for you at the central fountain near the market district."},
    },


    [GetQuestName(5045)] = { --"The Fate of a Friend"--mouch30
        ["Find Stands-In-Still-Water"] =
            {appendText=", who was last known to be wandering on the northern coast where he had previously set up camp."},
        ["Talk to Shuldrashi at the Farm near Kragenmoor"] =
            {appendText=", a city in the southwest part of Stonefalls."},
    },

    [GetQuestName(3598)] = { --"Giving for the Greater Good"--mouch30
        ["Find the Kwama Nest"] =
            {appendText=" located in the cliffs to the east of the Starved Plain."},
        ["Collect Kwama Cap"] =
            {appendText=", a large, foul-smelling mushroom hidden in the mine to the east of the Starved Plain."},
        ["Talk to Reesa"] =
            {appendText=", waiting for you outside the Strifeswarm mine. Carrying the Kwama cap with you emits a stench that riles up the nearby kwama."},
        ["Take the Kwama Cap to Utadeek"] =
            {appendText=" on the west side of the Starved Plain, crouching near a lava river."},
        ["Take the Kwama Cap to Gam-Kur"] =
            {appendText=" at the south side of the Starved Plain, standing amidst rocks and wandering spirits."},
        ["Deliver Kwama Cap to Reesa"] =
            {appendText=" at a Pact camp on the south road from the Starved Plain."},
    },

    [GetQuestName(3602)] = { --"Percussive Ranching"--mouch30
        ["Use Drelden's Whistle on Kwama"] =
            {appendText="\nThe escaped kwama have congregated outside of Senie, to the southwest."},
        ["Talk to Drelden Orn at His Mine"] =
            {appendText=", which is located to the far west out of Senie, overlooking a large lava pool."},
    },

	[GetQuestName(3592)] = { --"Proving Trust"--mouch30
		["Collect Shalk Chitin"] =
			{appendText="\nThese large, temperamental beetles were attracted to the lava pools around Senie. While dangerous to be around, the materials they produce are worth the risk."},
		["Talk to Soft-Scale"] =
			{appendText=", who has taken it upon himself to provide medical aid for the townsfolk."},
		["Heal Peasants"] =
			{appendText="\nVisiting apothecaries have arrived to tend to the wounded, but can't do much without the proper tools. To avoid any more injury, the citizens haven't moved from their positions around town."},
		["Talk to Spellwright Girvas 1"] =
			{appendText=", the mayor of Senie. He's taking refuge inside a barn in the center of town.", stepTextKey="I've used the Argonian poultice to heal a number of Dunmer injured by the eruption and the shalk invasion. I should seek out Spellwright Girvas and tell him of the aid the Argonians provided."},
		["Talk to Walks-in-Ash"] =
			{appendText=". She's wandering around the south side of town, picking her way through the ruined buildings."},
		["Find Morvani"] =
			{appendText=", Girvas's daughter. As you move further out of town, the air grows hotter from the numerous pools of lava."},
		["Use Walks-in-Ash's Signal"] =
			{appendText=". It's a small wooden stick, resembling a torch. Damp linen is wrapped around the tip, while feathers and beads adorn the stem."},
		["See Morvani Safely Off the Island"] =
			{appendText=" at the shrine to the west of town."},
		["Talk to Spellwright Girvas 2"] =
			{appendText=" at the shrine to the southwest of town. His usual frown has been replaced with a look of relief.", stepTextKey="I've found the missing Morvani. Both her father Girvas and the Argonian shaman Walks-in-Ash arrived when I used the signal. I should speak to the Spellwright."},
		["Talk to Spellwright Girvas 3"] =
			{appendText=" at the shrine to the southwest of town.", stepTextKey="Girvas and his daughter have been re-united. I should speak to him again."},
	},

    [GetQuestName(3617)] = { --"Quieting a Heart"--mouch30
        ["Collect Graven Caps"] =
            {appendText="\nThese golden mushrooms can be found growing in the shades of the stone monuments all over the graveyard."},
        ["Talk to Bala 1"] =
            {appendText=", who stayed behind on the southern edge of the central shrine.", stepTextKey="I've collected enough Graven Caps. I must seek out Bala near Mavos' tomb in Othrenis."},
        ["Use Dust on Eanen's Tomb"] =
            {appendText=", one of the large urns on the northwestern platform of Othrenis."},
        ["Talk to Eanen"] =
            {appendText="'s spirit on the northwestern platform of Othrenis, near the Varam tomb."},
        ["Talk to Bala 2"] =
            {appendText=" at the entrance of Othrenis.", stepTextKey="Eanen's feelings for Bala were a lie. He and his wife found the story about her feelings to be quite amusing. I must tell Bala … something."},
        ["Talk to Bala 3"] =
            {appendText=" at the entrance of Othrenis. You told her that Eanen's tomb was empty, hoping that Bala will leave Othrenis for good.", stepTextKey="After speaking with Eanen, I'll have to tell Bala something."},
        ["Talk to Bala 4"] =
            {appendText=" at the entrance of Othrenis.", stepTextKey="After speaking with Eanen, I must tell Bala something."},
    },

	[GetQuestName(3902)] = { --"A Son's Promise"--mouch30
		["Search the Old House"] =
			{appendText=" in the middle of a lagoon in the southwest part of Crow's Wood. The path travels through a valley full of wolves, before leading you to a wisp-laden marsh."},
		["Talk to Telbaril 1"] =
			{appendText=" in the charred remains of the cottage, in the southwestern lagoon of Crow's Wood.", stepTextKey="Telbaril followed me to the old house. I should let him know what I found."},
		["Find the Blackfeather Court"] =
			{appendText=". A path leading deeper into the woods lies to the north, twisting to the right at the top of the hill to meet in the center of the woods."},
		["Find the Tower Key"] =
			{appendText=". You can spot the broken base of the tower to the east of the Blackfeather Court, marked by a group of gnarled, brittle trees."},
		["Enter the Tower"] =
			{appendText=" located at the top of the hill, in the eastern side of Crow's Wood. Like everything else here, the structure is falling apart. The tower's courtyard teems with lost souls, wandering aimlessly about."},
		["Talk to the Crow Mother"] =
			{appendText=" - a terrifying amalgamation of woman and bird. She watches over a trapdoor, in the Crow Mother's tower on the eastern side of Crow's Wood."},
		["Subdue Rulantaril"] =
			{appendText=" by gently hitting him with your weapons and spells, in the basement of the Crow Mother's tower, on the eastern side of Crow's Wood."},
		["Talk to Telbaril 2"] =
			{appendText=", who returned to the southern isle to continue stabilizing the portal used to enter Crow's Wood.", stepTextKey="I \"persuaded\" Rulantaril to see reason and fulfill his obligation to Crow Mother. I need to tell Telbaril about the outcome."},
		["Kill Crow Mother 1"] =
			{appendText=", who ran away to one of her many nests. It should be in one of the other ruined towers that are scattered around Crow's Wood. You heard the faint howling of wolves when the Crow Mother escaped.", stepTextKey="I decided to destroy the Daedra Lord called Crow Mother. She fled into a tower. I should follow after her."},
		["Talk to Telbaril 3"] =
			{appendText=", who returned to the southern isle to continue stabilizing the portal used to enter Crow's Wood.", stepTextKey="Crow Mother has been banished, and Rulantaril is free. I should return to Telbaril and tell him the good news."},
		["Kill Rulantaril"] =
			{appendText=" for betraying the Crow Mother and breaking her heart. He was whisked away from the central tower and taken to another one of the Crow Mother's hidden nests."},
		["Kill Crow Mother 2"] =
			{appendText=" for being the spawn of a Daedric entity and preying on the greed of mortals. You spotted her feathered figure on the southern path from her central tower, down the staircases and towards the southern shores of Crow's Wood.", stepTextKey="Both Rulantaril and the Daedra Lord called Crow Mother are reprehensible beings. I decided to put an end to both of them."},
		["Talk to Telbaril 4"] =
			{appendText=", who returned to the southern isle to continue stabilizing the portal used to enter Crow's Wood.", stepTextKey="Rulantaril is dead, and Crow Mother has been banished. I should tell Telbaril."},
	},

    [GetQuestName(3583)] = { --"Suspicious Silence"--mouch30
        ["Collect General Serien's Orders"] =
            {appendText="\nThe camp lies to the northwest of the fort, where Covenant troops rest, train, and plan their attacks. The documents must be scattered around the tents in the camp."},
        ["Return to Captain Hjolm"] =
            {appendText=", at the northern entrance of the fort."},
        ["Talk to Sergeant Eila"] =
            {appendText=" at the entrance of Fort Arand. A bright scar cuts her pale face in half, but doesn't detract from her gentle expression."},
        ["Talk to Captain Llaari"] =
            {appendText=", housed in the largest building of the fort's courtyard."},
    },

	[GetQuestName(3590)] = { --"Through the Aftermath"--mouch30
		["Talk to Furon Rii 1"] =
			{appendText=", a Dark Elf mage, at the northern camp of the Starved Plains.", stepTextKey="Furon Rii and Reesa disagree on what to do with the army haunting Starved Plain. Sergeant Rhorlak asked me to start by talking to Furon Rii, to hear his plan."},
		["Use the Pendant on a Weakened Spirit"] =
			{appendText=".  A black miasma boils inside the clear stone, indicating a dark form of magic."},
		["Talk to Furon Rii 2"] =
			{appendText=" back at the northern camp of the Starved Plain. The dead Chimer shuffles dutifully behind you.", stepTextKey="I've bound one of the dead soldiers. I need to lead the soldier's spirit to Furon Rii."},
		["Talk to Reesa 1"] =
			{appendText=" at the northern camp of the Starved Plain. She wears a worried look on her face, disturbed by the success of the binding spell.", stepTextKey="I've tried the plan proposed by the Rii brothers. An Argonian named Reesa tried to get my attention as I finished talking to Furon. I should see what she has to say."},
		["Use the Talisman on a Weakened Spirit"] =
			{appendText=". It is a carefully crafted charm, adorned with colorful plumage and blessed with light magic."},
		["Talk to Reesa 2"] =
			{appendText=" at the northern camp of the Starved Plain. The ghost soldier dissipated, but not before thanking you.", stepTextKey="I need to tell Reesa that the Argonian Talisman was able to release the spirit."},
		["Talk to Sergeant Rhorlak"] =
			{appendText=" at the northern camp of the Starved Plain. A decision needs to be made - either the spirits are enslaved to protect Davon's Watch, or released from their eternal suffering."},
		["Choose Furon Rii's Plan"] =
			{appendText=""},
		["Choose Reesa's Plan"] =
			{appendText=""},
		["Talk to Reesa 3"] =
			{appendText=" at the northern camp of the Starved Plain. It's time to give these spirits the peace they deserve.", stepTextKey="I've decided to help the spectral army move on to Aetherius. I must speak to Reesa about my next step."},
		["Collect General Radrathren's Relic"] =
			{appendText=" - a thick and heavy pendant inlaid with black stones - from a burial mound in the northeast field of the Starved Plain."},
		["Collect Captain Andrana's Relic"] =
			{appendText=" - a tiny silver blade with a richly engraved hilt - from a burial mound in the center of the battlefield."},
		["Collect Captain Rysari's Relic"] =
			{appendText=" - an ivory trinket on a thin, silver chain - from a burial mound in the eastern part of the Starved Plain."},
		["Complete the Ritual 1"] =
			{appendText=" by joining Reesa at the ruins located in the center of the Starved Plain.", stepTextKey="I'm to meet Reesa at the Daedric ruins. We must perform a ritual and confront the spirit of General Radrathren."},
		["Talk to Reesa 4"] =
			{appendText=" on the platform of the Daedric ruins in the center of the Starved Plain. When General Radrathren was defeated, he disappeared in a flash of golden light, and the restless spirits around the field have ceased their fighting.", stepTextKey="I need to talk to Reesa and see if our attempt worked."},
		["Talk to Giron Rii"] =
			{appendText=" at the northern camp of the Starved Plain. With all these invading forces and incoming foes, an undead army is the perfect solution."},
		["Collect General Radrathren's Skull"] =
			{appendText=" from a burial mound in the northeast field of the Starved Plain."},
		["Collect Captain Andrana's Skull"] =
			{appendText=" from a burial mound in the center of the battlefield."},
		["Collect Captain Rysari's Skull"] =
			{appendText=" from a burial mound in the eastern part of the Starved Plain."},
		["Complete the Ritual 2"] =
			{appendText=" by joining Furon Rii at the ruins located in the center of the Starved Plain.", stepTextKey="I must meet Furon Rii at the Daedric tower. We'll perform a ritual there and confront the spirit of General Radrathren."},
		["Talk to Furon Rii 3"] =
			{appendText=" on the platform of the Daedric ruins in the center of the Starved Plain. When General Radrathren was defeated, a pillar of red and black magic thrust into the sky, sending shockwaves throughout the air. The spirits all around have stopped fighting, now waiting for their next command.", stepTextKey="We performed the ritual and confronted the spirit of General Radrathren. I should speak to Furon Rii once again."},
	},

[GetQuestName(3591)] = { --"The Venom of Ahknara"--mouch30
        ["Get Blinding Light Flasks"] =
            {appendText=" - these tall, slender bottles contain concentrated candlelight spells that create a bright flash, unraveling any stealth magic around."},
        ["Find and Kill Assassins"] =
            {appendText=""},
        ["Investigate the Eastern Tower"] =
            {appendText=" in Fort Arand's courtyard."},
        ["Talk to Strikes-from-Shadows 1"] =
            {appendText=", the Argonian spy employed by Captain Llaari.", stepTextKey="I've found some dead troops inside the tower on the fort's eastern side. There was a fight between Pact and Covenant forces. Strikes-from-Shadows might have used the trapdoor in the room to escape. I should climb down and look for him."},
        ["Activate Second Plate"] =
            {appendText=" in the first chamber of the Fort Arand dungeons."},
        ["Activate Third Plate"] =
            {appendText=" in the second chamber of the Fort Arand dungeons."},
        ["Activate Fourth Plate"] =
            {appendText=" at the far end of the Fort Arand dungeon's third and largest chamber."},
        ["Talk to Strikes-from-Shadows 2"] =
            {appendText=". You can spot him peeking through the darkness at the top of the stairs of the Fort Arand dungeon's main chamber.", stepTextKey="I've activated the plates. I should report to Strikes-from-Shadows and tell him."},
        ["Kill Ahknara"] =
            {appendText=", the infamous Redguard spymaster. It's time to end her reign of terror. She should be on the other side of the Fort Arand dungeon's southern exit."},
        ["Use the Trapdoor"] =
            {appendText=" underneath a large fungi-covered tree on the bluff overlooking Fort Arand."},
        ["Talk to Captain Llaari"] =
            {appendText=" on the main floor of Fort Arand's headquarters."},
    },


    [GetQuestName(3595)] = { --"Wayward Son"--mouch30
        ["Find the Cave Entrance"] =
            {appendText=", marked by a broken halo of stone."},
        ["Enter the Cave"] =
            {appendText=" to the south of the Starved Plain, delving deeper into the tunnel."},
        ["Steal Cultist Tome"] =
            {appendText=", resting on the western altar of the chamber of the cave, south of the Starved Plain."},
        ["Talk to Furon Rii"] =
            {appendText=", waiting at a Pact camp just outside the cave, on the road to the south of the Starved Plain."},
    },

[GetQuestName(1294)] = { --"The Wizard's Tome"--mouch30
        ["Talk to Dithis Romori"] =
            {appendText=", who might have an idea on where Denthis could be."},
        ["Find the Spellbook 1"] =
            {appendText=" stolen by Denthis. He could still be near the guild hall, trying to read the book.", stepTextKey="I should look around Davon's Watch for an apprentice named Denthis. I've been told I could ask his brother, Dithis Romori, for more information. He's at a tavern southeast of the library."},
        ["Find the Spellbook 2"] =
            {appendText=" in the courtyard next to the Mage's Guild, right behind the Uveran Bank.", stepTextKey="Dithis Romori told me his brother took the book east into a small courtyard to read."},
        ["Close the Book 1"] =
            {appendText=" by using the right incantation, in the Mages Guild courtyard. Dithis must have given you the correct passphrase.", stepTextKey="I've found the unfortunate apprentice. He's tripped the ward on the spellbook. To break the spell, I should chant \"Arkay's Beard.\""},
        ["Talk to Denthis Romori"] =
            {appendText=" in the Mages Guild courtyard. He looks relatively unharmed."},
        ["Close the Book 2"] =
            {appendText=" by using the correct incantation, in the Mages Guild courtyard. Now, which spell was the right one?", stepTextKey="I've found the unfortunate apprentice. He's tripped the ward on the spellbook. To break the spell, I should chant one of two incantations: \"Arkay's Beard\" or \"Eyes of Akatosh.\""},
        ["Collect the Spellbook"] =
            {appendText=" from the Mages Guild courtyard. Luckily, the chicken didn't damage it during the transformation."},
        ["Return to the Wizard"] =
            {appendText=" on the bottom floor of the Mages Guild tower."},
        ["Talk to Valdam Andoren"] =
            {appendText=" on the bottom floor of the Mages Guild tower."},
    },

    [GetQuestName(3662)] = { --"A Bit of Sport"--mouch30
        ["Defeat a Wagon Escort"] =
            {appendText=". Clad in heavy armor and shields, they protect the supply wagons."},
        ["Defeat a Log Roller"] =
            {appendText=". They show off their muscular arms with sleeveless jerkins."},
        ["Defeat a Wood Sawyer"] =
            {appendText=". Their clothes are stained with sawdust and sweat, but years of splinters have toughened up their skin."},
        ["Talk to Hraelgar Stonecrush 1"] =
            {appendText=" back at the main camp, right outside the southern entrance to Ebonheart.", stepTextKey="I pummeled several Nords. I should return to Hraelgar Stonecrush to see if he's suitably impressed."},
        ["Talk to Hraelgar Stonecrush 2"] =
            {appendText=" back at the main camp, right outside the southern entrance to Ebonheart.", stepTextKey="Hraelgar Stonecrush still has more to say."},
    },

    [GetQuestName(3622)] = { --"The Brothers Will Rise"--mouch30
        ["Collect Nedic Hearts"] =
            {appendText=" from the savage Nedes battling with the Chimer soldiers around the ruins."},
        ["Collect Ornskar's Heart"] =
            {appendText=". The warchief watches the battle from the southwest platform in the ruins. Dark streaks of soot and sweat mark her cheeks."},
        ["Talk to Sorcerer Turoni"] =
            {appendText=", who has gathered with the two commanders on the platform to prepare for the rite."},
        ["Collect the Essence of Wrath"] =
            {appendText=" from the flame atronach on the northern platform."},
        ["Collect the Essence of Fire"] =
            {appendText=" from the flame atronach on the southern platform."},
        ["Talk to Legate Sadal"] =
            {appendText=", younger of the brothers. He waits on the central platform of the ruins. While his brother appears calm and at peace with their fate, Sadal doesn't seem as confident with the plan."},
        ["Talk to General Balreth"] =
            {appendText=". The older brother waits on the central platform of the ruins. He stands tall and proud, mouth set in a serious grimace, but you can see his hands tremble ever so slightly."},
        ["Place the Spirits in the Ritual Brazier"] =
            {appendText=" on the central platform of the ruins. The essences crackle and fizz in your hands as you get ready to toss them into the flaming brazier."},
        ["Talk to Sorcerer Vunal"] =
            {appendText=" right outside the shrine's entrance."},
    },


    [GetQuestName(3581)] = { --"Cleansing the Past"--mouch30
        ["Anoint Remains"] =
            {appendText="\nThe skeletal remains mark the resting places of the brave Dunmer troops."},
        ["Talk to Priestess Brela"] =
            {appendText=" at the tents on the eastern shore."},
    },

[GetQuestName(3642)] = { --"The Curse of Heimlyn Keep"--mouch30
        ["Collect Tainted Hearts from the Corpses"] =
            {appendText="\nDead bodies are littered around the keep grounds, being picked at by nix-hounds."},
        ["Collect Spectral Essences from the Ghosts"] =
            {appendText="\nCursed spirits are holding rituals around Heimlyn, working under the influence of a strange magic."},
        ["Talk to Merarii Telvanni 1"] =
            {appendText=", stationed on a large platform, adorned with a brass statue of the Daedric Prince, Hircine.", stepTextKey="I've collected the ingredients needed by the Telvanni. I need to deliver them to Merarii Telvanni in the southern part of the keep."},
        ["Form Etheric Totem in the Daedric Urn"] =
            {appendText=" placed on a stone on the southern platform of the keep, underneath the Hircine statue."},
        ["Talk to Merarii Telvanni 2"] =
            {appendText=" on the southern platform of the keep.", stepTextKey="I've created the Etheric Totem. I should speak to Merarii Telvanni and learn what she wants me to do with it."},
        ["Talk to Adras Furari"] =
            {appendText=", a grieving father with a broken spirit."},
        ["Talk to Ramalii Malena"] =
            {appendText=", a terrified scholar."},
        ["Talk to Neron Arona"] =
            {appendText=", a wealthy merchant with no one left to care for."},
        ["Talk to Hadrill Diina"] =
            {appendText=", a noble who longs for her wife's embrace."},
        ["Find the Covenant Soldier"] =
            {appendText=" hiding in the western tower. She may be an enemy of the Pact, but no one deserves to suffer at the hands of malevolent spirits."},
        ["Talk to Merarii Telvanni 3"] =
            {appendText=" at the southern platform of the keep. The residents and the Dagger have made it to safety, but more needs to be done to save the keep.", stepTextKey="I should speak to Merarii Telvanni once more."},
    },

    [GetQuestName(3917)] = { --"Enlightenment Needs Salt"--mouch30
        ["Obtain Grub Grass"] =
            {appendText=", a thick-stemmed, spongy herb that makes its home at the base of the Greymist Falls."},
        ["Talk to Nojaxia 1"] =
            {appendText=" back at her home on the eastern side of Lukiul Uxith.", stepTextKey="I must return to Nojaxia with the reagents I've collected."},
        ["Give Elixir to Not-So-Quick"] =
            {appendText=", who lies low in the southern district of Lukiul Uxith. If he's being subjected to foul-smelling experiments like this on the daily, he has the right idea to hide from his boss."},
        ["Talk to Nojaxia 2"] =
            {appendText=" back at her home in the eastern part of Lukiul Uxith. Through an impressive display of logic from her assistant, the experiment was able to be carried out.", stepTextKey="Not-So-Quick became ill after drinking Nojaxia's potion. I should return to Nojaxia and report the effects of her elixir."},
        ["Drink Elixir in Lukiul Uxith's Center"] =
            {appendText=", a hub for the townsfolk to gather and chat with one another. The potion you received looks like water, but moves like honey and leaves a shiny film on the glass as you twirl it around."},
        ["Talk to Nojaxia 3"] =
            {appendText=", who waits for your results in her home, in the eastern part of Lukiul Uxith.", stepTextKey="I drank the elixir. Now must return to Nojaxia, so I can tell her what I saw."},
    },


    [GetQuestName(3751)] = { --"Hunting Invaders"--mouch30
        ["Talk to Seven-Bellies 1"] =
            {appendText=", the staff-wielding leader of the tribe. He stands in the center of the village, in order to give advice and aid to anyone who stops by.", stepTextKey="I've been instructed to speak to the Elder of Lukiul Uxith, Seven-Bellies. He'll know more about the Covenant's activities in the area."},
        ["Find Pash-Riha"] =
            {appendText=", who is stalking the enemies near the pools outside of town. The area is rife with furious nix-hounds and Covenant troops."},
        ["Talk to Pash-Riha"] =
            {appendText=", standing over a myriad of dead bodies, just north of the Greymist falls outside of town."},
        ["Talk to Meejapa"] =
            {appendText=", a brave but foolish warrior who traversed the eastern hills and ravine to find glory. The easiest way to not get lost in the ashy plains is to take the northeast exit from the village center."},
        ["Kill Borolg"] =
            {appendText=", a thick-necked beast of an Orc and his personal storm mage Sorme. They have set up camp in the midst of a Daedric ruin, at the end of the eastern path from Lukiul Uxith."},
        ["Talk to Seven-Bellies 2"] =
            {appendText=" back at the center of the village.", stepTextKey="I've slain Borolg. I must return to Lukiul Uxith to speak to Seven-Bellies."},
    },

    [GetQuestName(3627)] = { --"Kinsman's Revenge"--mouch30
        ["Find Bjorick"] =
            {appendText=". The tiny cocoons that dot the fields of Hrogar's Hold don't seem very comfortable to be held hostage in."},
        ["Search for Gar in the Goblin Cave"] =
            {appendText=". The entrance lies next to a waterfall, to the east of Hrogar's Hold."},
        ["Talk to Gar Deeper in the Cave"] =
            {appendText=" next to the waterfall to the east of Hrogar's Hold."},
        ["Kill Shadowsilk Warlord"] =
            {appendText=". Clutches of spider eggs are nestled in papery husks - stomping on them should draw out the Warlord and his Spider Queen."},
        ["Talk to Hrogar"] =
            {appendText=". He should be pleased to know that his sons and lands are safe and sound."},
    },

    [GetQuestName(3667)] = { --"Night of the Soul"--mouch30
        ["Seek Almalexia's Blessing"] =
            {appendText=". The Lady of Mercy has her shrine to the east of Ebonheart, bearing the brunt of the falling ash from the nearby volcano."},
        ["Seek Sotha Sil's Blessing"] =
            {appendText=". The Clockwork God's shrine rests at the northern tip of the Argonian quarters, the rushing waters replicating the sound of turning gears."},
        ["Seek Vivec's Blessing"] =
            {appendText=". The Warrior Poet's shrine can be found at the western entrance of the city, on the idyllic Inner Sea coastline."},
        ["Talk to Disciple Sildras 1"] =
            {appendText=" at the Tribunal Temple, the tall spire in the western part of the city.", stepTextKey="As I was warned, all three shrines were troubled by ravenous alits. However, that had nothing to do with disapproval by the Tribunal. They were drawn by piles of offal left near each shrine. I should return to Disciple Sildras with this news."},
        ["Talk to Disciple Sildras 2"] =
            {appendText=" at the Tribunal Temple, the tall spire in the western part of the city.", stepTextKey="I've told Disciple Sildras about the messages the Tribunal gave me. He found that encouraging."},
    },


    [GetQuestName(3621)] = { --"Peril at the Pools"--mouch30
        ["Rescue Dedras Othrys"] =
            {appendText=". Screeching shalks roam around the mines - the best place to hide from them are between the densely packed rocks."},
        ["Rescue Mevis Othrys"] =
            {appendText=". The foul-smelling pools are dangerous to step in but there's a bunch of scaffolding to climb."},
        ["Enter the Cave"] =
            {appendText=" on the northwest outskirts of the Sulfur Pools."},
        ["Talk to Drathyra Othrys 1"] =
            {appendText=", a young Dunmer girl. She kneels over an older woman's writhing body, in a cave on the northwest outskirts of the Sulfur Pools.", stepTextKey="I think I've found the right cave, but I heard the sounds of a struggle as I approached. I should seek out Saalu and Drathyra as soon as possible."},
        ["Collect the Herbal Antidote"] =
            {appendText=" by any means neccesary."},
        ["Talk to Drathyra Othrys 2"] =
            {appendText=", waiting for you in the cave on the northwest outskirts of the Sulfur Pools.", stepTextKey="I recovered the antidote. I must bring it back to the cave before Saalu's poison spreads too far."},
        ["Talk to Garvas Othrys"] =
            {appendText=", the patriarch of the pools. He's been guarding the Othrys family home and other buildings on the northern road of the Sulfur Pools."},
    },


    [GetQuestName(3626)] = { --"Protecting the Hall"--mouch30
        ["Talk to Hrogar 1"] =
            {appendText=" at his manor - the massive structure looms over the entire field.", stepTextKey="A field worker at Hrogar's Hold said I should speak to his master, Hrogar, if I wanted to help in the fight against the Goblins."},
        ["Talk to Gar"] =
            {appendText=", who leads the search for Hrogar's youngest son."},
        ["Kill Goblins and Spiders"] =
            {appendText=" \nThe nasty creatures have invaded the fields, destroying crops and harming the workers."},
        ["Talk to Fafnyr 1"] =
            {appendText=", the Nord that accompanied Gar, east of the main house in Hrogar's Hold.", stepTextKey="I need to find and speak to Fafnyr."},
        ["Talk to Hrogar 2"] =
            {appendText=" and warn of the incoming Goblin attack.", stepTextKey="I should speak with Hrogar at his house in Hrogar's Hold."},
        ["Defend the Hall"] =
            {appendText=" alongside Hrogar and his companions. The Goblins have infiltrated the hold through the cellar."},
        ["Find Gar"] =
            {appendText=", who is still looking for his brother in the fields."},
        ["Talk to Fafnyr 2"] =
            {appendText=" outside the main house on Hrogar's Hold.", stepTextKey="When I came back outside, I found that Fafnyr and the other guards had been attacked. I don't see Gar anywhere. I should talk to Fafnyr and discover what's happened."},
    },



    [GetQuestName(3631)] = { --"Recovering the Guar"--mouch30
        ["Send Guar Home"] =
            {appendText="\nDead guar bodies are dotted around the fields, either floating in the toxic waters or being picked at by the shalks. Luckily, their harnesses are sturdy and should be good enough to take."},
        ["Talk to Jin-Ei"] =
            {appendText=" at the stables on the northern road of the Sulfur Pools."},
    },

[GetQuestName(3639)] = { --"Restoring Order"--mouch30
        ["Convince the Argonians"] =
            {appendText=" by speaking to their leader, Zasha-Ja. It seems that someone has been trying to kill their Hist Tree."},
        ["Convince the Nords"] =
            {appendText=" that the Dark Elves are capable fighters. Hraelgar Stonecrush, the Nord commander, needs to know that the rest of the Pact is worth helping."},
        ["Convince the Dark Elves"] =
            {appendText=" that the Tribunal has not abandoned their people, and there is still hope for the upcoming battles."},
        ["Talk to Drathus Othral 1"] =
            {appendText=" at the Hlaalu House, the town hall near the center of the city.", stepTextKey="I persuaded the races in Ebonheart to work together and defend the town. It seems each had some contact with a manipulative Dark Elf named Rhavil Urano. Drathus Othral will certainly want to hear about his activities."},
        ["Go to Rhavil's House"] =
            {appendText=", which should be in the western part of the city."},
        ["Follow Rhavil Urano From a Distance"] =
            {appendText=" in order to find out where he's headed."},
        ["Wait for Rhavil to Leave"] =
            {appendText=" the house on the western docks in the Argonian quarter of Ebonheart."},
        ["Investigate the Shack"] =
            {appendText=" on the western docks in the Argonian quarter of Ebonheart."},
        ["Search Rhavil Urano's House"] =
            {appendText=". He has been a thorn in the Pact's side for way too long, and more proof is needed of him being a Covenant spy."},
        ["Talk to Drathus Othral 2"] =
            {appendText=", right outside of Rhavil's house in the southwest quarter of Ebonheart.", stepTextKey="Rhavil Urano, the architect of the racial strife in Ebonheart, has been killed. Drathus Othral will want to know his town is now free of Covenant agents."},
    },

    [GetQuestName(3645)] = { --"The Sapling"--mouch30
        ["Collect Mudcrab Meat"] =
            {appendText=""},
        ["Collect Ashreeds"] =
            {appendText=""},
        ["Talk to Zasha-Ja 1"] =
            {appendText=", who is following you. She seems agitated and upset.", stepTextKey="When I finished collecting ashreeds and crab meat, Zasha-Ja ran up to me. I should ask what she wants."},
        ["Fertilize the Hist Sapling"] =
            {appendText=". Hopefully, the tree will recover from the recent attacks."},
        ["Talk to Zasha-Ja 2"] =
            {appendText=". The captured Dark Elf is also waiting at her home, directly south of the Hist Tree.", stepTextKey="I've fertilized the Hist sapling as best I can. Zasha-Ja asked me to meet her back at her lodge."},
        ["Talk to Biiril"] =
            {appendText=" in Zasha-Ja's house, directly south of Ebonheart's Hist Tree. The Dark Elf can barely stand up straight, and he won't stop licking his dry, cracked lips."},
        ["Talk to Zasha-Ja 3"] =
            {appendText=" at her house, directly south of Ebonheart's Hist Tree.", stepTextKey="Biiril was half-crazed from imbibing Hist sap, but he clearly identified a Dunmer named Rhavil. He was the one who told him about the mind-altering qualities of tree sap. Zasha-Ja appeared angry at this revelation."},
    },

    [GetQuestName(3865)] = { --"Savages of Stonefalls"--mouch30
        ["Collect Varnag's Head"] =
            {appendText=". This feral little critter can be found to the southeast of Ebonheart, feasting on the local guars."},
        ["Collect Bleiger's Tentacle"] =
            {appendText=". The massive Bull netch floats along the coastline of the Inner Sea, west of Ebonheart. Locals say they can hear the mournful song of this monster from across the waters."},
        ["Collect Gurlisk's Head"] =
            {appendText=". This demonic beast lives on the hills east of Kragenmoor, overlooking the daedric ruins and streams of lava."},
        ["Talk to Shaali Kulun"] =
            {appendText=" back at the Ebonheart stables."},
    },

    [GetQuestName(3752)] = { --"A Storm Broken"--mouch30
        ["Find Pash-Riha Again"] =
            {appendText=", who has now moved on to the western plains, south of the Greymist Falls."},
        ["Kill the Covenant Lieutenant"] =
            {appendText=" at his base of operations to the south of the Greymist Falls."},
        ["Use Pash-Riha's Dagger on the Lieutenant's Corpse"] =
            {appendText=". Her knife is of expertly carved bone, with a serrated edge resembling the teeth of a vicious beast."},
        ["Talk to Pash-Riha"] =
            {appendText=" - she's taken her place by her brother's side in the village square."},
    },

    [GetQuestName(3863)] = { --"Taking the Tower"--mouch30
        ["Steal the Bottle of White-Gold Tower"] =
            {appendText=" from Fedrasa Andrethi, the current innkeeper of The Ebony Flask. She guards the bottle with the discipline of a soldier."},
        ["Bring the White-Gold Tower to Naril Heleran"] =
            {appendText=" at the center of town."},
    },

    [GetQuestName(5038)] = { --"The Truth about Spiders"--mouch30
        ["Search the Hollow"] =
            {appendText=", a sour-smelling cave on the western coast of the Inner Sea."},
        ["Return to Hjagir"] =
            {appendText=" who should still be outside the Hollow's entrance; that is, if she hasn't wandered off."},
    },


	[GetQuestName(3643)] = { --"What Was Done Must Be Undone"--mouch30
		["Enter the Reliquary"] =
			{appendText=", a Daedric crypt looming over the keep from the south."},
		["Talk to the Reliquary Keeper"] =
			{appendText=". The Chimer spirit had protected the vault when he was alive, and is now called back to action with the recent disturbance. He stands guard in the reliquary in the southern edge of the keep."},
		["Defeat Adras Velae"] =
			{appendText=", whose soul is locked in a pulsating smoky orb in the southern chamber of the Heimlyn Keep Reliquary, in the southern grounds."},
		["Defeat Rendrasa Malena"] =
			{appendText=". Her anima is sealed in a swirling mass of dark tendrils in the northern chamber of the Heimlyn Keep Reliquary, in the southern grounds."},
		["Talk to Keeper Vildras 1"] =
			{appendText=" in the western chamber of the Heimlyn Keep Reliquary, in the southern grounds. The other guardians have gathered at a large iron brazier.", stepTextKey="Keeper Vildras and the mages who created the curse are in position. I need to speak with Keeper Vildras."},
		["Use the Portal to the Relic Chamber"] =
			{appendText=" in the western hall of the Heimlyn Keep Reliquary, in the southern grounds."},
		["Confront the Power Behind the Curse"] =
			{appendText=". The other mages stand by your side, waiting for you to kickstart the battle at the hidden vault, in the western chamber of the Heimlyn Keep Reliquary, in the southern grounds."},
		["Talk to Keeper Vildras 2"] =
			{appendText=" by taking the portal back to the main chamber of the Heimlyn Keep Reliquary, in the southern grounds. Vildras waits for you at the top of the stairs.", stepTextKey="I've defeated the power fueling the spellplague. I should return and speak to Keeper Vildras."},
		["Exit Reliquary"] =
			{appendText=" through the main door."},
		["Talk to Beron Telvanni"] =
			{appendText=", waiting at the reliquary's entrance with his wife, Merarii. The air feels different with the curse lifted - there seems to be a calmer aura around the keep."},
	},


    [GetQuestName(3520)] = { --"Window on the Past"--mouch30
        ["Talk to General Balreth"] =
            {appendText=", who resides on the southern platform of the ruins."},
        ["Talk to Legate Sadal"] =
            {appendText=", who appeared on the northern platform of the ruins."},
        ["Collect Heartstone"] =
            {appendText="\nThese shards of obsidian emit plumes of smoke that can be spotted throughout the ruins."},
        ["Talk to Sorcerer Vunal"] =
            {appendText=" at his makeshift study at the bottom of the intimidating statues to the northeast."},
        ["Find the Shrine Entrance"] =
            {appendText=", enclosed in a cave near a gurgling stream."},
        ["Make an Offering at the Daedric Altar"] =
            {appendText=". The two commanders flank the altar, their ghostly bodies giving the shrine a gentle blue glow."},
        ["Talk to Sorcerer Nilae"] =
            {appendText=", who has appeared behind you. Her skin shimmers with a golden sheen - she must be a Chimer! The delicate features on her face contort with worry."},
    },

    [GetQuestName(5039)] = { --"Darkvale Brews"--mouch30
        ["Retrieve Caalorne's Potions"] =
            {appendText=", stored in heavy oaken casks.\nA trail of debris and empty bottles leads up to stony ruins, and the strong stench of cheese leaks through the door."},
        ["Return to Caalorne"] =
            {appendText=", waiting anxiously by his ruined cart on the road to the west of Sheogorath's Tongue."},
    },


    [GetQuestName(3794)] = { --"Divine Favor"--mouch30
        ["Pray to the Tribunal"] =
            {appendText=" in the Iliath Temple shrine. Thick plumes of incense dance in the air, and gentle chants can be heard from the monks below."},
        ["Collect Ash from Nerathren's Urn"] =
            {appendText=", a polished silver jar containing a fine powder."},
        ["Collect Ash from Faryon's Urn"] =
            {appendText=", a pearlescent vase holding pale dust."},
        ["Defeat Guard-Captain Nerathren"] =
            {appendText=" at the brazier to the northwest of the Iliath Temple shrine."},
        ["Defeat Guard-Captain Faryon"] =
            {appendText=" at the brazier to the southeast of the Iliath Temple shrine."},
        ["Talk to Curate Brethis"] =
            {appendText=" back at the Iliath Temple shrine, to the southwest side of the temple grounds."},
    },

    [GetQuestName(3886)] = { --"The Fetish"--mouch30
        ["Find Someone to Identify the Statue"] =
            {appendText=". It depicts a very buxom figure, stained with blood and sharp to the touch. The merchant crouches above Softloam Cavern, hiding from the wandering Covenant troops."},
        ["Observe Haldyn's Ritual"] =
            {appendText=" on the daedric platform, north of Kragenmoor. There's something very disturbing about Haldyn's excitement..."},
        ["Search Haldyn's Bag"] =
            {appendText=", which sits near the staircase on the daedric platform, north of Kragenmoor. At least Haldyn died with a smile on his face."},
    },

    [GetQuestName(3699)] = { --"From the Wastes"--mouch30
        ["Talk to the Wise Woman"] =
            {appendText=", the spiritual leader of the Kagesh tribe. The non-hostile members are gathered on the road north of the temple."},
        ["Collect Pouch of Aloe Extract"] =
            {appendText=". The cool aloe gel does wonders for scorched skin."},
        ["Collect Bag of Lavender Oil"] =
            {appendText=". A soothing scent emanates from the bag."},
        ["Collect Poppy Extract"] =
            {appendText=", a common flower used to ease aches and scrapes."},
        ["Collect Alchemical Draught"] =
            {appendText="\nThese viscous cordials can be used for a variety of ailments."},
        ["Enter Iliath Temple"] =
            {appendText=" by taking the paths uphill to the southwest entrance. A barricade keeps the monks and soldiers safe from the rogues."},
        ["Talk to Farseer Tirinaat"] =
            {appendText=", under the shade of the temple tower at the northeast platform of the temple."},
        ["Use Draughts on Dying Soldiers"] =
            {appendText="\nFirst aid tents have been set up around the temple grounds, where wounded soldiers wait for assistance."},
        ["Talk to Curate Brethis"] =
            {appendText=" at the Iliath Temple shrine, located at the very back of the grounds. With the soldiers recovering, it's time to tackle the rest of the problems at the temple."},
    },

    [GetQuestName(3697)] = { --"A Gathering of Guar"--mouch30
        ["Use the Prod on the Guar"] =
            {appendText="\nThe tantalizing smells of food from the local inns, and the safety of crowds must have attracted the guars."},
        ["Talk to Ral Savani"] =
            {appendText=" at his guar pen, located in the slave district of Kragenmoor."},
    },

    [GetQuestName(3854)] = { --"A Goblin's Affection"--mouch30
        ["Free Dithis Romori"] =
            {appendText=" from becoming a Goblin queen by sneaking him out of the nearby Goblin camp to the north of the Ashen wayshrine. The gem Valdam gave you should disguise you from the other Goblins, but spiders won't be affected by the illusion."},
        ["Talk to Valdam Andoren"] =
            {appendText=" and the Dunmer brothers back at the Ashen road wayshrine."},
    },

   [GetQuestName(1489)] = { --"Waylaid Wine Merchant"--mouch30
        ["Collect Balmora Blue Wine"] =
            {appendText="\nThis highly illegal but delicious concoction is made from Moon Sugar, giving it a distinct, sweet bouquet.  The goblins in the camp to the north could be very rich if they don't drink it all."},
        ["Talk to Geron Drothan"] =
            {appendText=", who continues drinking from a mysterious bottle, near his ruined cart on the Ashen road to the south of the the goblin camp."},
    },



	[GetQuestName(3647)] = { --"Shattering Mirror"--mouch30
		["Talk to Ra-Shadda"] =
			{appendText=", who was last seen hiding in one of the barns in the southern fields of the Sathram Plantation."},
		["Use Idol on Spirits and Kill Them"] =
			{appendText="\nThe spirits lurk around the abandoned buildings of Sathram Plantation, snarling and spitting at any living creature that walks by."},
		["Go to Ruvali's Home"] =
			{appendText=", to the north of the Sathram Plantation."},
		["Talk to Ruvali 1"] =
			{appendText=". She hasn't moved from her position upstairs.", stepTextKey="I didn't find Ra-shadda at Ruvali's home. Ruvali is kneeling over her husband's corpse. Perhaps she's spoken to Ra-shadda. I should find out."},
		["Talk to Ulov"] =
			{appendText=" Stormwall, waiting for you near the front door of Ruvali's home, in the Sathram Plantation."},
		["Use Altar"] =
			{appendText=", nestled between a grove of rocks, east of the pumpkin patch in the Sathram Plantation."},
		["Enter the Stables"] =
			{appendText=" near the northern entrance of the Sathram Plantation."},
		["Talk to Ruvali 2"] =
			{appendText=", glaring at the tied up Khajiit. She has him trapped in the stables near the northern entrance of the Sathram Plantation.", stepTextKey="Ra-shadda is bound, and Ruvali is questioning him, but I don't see Ulov. I should speak with her."},
		["Use Idol on Ulov"] =
			{appendText=", in the stables near the northern entrance of the Sathram Plantation."},
		["Kill Ulov Stormwall"] =
			{appendText="'s possessed clone, who fled through the door to the stable's courtyard, near the northern entrance of the Sathram Plantation."},
		["Talk to Ruvali 3"] =
			{appendText=", back in the stables near the northern entrance of the Sathram Plantation.", stepTextKey="Ulov is dead, and the dro-m'Athra destroyed. I must return to Ruvali and Ra-shadda."},
	},


    [GetQuestName(5037)] = { --"Stem the Tide"--mouch30
        ["Close the Portal"] =
            {appendText=" in order to halt the Daggerfall invasion. The entrance to the delve sits between lopsided rocks, in the shade of a towering mushroom."},
        ["Talk to Dathlyn"] =
            {appendText=", who waits for you near a pile of sharp rubble to the west."},
    },


    [GetQuestName(3648)] = { --"A Story Told in Footprints"--mouch30
        ["Follow the Rioters' Steps"] =
            {appendText=". It seems like the slaves were about to free themselves before the dark spirits massacred everyone on the Sathram Plantation."},
        ["Follow the Rioters' Plan"] =
            {appendText=". It would be a miracle to find survivors on the Sathram Plantation."},
        ["Find J'kur"] =
            {appendText=". The pumpkin patch is located in the eastern fields of the Sathram Plantation."},
        ["Deliver Letter to Vahara"] =
            {appendText=", who according to the map, should be on the northern road out of the Sathram Plantation. Let's hope this one is alive."},
        ["Talk to Vahara"] =
            {appendText=", a slender Khajiit waiting by the road to the north of the Sathram Plantation."},
    },


    [GetQuestName(3789)] = { --"This One's a Classic"--mouch30
        ["Find Clue to Opening Performance"] =
            {appendText=". There seems to be activity down every corridor - a lot of action for a place full of dead Elves."},
        ["Find Clue to Follow-Up Performance"] =
            {appendText=". The Vanguard seem to have woken up the ancient Dunmer buried here."},
        ["Find Clue to Closing Performance"] =
            {appendText=". The crypts are riddled with so many rooms. Why do the deceased need this much space?"},
        ["Give Laughs-at-All the Performance Notes"] =
            {appendText=" back at his 'stage' in front of the Grandmaster's palace, north of Kragenmoor."},
        ["Don't Tell Laughs-at-All about the Performance"] =
            {appendText=" - he isn't brave enough to find out the truth."},
        ["Talk to Laughs-at-All 1"] =
            {appendText=" at his 'stage' in front of the Grandmaster's palace, north of Kragenmoor.", stepTextKey="The Randoro brothers were clear on what would happen to Laughs-at-All if he performed their routine poorly. I've decided to keep it a secret and just throw away the notes. I should speak with Laughs-at-All one more time."},
        ["Talk to Laughs-at-All 2"] =
            {appendText=" at his 'stage' in front of the Grandmaster's palace, north of Kragenmoor. He's getting ready to give the performance of a lifetime.", stepTextKey="I took notes on the whole performance, and despite the Randoro brothers' warnings, I've decided to give the notes to Laughs-at-All. I should speak with him again."},
    },


    [GetQuestName(3806)] = { --"Undermined"--mouch30
        ["Talk to Farseer Tirinaat"] =
            {appendText=" on the main floor of the Iliath Temple shrine."},
        ["Talk to Ordinator Nethis"] =
            {appendText=", one of the Tribunal holy guards, behind the Iliath Temple shrine."},
        ["Collect a Pickaxe"] =
            {appendText=" from the temple grounds. Search around crates for the right tool."},
        ["Enter the Ashlander's Tunnel"] =
            {appendText=" behind the Iliath Temple shrine."},
        ["Weaken First Support"] =
            {appendText=" in the tunnels behind the Iliath Temple shrine. The following supports should be prominent against the rock walls."},
        ["Weaken Second Support"] =
            {appendText=""},
        ["Weaken Third Support"] =
            {appendText=""},
        ["Weaken Fourth Support"] =
            {appendText=""},
        ["Look for the Ashkhan"] =
            {appendText=" further into the tunnels. The final chamber seems devoid of any inhabitants."},
        ["Kill Ashkhan Ziddak Dunhaki"] =
            {appendText=", who refuses to listen to reason. The battle will take place in the final chamber of the tunnels behind the Iliath Temple shrine."},
        ["Weaken Last Support"] =
            {appendText=" right next to the tunnel's exit, behind the Iliath Temple shrine."},
        ["Talk to Hedranna Kaliki"] =
            {appendText=" at the exit of the Ashlander tunnel, behind the Iliath Temple shrine."},
    },


	[GetQuestName(3646)] = { --"An Unwanted Twin"--mouch30
		["Find Ulov"] =
			{appendText=" at the top of the hill of the Sathram Plantation. Smoke and ash drift through the sky and strange cat figures stalk the fields."},
		["Open the Trapdoor"] =
			{appendText=" underneath the stairs in the stable."},
		["Kill the Soldier's Double"] =
			{appendText=", lurking in the stable cellar. You see a dead body before you...and she's also standing in front of you."},
		["Chase the Creature 1"] =
			{appendText=" through the cellar door to the barn.", stepTextKey="After slaying the soldier's double, a gruesome shape rose from the corpse and fled into the stables. I should chase after it before it finds a new body."},
		["Talk to Ruvali 1"] =
			{appendText=", a gaunt faced Dunmer peering out of the barn's entrance.", stepTextKey="There's a woman standing in the entryway of the stables. I should speak to her. If she can't speak, I'll know the creature has found a new body."},
		["Collect the Idol from Ruvali's Bedroom"] =
			{appendText=". The once bustling plantation is now littered with bruised bodies."},
		["Return to Ruvali"] =
			{appendText=", who followed you to her house and now waits in the courtyard."},
		["Talk to Ruvali 2"] =
			{appendText=" and convince her that Tiril is most definitely not Tiril anymore. He's standing by the bridge....menacingly.", stepTextKey="Tiril's double is standing in the foyer of Ruvali's house. I must find and warn Ruvali."},
		["Use the Idol on Tiril's Double"] =
			{appendText=", who stares at you from the bridge in front of Ruvali's house."},
		["Follow Tiril"] =
			{appendText="'s wailing form as he runs into the Manothrel house."},
		["Kill Tiril's Double"] =
			{appendText=", who fled to the cellar of the Manothrel house."},
		["Chase the Creature 2"] =
			{appendText=" out of the cellar and back into the house.", stepTextKey="The creature fled again. I must chase it before it copies Ruvali."},
		["Talk to Ulov"] =
			{appendText=". He won't stop grunting, but maybe that's just a Nord thing."},
		["Talk to Ruvali 3"] =
			{appendText=" on the second floor of her home. If she doesn't answer you when you talk, you'll have to kill another Manothrel member.", stepTextKey="I must find Ruvali and see if the creature has copied her."},
	},



    [GetQuestName(3788)] = { --"Vengeance for House Dres"--mouch30
        ["Kill Captain Dunveril"] =
            {appendText=", resting by the campfire in the center of the ruins."},
        ["Talk to Grandmaster Omin Dres"] =
            {appendText=" back at his chambers in the Grandmaster's palace."},
    },


--  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- 
--  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- 
--  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- 
--  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- 
--  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- --  Deshann -- 

[GetQuestName(4894)] = { --"A Letter for Deshaan"--Rosque
        ["Find Dandrii Dran"] =
            {appendText=" in Deshaan. To reach it, head south along the road to the west of Tormented Spire and continue until the ash starts to fade away in favor of trees and mushrooms. Gorvyn said that Serk, where his cousin lived, was unable to be missed heading south, so it's likely simply on the road in that direction."},
        ["Talk to Dandrii Dran"] =
            {appendText=" on the road just north of Quarantine Serk. Gorvyn requested she be told that he made it to Stonefalls and that he's alright."},
    },



[GetQuestName(5057)] = { --"Bad Medicine"--Rosque
        ["Talk to Serk Townsfolk"] =
            {appendText=". With the Maulborn's quarantine in effect, most of the townsfolk are sheltering inside their homes to reduce the spread of the Llodos plague."},
        ["Talk to Aerona 1"] =
            {appendText=" in Serk.", stepTextKey="We've talked to a few townsfolk and witnessed the effects of the Llodos plague firsthand, but we're no closer to finding Dethisam. Aerona is growing increasingly anxious about her brother. I should talk to her."},
        ["Find the Old Graveyard Key"] =
            {appendText=" for the graveyard west of Serk. Aerona may have some idea where it might be located, and where to use it. Hopefully the Maulborn will have left it lying around somewhere."},
        ["Enter the Maulborn Quarantine"] =
            {appendText=". The back gate is located at the southern end of the graveyard west of Serk, but the Maulborn may have set up their equipment deeper in the catacombs."},
        ["Investigate the Maulborn Quarantine"] =
            {appendText=" in the Quarantine Serk Catacombs within its western graveyard to find Dethisam. For an alchemical project of this scale, there must be written documentation somewhere, which Aerona would likely be interested in learning about."},
        ["Talk to Aerona 2"] =
            {appendText=" inside the Quarantine Serk Catacombs in the graveyard.", stepTextKey="I decided to let Dethisam Berendas go through with his plan. I need to convince Aerona to let him go and get to safety."},
        ["Enter the Plague Production Chamber"] =
            {appendText=" deep within the Quarantine Serk Catacombs within its graveyard."},
        ["Destroy Maulborn Research"] =
            {appendText=" deep within the Quarantine Serk Catacombs within its graveyard."},
        ["Destroy Plague Stockpiles"] =
            {appendText=" deep within the Quarantine Serk Catacombs within its graveyard."},
        ["Exit the Maulborn Quarantine"] =
            {appendText="."},
        ["Talk to Aerona 3"] =
            {appendText=" in Serk. If she got out intact, she may be checking on her uncle Ornis Verobar now that she knows the true nature of the curative.", stepTextKey="I need to find Aerona Berendas and make sure she made it out of the quarantine safely. I'll check to see if she's with her uncle."},
    },



[GetQuestName(5067)] = { --"Proprietary Formula"--Rosque
        ["Collect Maulborn Curative"] =
            {appendText="\nThe Maulborn have set up their treatment operations in The Serk Catacombs in the graveyard west of Quarantine Serk. There must be samples of their curative in there, likely in alchemical flasks."},
        ["Talk to Nilyne Hlor"] =
            {appendText=". She'll likely be waiting for the samples somewhere outside the graveyard west of Quarantine Serk."},
    },


[GetQuestName(5068)] = { --"Quest for the Cure"--Rosque
        ["Talk to Nilyne 1"] =
            {appendText=" inside Verobar House in Quarantine Serk.", stepTextKey="Aerona wants me to help the alchemist Nilyne. I should talk to her."},
        ["Collect Kyne's Heart Healing Herbs"] =
            {appendText=". Nilyne seems too busy to go into detail, but she may have left notes inside Verobar House in Quarantine Serk that could give an indication where to find them."},
        ["Collect Sour Milk Tea"] =
            {appendText=". Nilyne seems too busy to go into detail, but she may have left notes inside Verobar House in Quarantine Serk that could give an indication where to find some, hopefully ready-prepared."},
        ["Collect Dragon Scale Mushrooms"] =
            {appendText=". Nilyne seems too busy to go into detail, but she may have left notes inside Verobar House in Quarantine Serk that could give an indication where to find them."},
        ["Talk to Nilyne 2"] =
            {appendText=" inside Verobar House in Quarantine Serk.", stepTextKey="I gathered the ingredients Nilyne asked for, I should return to Ornis' house and deliver these to the alchemist."},
        ["Mix the Ingredients Together"] =
            {appendText=" inside Verobar House in Quarantine Serk."},
        ["Talk to Nilyne 3"] =
            {appendText=" inside Verobar House in Quarantine Serk.", stepTextKey="I mixed the ingredients together. I should bring the concoction to Nilyne."},
        ["Observe Nilyne's Treatment"] =
            {appendText=" inside Verobar House in Quarantine Serk."},
        ["Meet Aerona Outside"] =
            {appendText=" Verobar House in Quarantine Serk."},
        ["Talk to Aerona"] =
            {appendText=" outside Verobar House in Quarantine Serk."},
    },


[GetQuestName(3958)] = { --"The Llodos Plague"--Rosque
        ["Talk to Defender Verilu"] =
            {appendText=" in Narsis. To reach it, head south down the road from Quarantine Serk. The towering spires of Narsis can be seen across Lake Hlaalu. Defender Verilu may be waiting for news from Sergeant Nen near the Merchants' Stall."},
    },

[GetQuestName(3610)] = { --"For Their Own Protection"--Rosque
        ["Talk to a House Councilor"] =
            {appendText=". Citizens often gather around the Merchants' Stall and other prominent shops in Narsis. They may be able to provide directions to the kinhouse or have knowledge of the situation in town."},
        ["Investigate Disappearances"] =
            {appendText=" in Narsis. With little to go on, a thorough investigation of the city and its many inhabitants for at least three clues may be the only real option. It's possible that someone in areas of high foot traffic may have seen something that could supply a lead to follow up on, at least."},
        ["Talk to Councilor Ralden"] =
            {appendText=" in the Hlaalu Kinhouse in Narsis."},
    },

[GetQuestName(3659)] = { --"Unwanted Guests"--Rosque
        ["Talk to Giron Sadri"] =
            {appendText=" in Narsis."},
        ["Investigate the Maulborn Camp"] =
            {appendText=" in and around the lake."},
        ["Investigate the Waterfall"] =
            {appendText=" that flows into Narsis."},
        ["Talk to Naryu Virian"] =
            {appendText=" at the waterfall that flows into Narsis."},
        ["Return to the Kinhouse"] =
            {appendText=". Somebody needs to tell Councilor Ralden not to seal the city."},
        ["Talk to Varon Davel"] =
            {appendText=" in the Hlaalu Kinhouse in Narsis."},
    },


[GetQuestName(3652)] = { --"Fighting Back"--Rosque
        ["Find Slips-Through-Fingers"] =
            {appendText=" in Narsis. With the city sealed, the inhabitants have grown restless; they'll likely be wandering out and about rather than staying indoors."},
        ["Search the Dropped Pack"] =
            {appendText=" in front of the Hlaalu Kinhouse in Narsis."},
        ["Look for the Star"] =
            {appendText=" in Narsis. The Covert Note I picked up from Slips-Through-Fingers outside the Hlaalu Kinhouse may be able to shed light on what to do."},
        ["Follow Star to the Secret Meeting"] =
            {appendText=". Someone has trained her to wait at the kinhouse in Narsis."},
        ["Talk to Slips-Through-Fingers"] =
            {appendText=" inside Tedas House in Narsis."},
        ["Talk to Madras 1"] =
            {appendText=" inside Tedas House in Narsis.", stepTextKey="I've been asked to help Slips-Through-Fingers and her friends. They want to rescue the abducted villagers, but they aren't soldiers. They have no idea what they're in for."},
        ["Talk to Madras 2"] =
            {appendText=" inside Tedas House in Narsis.", stepTextKey="Madras doesn't trust me yet, but I've decided to help him. I should speak to him again to find out what our next move is."},
        ["Inform the Guard 1"] =
            {appendText=" in Narsis outside Tedas House of the unarmed militia's plans to keep them safe while I rescue their families.", stepTextKey="I've decided not to aid Madras. He's just going to get his people killed. I should tell one of the guards about this before Madras and his group do something foolish."},
        ["Inform the Guard 2"] =
            {appendText=" in Narsis outside Tedas House of the unarmed militia's plans to keep them safe while I rescue their families.", stepTextKey="I found a guard right outside. I explained what was going on. She doesn't want to see anyone get hurt, so she's devised a plan to disrupt the meeting."},
    }, 

[GetQuestName(3653)] = { --"Ratting Them Out"--Rosque
        ["Catch Rats"] =
            {appendText="\nSergeant Rila Lenith outside Tedas House may have something to catch them in."},
        ["Deliver Rats to the Door"] =
            {appendText=" of Tedas House in Narsis, ideally before they escape their bag."},
        ["Talk to Sergeant Rila Lenith"] =
            {appendText=" outside Tedas House in Narsis."},
        ["Talk to Varon Davel"] =
            {appendText=" in the Hlaalu Kinhouse in Narsis."},
    },

[GetQuestName(3658)] = { --"A Timely Matter"--Rosque
        ["Talk to Seron Denelu"] =
            {appendText=" in Narsis."},
        ["Blow Whistle in Front of the Kinhouse"] =
            {appendText=" in Narsis."},
        ["Find the Armory Key"] =
            {appendText=" inside the Hlaalu Kinhouse in Narsis."},
        ["Gather Weapons"] =
            {appendText=" inside the Hlaalu Kinhouse in Narsis."},
        ["Report Your Failure to Seron Denelu"] =
            {appendText=" at the Blacksmith in Narsis."},
        ["Bring Weapons to Seron Denelu"] =
            {appendText=" at the Blacksmith in Narsis."},
        ["Talk to Varon Davel"] =
            {appendText=" in the Hlaalu Kinhouse in Narsis."},
    },

[GetQuestName(3660)] = { --"Hiding in Plain Sight"--Rosque
        ["Find Your Ally"] =
            {appendText=" outside the Hlaalu Kinhouse in Narsis."},
        ["Find the Ruins Entrance"] =
            {appendText=" beyond the western gates. The entrance should be a locked door that looks out of place against the rock."},
        ["Enter the Ruins"] =
            {appendText=" just west of the gates of Narsis."},
        ["Stop Giron Sadri"] =
            {appendText=" inside the ruins west of Narsis."},
        ["Find Survivors"] =
            {appendText=" inside the ruins west of Narsis."},
        ["Talk to Varon Davel 1"] =
            {appendText=" at the edge of the lake north of Narsis.", stepTextKey="Varon and the guards are waiting for me. I should speak to Varon."},
        ["Talk to Varon Davel 2"] =
            {appendText=" at the edge of the lake north of Narsis.", stepTextKey="I should tell Varon what I discovered."},
    },

[GetQuestName(3955)] = { --"Tracking the Plague"--Rosque
        ["Talk to Naryu Virian"] =
            {appendText=". She may be near one of the city gates if she's waiting for me or Varon to come talk to her."},
        ["Talk to Commander Renli at Obsidian Gorge"] =
            {appendText=". To reach it, take the northeastern road out of Narsis, and continue on the main road east. The imposing gate to the Obsidian Gorge is the large ruins of old Chimer architecture."},
    },

[GetQuestName(3673)] = { --"Death Trap"--Rosque
        ["Find the Hlaalu Scouting Party"] =
            {appendText=". It's unlikely that the scouting party would have taken the main path through Obsidian Gorge, but they may have taken a side route to get a look at the trader's camp merchants rely on as they pass through from Narsis to Mournhold."},
        ["Collect Mournhold Shipping Manifests"] =
            {appendText=""},
        ["Talk to Scout Mamyne"] =
            {appendText=" at the edge of the trader's camp in Obsidian Gorge."},
        ["Find the Cave Entrance"] =
            {appendText=". Mamyne said that it was at the north of Obsidian Gorge."},
        ["Find the Captured Scouting Party"] =
            {appendText=" inside the cave at the north edge of Obsidian Gorge."},
    },

[GetQuestName(3705)] = { --"Payback"--Rosque
        ["Destroy the Maulborn Wards"] =
            {appendText="\nThe wards are somewhere inside the northern Obsidian Gorge Cave."},
        ["Report Your Success of the Destroyed Wards"] =
            {appendText=" to the scout inside the northern Obsidian Gorge Cave."},
        ["Defend the Archers While They Destroy the Crates"] =
            {appendText=". Captain Diiril said that the tunnel east inside the northern Obsidian Gorge Cave will lead to the clifftop where the archers are stationed."},
        ["Talk to Naryu Virian"] =
            {appendText=" inside the northern Obsidian Gorge Cave."},
    },

[GetQuestName(3797)] = { --"Plague Bringer"--Rosque
        ["Find Captain Diiril"] =
            {appendText=". From the vantage point on the clifftop, it looked like there may have been a pathway up the southeast edge of Obsidian Gorge that led further south."},
        ["Talk to Diiril"] =
            {appendText=" on top of the platform on the southern edge of Obsidian Gorge."},
        ["Enter the Alchemist's Lair"] =
            {appendText=" up the path at the southern edge of Obsidian Gorge."},
        ["Search for Clues"] =
            {appendText=" inside The Apothecarium on the southern edge of Obsidian Gorge."},
        ["Kill Merdyndril"] =
            {appendText=" inside The Apothecarium on the southern edge of Obsidian Gorge."},
        ["Find a Hlaalu Officer"] =
            {appendText=" outside The Apothecarium at the southern edge of Obsidian Gorge."},
        ["Talk to Scout Mamyne"] =
            {appendText=" outside The Apothecarium at the southern edge of Obsidian Gorge."},
    },


[GetQuestName(3956)] = { --"Message to Mournhold"--Rosque
        ["Report to Ordinator Kilao in Mournhold"] =
            {appendText=". To reach it, head east through Obsidian Gorge, the large trade route that goes from Narsis to the capital city. The towering grand architecture of the Tribunal Temple can be seen for miles around. The Ordinators are a militant order, similar to the Fighters Guild. It's possible that someone there may be able to provide directions to Ordinator Kilao."},
    },


[GetQuestName(4453)] = { --"A Favor Returned"--Rosque
        ["Talk to Registrar Riivel"] =
            {appendText=". The Ordinator said to take the long stairs up to the central building in the city center, and that he would be waiting outside in the courtyard there."},
        ["Go to the Tribunal Temple"] =
            {appendText=". There is no mistaking it."},
        ["Talk to Naryu Virian 1"] =
            {appendText=" outside the Tribunal Temple.", stepTextKey="On my way to the Tribunal Temple, I ran into Naryu Virian. It appears that she wants to speak to me."},
        ["Enter the Tribunal Temple"] =
            {appendText=" and inform Almalexia about the Maulborn threat during the conversation."},
        ["Talk to Almalexia"] =
            {appendText=" inside the Tribunal Temple, and tell her about the Maulborn spotted in the city. Naryu asked that she not be mentioned."},
        ["Leave the Tribunal Temple"] =
            {appendText="."},
        ["Talk to Naryu Virian 2"] =
            {appendText=".", stepTextKey="Naryu Virian said to meet her at the Flaming Nix, a cornerclub on the east side of Mournhold. I should head over there now."},
        ["Poison the House Dres Wine"] =
            {appendText=" downstairs in The Flaming Nix cornerclub. Naryu suggested not to get too close to avoid spooking the courier."},
        ["Talk to Naryu Virian 3"] =
            {appendText=" in The Flaming Nix cornerclub.", stepTextKey="I slipped the sleeping poison into the wine meant for Courier Thauravil. I should let Naryu know it's been done."},
        ["Leave the Cornerclub"] =
            {appendText=" at the east edge of Mournhold."},
        ["Follow Courier Thauravil"] =
            {appendText="."},
        ["Talk to Naryu Virian 4"] =
            {appendText=" in The Flaming Nix cornerclub.", stepTextKey="I failed to follow Courier Thauravil. I should return to Naryu and see what she advises."},
        ["Obtain a House Dres Key"] =
            {appendText=" from Courier Thauravil's unconscious body behind the Fighters' Guild in Mournhold."},
        ["Go to the House Dres Farm"] =
            {appendText=". To the dismay of any Argonians in the capital city, it is within spitting distance south of Mournhold."},
        ["Investigate the Dres Farmhouses"] =
            {appendText=" in the House Dres Farmstead. Anything suspicious should be examined closely."},
        ["Talk to Naryu Virian 5"] =
            {appendText=" in the House Dres Farmstead farmhouse.", stepTextKey="I found a trap door hidden beneath a rug in one of the Dres farmhouses and Naryu just arrived. I should speak to her about what to do next."},
        ["Find the House Dres Wine"] =
            {appendText=" downstairs in The Flaming Nix cornerclub."},
        ["Talk to Naryu Virian 6"] =
            {appendText=" inside The Flaming Nix cornerclub.", stepTextKey="I grabbed a bottle of the House Dres wine. I should take the bottle to Naryu so we can get on with her plan."},
        ["Wait for Naryu's Signal"] =
            {appendText=" inside The Flaming Nix cornerclub."},
        ["Steal the House Dres Key"] =
            {appendText=" from Thauravil Dres' unconscious body upstairs in The Flaming Nix cornerclub."},
    },

[GetQuestName(4459)] = { --"The Mournhold Underground"--Rosque
        ["Enter the Trap Door"] =
            {appendText=" inside the westernmost farmhouse on the House Dres Farmstead."},
        ["Follow Naryu"] =
            {appendText=" beneath the westernmost farmhouse on the House Dres Farmstead."},
        ["Follow Naryu Into the Sewers"] =
            {appendText=""},
        ["Search for the Hidden Door"] =
            {appendText=" in the tunnels below the westernmost farmhouse on the House Dres Farmstead."},
        ["Open the Hidden Door"] =
            {appendText=" in the tunnels below the westernmost farmhouse on the House Dres Farmstead. Naryu might know more about this sealed door than she let on at first. In addition, there appears to be more verticality to the room than it initially appears."},
        ["Talk to Naryu"] =
            {appendText=" through the door and in the tunnels below the westernmost farmhouse on the House Dres Farmstead."},
        ["Find Whoever Activated the Wards"] =
            {appendText=" through the door and in the tunnels below the westernmost farmhouse on the House Dres Farmstead."},
        ["Defeat the Maulborn Assault"] =
            {appendText=" through the door and in the tunnels below the westernmost farmhouse on the House Dres Farmstead."},
        ["Go to the Mages Guild"] =
            {appendText=" in Mournhold. With how labyrinthine the sewers are, there must be a way out."},
        ["Talk to an Ordinator 1"] =
            {appendText=". Though there are many of the Tribunal's holy warriors scattered throughout Mournhold, there should always be some near the gates of the city.", stepTextKey="Farona said that a large number of Maulborn soldiers left the sewers before I got there. She gave Almalexia the same information. She also passed on a message. I'm to find an Ordinator to get additional instructions from the Sacred Lady."},
        ["Talk to an Ordinator 2"] =
            {appendText=". Though there are many of the Tribunal's holy warriors scattered throughout Mournhold, there should always be some near the gates of the city.", stepTextKey="I need to speak to an Ordinator."},
    },

[GetQuestName(3817)] = { --"The Seal of Three"--Rosque
        ["Talk to Almalexia 1"] =
            {appendText=" at the Tribunal Temple in Mournhold. The Ordinator did not reveal more of the situation, apparently on orders from Almalexia to avoid causing a panic in the city.", stepTextKey="An Ordinator informed me that Almalexia wants to see me at the Temple."},
        ["Enter the Tribunal Temple"] =
            {appendText=" in Mournhold."},
        ["Close the Daedric Portals"] =
            {appendText="\nThe Tribunal is composed of three living gods. If the Maulborn are attempting to subvert their power, they may have placed a portal inside the temple for each of them."},
        ["Pray at Almalexia's Altar"] =
            {appendText=" inside the Tribunal Temple in Mournhold. The cloisters are spread out at the far corners of the temple, one to each god, and should be decorated according to their domains: clockwork and mysteries, protection and healing, and poetry and entertainment."},
        ["Talk to Almalexia 2"] =
            {appendText=" at her cloister in the Tribunal Temple in Mournhold.", stepTextKey="I prayed at Almalexia's altar and now I should speak with her."},
        ["Pray at Vivec's Altar"] =
            {appendText=" in the Tribunal Temple in Mournhold, the one surrounded by incense and instruments."},
        ["Pray at Sotha Sil's Altar"] =
            {appendText=" in the Tribunal Temple in Mournhold, the one surrounded by books and clockwork."},
        ["Pass Sotha Sil's Trial"] =
            {appendText=" in the Tribunal Temple in Mournhold. Almalexia has appeared, and may be able to explain how to obtain the clockwork god's blessing."},
        ["Receive Sotha Sil's Blessing"] =
            {appendText=" inside the Tribunal Temple in Mournhold."},
        ["Find Vivec's Cloister"] =
            {appendText=" in the Tribunal Temple in Mournhold, the one surrounded by incense and instruments."},
        ["Pass Vivec's Trial"] =
            {appendText=" in the Tribunal Temple in Mournhold. Almalexia has appeared, and may be able to explain how to obtain the warrior-poet god's blessing."},
        ["Receive Vivec's Blessing"] =
            {appendText=" inside the Tribunal Temple in Mournhold."},
        ["Enter the High Chapel of the Three"] =
            {appendText=" inside the Tribunal Temple in Mournhold. There must be a doorway that leads into the innermost chamber of the temple."},
        ["Defeat Maulborn Priest Sathram"] =
            {appendText=" inside the Tribunal Temple in Mournhold, through the door into the innermost chamber of the temple. It looks like some kind of magical ward is protecting him from harm, made from relics of the Tribunal. It's possible there's a special order to deactivating them."},
        ["Exit the Tribunal Temple"] =
            {appendText=" and return to the entrance in Mournhold."},
        ["Talk to Almalexia 3"] =
            {appendText=" outside the Tribunal Temple in Mournhold.", stepTextKey="I defeated Vanus Sathram and saved the Tribunal Temple, but Vox escaped with the Judgment of Veloth. I should tell Almalexia what happened."},
       ["Find Sotha Sil's Cloister"] =
            {appendText=" in the Tribunal Temple in Mournhold, the one surrounded by books and clockwork."},
   },

[GetQuestName(3966)] = { --"Chasing the Magistrix"--Rosque
        ["Follow Vox to Selfora"] =
            {appendText=". To reach the village, head out of Mournhold's eastern gates and stay on the main road until Selfora's towering walls come into view on the left. There may be someone on the road who may have seen Magistrix Vox."},
    },


[GetQuestName(3820)] = { --"Restless Spirits"--Rosque
        ["Escort Elynisi to the Inn"] =
            {appendText=", the place she said the other survivors were regrouping at. She may be able to provide some direction as to where it is."},
        ["Listen to Elynisi and Meldras"] =
            {appendText=" inside the inn at the northeast corner of Selfora."},
        ["Talk to Elynisi"] =
            {appendText=" inside the inn at the northeast corner of Selfora."},
        ["Enter the Temple"] =
            {appendText=". Elynisi said that there were stairs to the south of the inn at the northeast edge of Selfora that would lead to a bridge that went to the temple on the hill."},
        ["Talk to the Forlorn One 1"] =
            {appendText=" inside Selfora's temple on the hill.", stepTextKey="A spirit called the Forlorn One has materialized at the temple's entrance. It appears to want to speak with me."},
        ["Find the Holy Water Decanter"] =
            {appendText=" inside Selfora's temple on the hill. The cursed spirit said that it was on the lower level of the temple, and may have the power to quench the flames engulfing the village."},
        ["Use the Holy Water on the Brazier"] =
            {appendText=" inside Selfora's temple on the hill. The cursed spirit said that it may have the power to quench the flames engulfing the village. He said to look for a brazier of unnatural flame in the lower level of the temple to test it on."},
        ["Talk to the Forlorn One 2"] =
            {appendText=" inside Selfora's temple on the hill.", stepTextKey="Now that I have the decanter of holy water, I should speak to the Forlorn One at the temple's entrance."},
        ["Observe the Vision of the Past"] =
            {appendText=" inside Selfora's temple on the hill."},
        ["Talk to the Forlorn One 3"] =
            {appendText=" inside Selfora's temple on the hill.", stepTextKey="The Forlorn One shared a vision of the past with me. I should ask him about it."},
    },

[GetQuestName(3852)] = { --"Rescue and Revenge"--Rosque
        ["Rescue the Man"] =
            {appendText="."},
        ["Rescue the Woman"] =
            {appendText="."},
        ["Talk to Elynisi Arthalen 1"] =
            {appendText=" in the inn at the northeast edge of Selfora.", stepTextKey="I rescued the young man and the woman, just as the spirit asked. I should return to the inn and make sure Elynisi is all right."},
        ["Enter the Town Hall"] =
            {appendText=", the cross-shaped building near the center of Selfora."},
        ["Find Tidyn Arthalen"] =
            {appendText=" inside the Town Hall, the cross-shaped building near the center of Selfora."},
        ["Talk to the Forlorn One"] =
            {appendText=" inside the Town Hall, the cross-shaped building near the center of Selfora."},
        ["Talk to Tidyn at the Crater"] =
            {appendText=" in Selfora. He theorizes that by containing the echo, Selfora can be saved."},
        ["Capture the Echo of Vox"] =
            {appendText=" in the crater in the center of Selfora by using the decanter."},
        ["Talk to Tidyn Arthalen"] =
            {appendText=" in the crater in the middle of Selfora."},
        ["Talk to Elynisi Arthalen 2"] =
            {appendText=" at the inn at the northeast edge of Selfora. Her father wanted to pass along a message that he loves her and wishes her to carry on.", stepTextKey="Selfora is safe now. I should return to the inn and tell Elynisi about her father."},
    },

[GetQuestName(3818)] = { --"A Saint Asunder"--Rosque
        ["Find the Vestige of Saint Veloth"] =
            {appendText=". To reach the Shrine of Saint Veloth, head out of Selfora and travel east along the road, keeping the Tal'Deic fortress on the left the entire time, until arriving at the large Chimer ruins."},
        ["Find the Reliquary Spire"] =
            {appendText=". It may have been tossed into an ash garden around the Shrine of Saint Veloth to be buried."},
        ["Find the Reliquary Pendant"] =
            {appendText=" around the Shrine of Saint Veloth. It may be useful to look around the shrine for hints of gleaming light that could be coming from a holy artifact like this."},
        ["Find Reliquary Stones"] =
            {appendText="\nThey look like square stone tablets carved with blue symbols. They may have been tossed into the ash gardens scattered around the Shrine of Saint Veloth to be buried."},
        ["Find Master Aron"] =
            {appendText=" at the top of the Shrine of Saint Veloth."},
        ["Locate Acolyte Hlen"] =
            {appendText=" at the crypts on the western edge of the Shrine of Saint Veloth."},
        ["Recover Saint Veloth's Skull"] =
            {appendText=" from the crypt on the western edge of the Shrine of Saint Veloth. Acolyte Hlen warned that the daedroth could breathe fire."},
        ["Talk to the Vestige of Saint Veloth"] =
            {appendText=" that appeared in the crypt on the western edge of the Shrine of Saint Veloth."},
        ["Restore the Reliquary"] =
            {appendText=" using the Veloth's skull at the top of the Shrine of Saint Veloth."},
        ["Talk to Saint Veloth 1"] =
            {appendText=" at the top of the Shrine of Saint Veloth.", stepTextKey="The reliquary is whole again. I can see that Saint Veloth's spirit has also recovered. I should speak to him."},
        ["Talk to Saint Veloth 2"] =
            {appendText=" at the top of the Shrine of Saint Veloth.", stepTextKey="I restored the Shrine of Saint Veloth and received his blessing. It's time to face Magistrix Vox at Eidolon's Hollow."},
    },


[GetQuestName(3819)] = { --"Healing Hearts"--Rosque
        ["Find Healer Dalen at Eidolon's Hollow"] =
            {appendText=". To reach it, head directly east from the base of the Shrine of Saint Veloth, and follow the road. Healer Dalen should be somewhere around the base preparing his healing potions for the Ordinators."},
        ["Talk to Healer Dalen at Eidolon's Hollow"] =
            {appendText=". To reach it, head directly east from the base of the Shrine of Saint Veloth, and follow the road. Healer Dalen should be somewhere around the base preparing his healing potions for the Ordinators."},
    },

[GetQuestName(3749)] = { --"Into the Mouth of Madness"--Rosque
        ["Sit by the Fire"] =
            {appendText=" at the camp east of Eidolon's Hollow Wayshrine."},
        ["Observe the Vision of Almalexia"] =
            {appendText=" at the camp east of Eidolon's Hollow Wayshrine."},
        ["Talk to Ordinator Muron"] =
            {appendText=" at the camp east of Eidolon's Hollow Wayshrine."},
        ["Destroy the Wards"] =
            {appendText="\nOrdinator Muron said that he saw three lights emanating from the tops of three ruins in Eidolon's Hollow, and suggested looking there for the wards. Almalexia said that one was bound to the living, one to the dead, and one to the daedric planes."},
        ["Find the Entrance to Vox's Lair"] =
            {appendText=". It looks like Eidolon's Hollow goes further towards the northeast into the mountains. There may be an entrance there."},
        ["Enter the Hollow Cave"] =
            {appendText=" at the northeastern edge of Eidolon's Hollow."},
        ["Talk to Aspera the Forgotten"] =
            {appendText=" inside The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
    },


[GetQuestName(3810)] = { --"Motive for Heresy"--Rosque
        ["Find the Western Anima Archive"] =
            {appendText=", somewhere in the western wing of The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Use the Anima Crystal and Witness Vox's Memory 1"] =
            {appendText=" in the western wing of The Hollow Cave at the northeastern edge of Eidolon's Hollow.", stepTextKey="I should attune myself to the anima crystal to observe Vox's earliest memory. Once within the memory, I should speak to Aspera's projection."},
        ["Find the Eastern Anima Archive"] =
            {appendText=", somewhere in the eastern wing of The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Use the Anima Crystal and Witness Vox's Memory 2"] =
            {appendText=" in the eastern wing of The Hollow Cave at the northeastern edge of Eidolon's Hollow.", stepTextKey="I should attune myself to the anima crystal to observe Vox's next memory. Once inside the memory, I should speak to Aspera's projection."},
        ["Find the Central Anima Archive"] =
            {appendText=", somewhere in The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Use the Anima Crystal and Witness Vox's Memory 3"] =
            {appendText=" in the center of The Hollow Cave at the northeastern edge of Eidolon's Hollow.", stepTextKey="I should attune myself to the anima crystal to observe Vox's final memory. Once within the memory, I should speak to Aspera's projection."},
        ["Talk to Aspera the Forgotten"] =
            {appendText=" in the center of The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
    },


[GetQuestName(3831)] = { --"The Judgment of Veloth"--Rosque
        ["Enter the Hollow"] =
            {appendText=" within The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Confront Vox"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow. If I decide to see this through, I will have to die from a blow of Judgement."},
        ["Talk to Meram Vox"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Free the Spirit of Ordinator Da'ravis"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow. It appears that there is a dias next to him that may hold his keeper."},
        ["Free the Spirit of Priest Malvari"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow. It appears that there is a dais next to her that may hold her keeper."},
        ["Convince Meram to Join You"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Enter the Reservoir of Souls"] =
            {appendText=" deep within The Hollow Cave at the northeastern edge of Eidolon's Hollow."},
        ["Release the Captured Souls"] =
            {appendText=" within the Well of Lost Souls. It seems like Vox is storing the souls she's taken in multiple soul wells inside of Judgement."},
        ["Defeat Vox"] =
            {appendText=" within the Well of Lost Souls."},
        ["Talk to Almalexia"] =
            {appendText=" within the Well of Lost Souls."},
    },

[GetQuestName(4163)] = { --"Onward to Shadowfen"--Rosque
        ["Find the Shadowfen Border"] =
            {appendText=". To reach it, go south from Mournhold and continue until running out of dry land."},
        ["Talk to Vicecanon Hrondar in Stormhold"] =
            {appendText=". To reach it, head due west from the top of the border of Shadowfen, past the bridges and towards the nearest sign of the Ayleid ruins the city was built on. The Fighters Guild sometimes serves double duty as a meeting place for guards; it's possible that Vicecanon Hrondar is heading up the investigation from there."},
    },


[GetQuestName(5103)] = { --"Mournhold Market Misery"--Rosque
        ["Talk to Gendyn Beleth"] =
            {appendText=" in Mournhold, the largest city in Deshaan. It's located in the center of the region, and all roads in that direction will intersect with it. The towering Tribunal Temple in the city can be seen from nearly halfway across Deshaan."},
    },









-- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- -- Side Quests Deshann -- 

  [GetQuestName(4151)] = { --"A Bitter Pill"--@ARKANOBOT
        ["Find Garil"] =
            {appendText=". Danus told me, He had to leave Garil behind somewhere in this Forgotten Crypt."},
        ["Kill Garil"] =
            {appendText="'s husk. I found him in the northern camber near the camp within Forgotten Crypts."},
        ["Read Garil's Journal"] =
            {appendText=". It should be somewhere in the room where I killed Garil's Husk. These Forgotten Crypts are unbecoming for the Refugees of the plague. Perhaps I can discover what happened to him..."},
        ["Confront Danus"] =
            {appendText=" in the Camp within Forgotten Crypts."},
        ["Find the Camp's Food Source"] =
            {appendText=" within the Forgotten Crypts."},
        ["Burn the Meat"] =
            {appendText=" in the Cold Storage next to the Camp within Forgotten Crypts."},
        ["Return to Danus"] =
            {appendText=" in the Camp within the Forgotten Crypts."},
        ["Find Sela"] =
            {appendText=". \n\nLook for her near the entrance of Forgotten Crypts. She couldn't have traveled far."},
        ["Talk to Sela"] =
            {appendText=" on the bridge near the entrance of the Forgotten Crypts."},
        ["Talk to Danus"] =
            {appendText=" in the Camp within the Forgotten Crypts."},
    },


   [GetQuestName(3611)] = { --"Burning Revenge"--@ARKANOBOT
        ["Torch Southern Supplies"] =
            {appendText=""},
        ["Torch Eastern Supplies"] =
            {appendText=""},
        ["Torch Western Supplies"] =
            {appendText="\n\nAfter following an off-beaten path south of Muth Gnaar, I found the Camp on a hill to the west. I think I am around the South West corner of Muth Gnaar Monastery"},
        ["Talk to Tennus Andalen"] =
            {appendText="\n\nI was told, Tennus is near the survivor camp on the road looking after his father’s corpse."},
    },

    [GetQuestName(3604)] = { --"Challenge the Tide"--@ARKANOBOT
        ["Burn the North Banner"] =
            {appendText=""},
        ["Burn the Central Banner"] =
            {appendText=""},
        ["Burn the South Banner"] =
            {appendText="\n\nI can see the banners on the Towers inside the fort in Malak's Maw."},
        ["Kill Gruznak the Impatient"] =
            {appendText="\n\nSvanhildr asked me to blow the Horn in front of the closed fort gate South West of Malak's Maw to summon Gruznak the impatient"},
        ["Talk to Svanhildr"] =
            {appendText=". I have asked her to send for reinforcements and stand by on the road north of Malak's Maw."},
    },

    [GetQuestName(4146)] = { --"A Family Divided"--@ARKANOBOT
        ["Help Sela Reach the Camp"] =
            {appendText=". Perhaps there is another way into the Camp somewhere in this Forgotten Crypts?"},
        ["Find a Way to Unlock the Camp Entrance"] =
            {appendText=" in the Forgotten Crypts. Maybe Sela knows something about this Locked door ?"},
        ["Enter the Camp"] =
            {appendText=" inside the Forgotten Crypts."},
        ["Talk to Sela 1"] =
            {appendText=" in the camp inside the Forgotten Crypts.", stepTextKey="Sela looks uneasy."},
        ["Discover Sela's Husband's Fate"] =
            {appendText=" by talking to the people in the camp within the Forgotten Crypts."},
        ["Talk to Sela 2"] =
            {appendText=" in the Camp within the Forgotten Crypts", stepTextKey="Danus, the leader of the refugees, claims Sela's husband contracted the plague and had to be abandoned in the crypts."},
        ["Tell Sela if the Camp is Safe"] =
            {appendText="\n\nShe is in the Camp within the Forgotten Crypts."},
        ["Speak to Sela 1"] =
            {appendText=" at the Camp within the Forgotten Crypts.", stepTextKey="I've decided it is not safe for Sela to stay in the camp."},
        ["Speak to Sela 2"] =
            {appendText=" in the Camp within the Forgotten Crypts.", stepTextKey="I've decided it's safe for Sela to stay in the camp."},
    },

 [GetQuestName(3703)] = { --"Honor Bound"--@ARKANOBOT
        ["Talk to Healer Senar"] =
            {appendText="\n\nI was told, Healer Senar can be found on a makeshift survivor camp on the road north of Muth Gnaar Monastery"},
        ["Find Dolril Belvayn"] =
            {appendText="\n\nHealer Senar tells me that Dolril Belvan is trying to help people who are still trapped in and around Muth Gnaar Monastery"},
        ["Rescue Afflicted Commoners and Monks"] =
            {appendText=""},
        ["Talk to Healer Hlaren"] =
            {appendText="\n\nHealer Hlaren looks like she had to run quite a distance to get to me... Whatever she has to say might be urgent."},
        ["Rescue Dolril Belvayn"] =
            {appendText=""},
        ["Find the Tear of Saint Veloth"] =
            {appendText=" in the central Monastery building"},
        ["Recover the Tear of Saint Veloth"] =
            {appendText=". It should be somewhere inside this Monastery building."},
        ["Talk to Dolril Belvayn 1"] =
            {appendText=". I have seen him in the basement of the Monastery", stepTextKey="I recovered the Tear of Saint Veloth. I should give it to Dolril Belvayn."},
        ["Kill Ashkhan Ginasa"] =
            {appendText=". Dolril Belvayn tells me that the camp should be on a hill South West of Muth Gnaar Monastery"},
        ["Talk to Dolril Belvayn 2"] =
            {appendText=". I should be able to find him in the makeshift survivor camp.", stepTextKey="I defeated Ashkhan Ginasa. Dolril Belvayn is north of Muth Gnaar. I should tell him what happened."},
    },

    [GetQuestName(3593)] = { --"Intruders in Deshaan"--@ARKANOBOT
        ["Read Orders"] =
            {appendText="\n\nI should look for Orcish order papers in and around the Orcish camp in Malak's Maw. Perhaps the orcs have set up some written posters around their camp relating to what they are doing here."},
        ["Retrieve the Contract"] =
            {appendText=". \n\nThe orders mentioned that the agreement was made by the Chieftain. I assume that the Chieftain would spend his time in the fortification on a hill in the South-West corner of Malak's Maw. Perhaps I can find more details regarding this contract there?"},
        ["Talk to Vartis Dareel"] =
            {appendText=". He should still be on guard on the road north of Malak's Maw."},
    },

    [GetQuestName(3608)] = { --"The Medallions of Saint Veloth"--@ARKANOBOT
        ["Collect Medallions from Husks"] =
            {appendText="\n\nI have seen plenty of Husks and Stalkers roaming in and around Muth Gnaar Monastery"},
        ["Talk to Healer Ravel"] =
            {appendText=" in a makeshift survivor camp on the road."},
    },

[GetQuestName(3612)] = { --"The Naked Nord"--chaos
        ["Talk to the Witch"] =
            {appendText=" north of the Obsidian Gorge wayshrine."},
        ["Find the Axe of Halmer Stormhand"] =
            {appendText=". If its not by the lake, maybe it's inside the cottage."},
        ["Locate Norgred's Missing Pants"] =
            {appendText=""},
        ["Return the Axe to Norgred Hardhelm"] =
            {appendText=", west of the Obsidian Gorge Wayshrine."},
        ["Return Norgred's Pants"] =
            {appendText=""},
    },

[GetQuestName(3796)] = { --"Nothing Left to Waste"--chaos
        ["Find Appraising-Spine's Key"] =
            {appendText=", northwest of the Obsidian Gorge, by the crossroad."},
        ["Find Valyia's Key"] =
            {appendText=", east of the Obsidian Gorge, close to the road."},
        ["Find Frahjan's Key"] =
            {appendText=", southeast of the Obsidian Gorge, by the road going to the old ruins of The Apothecarium."},
        ["Collect Appraising-Spine's Treasure"] =
            {appendText=""},
        ["Collect Valyia's Treasure"] =
            {appendText=""},
        ["Collect Frahjan's Treasure"] =
            {appendText=""},
        ["Talk to Kotholl 1"] =
            {appendText=" just outside the camp.", stepTextKey="I gathered the goods from the locked chests, but they turned out to be nothing more than trinkets. Valuable, but hardly dangerous.\n\nI should return to Kotholl and find out what's going on."},
        ["Talk to Kotholl 2"] =
            {appendText="", stepTextKey="Kotholl wanted to steal the goods to make up for lost pay so that he could feed his family. I told him to return the goods anyway."},
    },

    [GetQuestName(3600)] = { --"Oath Breaker"--@ARKANOBOT
        ["Talk to Svanhildr 1"] =
            {appendText=". She should be held somewhere in Malak's Maw.", stepTextKey="I need to find the Nord named Svanhildr."},
        ["Talk to Svanhildr 2"] =
            {appendText="", stepTextKey="I need to talk to Svanhildr and listen to her plan."},
        ["Collect Treated Kindlepitch"] =
            {appendText=""},
        ["Burn Northern Supply Shack"] =
            {appendText=""},
        ["Burn Eastern Supply Shack"] =
            {appendText=""},
        ["Burn Southern Supply Shack"] =
            {appendText=""},
        ["Talk to Svanhildr 3"] =
            {appendText=" by the large gate in the southern side of Malak's Maw.", stepTextKey="I set fire to the Orc supply shacks. I should find Svanhildr by the large gate and let her know."},
    },


    [GetQuestName(3605)] = { --"Ritual of Anguish"--@ARKANOBOT
        ["Collect Skulls from Cauldrons"] =
            {appendText=""},
        ["Kill Khralek gro-Vortag"] =
            {appendText=". The Dark elf spirits have pointed out that I should summon Him by placing the skulls on an altar on a hill in the South-Eastern corner of Malak's Maw."},
        ["Talk to Idrasa"] =
            {appendText=" near the altar on the South-Eastern corner of Malak's Maw."},
    },

[GetQuestName(4494)] = { --"You Have to Break a Few"--chaos
        ["Read the Note"] =
            {appendText=""},
        ["Find the Bag of Kwama Eggs"] =
            {appendText=" on the other side of the mine."},
        ["Exit Lady Llarel's Shelter"] =
            {appendText=""},
        ["Talk to Mamma Aralosi"] =
            {appendText="."},
    },

[GetQuestName(3893)] = { --"By Invitation Only" --chaos
 	["Return to Mourhold"] =
            {appendText=". There is a spirit at the harbor that can help you."},
        ["Acquire a Shad Astula Invitation"] =
            {appendText=""},
        ["Talk to The Boatmaster"] =
            {appendText=""},
        ["Talk to the Registrar"] =
            {appendText=", on the way to the Academy."},
        ["Find Arch-Mage Valeyn"] =
            {appendText=" his office is at the Academy's main tower."},
        ["Touch the Vision Orb"] =
            {appendText=" at the Arch-Mage's Office."},
        ["Repeat the Sequence of Lights"] =
            {appendText=""},
        ["Talk to Arch-Mage Valeyn"] =
            {appendText=" at his office."},
    },

    [GetQuestName(3657)] = { --"Carving Cuttle"--@ARKANOBOT
        ["Harvest Kwama Cuttle"] =
            {appendText="\n\nI think it is profitable to harvest any Kwama I kill in the Deepcrag Den for their cuttle."},
        ["Talk to Orona"] =
            {appendText=". She said she would wait for me at the entrance of Deepcrag Den."},
        ["Bring the Cuttle to Orona"] =
            {appendText=". She is waiting for me near the entrance of Deepcrag Den."},
    },

    [GetQuestName(3809)] = { --"Cultural Exchange"--@ARKANOBOT
        ["Trade for a Dunmer Book"] =
            {appendText=". Perhaps one of the trading stalls in the Docks of Shad Astula in the Northern region of Deshaan is willing to trade a Dunmer Book?"},
        ["Trade for Dunmer Clothing"] =
            {appendText=". Perhaps I can find a Armourer or Trader who is willing to barter in the Trade district of Mournhold?"},
        ["Trade for a Dunmer Relic"] =
            {appendText=". Perhaps one of the surviving healers at the makeshift camp on the road northwest of Muth Gnaar Monastery in the South-Western region of Deshaan has a relic to barter ?"},
        ["Talk to Rigurt the Brash"] =
            {appendText=". He is with the Nord Envoys near Mournhold City Center."},
    },


    [GetQuestName(3721)] = { --"Dissonant Commands"--@ARKANOBOT
        ["Collect Resonators"] =
            {appendText="\n\nBedyni has asked me to collect the Resonators from the Dwarven constructs in and around the Dwarven ruins of Mzithumz.\n"},
        ["Destroy Repair Stations"] =
            {appendText=" \n\nAccording to Bedyni, I can find the Dwarven Repair Stations inside the Dwarven ruins of Mzithumz."},
        ["Talk to Bedyni the Artificer"] =
            {appendText=""},
    },

    [GetQuestName(3864)] = { --"The Dungeon Delvers"--@ARKANOBOT
        ["Enter Bthanual"] =
            {appendText=""},
        ["Find Kireth Vanos 1"] =
            {appendText=" inside the Dwemer ruins of Bthanual.", stepTextKey="Kireth entered the ruins without her brother, who was injured trying to follow her. He invented a control rod to deal with the constructs inside. I need to take it to his sister."},
        ["Use Rod To Capture a Dwarven Spider"] =
            {appendText=""},
        ["Find Kireth Vanos 2"] =
            {appendText=" inside the Dwemer ruins of Bthanual.", stepTextKey="After a number of attempts, I finally got one of the Dwarven spiders to follow me around like some kind of pet. So that's what the control rod does! I should find Kireth Vanos in the next chamber and show her."},
        ["Use Rod on Defeated Spiders"] =
            {appendText=""},
        ["Find Kireth Vanos 3"] =
            {appendText=" in one of the bigger chambers inside the Dwemer ruins of Bthanual", stepTextKey="My spider collected the parts Kireth needs to repair the emitter. I should find Kireth and give the parts to her."},
    },

    [GetQuestName(3874)] = { --"The Light Fantastic"--@ARKANOBOT
        ["Adjust the Prisms"] =
            {appendText=""},
        ["Open the Huge Door"] =
            {appendText=" near the second large chamber in the Ruins of Bthanual."},
        ["Get Key from Greatspider"] =
            {appendText=" in the Small room near the second large chamber in the Ruins of Bthanual."},
        ["Open Dwarven Chest"] =
            {appendText=" in the Small room near the second large chamber in the Ruins of Bthanual."},
        ["Talk to Kireth Vanos"] =
            {appendText=" in the second large chamber in the Ruins of Bthanual."},
    },

    [GetQuestName(3661)] = { --"Mechanical Murder"--@ARKANOBOT
        ["Follow the Debris Path"] =
            {appendText=""},
        ["Talk to Lieutenant Silen"] =
            {appendText=" on the bridge near Mzithumz, North-West of Mournhold."},
        ["Talk to the Dres Captive"] =
            {appendText=" held in the broken tower near Mzithumz, North of Mournhold."},
        ["Kill Dres Raiders"] =
            {appendText=""},
        ["Talk to Defender Maera 1"] =
            {appendText=" at the main entrance to the Ruins of Mzithumz", stepTextKey="I stopped the Dres raiders and should speak to Defender Maera at the main entrance to the ruins."},
        ["Enter Mzithumz and Find Ithis Omalor"] =
            {appendText=""},
        ["Talk to Ithis Omalor"] =
            {appendText=""},
        ["Lead Ithis Omalor from Mzithumz"] =
            {appendText=""},
        ["Talk to Guard Maera"] =
            {appendText=" at the main entrance of Mzithumz."},
        ["Talk to Defender Maera 2"] =
            {appendText=" at the main entrance of Mzithumz.", stepTextKey="I interrogated Ithis Omalor and learned that Magistrix Vox sent him to attack the Hlaalu caravan. I refused to grant him leniency for his crimes and sent him running to his death in the depths of Mzithumz."},
    },

[GetQuestName(3728)] = { --"Remembering Risa"--chaos
        ["Search Giant Snakes for an Amulet"] =
            {appendText=" around the river, southwest of the Landing."},
        ["Give Amulet to Aneyda Uvaril"] =
            {appendText=". Go left after going in through the main gate, down to the tens."},
        ["Talk to Aneyda Uvaril"] =
            {appendText=""},
    },

[GetQuestName(3903)] = { --"School Daze"--chaos
        ["Assist Lena Dalvel"] =
            {appendText=". She's by the Instruction Hall, east of the Arch-Mage's Office."},
        ["Assist Tedras Relvi"] =
            {appendText=", by the eastern pond in the academy.\n\nThere is also a strange device besides him."},
        ["Assist Hadmar the Thin-Boned"] =
            {appendText=", west of the Arch-Mage's Office, close to the Dormitory.\n\nThere is also a strange totem made of skulls beside him."},
        ["Talk to Arch-Mage Valeyn"] =
            {appendText=". His office is at the central tower of the northmost building in the Academy."},
    },

 [GetQuestName(3656)] = { --"Search and Rescue"--@ARKANOBOT
        ["Find Plants for Edrasa"] =
            {appendText="\n\nEdresa says that Aloe and Redweed plants grow in the area around Deepcrag Den."},
        ["Deliver the Plants"] =
            {appendText=" to Edrasa in her Shack in Deepcrag Den."},
        ["Find Boril Drelas in Deepcrag Den"] =
            {appendText=""},
        ["Stop Fumes in Middle and Lower Chambers"] =
            {appendText=""},
        ["Give Potion to Miners"] =
            {appendText=""},
        ["Find Renvis"] =
            {appendText=". Edresa and Boril believe that Renvis is somewhere deep in the caves of Deepcrag Den."},
        ["Kill the Hive Guardian"] =
            {appendText="\n\nRenvis tells me that Poking the Kwama eggs should lure the Hive Guardian. I should prepare for a fight."},
        ["Talk to Renvis"] =
            {appendText=" in the entry chamber."},
        ["Confront Edrasa Drelas"] =
            {appendText=" in her shack near the entrance of Deepcrag Den."},
        ["Return the Amulet to Edrasa Drelas"] =
            {appendText=" in her Shack near the entrance of Deepcrag Den."},
        ["Give the Amulet to Boril Drelas"] =
            {appendText=". He should be around the Shack near the Entrance of Deepcrag Den."},
        ["Talk to Boril Drelas"] =
            {appendText=". He should be around the Shack near the Entrance of Deepcrag Den."},
    },

[GetQuestName(4495)] = { --"A Service for the Dead"--chaos
        ["Talk to Retainer Lladrelo"] =
            {appendText=". His tent is at the northern part of the fort, going right after entering Tal'Deic."},
    },

[GetQuestName(4455)] = { --"Trade Negotiations"--chaos
        ["Find the Hlaalu Trading Post"] =
            {appendText=" at the crossroads east of Mournhold."},
        ["Talk to Gulakhan Harrinat"] =
            {appendText=" inside the Ashlander camp, close to one of the giant mushrooms."},
        ["Talk to Iru-Ahan"] =
            {appendText=" at the southern entrance of the Vale's ashlander camp."},
        ["Look for the Ghosts"] =
            {appendText=" inside the Ashlander camp at the Vale."},
        ["Talk to the Farseer"] =
            {appendText=""},
        ["Listen to Raston's Account"] =
            {appendText=". He is being kept at the ashlander camp of Vale of the Ghost Snake."},
        ["Speak to Raston"] =
            {appendText=""},
    },

	[GetQuestName(3651)] = { --"The Trial of the Ghost Snake"--@ARKANOBOT
		["Gather Bog Rats"] =
			{appendText="\n\nFarseer says the Bog Rats roam the marshes around the Coiled Path, East of the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Place the Offering at the Fang Spires"] =
			{appendText=" altar at the end of the Coiled Path, South-East of Ashlander Encampment in the Vale of the Ghost Snake."},
		["Talk to the Ghost Snake"] =
			{appendText=" at the Fang Spires at the end of the Coiled Path, South-East of the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Defeat the Shadow Snake"] =
			{appendText=" at the Shadow Snake Shrine. Perhaps the Ghost Snake is pointing towards the Shrine?"},
		["Seek the Ghost Snake's Advice"] =
			{appendText=" at the Fang Spires at the end of the Coiled Path, South-East of the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Talk to the Farseer"] =
			{appendText=" at the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Retrieve the Snake Totem"] =
			{appendText=" in the Farseer's Chest from the Farseer's tent in the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Give Snake Totem to the Farseer"] =
			{appendText=" at the Ashlander's Encampment in the Vale of the Ghost Snake."},
		["Tell Bodani Your Decision"] =
			{appendText=". The Farseer is in the Ashlander Encampment in the Vale of the Ghost Snake."},
		["Give the Totem to Raston"] =
			{appendText=""},
		["Burn the Snake Totem"] =
			{appendText=" at the Campfire"},
		["Suggest Something Else"] =
			{appendText=" to the Farseer Bodani\n\nYour action will impact the future of the Mabrigash in the Ashlander Encampment and the Vale of the Ghost Snake."},
		["Talk to Bodani 1"] =
			{appendText=" at the Ashlander Encampment in the Vale of the Ghost Snake.", stepTextKey="I decided to present Tevynni's suggestion to the Farseer. She'll trade with the Vale and Raston will go free."},
		["Talk to Bodani 2"] =
			{appendText=" at the Ashlander Encampment in the Vale of the Ghost Snake.", stepTextKey="I decided that the Mabrigash will remain isolated. The merchant will serve Ghost Snake."},
		["Talk to Raston"] =
			{appendText=" at the Ashlander Encampment in the Vale of the Ghost Snake."},
	},

[GetQuestName(3787)] = { --"Vengeance of the Oppressed"--chaos
        ["Find Betina Volek"] =
            {appendText=" at the Flaming Nix Deluxe Garret."},
        ["Meet Betina at Her Family Home 1"] =
            {appendText=", northwest of the Flaming Nix Deluxe Garret. Her and Thonja the Quiet are waiting for you there.", stepTextKey="I informed Betina of the Argonians' plan to ambush her. I'll meet her in front of her family home, northwest of the inn."},
        ["Enter the Volek Home 1"] =
            {appendText="", stepTextKey="Now that Betina knows about the plan to ambush her, I should escort her into her family home and help fend off the Argonians."},
        ["Defeat the Argonians"] =
            {appendText=""},
        ["Talk to Betina Volek Outside"] =
            {appendText=" her house, northwest of the Flaming Nix Deluxe Garret."},
        ["Meet Betina at Her Family Home 2"] =
            {appendText=", northwest of the Flaming Nix Deluxe Garret.", stepTextKey="I decided not to tell Betina about the ambush. She's going to meet me in front of her family home, northwest of the inn."},
        ["Enter the Volek Home 2"] =
            {appendText="", stepTextKey="Betina entered her home. I'll follow her inside and spring the ambush."},
        ["Defeat Betina Volek"] =
            {appendText=""},
        ["Talk to Sar-Keer"] =
            {appendText=", northwest of the Flaming Nix Deluxe Garret."},
    },

[GetQuestName(3908)] = { --"Vision Quest"--@ARKANOBOT
        ["Enter the Library"] =
            {appendText=" Vault using the trapdoor in Arch-Mage's Office in Shad Astula."},
        ["Investigate the Library"] =
            {appendText=""},
        ["Talk to Lena Dalvel 1"] =
            {appendText="", stepTextKey="As I investigated the library vaults, someone ambushed me. I woke up in a locked cell with Tedras and Lena. \n\nI should speak to them and find out what happened."},
        ["Talk to Tedras Relvi 1"] =
            {appendText="", stepTextKey="As I investigated the library vaults, someone ambushed me. I woke up in a locked cell with Tedras and Lena. \n\nI should speak to them and find out what happened."},
        ["Examine the Gate"] =
            {appendText=""},
        ["Talk to Valeyn's Familiar"] =
            {appendText=""},
        ["Find Hadmar the Thin-Boned"] =
            {appendText=" . Perhaps the banekin has more information on where Hadmar is?\n\nHint : Escape the prison by entering the portal the banekin casted."},
        ["Find Lena's Lockbox"] =
            {appendText="on top of a large rock north of Shad Astula."},
        ["Talk to Lena Dalvel 2"] =
            {appendText=" on top of the large rock north of Shad Astula.", stepTextKey="When I found the lockbox and tried to open it, Lena appeared. I should speak to her."},
        ["Collect Illusion Dust"] =
            {appendText=""},
        ["Collect Scorched Scamp Hide"] =
            {appendText="\n\nThe Scamps and other Monsters have overtaken the Shad Astula Academy."},
        ["Go to Library Trap Door"] =
            {appendText=" in the Arch-Mage's office in Shad Astula."},
        ["Talk to Tedras Relvi 2"] =
            {appendText=" in the Arch-Mage's office in Shad Astula.", stepTextKey="I'm back at the library door and the Arch-Mage's familiar summoned Tedras to meet me. I should give Tedras the ingredients and tell him what we're planning."},
        ["Find the Maulborn General"] =
            {appendText=" by entering the trapdoor to Library Vaults in Arch-Mage's office in Shad Astula."},
        ["Defeat Maulborn General Darvasen"] =
            {appendText=" in the caves inside the Library Vaults in Shad Astula."},
        ["Destroy the Jagged Lens of Compulsion"] =
            {appendText=" in the Caves connected to Library Vaults in Shad Astula."},
        ["Return to the School"] =
            {appendText=""},
        ["Talk to Arch-Mage Valeyn"] =
            {appendText=". Perhaps Lana Dalvel in the Shad Astula Dormitory knows where the Arch-Mage is?"},
        ["Talk to Students at the Dock"] =
            {appendText=" of Shad Astula."},
    },

    [GetQuestName(3663)] = { --"That Which Matters Most"--@ARKANOBOT
        ["Recover Stolen Cargo"] =
            {appendText=" \n\nThe Caravan Master says that I can find the Stolen Cargo from the Hlaalu Cargo Crates around the ruins of Mzithumz.\n"},
        ["Recover the Cargo Manifest"] =
            {appendText="\nThe Caravan Master said that I can find the Elite who stole the Manifest in the Camp of House Dres to the North of Mzithumz."},
        ["Talk to Caravan Master Girano"] =
            {appendText=". He has asked me to find him at the Entrance of Mzithumz once I have the cargo."},
    },

    [GetQuestName(3684)] = { --"Bad Soldiers"--@ARKANOBOT
        ["Talk to Commander Taldyn 1"] =
            {appendText=" in the training yard of Tal'Deic Fortress.", stepTextKey="I need to speak to Commander Taldyn in the training yard to determine what to do about the Sentinels."},
        ["Challenge the Sentinels"] =
            {appendText="\n\nThere are plenty of Redoran Sentinents in Tal'Deic Fortress."},
        ["Talk to Commander Taldyn 2"] =
            {appendText=" in the training yard of Tal'Deic Fortress.", stepTextKey="I challenged members of the corrupt Redoran Sentinels and defeated them in combat. I should tell Commander Taldyn what happened."},
    },

    [GetQuestName(3880)] = { --"A Blow for Order"--@ARKANOBOT
        ["Kill Maulborn"] =
            {appendText=""},
        ["Kill Daedra"] =
            {appendText=""},
        ["Talk to Ordinator Gorili"] =
            {appendText=" outside the ruins of Eidolon's Hollow."},
        ["Talk to Ordinator Eron"] =
            {appendText=" near the Tribunal Temple in Mournhold."},
    },


[GetQuestName(3650)] = { --"Cold-Blooded Vengeance"--chaos
        ["Kill Captain Sa'dir"] =
            {appendText=" at the pirate ship, east of the Silent Mire."},
        ["Burn Khajiit Boats"] =
            {appendText=".\n\nThere are four east of the Silehnt Mire, and four close the the Mire's peninsula, north of the pirate ship."},
        ["Talk to Azeenus"] =
            {appendText=" near the Meditation Mound, north of Silent Mire."},
    },


[GetQuestName(4493)] = { --"A Fair Warning"--chaos
        ["Search for an Artifact"] =
            {appendText=" behind Drulshasa."},
        ["Talk to Aralyon the Scholar"] =
            {appendText=" west of Old Ida's Cottage."},
    },


[GetQuestName(3620)] = { --"The Ravaged Village"--chaos
        ["Talk to Vara-Zeen"] =
            {appendText=" at the main gate."},
        ["Talk to Leel-Vata 1"] =
            {appendText=". She's in a hut south of the main entrance.", stepTextKey="Vara-Zeen is concerned for his mate, Leel-Vata, as she did not escape before the Khajiiti pirates attacked. I must find her in the village."},
        ["Recover Sacred Stones"] =
            {appendText=" from the Renjira enemies."},
        ["Recover the Hist Branch"] =
            {appendText=" from a small wooden box."},
        ["Talk to Leel-Vata 2"] =
            {appendText=" by a giant tree.", stepTextKey="I recovered the sacred stones and the Hist branch. I should find Leel-Vata by the large rocks north of the village and return them to her."},
    },

    [GetQuestName(3666)] = { --"Rules and Regulations"--@ARKANOBOT
        ["Talk to General Gavryn Redoran"] =
            {appendText=" in Tal'Deic Fortress"},
        ["Find Ragna Stormcrag"] =
            {appendText=". She should be somewhere in the Keep of Tal'Deic Fortress."},
        ["Talk to Ragna Stormcrag 1"] =
            {appendText=" near the entrance in the Keep of Tal'Deic Fortress.", stepTextKey="Ragna Stormcrag doesn't look like a spy to me. I should talk to her."},
        ["Talk to Defender Furen"] =
            {appendText=" at the Lower level of the Keep in Tal'Deic Fortress."},
        ["Check the Nightstand"] =
            {appendText=""},
        ["Check the Wardrobe"] =
            {appendText=""},
        ["Check the Desk"] =
            {appendText="\n\nLook for anything suspicious in the Genera's Quarters in Keep of Tal'Deic Fortress."},
        ["Talk to Captain Valec Doronil"] =
            {appendText=". He should be in the Training yard of Tal'Deic Fortress."},
        ["Find the New Retainer"] =
            {appendText=" or whereabouts of the New Retainer in the Mess Tent of Tal'Deic Fortress."},
        ["Talk to Ragna Stormcrag 2"] =
            {appendText=" near the entrance in the Keep of Tal'Deic Fortress.", stepTextKey="I should tell Ragna about this new retainer and the meeting at the ruins by the river."},
    },

[GetQuestName(3624)] = { --"The Saving of Silent Mire"--chaos
        ["Find the Key to the Chains"] =
            {appendText=" north of Silent Mire."},
        ["Free Argonian Captives"] =
            {appendText=". They're being hold in groups of three.\n\nOne group is close to the main tent, north of Silent Mire.\n\nOne  is close to the pirate ship.\n\nOne is at the small peninsula north of the ship"},
        ["Talk to Seeks-the-Night"] =
            {appendText=""},
        ["Talk to Leel-Vata"] =
            {appendText=". The meditation Mound is next to the river north of the Silent Mire."},
        ["Mark Seeks-the-Night's Home"] =
            {appendText=" around the town square."},
        ["Kill Seeks-the-Night"] =
            {appendText=""},
        ["Talk to Vara-Zeen"] =
            {appendText=" at the Mire's west gate."},
    },


[GetQuestName(3702)] = { --"The Soldier's Alibi"--chaos
        ["Retrieve Daedric Tome"] =
            {appendText=" on the desk of a makeshift office inside the crypt."},
        ["Find the Cage Key"] =
            {appendText=" from enemies inside Tal'Deic's Crypt."},
        ["Talk to Saryvn"] =
            {appendText=""},
        ["Talk to Sergeant Maril 1"] =
            {appendText=" by a big tent, east of the cryot's entrance.", stepTextKey="Saryvn has been freed and I agreed to cover for him. I should speak to his superior, Sergeant Maril."},
        ["Talk to Sergeant Maril 2"] =
            {appendText=" by a big tent, east of the Crypt's entrance.", stepTextKey="Saryvn has been freed, but I refused to lie for him. I should speak to his superior, Sergeant Maril."},
    },

[GetQuestName(3715)] = { --"Strange Guard Beasts"--chaos
        ["Collect Wasp Gizzards"] =
            {appendText=" around Silent Mire."},
        ["Make the Concoction"] =
            {appendText=" at Churasi's hut at Silent Mire, at the southeastern part of town."},
        ["Splash Tree with the Concoction"] =
            {appendText=". The one right in front of Churasu's hut."},
        ["Talk to Churasu"] =
            {appendText=" at the Abandoned Mud Hut north of Silent Mire."},
    },

[GetQuestName(3904)] = { --"Supply Run"--chaos
        ["Collect Healing Supplies"] =
            {appendText=""},
        ["Talk to Aamela Rethandus"] =
            {appendText=""},
    },

    [GetQuestName(3683)] = { --"What Lies Beneath"--@ARKANOBOT
        ["Enter the Ruins"] =
            {appendText=", the entrance should be by the river surrounding the North-West region of Tal'Deic Fortress"},
        ["Find Durel Gilveni"] =
            {appendText=" in the Caves by the river surrounding the North-West region of Tal'Deic Fortress."},
        ["Find Proof of the General's Demise"] =
            {appendText=" in the Caves by the river surrounding the North-West region of Tal'Deic Fortress."},
        ["Defeat the Imposter"] =
            {appendText=" of the General residing within the Caves by the river surrounding the North-West region of Tal'Deic Fortress."},
        ["Talk to Captain Valec Doronil 1"] =
            {appendText=". He should be waiting for you inside the Keep of Tal'Deic Fortress.", stepTextKey="I have proof of the General's death. I should inform Captain Valec that he was slain by a Dremora imposter."},
        ["Talk to Captain Valec Doronil 2"] =
            {appendText=" inside the Keep of Tal'Deic Fortress.", stepTextKey="I informed Captain Valec about what I found in the ruins beneath Tal'Deic Fortress. I should see if he needs anything else from me."},
    },

-- Shadowfen ---- Shadowfen ---- Shadowfen ---- Shadowfen --
-- Shadowfen ---- Shadowfen ---- Shadowfen ---- Shadowfen --
-- Shadowfen ---- Shadowfen ---- Shadowfen ---- Shadowfen --
-- Shadowfen ---- Shadowfen ---- Shadowfen ---- Shadowfen --



-- Side Quests ---- Side Quests ---- Side Quests ---- Side Quests --
-- Side Quests ---- Side Quests ---- Side Quests ---- Side Quests --
-- Side Quests ---- Side Quests ---- Side Quests ---- Side Quests --

    [GetQuestName(3709)] = { --"The Bargain's End"--@ARKANOBOT 
        ["Follow Shaman Chirah's Advice"] =
            {appendText=""},
        ["Follow War Chief Helushk's Advice"] =
            {appendText=""},
        ["Enter the Odious Chapel"] =
            {appendText=" in the Western corner of the village."},
        ["Enter the Vile Terminus"] =
            {appendText=" deep inside the Odious Chapel in the western corner of Village."},
        ["Destroy the Soul Gem Array"] =
            {appendText=""},
        ["Preserve the Soul Gem Array"] =
            {appendText="\n\nFate of the Kothringi of Stillrise Village must be decided deep inside the Daedric Chapel west of the Village."},
        ["Return to Stillrise 1"] =
            {appendText=" Village.", stepTextKey="I destroyed the soul gem array, ending the villagers' bargain with Clavicus Vile. I should return to Stillrise Village and see what became of the villagers."},
        ["Talk to Chieftain Suhlak"] =
            {appendText=" near center of the village."},
        ["Return to Stillrise 2"] =
            {appendText=" Village.", stepTextKey="I preserved the soul gem array, ending the villagers' bargain with Clavicus Vile. I should return to Stillrise Village and see what became of the villagers."},
    },


  [GetQuestName(3982)] = { --"Bound to the Bog"--@ARKANOBOT 
        ["Talk to Gerent Saervild Steel-Wind at Bogmother"] =
            {appendText=" Crossroads, North-East of Mud Tree Village."},
    },


    [GetQuestName(3712)] = { --"Captive Souls"--@ARKANOBOT 
        ["Talk to Daeril"] =
            {appendText=". Sia said the necromancers took Daeril to the camp North-East of Stillrise Village."},
        ["Destroy Nerys' Animus Geode"] =
            {appendText=""},
        ["Destroy Liam's Animus Geode"] =
            {appendText=""},
        ["Destroy Wilhem's Animus Geode"] =
            {appendText=""},
        ["Destroy Gerren's Animus Geode"] =
            {appendText="\n\nAccording to Daeril, they appear to look like large Soul Gems."},
        ["Find Daeril Near Stillrise Village"] =
            {appendText=""},
    },

    [GetQuestName(4259)] = { --"Foreign Vintage"--@ARKANOBOT 
        ["Make the Aldmeri Spies Drink"] =
            {appendText="\n\nThey have infiltrated the celebration in Sanguin's Demesne."},
        ["Talk to Seducer Trilvath"] =
            {appendText=" near the entrance inside Sanguine's Demesne."},
    },


    [GetQuestName(3824)] = { --"A Last Reminder"--@ARKANOBOT 
        ["Take the Runestone to Eydvi Iron-Kettle in Mud Tree Village"] =
            {appendText=".\n\nThere are rumors of miners trapped in the Mud Tree Mines... Is she one of them? The mine foreman is bound to know more about their whereabouts."},
    },


    [GetQuestName(4237)] = { --"Life of the Party"--@ARKANOBOT 
        ["Find a Barkeep for the Bar"] =
            {appendText=""},
        ["Secure an Actor for the Stage"] =
            {appendText=""},
        ["Get a Musician for the Ballroom"] =
            {appendText=""},
        ["Get a Second Musician for the Ballroom"] =
            {appendText="\n\nSearch for the remains of the dead entertainers in Sanguine's Demesne."},
        ["Talk to Sings-with-Drink"] =
            {appendText=" in Sanguine's Demesne."},
    },

[GetQuestName(3840)] = { --"Saving the Relics"--@ARKANOBOT 
		["Talk to Gerent Saervild Steel-Wind"] =
			{appendText=" in his camp near the Crossroads to Bogmother, South-East of Stormhold."},
		["Collect Xaloc Relic"] =
			{appendText=""},
		["Collect Shol Relic"] =
			{appendText=""},
		["Collect Tsith Relic"] =
			{appendText=""},
		["Collect Umoj Relic"] =
			{appendText="\n\nSaervild claims the relics scattered around the ruins of Bogmother all the way towards the North-Western borders of daedric ruins of Ten-Maur-Wolk."},
		["Talk to Njorlund Steel-Wind 1"] =
			{appendText=" at Bogmother ruins.", stepTextKey="When I finished collecting the relics, Njorlund Steel-Wind showed up. I should tell him to return to the camp."},
		["Go to the Tree-Minders' Camp"] =
			{appendText=" by the Road, North of Bogmother ruins."},
		["Talk to Njorlund Steel-Wind 2"] =
			{appendText=" at the tree-minders camp by the road North of Bogmother ruins.", stepTextKey="The tree-minders aren't at their camp. I should tell Njorlund Steel-Wind about this."},
		["Find the Tree-Minders"] =
			{appendText=".\n\nNjorlund says that the Dreughs could have buried the tree-minders in the mud pile in the northern region of Bogmother towards the river and the eastern region of Bogmother."},
		["Return to Tree-Minder Raleetal's Camp"] =
			{appendText=""},
		["Talk to Tree-Minder Raleetal 1"] =
			{appendText="", stepTextKey="I got back to the camp too late and found Njorlund Steel-Wind was dead, and the relics taken. I should see if there is anything Tree-Minder Raleetal can do to help me return them."},
		["Collect the Dominion Troops' Scent"] =
			{appendText=" by collecting something from the Dominion camp, South of Bogmother ruins."},
		["Talk to Tree-Minder Raleetal 2"] =
			{appendText="near the reliquary near the central Bogmother ruins.", stepTextKey="I found a Dominion bedroll, still smelling like its owner. Tree-Minder Raleetal needs this to start her ritual at the reliquary within the ruins beside her camp."},
		["Place the Dominion Bedroll in the Reliquary"] =
			{appendText=" near the central Bogmother ruins."},
		["Witness the Ritual"] =
			{appendText=" performed by the Tree-Minder Raleetal at the central Bogmother ruins."},
		["Talk to Tree-Minder Raleetal 3"] =
			{appendText=" at the central Bogmother ruins.", stepTextKey="The dreugh seemed enthralled by the scent of the Dominion troops. I should talk to Tree-Minder Raleetal before I go in search of Gerent Saervild Steel-Wind."},
		["Kill Saervild"] =
			{appendText=""},
		["Take the Relics"] =
			{appendText="\n\nSaervild should be somewhere in Mudshallow Cave south of Camp Silken Snare, South of Bogmother ruins."},
		["Talk to Tree-Minder Raleetal 4"] =
			{appendText=" outside the Mudshallow cave, South of Camp Silken Snare.", stepTextKey="The Dominion spy using Saervild's form is dead. Now that I've collected the relics, I should take them back to Tree-Minder Raleetal."},
	},


    [GetQuestName(3822)] = { --"Schism"--@ARKANOBOT 
        ["Talk to Surii Dreth"] =
            {appendText=". She should be somewhere in Mud Tree Village."},
        ["Enter the Mud Tree Mine"] =
            {appendText=" South-West of Mud Tree Village."},
        ["Save Eydvi Iron-Kettle"] =
            {appendText=""},
        ["Save Lenam Sero"] =
            {appendText=""},
        ["Save Miharil"] =
            {appendText="\n\nThe Miners are trapped in the Mines of Mud Tree Village."},
        ["Recover Goblin Totem from the Gnaw-Root War Chief"] =
            {appendText=" in the Goblin camp above the Mines of Mud Tree Village."},
        ["Find the Source of a Cry for Help"] =
            {appendText=". A faint cry was from the cliffs North of Goblin camp, South of Mud Tree Village."},
        ["Goblins Subdued"] =
            {appendText="\n\nThe Goblins in the Goblin Camp above the Mines of the Mud Tree Village need to be subdued."},
        ["Take the Gnaw-Root Goblin Totem to Miharil's Hut Inside the Mine"] =
            {appendText=" near the Mud Tree Village"},
        ["Give the Gnaw-Root Goblin Totem to Thragnar the Breaker"] =
            {appendText=""},
        ["Give the Gnaw-Root Goblin Totem to Miharil"] =
            {appendText=""},
        ["Talk to Miharil's brothers in Mud Tree Village"] =
            {appendText=""},
        ["Talk to Surii Dreth in Mud Tree Village"] =
            {appendText=""},
    },

    [GetQuestName(4554)] = { --"Shadowfen Smorgasbord"--@ARKANOBOT 
        ["Talk to Veenaza 1"] =
            {appendText=", Angwe says he's hunting game east just outside the city limits of Mournhold.", stepTextKey="Angwe doesn't even know where to hunt alits, kagoutis, giant wasps or mudcrabs. She wants me to talk to the very person she made the bet with, Veenaza, and get him to tell me what I need to know. She's begged me not to tell him why."},
        ["Collect Wasp Eggs"] =
            {appendText=" in the northern region of Shadowfen."},
        ["Collect an Alit's Heart"] =
            {appendText=" from the Alit's roaming the southern region of Shadowfen."},
        ["Collect Kagouti Ribs"] =
            {appendText=" in the northwestern region of Shadowfen."},
        ["Collect Mudcrab Claw Meat"] =
            {appendText=" from the mudcrabs roaming the river banks in the northeastern region of Shadowfen."},
        ["Talk to Angwe"] =
            {appendText=""},
        ["Talk to Veenaza 2"] =
            {appendText="\n\nThey await you at Hissmir in the southwestern region of Shadowfen.", stepTextKey="I've collected all the cook's ingredients and I need to take them to Hissmir. But I also need to decide: Should I take them to her so she can win her bet, or should I give them to Veenaza and reveal his drunkard friend's plan to cheat him?"},
        ["Give the meat to Angwe"] =
            {appendText=" at Hissmir"},
        ["Give ingredients to Veenaza"] =
            {appendText=" at Hissmir"},
    },

	[GetQuestName(3685)] = { --"The Thin Ones"--@ARKANOBOT 
		["Talk to Chieftain Suhlak 1"] =
			{appendText="", stepTextKey="To find out why, I should speak to their leader, Chieftain Suhlak. Her hut is near the center of the village."},
		["Confront Gorag"] =
			{appendText=""},
		["Confront Felra"] =
			{appendText=""},
		["Confront Draguar"] =
			{appendText="\n\nSuhlak said that some of the huts have storage cellars."},
		["Talk to Chieftain Suhlak 2"] =
			{appendText=" in her hut in the center of the Village.", stepTextKey="None of the Worm Cult lieutenants would surrender. I should inform Chieftain Suhlak."},
		["Talk to Chieftain Suhlak 3"] =
			{appendText=" in her hut in the center of the Village.", stepTextKey="I learned a shocking secret. The people of Stillrise Village are living skeletons! Chieftain Suhlak asked me not to be alarmed. I should speak with her further."},
		["Talk to Shaman Chirah"] =
			{appendText=" in his hut near the center of the Village."},
		["Talk to War Chief Helushk"] =
			{appendText=" near the entrance of the daedric temple near the western corner of the Village."},
		["Enter the Odious Chapel"] =
			{appendText=" in the cave towards the western corner of the village."},
		["Offer the Vacant Daedric Soul Totem to Clavicus Vile"] =
			{appendText=" in the Chapel in the caves west of the village."},
		["Talk to Acolyte Morag in Stillrise Village"] =
			{appendText=". Morag should be near a hut in the northern corner of the village."},
		["Retrieve the Soul Gem Array"] =
			{appendText=" from the Worm Cult camp North-East of the village. Acolyte Morag said that she stuck one of her skeletal toes to the Soul Gem Array."},
		["Talk to Chieftain Suhlak 4"] =
			{appendText=" in her hut in the center of the village.", stepTextKey="I recovered the soul gem array. I should return it to Chieftain Suhlak."},
	},

    [GetQuestName(4390)] = { --"Unbridled Wealth"--@ARKANOBOT 
        ["Search Guar Pack Animals for Teegya's Ruby"] =
            {appendText="\n\nThe Pack Guars should be in the nearby Swamps."},
        ["Capture Wades-In-Muck"] =
            {appendText=" in the Swamps West of the Shadow Stone."},
        ["Search Crocodile Bellies for Teegya's Ruby"] =
            {appendText=". Perhaps one of the crocodiles in the swamp near the Shadow stone has swallowed it?"},
        ["Talk to Teegya"] =
            {appendText=" near the cross roads, South-East of the Shadow stone."},
    },

   [GetQuestName(3688)] = { --"Unwelcome Guests"--@ARKANOBOT 
        ["Convince Mercenaries to Leave"] =
            {appendText=""},
        ["Talk to Doubts-the-Moon"] =
            {appendText=" in his stall called 'Doubt Not These Prices' at Riverside Markets in Stormhold."},
        ["Talk to Hjotild"] =
            {appendText=" near 'Doubt Not These Prices' stall at Riverside Markets in Stormhold."},
    },


    [GetQuestName(3731)] = { --"Broken Apart"--@ARKANOBOT 
        ["Return to Valrendil's Camp"] =
            {appendText=" behind the xanmeer in the southern edge of Deep Graves."},
        ["Convince Valrendil of the Wispmother's Treachery"] =
            {appendText=". He is tricked into protecting the wispmother and stands guard at the entrance of the cave next to his camp behind the southern xanmeer in Deep Graves."},
        ["Seal the Wispmother's Remains in the Blessed Vessel 1"] =
            {appendText=". She hides in Valrendil's cave next to his camp behind the southern xanmeer in Deep Graves.", stepTextKey="I convinced Valrendil of the wispmother's illusions. Hopefully, he'll stay out of my way."},
        ["Talk to Valrendil Outside the Cave"] =
            {appendText=" near his camp behind the southern xanmeer in Deep Graves."},
        ["Talk to Valrendil"] =
            {appendText=""},
        ["Seal the Wispmother's Remains in the Blessed Vessel 2"] =
            {appendText=". She hides in Valrendil's cave next to his camp behind the southern xanmeer in Deep Graves.", stepTextKey="Valrendil did not believe my argument against the wispmother, but I convinced him to let me into her lair. Now I must slay the wispmother and seal her remains."},
        ["Talk to Xijai-Teel 1"] =
            {appendText=" at Valrendil's camp behind the southern xanmeer in Deep Graves.", stepTextKey="The wispmother has been sealed away, though Valrendil fell to her charms. I should speak to Xijai-Teel, so she'll know the wispmother is no longer plaguing the Deep Graves."},
        ["Talk to Xijai-Teel 2"] =
            {appendText=" at Valrendil's camp behind the southern xanmeer in Deep Graves.", stepTextKey="The wispmother has been sealed away, though Valrendil fell to her charms. I should let Xijai-Teel know the wispmother is no longer plaguing Deep Graves."},
    },


	[GetQuestName(3905)] = { --"Clarity"--@ARKANOBOT 
		["Talk to Tree-Minder Fal-Xoc 1"] =
			{appendText=" at her hut in Precolating Mire.", stepTextKey="I should go speak to Tree-Minder Fal-Xoc about Ja-Reet's strange silence."},
		["Collect Lanceata Pholiota"] =
			{appendText=", a giant mushroom from the Mushroom Cave east of Precolating Mire."},
		["Talk to Tree-Minder Fal-Xoc 2"] =
			{appendText=" at her hut in Precolating Mire.", stepTextKey="I should return to Tree-Minder Fal-Xoc for the blessing that will enable me to locate Ja-Reet's spirit."},
		["Talk to Memory of Ja-Reet's Father"] =
			{appendText=""},
		["Talk to Memory of Overseer"] =
			{appendText=""},
		["Talk to Memory of Feyne Vildan"] =
			{appendText="\n\nThe memories are scattered around the Village."},
		["Talk to Spirit of the Hist 1"] =
			{appendText="", stepTextKey="I should go to the Hist tree at the center of the village to meet spirit of the Hist."},
		["Talk to Spirit of the Hist 2"] =
			{appendText=" near the Hist Tree at the Center of the Village.", stepTextKey="Spirit of the Hist can send me directly to Carethil, the Dominion soldier responsible for corrupting Ja-Reet's memories."},
		["Kill Carethil"] =
			{appendText=" deep within the Hist tree"},
		["Destroy Binding Crystals"] =
			{appendText=""},
		["Talk to Tree-Minder Fal-Xoc 3"] =
			{appendText=" at her hut in Precolating Mire.", stepTextKey="Tree-Minder Fal-Xoc kept watch over me while I searched for and freed Ja-Reet's spirit."},
		["Talk to Ja-Reet 1"] =
			{appendText="", stepTextKey="Ja-Reet can stay in Percolating Mire to train as a healer, but he's free to leave with Feyne Vildan. I should help him make a choice."},
		["Talk to Ja-Reet 2"] =
			{appendText=" at Precolating Mire.", stepTextKey="Ja-Reet decided to remain in Percolating Mire to train as a healer."},
		["Talk to Ja-Reet 3"] =
			{appendText=" at Precolating Mire.", stepTextKey="Ja-Reet decided to return to Narsis, Feyne's hometown."},
	},

[GetQuestName(3828)] = { --"Cold-Blooded Revenge"--chaos
        ["Kill Maldur"] =
            {appendText=" after burning his banner at the Dominion Camp west of Merciful Reduction, in front of the largest tent."},
        ["Get Maldur's Heart"] =
            {appendText=""},
        ["Talk to Prowls-in-Stealth at the Swamp's Edge"] =
            {appendText=" by the water, south of the Camp Merciful Reduction."},
        ["Talk to Prowls-in-Stealth"] =
            {appendText=" by the water, south of the Camp Merciful Reduction."},
    }, 


    [GetQuestName(3889)] = { --"The Fangs of Sithis"--@ARKANOBOT 
        ["Talk to Barvyn"] =
            {appendText=" at the western spire of the Xanmeer in Sunscale Strand."},
        ["Talk to Looks-Under-Rocks 1"] =
            {appendText=" at the western spire of the Xanmeer in Sunscale Strand.", stepTextKey="Barvyn didn't heed his partner's warning. He unsealed the xanmeer and went in. I hope Looks-Under-Rocks can tell me more about what's hidden in these ruins."},
        ["Use Ancient Door to Enter Ruins"] =
            {appendText=" at the western spire of the Xanmeer in Sunscale Strand."},
        ["Stop Barvyn"] =
            {appendText=" from claiming the 'Fangs of Sithis' from the ancient ruins inside the Xanmeer in Sunscale Strand."},
        ["Exit Sunscale Ruins"] =
            {appendText=""},
        ["Talk to Looks-Under-Rocks 2"] =
            {appendText=" at the entrance of the cave southeast of the Xanmeer in Sunscale Strand.", stepTextKey="Barvyn succumbed to the enchantment of the Fangs of Sithis, but he repented as he was dying. More importantly, I've recovered only one Fang. The other is gone. I must tell Looks-Under-Rocks."},
    },


[GetQuestName(3900)] = { --"Into the Mire"--chaos
        ["Rescue Residents"] =
            {appendText="\n\nSearch around Percolating Mire."},
        ["Rescue Ja-Reet"] =
            {appendText=". Search for his hut to the north of Percolating Mire, around the main tree at the center of town."},
        ["Talk to Feyne"] =
            {appendText=" at the eastern side of town, close to a wooden bridge around the central tree."},
    },


    [GetQuestName(3675)] = { --"Last One Standing"--Mouch30
        ["Question the Pirates on the Docks"] =
            {appendText="\nThese sneaky Khajiit will surely give up information after watching you murder the Dominion agents wandering about."},
        ["Go to the Warehouse"] =
            {appendText=", a small, dank structure at the boat's stern."},
        ["Kill Tsanji and Take the Dominion's Treasure"] =
            {appendText=". Lady, as she is known to her cohorts, waits in the abandoned mine just under your feet."},
        ["Talk to S'jash 1"] =
            {appendText=", a young cat that follows your every move.", stepTextKey="In the underground hideout, a Khajiit approached me, right after killing his leader. I should speak to him and find out what he wants."},
        ["Talk to S'jash Outside Tsanji's Hideout"] =
            {appendText=", tucked away in a cave on the eastern shore across from Alten Corimont."},
        ["Talk to S'jash 2"] =
            {appendText=" outside Tsanji's hideout, tucked away in a cave on the eastern shore across from Alten Corimont.", stepTextKey="The treasure One-Eye expected to be in the Khajiit's hideout was not there. A pirate named S'jash said he and his gang would be willing to help me track it down, if I spared them. I should see what they have to offer me."},
    },

	[GetQuestName(4388)] = { --"A Life of Privilege"--Mouch30
		["Find Suriel's Belongings"] =
			{appendText="\nFauna of all shapes and sizes have made the trees their home, leaving convenient hiding spots in the rotting trunks. The southeastern swamp is full of hollow trees."},
		["Talk to Suriel 1"] =
			{appendText=", who sprinted off to crouch in the muck of the pools east of the nearby Dominion camp.", stepTextKey="I've collected Suriel's things from the dubious hiding spots in the swamp. She ran off almost immediately. I should bring her the trinkets and see what's got her so excited."},
		["Follow Suriel"] =
			{appendText=" to the dinghy resting just below the northern shore, in the southeastern swamp."},
		["Decide Suriel's Fate"] =
			{appendText=". The two women are waiting by the rowboat moored in the southeastern swamp. The Dark Elf looks out of place in the muddy pools, decked in jewelry and satin."},
		["Talk to Aldyna 1"] =
			{appendText=" by the moored boat in the southeastern swamps.", stepTextKey="I think I've \"convinced\" Aldyna to forget about Suriel and leave with her stolen items."},
		["Talk to Suriel 2"] =
			{appendText=" by the moored boat in the southeastern swamps. It seems Dark Elf slavers only respond to threats.", stepTextKey="I think I've \"convinced\" Aldyna to forget about her former slave. I should speak with Suriel before she leaves."},
		["Talk to Suriel 3"] =
			{appendText=" by the moored boat in the southeastern swamps.", stepTextKey="I gave Suriel to buy her freedom without stealing from her now-former master. Aldyna probably won't be happy about this turn of events."},
		["Talk to Aldyna 2"] =
			{appendText=" by the moored boat in the southeastern swamps. The hefty price you paid was worth it to free the Breton.", stepTextKey="I bought Suriel's freedom. I should speak with Aldyna and make sure she doesn't plan to go back on the deal."},
		["Talk to Aldyna 3"] =
			{appendText=" by the moored boat in the southeastern swamps.", stepTextKey="I've agreed to return Aldyna's stolen goods to her - both the trinkets and her slave, Suriel."},
		["Talk to Aldyna 4"] =
			{appendText=" by the moored boat in the southeastern swamps. The squabbles between Dunmer and their property isn't important enough to matter to you.", stepTextKey="I've agreed to return Aldyna's stolen property to her. I should speak with her before she departs."},
	},

    [GetQuestName(3724)] = { --"Lost to the Mire"--Mouch30
        ["Find Luteema in the Percolating Mire"] =
            {appendText=". The village lies to the south of Alten Corimont, surrounded by the river on all sides. Luteema followed another to the Mire, leaving behind the one that loved him from the start."},
    },

    [GetQuestName(3914)] = { --"Missing Son"--@ARKANOBOT 
        ["Find Wideem-Voh"] =
            {appendText=" in the Dominion camp north of Precolating Mire."},
        ["Find Wideem-Voh's Necklace"] =
            {appendText=". Search the Camp Crystal Abattoir for the necklace."},
        ["Talk to Tah-Tehat"] =
            {appendText=" at Precolating Mire."},
    },

    [GetQuestName(3676)] = { --"A Pirate Parley"--Mouch30
        ["Find the Dominion Treasure Ship"] =
            {appendText=", a gorgeous galleon docked on the river east of Alten Corimont."},
        ["Find the Pirate Treasure on the Dominion Ship"] =
            {appendText=", which is rife with Dominion troops. The paychest should be safely stored to the back of the ship's hold."},
        ["Talk to One-Eye 1"] =
            {appendText=", who patiently waits for her 'hard-earned' payment on the southern docks. S'jash mentioned a boat waiting for you on the shore near the old hideout.", stepTextKey="One-Eye is waiting for me to return to Alten Corimont. Supposedly, she has some important information I must hear. S'jash said she would be waiting on the docks."},
        ["Kill Sirinaire"] =
            {appendText=", and take back Alten Corimont from the clutches of the Dominion."},
        ["Talk to One-Eye 2"] =
            {appendText=" on her ship's main deck.", stepTextKey="Sirinaire is dead. With luck, this means the end of supply running through Alten Corimont. That deals a severe blow to the Dominion's designs in Shadowfen. I should let One-Eye know the Dominion won't bother her town any longer."},
        ["Talk to Vicecanon Servyna"] =
            {appendText=" on the upper deck of the Blasted Breton."},
    },


    [GetQuestName(3890)] = { --"Pull the Last Fang"--@ARKANOBOT 
        ["Board the Pirate Ship"] =
            {appendText=" at Sunscale Strand"},
        ["Find the Key to the Hold"] =
            {appendText=". It should be somewhere in the top deck of the Pirate Ship at Sunscale Strand."},
        ["Recover the Fang of Sithis"] =
            {appendText=" from the pirate captain below decks of the ship at Sunscale Strand"},
        ["Find Looks-Under-Rocks"] =
            {appendText=" in Sunscale Strand."},
        ["Talk to Sharava 1"] =
            {appendText=" at Looks-Under-Rocks' camp northeast of Sunscale Strand.", stepTextKey="These Shadowscales appeared out of nowhere. I should talk to their leader, Sharava and find out what they want."},
        ["Give the Fangs to Sharava"] =
            {appendText=""},
        ["Give the Fangs to Looks-Under-Rocks"] =
            {appendText="\n\nThey await your decision at Looks-Under-Rocks' camp northeast of Sunscale Strand."},
        ["Talk to Sharava 2"] =
            {appendText=" at Looks-Under-Rocks' camp northeast of Sunscale Strand.", stepTextKey="I gave Sharava the Fangs of Sithis. I should talk to her again before she leaves."},
        ["Talk to Aspect of Sithis"] =
            {appendText=" at Looks-Under-Rocks' camp northeast of Sunscale Strand."},
        ["Talk to Looks-Under-Rocks"] =
            {appendText=" at his camp northeast of Sunscale Strand."},
    },

    [GetQuestName(3729)] = { --"A Stranger Uninvited"--@ARKANOBOT 
        ["Find the High Elf's Camp"] =
            {appendText=" behind the xanmeer at Deep Graves."},
        ["Search the Altmer's Camp"] =
            {appendText=" behind the xanmeer at Deep Graves."},
        ["Talk to Valrendil"] =
            {appendText=" at his camp behind the xanmeer in Deep Graves."},
        ["Talk to Valrendil's Wife"] =
            {appendText=" in the cave next to his camp behind the xanmeer in Deep Graves."},
        ["Talk to Xijai-Teel atop the Xanmeer"] =
            {appendText=" in Deep Graves."},
        ["Retrieve the Fragmented Urn"] =
            {appendText=" from the ruined xanmeer in the northeastern edge of Deep Graves."},
        ["Retrieve the Fragmented Stopper"] =
            {appendText=" from the northwestern xanmeer in Deep Graves."},
        ["Complete the Ritual with Xijai-Teel"] =
            {appendText=". She awaits your return with the artifacts near the road in the northern edge of Deep Graves."},
        ["Talk to Xijai-Teel"] =
            {appendText=" near the cart filled with recent dead at the road on the northern edge of Deep Graves."},
    },

    [GetQuestName(4556)] = { --"Strength of the Father"--Mouch30
        ["Read Gordag's Journal"] =
            {appendText=" in the final chamber of the ruins."},
        ["Create an Antidote"] =
            {appendText=" from the native plants around the ruins. A Seriweed Elixir will cure Mozgosh and ease her pain, but Gordag is against using such gentle methods. The Xthari Elixir, although poisonous, promises a grueling recovery to anyone who can muster through the burning sensations."},
        ["Use Xthari Elixir on Mozgosh"] =
            {appendText=", who waits for the cure in the ruins of Hissmir, a xanmeer located above the southern river of Shadowfen."},
        ["Switch to Seriweed Elixir"] =
            {appendText=" for a gentler, painless cure."},
        ["Use Seriweed Elixir on Mozgosh"] =
            {appendText=", who waits for the cure in the ruins of Hissmir, a xanmeer located above the southern river of Shadowfen."},
        ["Switch to Xthari Elixir"] =
            {appendText=" for a more intense, painful cure."},
        ["Talk to Mozgosh 1"] =
            {appendText=" near her tent on the northeast platform of Hissmir. Her skin is pale and damp, but she's standing on her own feet.", stepTextKey="While the Xthari Elixir woke Mozgosh from her coma, she appears severely weakened. I should find out how she feels."},
        ["Talk to Mozgosh 2"] =
            {appendText=" near her tent on the northeast platform of Hissmir. Her skin has gained a youthful glow, and she stands with renewed vigor.", stepTextKey="The Seriweed Elixir appears to have cured Mozgosh entirely. I should find out how she feels."},
    },


    [GetQuestName(4553)] = { --"Threefold Folly"--@ARKANOBOT 
        ["Talk to Akishan"] =
            {appendText=" near the crossroads to the Hatching Pools, west of Alten Corimont."},
        ["Solve Akishan's Riddles"] =
            {appendText=""},
        ["Trick Akishan into Answering a Riddle"] =
            {appendText="\n\nAkishan waits for you to answer her riddles near the Crossroads, south of the Hatching Pools."},
        ["Return Erranenen's Lute"] =
            {appendText=". He waits for you near the ruins at the western corner of Alten Corimont."},
        ["Talk to Erranenen"] =
            {appendText=" near the ruins at the western corner of Alten Corimont."},
    },

	[GetQuestName(3827)] = { --"The Tree-Minder's Fate"--@ARKANOBOT 
		["Recover Broken Haft"] =
			{appendText=""},
		["Recover Ancient Book"] =
			{appendText=""},
		["Recover Lost Key"] =
			{appendText="\n\nSearch the Forsaken Hamlet for clues."},
		["Talk to Tree-Minder Deyapa 1"] =
			{appendText="'s ghost inside one of the huts in Forsaken Hamlet.", stepTextKey="The tree-minder's ghost appeared, hovering over the last object I recovered. I need to talk to this spirit."},
		["Talk to Tree-Minder Deyapa in Her Hut"] =
			{appendText=" in Forsaken Hamlet."},
		["Subdue Spirits"] =
			{appendText="\n\nThe mad Argonian spirits run rampant in the Forgotten Hamlet."},
		["Go to the Hist Tree"] =
			{appendText=" in the center of Forgotten Hamlet."},
		["Talk to Tree-Minder Deyapa at the Hist Tree"] =
			{appendText=" in the center of Forgotten Hamlet."},
		["Talk to Tree-Minder Deyapa 2"] =
			{appendText=" near the Hist tree in the center of the Forgotten Hamlet.", stepTextKey="Having returned the broken headpiece to the tree-minder, I need to wait and see if she is able to restore the Hist tree … or at least put her fellow spirits to rest. I'll talk to her when she's finished."},
		["Burn Hist Sap Containers"] =
			{appendText="\n\nThe tree-minder says that the Dominion has taken the Sap Containers to their camp north of the Forgotten Hamlet."},
		["Talk to Tree-Minder Deyapa 3"] =
			{appendText=" at Forgotten Hamlet.", stepTextKey="The Hist sap is free of the Dominion's refinement containers, so the Argonian spirits should be calm again, but the Dominion's soldiers know where I came from. I must return to the Hist tree and confer with Tree-Minder Deyapa."},
		["Tell Tree-Minder Deyapa to Begin the Ritual"] =
			{appendText=". She waits for you at Forsaken Hamlet."},
		["Defend the Spirits"] =
			{appendText=" performing the ritual at Forsaken Hamlet."},
		["Talk to Tree-Minder Deyapa 4"] =
			{appendText=" near the hist tree at the center of Forsaken Hamlet.", stepTextKey="The Dominion's forces have been routed. Tree-Minder Deyapa's ritual was a success. The Argonian spirits of the forsaken hamlet can now return to the restored Hist tree. They can be at peace."},
	},

    [GetQuestName(3674)] = { --"Warm Welcome"--Mouch30
        ["Talk to Senil Fenrila"] =
            {appendText=", imprisoned in the stocks located on the northern side of the docked ship. Stale alcohol and swamp water mingle together, producing a fetid stench that covers the town."},
        ["Get an Audience with Alten Corimont's Leader"] =
            {appendText=". Strength recognizes strength among pirates, and there's no better way to earn respect than with a good ol' rumble."},
        ["Talk to One-Eye 1"] =
            {appendText=", a grizzled Argonian captain. As her name suggests, one eye is a pale, milky white, blinded in a terrible scuffle.", stepTextKey="I won the right to speak to One-Eye, the leader of Alten Corimont. Her thugs said she would be in the captain's quarters of the beached ship, on the main deck."},
        ["Get Information from One-Eye's Contact"] =
            {appendText=", a twitchy, speckled Argonian lurking near some supply crates."},
        ["Eavesdrop on the Meeting in the Warehouse"] =
            {appendText=" to the south of the Blasted Breton."},
        ["Talk to One-Eye 2"] =
            {appendText=", residing in her quarters on the ship's main deck.", stepTextKey="Tsanji has made a deal with the Thalmor, the military force of the Dominion in Shadowfen. One-Eye should hear about this immediately."},
        ["Talk to One-Eye 3"] =
            {appendText=", residing in her quarters on the ship's main deck.", stepTextKey="It seems Tsanji made a deal with the Thalmor, the military force of the Dominion in Shadowfen. One-Eye should hear about this immediately."},
    },


    [GetQuestName(3730)] = { --"Whispers of the Wisps"--@ARKANOBOT 
        ["Talk to Parash 1"] =
            {appendText=" at Deep Graves, in the swamps southwest of Alten Corimont", stepTextKey="I should seek out Parash and see what's going on."},
        ["Rescue the Travelers"] =
            {appendText=""},
        ["Talk to Parash 2"] =
            {appendText=" at Deep Graves.", stepTextKey="I should return to Parash and let him know the travelers should be safer now."},
        ["Follow the Ghostly Figure"] =
            {appendText=" near Parash at Deep Graves."},
        ["Talk to Xijai-Teel"] =
            {appendText=" at Deep Graves."},
    },

    [GetQuestName(4557)] = { --"Will of the Broken"--Mouch30
        ["Talk to the Dying Priest"] =
            {appendText=" sprawled on the platform, in the second chamber."},
        ["Bring Daedric Urn to Vaudrie 1"] =
            {appendText=", a fellow priestess of Arkay, who is stationed in the eastern port city.", stepTextKey="Mallius Falto is at peace. The Blessing of Arkay will keep his spirit safe from Daedric corruption. He asked me to bring the urn to Vaudrie in Alten Corimont."},
        ["Talk to Vaudrie"] =
            {appendText=", a fellow priestess of Arkay, stationed in the eastern port city."},
        ["Bring Daedric Urn to Vaudrie 2"] =
            {appendText=", a fellow priestess of Arkay, stationed in the eastern port city.", stepTextKey="Mallius Falto blessed me before he died, to keep me safe from Daedra. He asked me to bring the urn to Vaudrie in Alten Corimont."},
    },

    [GetQuestName(3845)] = { --"And Throw Away The Key"--@ARKANOBOT 
        ["Talk to a Guard"] =
            {appendText=" at White Rose Prison."},
        ["Talk to General Raetus"] =
            {appendText=" at one of the broken buildings in the southern section of the White Rose Prison."},
        ["Collect Medical Supplies"] =
            {appendText=""},
        ["Take Medical Supplies to the Tower"] =
            {appendText=" near the overrun camp, northwest of White Rose Prison"},
    },

    [GetQuestName(3719)] = { --"Captured Time"--@ARKANOBOT 
        ["Awaken Ayleid Pilasters"] =
            {appendText="\n\nSearch for the Ayleid Pilasters in the Temple of Sul, north of the village in Zuuk. According to the book, the Pilasters look like a smaller variant of Welkynd Stones."},
        ["Talk to Neeja-Meen"] =
            {appendText=" at Hissmir in the southwestern region of Shadowfen."},
    },

    [GetQuestName(4391)] = { --"Catch the Lightning"--@ARKANOBOT 
        ["Talk to Drulis"] =
            {appendText=". According to Gathotar, Drulis should be along the River banks to the east of Chid-Moska Ruins and south of Hissmir. Gathotar says Drulis is not willing to partake in the experimentation of the Amulet. Perhaps you will fare better at persuading him?"},
        ["Collect Wamasu Lightning"] =
            {appendText="\n\nUse the amulet given by Gathotar on a Wamasu while it emits lightning. Wamasus are known to roam in the swamps near Venomous Fens Dolmen and Chid-Moska Ruins."},
        ["Talk to Gathotar"] =
            {appendText=" about the results of the experimentation. He should be awaiting your return in an Argonian tower next to the vine bridge leading to Blackwood southeast of Chid-Moska Ruins."},
    },

[GetQuestName(3795)] = { --"Deep Disturbance"--@ARKANOBOT 
		["Talk to Tree-Minder Nexith 1"] =
			{appendText=". He usually spends time communing with the Hist in his hut in the village of Xal Ithix.", stepTextKey="The hunter I met in Xal Ithix says if I want to know what's happening in the swamp, I need to talk to Tree-Minder Nexith in his hut."},
		["Place Ritual Potion at Northeast Stele"] =
			{appendText=""},
		["Place Ritual Potion at Southeast Stele"] =
			{appendText=""},
		["Place Ritual Potion at Southwest Stele"] =
			{appendText=""},
		["Place Ritual Potion at Northwest Stele"] =
			{appendText="\n\nThe Tree-Minder warns of daedric forces guarding the stele surrounding the ancient xanmeer south of Xal Ithix."},
		["Talk to Tree-Minder Nexith 2"] =
			{appendText=". He is preparing for the ritual of clear sight atop the xanmeer south of Xul Ithix.", stepTextKey="I should meet Tree-Minder Nexith atop its ancient stone temple. He should be able to begin his ritual now."},
		["Talk to Tree-Minder Nexith 3"] =
			{appendText=" atop the xanmeer south of Xal Ithix. His ritual did seem to go well almost up until the end. Perhaps the ancients revealed the real cause for the corruption in the bog?", stepTextKey="I should ask Tree-Minder Nexith whether his ritual revealed the source of Xal Ithix's problems."},
		["Go to Hist Tree"] =
			{appendText=""},
		["Unearth Daedric Relic at the Stele"] =
			{appendText=" by the waterfall, west of the Hist tree southwest of Xal Ithix."},
		["Talk to the Daedra"] =
			{appendText=" at the stele next to the waterfall west of the Hist tree southwest of Xal Ithix. The daedra does not seem to be pleased with what you have done..."},
		["Go to Ritual Site"] =
			{appendText=" by following the path through the caves near the stele by the waterfalls west of the hist tree in the southwestern region of Xal Ithix. Beware though! The aspect of the Daedric Prince Namira has threatened to overwhelm you by sending her minions if you attempt to foil her plans."},
		["Talk to Aspect of Namira at Ritual Site"] =
			{appendText=" west of Xal Ithix."},
		["Disrupt Ritual"] =
			{appendText=" at the ritual site atop the mountain southwest of Xal Ithix. According to the Tree-Minder you can use the artifact you found at the stele to disrupt Namira's daedric minions"},
		["Talk to Tree-Minder Nexith 4"] =
			{appendText=" atop the mountain southwest of Xal Ithix.", stepTextKey="I stopped Namira's ritual of corruption. I can see Tree-Minder Nexith at the top of a nearby structure. I should go talk to him and see what's next for Xal Ithix."},
	},


    [GetQuestName(3679)] = { --"Dreams From the Hist"--@ARKANOBOT 
        ["Drink Hist Sap"] =
            {appendText=" next to Bimee-Kas at the pit south of Hissmir."},
        ["Witness the Lost Communion"] =
            {appendText=" by talking to the ancient Argonian spirit at the broken structure near the wooden bridge west from the pit south of Hissmir."},
        ["Witness the Fruit and the Stone"] =
            {appendText=" by talking to the ancient Argonian spirit and then placing the amber in the zaht stone at the hist tree next to the road in the swamps southwest of Hissmir."},
        ["Witness the True Balance"] =
            {appendText=" by activating the Zaht Stone at the road in the swamps southwest of Hissmir. Travel north by northeast by following the path from the location where you witnessed the Fruit and Stone, towards Hissmir to reach the location of the True Balance."},
        ["Talk to Bimee-Kas"] =
            {appendText=" at the pit south of Hissmir."},
        ["Talk to Kamax-Ei at the Xanmeer's Summit"] =
            {appendText=" in Hissmir"},
        ["Confront Captain Henaamo"] =
            {appendText=""},
        ["Collect Hist Amber"] =
            {appendText="\n\nFind Captain Henaamo and the Hist Amber inside the Ruined Xanmeer northwest of Hissmir."},
        ["Activate the Northern Zaht Stone"] =
            {appendText=""},
        ["Activate the Eastern Zaht Stone"] =
            {appendText=""},
        ["Activate the Southern Zaht Stone"] =
            {appendText=""},
        ["Activate the Western Zaht Stone"] =
            {appendText=""},
        ["Talk to Kamax-Ei"] =
            {appendText=" at the Xanmeer's Summit in Hissmir."},
    },


    [GetQuestName(3849)] = { --"A Final Release"--@ARKANOBOT 
        ["Find Najeepa's Remains"] =
            {appendText=". There have been rumors of sightings of an Argonian spirit on the road east of White Rose Prison. Perhaps you should start your search there."},
        ["Find the Remains of Bezeer's Mother"] =
            {appendText=""},
        ["Bring Najeepa's Remains to her Spirit"] =
            {appendText=" on the road east of White Rose Prison."},
    },


    [GetQuestName(3718)] = { --"Into the Temple"--@ARKANOBOT 
        ["Break the Ward Blocking the Temple of Sul"] =
            {appendText=". The entrance is located in the Ayleid ruins north of the village in Zuuk"},
        ["Enter the Temple of Sul"] =
            {appendText=". It is located in the Ayleid ruins north of the village in Zuuk"},
        ["Search the Temple of Sul"] =
            {appendText=" at Zuuk.\n\nA ward of some kind blocks the keystone chamber. Perhaps the pillar marked with the image of Celestials be the key to this ward?"},
        ["Find the Keystone"] =
            {appendText=" in the final chamber of the Temple of Sul, north of the village in Zuuk"},
        ["Talk to Morilye"] =
            {appendText=" in the final chamber of the Temple of Sul, north of the village in Zuuk"},
        ["Return to Drillk"] =
            {appendText=" at the broken Ayleid tower, north of the village in Zuuk"},
        ["Talk to Lodyna Arethi 1"] =
            {appendText=" behind a fallen tree log near the crossroads south of Zuuk", stepTextKey="I couldn't let Drillk die on my behalf. The keystone will be safe within him. I should return to Lodyna Arethi and let her know about the keystone."},
        ["Talk to Lodyna Arethi 2"] =
            {appendText=" behind a fallen tree log near the crossroads south of Zuuk", stepTextKey="Drillk is dead. He gave his life to pass the keystone to me. I should return to Lodyna Arethi and let her know about the keystone."},
    },


    [GetQuestName(3846)] = { --"The Keystone"--@ARKANOBOT 
        ["Enter the Dungeon"] =
            {appendText=". The entrance to the dungeon lies in a cave near the swamps in the northwest section of the White Rose Prison below the southwestern tower."},
        ["Find Sargon"] =
            {appendText=" in the dungeons near the northwest section of White Rose Prison."},
        ["Find the Warden's Office"] =
            {appendText=" in the area above the cells inside dungeon near the northwest section of White Rose Prison."},
        ["Talk to Sargon"] =
            {appendText=" in the dungeons near the northwest section of White Rose Prison."},
        ["Decide the Prisoners' Fate"] =
            {appendText=""},
        ["Survive the Feral Onslaught"] =
            {appendText=" inside the dungeon."},
        ["Talk to General Raetus"] =
            {appendText=" at one of the broken buildings in the southern section of the White Rose Prison."},
        ["Talk to Gerent Hernik 1"] =
            {appendText=" on the road east, outside of White Rose Prison.", stepTextKey="I need to speak with Gerent Hernik and tell him about the Keystone."},
        ["Escape White Rose Prison"] =
            {appendText=""},
        ["Find Gerent Hernik"] =
            {appendText=""},
        ["Meet Hernik Outside"] =
            {appendText=" near the southern exit of the White Rose Prison."},
        ["Talk to Gerent Hernik 2"] =
            {appendText=" near the southern exit of the White Rose Prison.", stepTextKey="Gerent Hernik fled from the prison after I killed General Raetus. I should meet him outside the prison walls."},
    },

    [GetQuestName(3717)] = { --"King of Dust"--@ARKANOBOT 
        ["Free the Kothringi in Zuuk"] =
            {appendText=". The Dominion has chained him in the center of the village in Zuuk."},
        ["Talk to Drillk 1"] =
            {appendText="", stepTextKey="I need to speak to the Kothringi at his \"castle\" in Zuuk."},
        ["Collect Metal Band"] =
            {appendText=""},
        ["Collect Colored Glass"] =
            {appendText="\n\nSearch for the materials in and around the village in Zuuk."},
        ["Forge the Crown"] =
            {appendText=" at the anvil near the center of the village in Zuuk."},
        ["Bring the Crown to Drillk"] =
            {appendText=" at his hut in Zuuk."},
        ["Steal a Scroll of Release"] =
            {appendText=" from the invader's camp west of Zuuk"},
        ["Free Lleram"] =
            {appendText=""},
        ["Free Dethrel"] =
            {appendText=""},
        ["Free Sarase"] =
            {appendText="\n\nThe subjects of Zuuk are trapped in the lowlands in the western and northwestern region of Zuuk. Their screams can be heard echoing through out the lowlands."},
        ["Talk to Drillk 2"] =
            {appendText=" at his hut in Zuuk.", stepTextKey="I freed the subjects of Zuuk, though they weren't living, they were spirits. I should report this information to Drillk."},
        ["Escort Drillk to the Tower"] =
            {appendText=" north of the village in Zuuk"},
        ["Talk to Drillk 3"] =
            {appendText=" at the broken Ayleid tower north of the village in Zuuk.", stepTextKey="Drillk declared me the captain of his royal army. Now that he has addressed his \"subjects\" I should speak to Drillk about the keystone."},
    },

    [GetQuestName(3681)] = { --"Lost Pilgrimage"--@ARKANOBOT 
        ["Search for Pilgrims"] =
            {appendText=" in the swamps north of Hissmir to the road northeast of Hissmir. They may have lost their way and ended up in the treacherous marshes, where they are at risk of being killed by bandits or consumed by dangerous creatures lurking in the shadows."},
        ["Search for Remaining Pilgrims"] =
            {appendText=" in the nearby swamps north of Hissmir. Perhaps someone survived to tell the tale and shed light on the recent deaths of their companions."},
        ["Confront the Pilgrims' Murderers"] =
            {appendText=" on the Hill past the swamps north of Hissmir."},
        ["Talk to Kiameed"] =
            {appendText=". He is waiting for your return with news of the pilgrims at the northern end of Hissmir."},
    },

[GetQuestName(3804)] = { --"Missing in the Mire"--chaos
        ["Rescue Scavengers from Stranglers"] =
            {appendText="\n\nSearch the area south of Xal Ithix."},
        ["Talk to Sleeps-with-Open-Eyes"] =
            {appendText=" in front of the ruins south of Xal Ithix."},
        ["Search the Trash Piles"] =
            {appendText=" south of Xal Ithix, around the bog."},
        ["Talk to Nimble-Knuckles"] =
            {appendText=". She is sitting around the ruins of Xal Ithix."},
    },

    [GetQuestName(3680)] = { --"Of Dubious Value"--@ARKANOBOT 
        ["Interview Xula"] =
            {appendText=""},
        ["Interview Tulut"] =
            {appendText=""},
        ["Interview Kaloo"] =
            {appendText=""},
        ["Search the Cart for Clues"] =
            {appendText="\n\nSearch the cart next to wareem in Hissmir and ask around for any possible witnesses to the theft in the southwestern corner of Xanmeer in Hissmir."},
        ["Search for the Culprit"] =
            {appendText=" or clues pointing towards the culprit on the eastern side of Hissmir."},
        ["Search the Nearby Hut"] =
            {appendText=" in the eastern side of Hissmir."},
        ["Talk to Wareem"] =
            {appendText=" at the southwestern corner of the Xanmeer in Hissmir. She should be waiting by her cart for news relating to the relics."},
    },

    [GetQuestName(3847)] = { --"The Ones Left Behind"--@ARKANOBOT 
        ["Find Zarukhari's Remains"] =
            {appendText=""},
        ["Find Nuzal's Remains"] =
            {appendText="\n\nSearch the prison dungeons for the ashes of Erranza's children. Perhaps the ashes are stored in an urn of some kind?"},
        ["Collect Erranza's Remains"] =
            {appendText=" from White Rose Prison dungeon."},
        ["Bury the Remains"] =
            {appendText=""},
        ["Talk to Erranza"] =
            {appendText=" near the tree northwest of White Rose Prison."},
    },

    [GetQuestName(3732)] = { --"Overrun"--@ARKANOBOT 
        ["Talk to Silent-Moss at Murkwater"] =
            {appendText=". The Shadowscale Silent-Moss is observing the Dominion movements at Murkwater from the crossroads leading into Murkwater just southeast of Hissmir."},
    },

    [GetQuestName(4551)] = { --"A Poisoned Heart"--@ARKANOBOT 
        ["Collect a Wasp Husk"] =
            {appendText=" from the wasps south of the Hatching Pools.\n\nRhea could have some information that could help. Speak to her near the Hatching Pools Wayshrine."},
        ["Bring the Husk to Rhea"] =
            {appendText=" at her Camp near the road beyond the swamps south of the Hatching Pools."},
        ["Talk to Marius 1"] =
            {appendText=" at the Imperial Camp near the road beyond the swamps south of Hatching Pools.", stepTextKey="Rhea enchanted the wasp husk and instructed me to ask Marius about their plans."},
        ["Use the Enchanted Container to Collect Poison Gas"] =
            {appendText="\n\nMarius has asked you to take care of the poison gas in the swamps southwest of the Hatching Pools near Gandranen Ruins and by the swamps further westward."},
        ["Give Rhea the Poison"] =
            {appendText=""},
        ["Give Marius the Poison"] =
            {appendText="\n\nThey await your return near a murky pond south of Zuuk, west of Gandranen Ruins."},
        ["Talk to Rhea"] =
            {appendText=" at the poison dumping ditch, near the murky pool south of Zuuk, west of Gandranen Ruins."},
        ["Talk to Marius 2"] =
            {appendText=" at the poison dumping ditch, near the murky pool south of Zuuk, west of Gandranen Ruins.", stepTextKey="I gave the enchanted container filled with poison to Marius, who was very grateful. I should speak to him about my reward."},
    },


   [GetQuestName(4560)] = { --"Riches Beyond Measure"--@ARKANOBOT 
        ["Find the Crown of Ascension"] =
            {appendText=" deeper in Gandranen Ruins. According to what Zahra has heard, it is the crown of ancient Ayleid fenlords, and made up of ice."},
        ["Talk to Zahra"] =
            {appendText=" near the Crown of Ascension in Gandranen Ruins."},
    },

[GetQuestName(3799)] = { --"Scales of Retribution"--@ARKANOBOT 
		["Rescue Batar-Meej"] =
			{appendText=". Silent-Moss said that Batar-Meej was captured and tied somewhere near the crescent pool in Murkwater."},
		["Rescue Nuwisha"] =
			{appendText=". Silent-Moss heard her cries coming from the caves in Murkwater."},
		["Rescue Radithax"] =
			{appendText=". Silent-Moss assumes he must be somewhere deeper in the Dominion Camp towards the western area of Murkwater southeast of Hissmir"},
		["Rendezvous with the Shadowscales"] =
			{appendText=""},
		["Signal Shadowscales to Save Townsfolk"] =
			{appendText="\n\nThe townsfolk of Murkwater are being coerced into excavating for an ancient relic in the Ayleid ruins on the southernmost edge of Murkwater. Search for the surviving townsfolk in the Ayleid ruins and signal the Shadowscales."},
		["Locate Haj-Tulm"] =
			{appendText=". She was last seen near the eastern section of the Ayleid ruins located at the southernmost edge of Murkwater."},
		["Find the Relleis Lor Keystone"] =
			{appendText=" in the Ayleid ruins located at the southernmost edge of Murkwater."},
		["Talk to Silent-Moss 1"] =
			{appendText=" at the eastern section of the Ayleid ruins located at the southernmost edge of Murkwater.", stepTextKey="Now that I've retrived the Relleis Lor keystone, I should find Silent-Moss.\n\nHe's waiting for me at an excavation site in Murkwater."},
		["Kill Khasar-dro and Velelya"] =
			{appendText=""},
		["Collect Fire Salts"] =
			{appendText=""},
		["Use Fire Salts Along the River"] =
			{appendText="\n\nThe Shadowscale Silent-Moss has asked you to use the Fire salts on the river near to the Dominion Ship and in the surrounding water bodies to cut off their escape route."},
		["Talk to Silent-Moss 2"] =
			{appendText=" west of the Dominion Ship along the banks of the river in Murkwater.", stepTextKey="I've spread the fire salts all along the river. Now I need to meet with Silent-Moss east of the Dominion's ship."},
		["Light Fire Salts"] =
			{appendText=" on the broken branches set up by Silent-Moss near him on the river banks west of the Dominion Ship in Murkwater."},
		["Talk to Pale-Heart 1"] =
			{appendText=" at her camp on the hill near the southernmost edge of Murkwater.", stepTextKey="I've burnt the Dominion ships and retrieved the Relleis Lor keystone, I should return to Pale-Heart in Murkwater."},
		["Talk to Pale-Heart 2"] =
			{appendText=" at her camp on the hill near the southernmost edge of Murkwater.", stepTextKey="I've taken part in a ritual that bound the Rellis Lor Keystone to me. I should speak to Pale-Heart to see what's next."},
	},

    [GetQuestName(3911)] = { --"The Swamp's Embrace"--@ARKANOBOT 
        ["Find the Prisoners' Bodies"] =
            {appendText="\n\nMaahi says that the bodies of other prisoners should be around the eastern halls and the caves adjacent to Loriasel's eastern halls. He has warned of the Lamias roaming the area due to the stench of the bodies."},
        ["Talk to Maahi 1"] =
            {appendText=" in the cavern leading from caves adjacent to Loriasel's eastern halls. He has somehow managed to slip past the Lamias roaming the area.", stepTextKey="I found four of the missing prisoners. Akeenus said Maahi is waiting ahead, farther into the caves."},
        ["Kill the Lamia Queen and Retrieve the Argonian Remains"] =
            {appendText="\n\nMaahi last saw the Lamia Queen in the Cavern leading from caves adjacent to Loriasel's eastern halls."},
        ["Take the Remains to the Ruin's Antechamber"] =
            {appendText=""},
        ["Reunite the Bodies"] =
            {appendText="\n\nThe bodies of the prisoners are kept near Maahi in the antechamber of Loriasel."},
        ["Talk to Maahi 2"] =
            {appendText=" in the antechamber of Loriasel.", stepTextKey="I returned the flesh to the Argonian prisoners. I should speak to Maahi."},
        ["Talk to Maahi 3"] =
            {appendText=" in the antechamber of Loriasel.", stepTextKey="I returned the flesh to the Argonian victims. I should speak to Maahi."},
    },

[GetQuestName(3678)] = { --"Trials of the Burnished Scales"--@ARKANOBOT 
		["Talk to Chimatei 1"] =
			{appendText=" at Hissmir", stepTextKey="I must speak with Chimatei to begin the first trial. She's on the northwest corner of the pyramid."},
		["Enter the Trial of the Mind"] =
			{appendText=". The entrance lies next to Chimatei, in the northwest corner of the pyramid in Hissmir."},
		["Complete the Trial of the Mind"] =
			{appendText=" at the northwest corner of the pyramid in Hissmir."},
		["Talk to Chimatei 2"] =
			{appendText=" at the northwest corner of the pyramid in Hissmir.", stepTextKey="I've completed the Trial of the Mind. I should speak with Chimatei about the next trial."},
		["Go to First Waypoint"] =
			{appendText=" at the tower connecting the pyramid in the western corner of the pyramid in Hissmir."},
		["Talk to Chimatei 3"] =
			{appendText=" at the northwest corner of the pyramid in Hissmir.", stepTextKey="I should speak with Chimatei to start the Trial of the Heart once more."},
		["Go to Second Waypoint"] =
			{appendText=" by following the path west from the tower. On your way towards the waypoint, There awaits someone who could use your help but will you?"},
		["Go to Third Waypoint"] =
			{appendText=" by following the same path back to Hissmir, to the stele towards the southwest corner of Hissmir. Once again, on your way towards the waypoint, You see the Argonian next to the stone brazier who could use your help, but will you?"},
		["Talk to Nazuux"] =
			{appendText=" next to the stele in the southwest corner of Hissmir."},
		["Talk to Bimee-Kas 1"] =
			{appendText=", south of Hissmir.", stepTextKey="I must talk to Bimee-Kas to begin the Trial of the Fang. I can find him in the pit south of the pyramid."},
		["Drink the Root Rot Poison"] =
			{appendText=" at the pit south of Hissmir."},
		["Complete the Trial of the Fang"] =
			{appendText=" at the pit south of Hissmir."},
		["Talk to Bimee-Kas 2"] =
			{appendText=" at the pit south of Hissmir.", stepTextKey="I defeated my opponent and completed the Trial of the Fang. I should speak to Bimee-Kas."},
		["Escort Leetu Back to Hissmir"] =
			{appendText=""},
	},

    [GetQuestName(3912)] = { --"Vigil's End"--@ARKANOBOT 
        ["Recover the Sword Shards"] =
            {appendText=""},
        ["Find the Knight's Shield"] =
            {appendText="\n\nSearch the western halls in Loriasel for the relics."},
        ["Find the Ayleid Knight"] =
            {appendText=" in the western halls in Loriasel"},
        ["Talk to the Ayleid Knight 1"] =
            {appendText=". His spirit awaits me in his tomb chamber with an Ayleid statue in the western halls of Loriasel.", stepTextKey="The spirit appeared before me at its tomb. I should find out why it has taken an interest in me."},
        ["Find the Enchanter"] =
            {appendText=" in the western halls of Loriasel. Perhaps searching for the Tomb of the Liege Lord might give you more insights into finding the enchanter and putting the spirit of the Ayleid knight to rest."},
        ["Investigate the Tomb"] =
            {appendText=" of the Liege Lord in the western halls of Loriasel."},
        ["Talk to the Ayleid Knight 2"] =
            {appendText=" in the Tomb of the Liege Lord in the western halls of Loriasel.", stepTextKey="The spirit drive away the ghost of the Enchanter, who had murdered the spirit's liege lord. It asked me to destroy the Enchanter's phylactery. The spirit believes doing so will end the Enchanter's threat."},
        ["Destroy the Phylactery"] =
            {appendText=" in the Tomb of the Liege Lord in the western halls of Loriasel."},
    },

    [GetQuestName(3802)] = { --"What Happened at Murkwater"--@ARKANOBOT 
        ["Talk to Azinar at Hissmir"] =
            {appendText=". He is listening to the complaints of agitated Argonians on the road northeast just outside of Hissmir."},
    },




--Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch 
--Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch 
--Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch 
--Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch --Eastmarch 


--Side Quests
--Side Quests
--Side Quests
--Side Quests
--Side Quests


[GetQuestName(4043)] = { --"Collector of Pelts" --Chaos
        ["Collect Wolf Pelts"] =
            {appendText=" around Lower Yorgrim. North of Giant's Heart and east of Windhelm.\n\nThere are some giants lurking around the settlement. Be careful around them, or else they might attack you."},
        ["Talk to Hanmaer Furmender"] =
            {appendText=". She's staying at the fishing camp around Lower Yorgrim, southeast of Windhelm and directly north of Ragnthar. A bit after the crossroad south of Windhelm, across the upper road to the east. Belofa Frostmoon is sitting in front of the fishing camp."},
    },


[GetQuestName(4055)] = { --"A Cure For Droi"--Chaos
        ["Collect Kyne's Breath"] =
            {appendText=". The red flowers that grow around the great rune stones of Kynesgrove. There is usually two soldiers and a witch around the stones."},
        ["Talk to Fresgil"] =
            {appendText=" in the keeper's house. It's the biggest building to the west side of town, close to a well."},
    },

[GetQuestName(4030)] = { --"Shrine of Corruption"--Chaos
        ["Find the Missing Brigade"] =
            {appendText=""},
        ["Talk to the Soldiers Through the Door"] =
            {appendText=". Look for the Keeper's Home at the Western part of town. There is a well close by it."},
        ["Prove You Are Not a Witch"] =
            {appendText=". Get 3 Amulets of Kyne from the enemy soldiers at Kynesgrove."},
        ["Bring Amulets to the Safe House"] =
            {appendText=". It's the biggest building to the west of town, close to a well."},
        ["Talk to the Soldiers in the House"] =
            {appendText="in the building at the western part of town. There is a well close by it."},
        ["Search for Clues to the Keepers' Whereabouts"] =
            {appendText=".\n\nFind the key for the keeper's dresser on enemy soldiers in Kynesgrove. The dresser is in their home, at the western part of town. There is a well close by it.\n\nThe Hymn to Kyne can be found on enemy soldiers in Kynesgrove..\n\nSearch the witch atop a rock, west of the town's lake."},
        ["Talk to Captain Alhana 1"] =
            {appendText="at the Keeper's Home at the Western part of town. There is a well close by it.", stepTextKey="I gathered the clues to the Keepers' fate: a hymn book, a soldier's journal, and the strange ramblings of the witch Leifnar. I should return to Captain Alhana and tell her what I found."},
        ["Enter the Locked House"] =
            {appendText=" at the eastern side of town. There is also a a bag sitting by the tree in front of the house that might be worth looking into."},
        ["Search the House for Clues"] =
            {appendText=""},
        ["Talk to Captain Alhana 2"] =
            {appendText="", stepTextKey="Alhana followed me into the house. I should let her know what I discovered."},
    },

    [GetQuestName(4138)] = { --"Alchemical Analysis" --Tahir
        ["Find the Alchemist Shop in Fort Amol"] =
            {appendText=". It should be marked on my map of Fort Amol."},
        ["Ask Aleeto to Examine the Ore"] =
            {appendText=". I should tell her of it's qualities too- maybe she'll know what this metal is."},
        ["Get the Varla Stone Tincture"] =
            {appendText=". It should be stored somewhere, maybe on a table or shelf."},
        ["Give the Tincture to Aleeto"] =
            {appendText="."},
        ["Find Ovuld's Study of Metallurgic Anomalies"] =
            {appendText=". It must be somewhere near the riverbank."},
        ["Return Ovuld's Book to Aleeto"] =
            {appendText=", back at the Uncanny Alembic."},
        ["Observe the Experiment"] =
            {appendText=". Aleeto looks like she knows what she's doing... I hope."},
        ["Talk to Aleeto"] =
            {appendText=". I should make sure she's okay."},
    },

[GetQuestName(4204)] = { --"Bath Time"--Tahir
        ["Find Grida Meadmoon"] =
            {appendText=". I should stick to the road to see if I can find the town."},
        ["Read Grida's Note"] =
            {appendText=". It might have an explanation as to what happened here."},
        ["Collect Mudcrab Claws"] =
            {appendText="\nI can find mudcrab laws by killing mudcrabs, usually found around moist regions of Tamriel. The river may be a good place to look."},
        ["Collect Troll Fat"] =
            {appendText="\nI can find troll fat by killing trolls and collecting their fat. Trolls are quite large and common in Eastmarch, it's hard to miss them. They can't be too far."},
        ["Collect Daril"] =
            {appendText=". The note might mention something about where to find this. The argonian encampment must be well-hidden if it hasn't been thrashed by trolls yet, it can't be out in the open."},
        ["Grind Ingredients at the Mill"] =
            {appendText=". It should be close by to the wreckage of the town, up on the hill."},
        ["Talk to Dralof Waterwalker 1"] =
            {appendText=". He should be where I met him, south of the Ratmaster's Prowl.", stepTextKey="As I ground the bath salts ingredients, Grida appeared. She was some kind of undead creature. I wonder if the bath salts had anything to do with her condition? I should speak to Dralof about this."},
        ["Talk to Dralof Waterwalker 2"] =
            {appendText="", stepTextKey="I decided to give Dralof the bath salts. He's a big Nord and he knows the risks."},
    },


    [GetQuestName(4126)] = { --"Labor Dispute"--Tahir
        ["Collect Stormfist Weapons"] =
            {appendText="\nIf I defeat Stormfist soldiers, I can take their weapons."},
        ["Find Tridi"] =
            {appendText=". She must be somewhere in the mine."},
        ["Find Nedrek"] =
            {appendText=". He too must be in the mine — maybe Eitaki knows where he is."},
        ["Talk to Jomund"] =
            {appendText=". He should be close by to where I found Nedrek."},
    },

    [GetQuestName(4128)] = { --"Mystery Metal"
        ["Find Ore Sample"] =
            {appendText=". It should be in the chamber deeper into the mine."},
        ["Collect Research Notes"] =
            {appendText=". I should have a description of where it is in my journal."},
        ["Talk to Jomund 1"] =
            {appendText=", who should be waiting outside of the chamber for me.", stepTextKey="I recovered the hidden research notes and retrieved the ore sample from Magister Osanne. I should find Jomund and let him know what happened."},
        ["Gather More Ore Samples"] =
            {appendText="\nI should beware of any trolls that lie ahead."},
        ["Exit the Mine"] =
            {appendText=". I should leave the way I came."},
        ["Talk to Jomund 2"] =
            {appendText=". He should be near one of the lodges.\n", stepTextKey="The weapons I provided allowed the miners to drive off the Orcthane's troops. Lost Knife Cave Mine is once again free. I should talk to Jomund and hand over the ore samples."},
    },

-- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC -- DC -- DC -- DC -- -- DC -- DC -- DC

}