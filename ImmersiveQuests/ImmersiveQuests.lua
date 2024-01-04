local ImmQuests = ImmersiveQuests

ImmQuests.name = "ImmersiveQuests"
ImmQuests.author = "Alianym, @OneSkyGod"
ImmQuests.version = "0.0027"

local addOnName = ImmQuests.name
local localization = ImmQuests.localization
local cr = CHAT_ROUTER

----------
--Core New Code
----------
local function GetNewConditionText(questIndex, stepText, conditionText, maxCount, conditionStep)
	local journalQuestName = GetJournalQuestName(questIndex)
	local locQuestData = localization[journalQuestName] or {}

	local conditionWithoutCounter
	if maxCount and maxCount > 0 then
		conditionWithoutCounter = conditionText:gsub(":.*", "")
	end

	-- Changed this to loop through an array of objectives for the quest, since by this point it is 'scoped' down to objectives for one quest,
	--> that means that the array should never get obscenely large and looping through it won't cause any noticeable delays

	local customAppendText = ""

	-- If user-input description exists, use that
	local savedVars = IMMERSIVE_QUESTS_VARS
	local immQuestData = savedVars.immersiveQuestData

	for questId, questData in pairs(immQuestData) do
		if questData.questName == journalQuestName then
			for stage, stageData in ipairs(questData.steps) do
				if stageData.stepText == stepText then
					for obj, objData in ipairs(stageData.objectiveTexts) do
						local objective = objData.objective:gsub("• ", ""):gsub(" %d+", "")

						if objective == conditionText or objective == conditionWithoutCounter then
							customAppendText = objData.immQuestDesc
							break
						end
					end

				end
			end
			break
		end
	end

	-- If no user-input description exists, see if there is anything in a lang file
	if customAppendText == "" then
		-- ipairs only loops through numerically indexed arrays. Since our array is string indexed (keys are surrounded by "") we need to use the pairs command
		for conditionKey, conditionData in pairs(locQuestData) do
			-- This below line strips the number off the end of the conditionKey so we can compare it to the conditionText properly
			conditionKey = conditionKey:gsub(" %d", "")

			if conditionKey == (conditionWithoutCounter or conditionText) and conditionData then
				local stepTextKey = conditionData.stepTextKey

				-- This below line checks that if we have a stepTextKey, check it matches the stepText before proceeding. Otherwise, just proceed
				if (stepTextKey and stepTextKey == stepText) or (not stepTextKey) then					
					customAppendText = conditionData.appendText

					if type(customAppendText) == "table" then
						customAppendText = customAppendText[GetUnitAlliance("player")]
					end

					break
				end
			end
		end
	end

	return zo_strformat("<<1>><<2>>", conditionText, customAppendText)
end

local function BuildTextHelper(questIndex, stepIndex, conditionStep, questStrings)
	local conditionText, currentCount, maxCount, isFailCondition, isComplete, _, isVisible = GetJournalQuestConditionInfo(questIndex, stepIndex, conditionStep)

	-- This calls our new code and gets the updated conditionText
	----------
	local stepText = GetJournalQuestStepInfo(questIndex, stepIndex)
	conditionText = GetNewConditionText(questIndex, stepText, conditionText, maxCount, conditionStep)
	----------

	if isVisible and not isFailCondition and conditionText ~= "" then
		if isComplete then
			conditionText = ZO_DISABLED_TEXT:Colorize(conditionText)
		end

		local taskInfo =
		{
			name = conditionText,
			isComplete = isComplete,
		}

		table.insert(questStrings, taskInfo)
	end
end

-- Copied from ZOS' QUEST_JOURNAL_MANAGER:BuildTextForConditions(questIndex, stepIndex, numConditions, questStrings)
local function BuildTextForConditions(questIndex, stepIndex, numConditions, questStrings)
	for i = 1, numConditions do
		BuildTextHelper(questIndex, stepIndex, i, questStrings)
	end
end

-- Copied from ZOS' QUEST_JOURNAL_MANAGER:BuildTextForTasks(stepOverrideText, questIndex, questStrings)
local function BuildTextForTasks(questJournalManager, stepOverrideText, questIndex, questStrings)
	if stepOverrideText and (stepOverrideText ~= "") then
		BuildTextHelper(questIndex, QUEST_MAIN_STEP_INDEX, nil, questStrings)
	else
		local conditionCount = GetJournalQuestNumConditions(questIndex, QUEST_MAIN_STEP_INDEX)
		BuildTextForConditions(questIndex, QUEST_MAIN_STEP_INDEX, conditionCount, questStrings)
	end

	-- Because we return true in our hook, the original function will be stopped from running (which is what we want)
	return true
end

-- This sets up a "hook" so that our function will intercept QUEST_JOURNAL_MANAGER:BuildTextForTasks and run our code before their code
ZO_PreHook(QUEST_JOURNAL_MANAGER, "BuildTextForTasks", BuildTextForTasks)

----------
--Core New Code
----------
local function BuildTextForQuestComplete(questJournalManager)
	local questData = questJournalManager:GetSelectedQuestData()

	if not questData then return end

	local questIndex = questData.questIndex
	local goalCondition, _, _, _, goalBackgroundText, goalDescription = GetJournalQuestEnding(questIndex)
	
	if (not goalCondition) or goalCondition == "" then return end

	goalCondition = GetNewConditionText(questIndex, goalDescription, goalCondition)

	questJournalManager.conditionTextBulletList:Clear()
	questJournalManager.conditionTextBulletList:AddLine(goalCondition)
end

-- This sets up a "hook" so that our function will securely run after QUEST_JOURNAL_KEYBOARD:RefreshDetails and update the conditionText when the quest is
--> at the stage just prior to completion
SecurePostHook(QUEST_JOURNAL_KEYBOARD, "RefreshDetails", BuildTextForQuestComplete)

-- This sets up a "hook" so that our function will securely run after QUEST_JOURNAL_GAMEPAD:RefreshDetails and update the conditionText when the quest is
--> at the stage just prior to completion
SecurePostHook(QUEST_JOURNAL_GAMEPAD, "RefreshDetails", BuildTextForQuestComplete)

-- On Load of the AddOn
local addOnName = "ImmersiveQuests"

local function onLoad(e, addon)
	-- We only want to run this code if the AddOn being loaded is ours
	if addon ~= addOnName then return end

	-- Create/Load SavedVars
	local defaultVals = {
		settings = {},
		immersiveQuestData = {},
	}

	IMMERSIVE_QUESTS_VARS = ZO_SavedVars:NewAccountWide("ImmersiveQuestsVars", 0.1, nil, defaultVals, GetWorldName())

	-- Refreshes the quest journal to include our updated quest steps
	QUEST_JOURNAL_KEYBOARD:RefreshDetails()

	-- Load AddOn Settings
	ImmQuests.LoadSettings()

	-- Unregister once we've run it once as we don't need to call it again
	EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_ADD_ON_LOADED)
end

-- This registers the onLoad() function to be called whenever an AddOn is loaded (which is on login or /reloadui)
EVENT_MANAGER:RegisterForEvent(addOnName, EVENT_ADD_ON_LOADED, onLoad)