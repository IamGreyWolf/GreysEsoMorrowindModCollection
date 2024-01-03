# ImmersiveQuests
Project for OneSkyGod

# How to Update: 
	1. Get the QuestId for the particular quest
		a. Go to https://esoitem.uesp.net/viewlog.php
		b. Type in the quest name in the search box, and filter to "Quests (Unique)" using the drop-down menu just below the search bar
		c. In the "Note" column should be a number, this is the questId
	2. Go back to the files, to the lang/en.lua (or whichever language file) and add an entry for GetQuestName(questId) following the format
	3. Add an entry for objective name and the text to append (see examples in lang/en.lua for the format)
		a. The text to append is a property of the array named appendText
		b. If the objective appears multiple times in the same quest, append numbers to the end in the format ["Objective 1"], ["Objective 2"]
			i. Add an entry for stepText (get this from the https://uesp.net entry for the quest)
		c. If the objective is 1/5 or something like that, omit that part from the condition. For example, if the condition is; "Collect Eggs: 1 / 5" then the condition should be typed as "Collect Eggs"
	4. Load into a character or /reloadui and check the Journal to see the results!