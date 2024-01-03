local ImmQuests = ImmersiveQuests

local addOnName = ImmQuests.name
local localization = ImmQuests.localization
local strFmt = zo_strformat
local cr = CHAT_ROUTER

local QuestPopup = {}

local function IsValidToShowPopup()
	return SCENE_MANAGER:IsShowingBaseScene() or SCENE_MANAGER:IsShowing(QUEST_JOURNAL_KEYBOARD.sceneName)
end

local showPopup
local function ShowPopup()
	local isHidden = QuestPopup.popupCtrl:IsHidden()
	showPopup = isHidden -- Because it will be unhidden if hidden, etc.

	QuestPopup.popupCtrl:SetHidden(not isHidden)

	if not isHidden then
		QuestPopup.editBoxesCtrl:SetHidden(not isHidden)
	end
end

function ImmersiveQuestsShowPopup()
	ShowPopup()
end

----------
--Constants + Locals
----------

local questId
local stepNumToShow = 1
local MAX_CHARS_FOR_QUEST_ID = 5
local MAX_CHARS_FOR_IMM_QUEST_DESC = 5000
local MAX_CHARS_FOR_GENERATED_OUTPUT = 15000
local MAX_OBJECTIVES_PER_STAGE = 5
local MAX_OBJECTIVES_SAME_NAME = 20

----------
--XML Local Functions
----------

local function GetSavedVarsQuestDataLocal(questId)
	local savedVars = IMMERSIVE_QUESTS_VARS
	local immQuestData = savedVars.immersiveQuestData

	if questId then
		return immQuestData[questId]
	end

	return immQuestData
end

local function GetEditBoxCtrls(control)
	local qp = QuestPopup
	return qp.editBoxesCtrl, qp.copyPasteEditBoxCtrl, qp.immQuestsDescCtrl
end

local function BuildTextForNewJournalQuest(journalQuestIndex)
	local questName, bgText, activeStepText = GetJournalQuestInfo(journalQuestIndex)
	local objectiveTexts = {}

	local goalCondition, _, _, _, goalBackgroundText, goalDescription = GetJournalQuestEnding(journalQuestIndex)

	if goalCondition == "" then
		-- If not at final quest stage
		local conditions = {}

		for i=1, GetJournalQuestNumConditions(journalQuestIndex, QUEST_MAIN_STEP_INDEX) do
			local conditionText, _, _, isFailCondition, _, _, isVisible = GetJournalQuestConditionInfo(journalQuestIndex, QUEST_MAIN_STEP_INDEX, i)
			
			if not conditions[conditionText] then
				conditions[conditionText] = true

				if isVisible and not isFailCondition and conditionText ~= "" then
					objectiveTexts[i] = {}
					objectiveTexts[i].objective = strFmt(SI_QUEST_OR_CONDITION_FORMAT, conditionText:gsub(":.*", ""))
				end
			end
		end
	else
		-- If at final quest stage
		objectiveTexts[1] = {}
		objectiveTexts[1].objective = strFmt(SI_QUEST_OR_CONDITION_FORMAT, goalCondition:gsub(":.*", ""))
	end

	return questName, (goalDescription ~= "" and goalDescription) or activeStepText, objectiveTexts
end

local function UpdateTextForPopup(questName, stepText, objectiveTexts)
	local backdrop = QuestPopup.backdrop

	local questNameLabel		=		backdrop:GetNamedChild("QuestName")
	local questStepTextLabel	=		backdrop:GetNamedChild("QuestStepText")
	local questObjectivesLabel	=		backdrop:GetNamedChild("QuestObjective") 

	local questObjectives = QuestPopup.objectiveTemplates

	-- Update XML labels/etc.
	questNameLabel:SetText(strFmt("<<1>>: <<2>>", GetString(IMMERSIVE_QUESTS_QUEST_NAME), questName))
	questStepTextLabel:SetText(strFmt("<<1>>:\n<<2>>", GetString(IMMERSIVE_QUESTS_STEP_TEXT), stepText))
	questObjectivesLabel:SetText(GetString(IMMERSIVE_QUESTS_OBJECTIVES))

	for i=1, MAX_OBJECTIVES_PER_STAGE do
		local objective = (objectiveTexts[i] and objectiveTexts[i].objective) or ""
		questObjectives[i].button:SetText(objective)
		questObjectives[i].button:SetHidden(objective == nil or objective == "")
	end
end

local function RefreshPopupOnQuestIdChange()
	local backdrop = QuestPopup.backdrop
	local questNameLabel = backdrop:GetNamedChild("QuestName")
	local questIdEditBox = backdrop:GetNamedChild("QuestIdEditBox")

	-- Check if data for this quest has been input
	local inputQuestId = questId
	local inputQuestName = (type(inputQuestId) == "number" and GetQuestName(inputQuestId)) or ""

	local immQuestData = GetSavedVarsQuestDataLocal()

	if inputQuestName == "" then
		questName = GetString(IMMERSIVE_QUESTS_UNKNOWN_QUEST)
		UpdateTextForPopup(questName, stepText, {})

		QuestPopup.editBoxesCtrl:SetHidden(true)
	else
		if not immQuestData[inputQuestId] then
			local journalQuestIndex, journalQuestName
			for i = 1, GetNumJournalQuests() do
				journalQuestName = GetJournalQuestName(i)
				if inputQuestName == journalQuestName then
					journalQuestIndex = i
					break
				end
			end

			if not IMMERSIVE_QUESTS_VARS.settings.writer then
				questName = GetString(IMMERSIVE_QUESTS_BLOCKED_QUEST)
				UpdateTextForPopup(questName, stepText, {})
			elseif inputQuestName == journalQuestName then
				local questName, stepText, objectiveTexts = BuildTextForNewJournalQuest(journalQuestIndex)
				UpdateTextForPopup(questName, stepText, objectiveTexts)

				immQuestData[inputQuestId] = {}
				immQuestData[inputQuestId].questName = inputQuestName
				immQuestData[inputQuestId].steps = {
					[1] = {
						stepText = stepText,
						objectiveTexts = objectiveTexts,
					},
				}

				-- Used for smaller table to cycle, in order to do comparisons to check repeat objectives within a quest (necessary?)
				immQuestData[inputQuestId].objectiveListComplete = {unpack(objectiveTexts)}
			else
				questName = GetString(IMMERSIVE_QUESTS_UNKNOWN)
				UpdateTextForPopup(questName, stepText, {})
			end
		else
			local questData = immQuestData[inputQuestId]
			local questName, stepText, objectiveTexts = questData.questName, questData.steps[stepNumToShow].stepText, questData.steps[stepNumToShow].objectiveTexts

			UpdateTextForPopup(questName, stepText, objectiveTexts or {})
		end
	end
end

----------
--XML Global Functions
----------

function ImmersiveQuests_QuestPopup_OnShow(control)
	RefreshPopupOnQuestIdChange()
end

function ImmersiveQuests_QuestPopup_OnInitialized(control)
	QuestPopup.popupCtrl = control
	QuestPopup.backdrop = control:GetNamedChild("Backdrop")
end

function ImmersiveQuests_QuestIdShowTooltip(control)
	local backdrop = QuestPopup.backdrop
	InitializeTooltip(ImmQuestsQuestIdTooltip, backdrop, TOPLEFT, -340, 0, TOPLEFT)

	local text = GetString(IMMERSIVE_QUESTS_QUEST_ID_HELP_TOOLTIP)
	ImmQuestsQuestIdTooltip:AddLine(text, "", ZO_NORMAL_TEXT:UnpackRGB())
end

function ImmersiveQuests_QuestIdHideTooltip(control)
	ClearTooltipImmediately(ImmQuestsQuestIdTooltip)
end

function ImmersiveQuests_OnQuestIdEditBoxInitialized(control)
	questId = tonumber(control:GetText())
	control:SetMaxInputChars(MAX_CHARS_FOR_QUEST_ID)

	control:SetHandler("OnTextChanged", function()
		stepNumToShow = 1
		questId = tonumber(control:GetText())
		RefreshPopupOnQuestIdChange()
	end, addOnName.."QuestIdEditBox")
end

function ImmQuests_EditBoxes_OnInitialized(control)
	QuestPopup.editBoxesCtrl = control
	local immQuestsDescCtrl = control:GetNamedChild("ImmQuestsDescEditBox")
	QuestPopup.copyPasteEditBoxCtrl = control:GetNamedChild("OutputEditBox")

	immQuestsDescCtrl:SetMaxInputChars(MAX_CHARS_FOR_IMM_QUEST_DESC)
	QuestPopup.copyPasteEditBoxCtrl:SetMaxInputChars(MAX_CHARS_FOR_GENERATED_OUTPUT)

	control:SetHandler("OnHide", function()
		QUEST_JOURNAL_KEYBOARD:RefreshDetails()
	end, addOnName..control:GetName())

	immQuestsDescCtrl:SetHandler("OnTextChanged", function()
		local questObjectives = QuestPopup.objectiveTemplates
		local immQuestData = GetSavedVarsQuestDataLocal()

		for i=1, MAX_OBJECTIVES_PER_STAGE do
			if questObjectives[i].clicked then
				immQuestDesc = immQuestsDescCtrl:GetText()
				immQuestData[questId].steps[stepNumToShow].objectiveTexts[i].immQuestDesc = immQuestDesc
			end
		end
	end, addOnName..immQuestsDescCtrl:GetName())

	QuestPopup.immQuestsDescCtrl = immQuestsDescCtrl
end

function ImmersiveQuests_Objective_OnClicked(control)
	local labelCtrl = control:GetLabelControl()
	local objectiveText = labelCtrl:GetText()
	if not objectiveText or objectiveText == "" then return end

	local editBoxesCtrl, copyPasteCtrl, immQuestsDescCtrl = GetEditBoxCtrls(control)
	if immQuestsDescCtrl:GetParent():IsHidden() == false and editBoxesCtrl:IsHidden() == false then
		--immQuestsDescCtrl:GetParent():SetHidden(true)
		editBoxesCtrl:SetHidden(true)

		return
	end

	local questData = GetSavedVarsQuestDataLocal(questId)

	if not questData then return end

	copyPasteCtrl:GetParent():SetHidden(true)

	local immersiveQuestDesc
	local questObjectivesCtrl
	local questObjectives = QuestPopup.objectiveTemplates

	for i=1, MAX_OBJECTIVES_PER_STAGE do
		if control == questObjectives[i].button then
			questObjectives[i].clicked = true
			immersiveQuestDesc = questData.steps[stepNumToShow].objectiveTexts[i].immQuestDesc
		else
			questObjectives[i].clicked = false
		end
	end

	immQuestsDescCtrl:SetText(immersiveQuestDesc or "")
	immQuestsDescCtrl:GetParent():SetHidden(false)
	editBoxesCtrl:SetHidden(false)
end

function ImmersiveQuests_Spellcheck_OnClicked(control)
	local editBoxesCtrl, copyPasteCtrl, immQuestsDescCtrl = GetEditBoxCtrls(control)
	if copyPasteCtrl:GetParent():IsHidden() == false and editBoxesCtrl:IsHidden() == false then
		--copyPasteCtrl:GetParent():SetHidden(true)
		editBoxesCtrl:SetHidden(true)

		return
	end

	local questData = GetSavedVarsQuestDataLocal(questId)	
	if not questData then return end

	immQuestsDescCtrl:GetParent():SetHidden(true)

	local immQuestData = GetSavedVarsQuestDataLocal(questId)
	if not immQuestData then return end

	local steps = immQuestData.steps
	if not steps then return end

	local objectivesTable = {}
	for stepNum, step in ipairs(steps) do
		for objNum, objectiveTexts in ipairs(step.objectiveTexts) do
			local objective = objectiveTexts.objective
			local immQuestDesc = objectiveTexts.immQuestDesc

			objectivesTable[#objectivesTable + 1] = strFmt("<<1>>|<<2>>", objective, immQuestDesc)
		end
	end

	local toSpellcheck = table.concat(objectivesTable, "\n")
	copyPasteCtrl:SetText(toSpellcheck)

	copyPasteCtrl:GetParent():SetHidden(false)
	editBoxesCtrl:SetHidden(false)
end

function ImmersiveQuests_CreateCode_OnClicked(control)
	local editBoxesCtrl, copyPasteCtrl, immQuestsDescCtrl = GetEditBoxCtrls(control)
	if copyPasteCtrl:GetParent():IsHidden() == false and editBoxesCtrl:IsHidden() == false then
		--copyPasteCtrl:GetParent():SetHidden(true)
		editBoxesCtrl:SetHidden(true)

		return
	end

	immQuestsDescCtrl:GetParent():SetHidden(true)

	local questData = GetSavedVarsQuestDataLocal(questId)
	if not questData then return end

	local steps = questData.steps
	if not steps then return end

	local function ReplaceCharsForOutput(str)
		return str:gsub('"', '\\\"'):gsub("\n", "\\n")
	end

	objectivesCodeOutput = strFmt('	[<<1>>(<<2>>)] = { --"<<3>>"', 'GetQuestName', questId, ReplaceCharsForOutput(GetQuestName(questId)))

	for _, step in ipairs(steps) do
		local stepText = step.stepText

		for _, objectiveTexts in ipairs(step.objectiveTexts) do
			local objective = objectiveTexts.objective:gsub("• ", "")
			local immQuestDesc = objectiveTexts.immQuestDesc or ""
			local objWithSameName

			for num in objective:gmatch("%d") do
				objWithSameName = true
				break
			end

			objectivesCodeOutput = strFmt('<<1>>\n		["<<2>>"] =', objectivesCodeOutput, ReplaceCharsForOutput(objective))
			objectivesCodeOutput = strFmt('<<1>>\n			{<<2>>="<<3>>"', objectivesCodeOutput, "appendText", ReplaceCharsForOutput(immQuestDesc))

			if objWithSameName then
				objectivesCodeOutput = strFmt('<<1>>, <<2>>="<<3>>"', objectivesCodeOutput, "stepTextKey", ReplaceCharsForOutput(stepText))
			end

			objectivesCodeOutput = strFmt('<<1>>},,,', objectivesCodeOutput)
		end
	end

	objectivesCodeOutput = strFmt('<<1>>\n	},,,', objectivesCodeOutput)

	copyPasteCtrl:SetText(objectivesCodeOutput)

	copyPasteCtrl:GetParent():SetHidden(false)
	editBoxesCtrl:SetHidden(false)
end

function ImmersiveQuests_Button_BackStep(control)
	local questData = GetSavedVarsQuestDataLocal(questId)

	if not questData then return end
	if questData.steps[stepNumToShow-1] then
		stepNumToShow = stepNumToShow -1
	end

	RefreshPopupOnQuestIdChange()
end

function ImmersiveQuests_Button_ForwardStep(control)
	local questData = GetSavedVarsQuestDataLocal(questId)

	if not questData then return end
	if questData.steps[stepNumToShow+1] then
		stepNumToShow = stepNumToShow +1
	end

	RefreshPopupOnQuestIdChange()
end

----------
--Events and Event Handlers
----------

local function OnQuestAdvanced(e, journalQuestIndex, questName, isPushed, isComplete, mainStepChanged)
	--if isPushed then cr:AddSystemMessage("isPushed") end
	--if isComplete then cr:AddSystemMessage("isComplete") end

	if not IMMERSIVE_QUESTS_VARS.settings.writer then return end

	if mainStepChanged then
		local immQuestData = GetSavedVarsQuestDataLocal()

		local advancedQuestId
		for storedQuestId, _ in pairs(immQuestData) do
			if GetQuestName(storedQuestId) == questName then
				advancedQuestId = storedQuestId
				break
			end
		end

		-- If this quest has not been 'started' to be recorded, exit here
		if not advancedQuestId then return end

		local questData = immQuestData[advancedQuestId]
		local objectiveListComplete = questData.objectiveListComplete
		local _, stepText, objectiveTexts = BuildTextForNewJournalQuest(journalQuestIndex)

		local function UpdateOrigObjWhereDuplicateFound(origObjIndex)
			local redoObj = objectiveListComplete[origObjIndex].objective

			for stepIndex, stepData in ipairs(questData.steps) do
				for objIndex, objTextData in pairs(stepData.objectiveTexts) do
					if objTextData.objective == redoObj then
						questData.steps[stepIndex].objectiveTexts[objIndex].objective = strFmt("<<1>> <<2>>", redoObj, "1")
						objectiveListComplete[origObjIndex].objective = strFmt("<<1>> <<2>>", redoObj, "1")
						break
					end
				end
			end
		end

		for index, objectiveNew in ipairs(objectiveTexts) do
			objectiveNew = objectiveNew.objective
			
			for oldIndex, objectiveOld in ipairs(objectiveListComplete) do
				objectiveOld = objectiveOld.objective

				if objectiveOld:gsub(" %d+", "") == objectiveNew then
					local numObjectiveWithSameName = 0

             				       for stepIndex, stepData in ipairs(questData.steps) do
               				         local goalCondition = GetJournalQuestEnding(journalQuestIndex)
             				           if (not goalCondition) or goalCondition == "" then
               				             if stepData.stepText == stepText then
                 				               return
              				              end
             				           end
             				       end  

					for num in objectiveOld:gmatch("%d+") do
						num = tonumber(num)

						if num and num > 0 and num <= MAX_OBJECTIVES_SAME_NAME then
							numObjectiveWithSameName = num
							break
						end
					end

					if numObjectiveWithSameName == 0 then
						UpdateOrigObjWhereDuplicateFound(oldIndex)
						numObjectiveWithSameName = 1
					end

					objectiveTexts[index].objective = objectiveNew:gsub(strFmt(" <<1>>", numObjectiveWithSameName), ""):gsub(":.*", "")
					objectiveTexts[index].objective = strFmt("<<1>> <<2>>", objectiveTexts[index].objective, numObjectiveWithSameName + 1)
				end
			end
		end

		for _, objectiveNew in ipairs(objectiveTexts) do
			table.insert(objectiveListComplete, {objective = objectiveNew.objective})
		end

		local numStepsRecorded = #questData.steps
		questData.steps[numStepsRecorded+1] = {
			stepText = stepText,
			objectiveTexts = objectiveTexts,
		}

		if questId == advancedQuestId then
			stepNumToShow = numStepsRecorded + 1
		end
	end
end

EVENT_MANAGER:RegisterForEvent(addOnName, EVENT_QUEST_ADVANCED, OnQuestAdvanced)

local function OnPlayerActivated()
	-- Create Templates
	local objectiveTemplates = {}
	
	local backdrop = QuestPopup.backdrop
	local questObjectivesLabel = backdrop:GetNamedChild("QuestObjective") 

	for i=1, MAX_OBJECTIVES_PER_STAGE do
		objectiveTemplates[i] = {}

		objectiveTemplates[i].button = CreateControlFromVirtual("ImmersiveQuestsQuestPopupBackdropQuestObjectiveObjectives", questObjectivesLabel, "ImmQuests_ObjectivesTemplateButton", i)

		if i > 1 then
			objectiveTemplates[i].button:ClearAnchors()
			objectiveTemplates[i].button:SetAnchor(BOTTOM, objectiveTemplates[i-1].button, CENTER, 0, 60)
		end
	end

	QuestPopup.objectiveTemplates = objectiveTemplates or {}
	
	EVENT_MANAGER:UnregisterForEvent(addOnName.."UI", EVENT_PLAYER_ACTIVATED)
end

EVENT_MANAGER:RegisterForEvent(addOnName.."UI", EVENT_PLAYER_ACTIVATED, OnPlayerActivated)

local function OnActionLayerChange(e, layerIndex, activeLayerIndex)
	if activeLayerIndex > 2 then
		--QuestPopup.popupCtrl:SetHidden(true)
		--QuestPopup.editBoxesCtrl:SetHidden(true)
	elseif showPopup then
		QuestPopup.popupCtrl:SetHidden(false)
	end
end

EVENT_MANAGER:RegisterForEvent(addOnName.."UI", EVENT_ACTION_LAYER_POPPED, OnActionLayerChange)
EVENT_MANAGER:RegisterForEvent(addOnName.."UI", EVENT_ACTION_LAYER_PUSHED, OnActionLayerChange)

-----
-----

ZO_Dialogs_RegisterCustomDialog("ABANDON_IMM_QUEST_PROGRESS",
{
    gamepadInfo =
    {
        dialogType = GAMEPAD_DIALOGS.BASIC,
    },
    title =
    {
        text = IMMERSIVE_QUESTS_ABANDON_WRITING,
    },
    mainText = 
    {
        text = GetString(SI_CONFIRM_ABANDON_QUEST),
    },
    buttons =
    {
        [1] =
        {
            text =      SI_ABANDON_QUEST_CONFIRM,
            callback =  function(dialog)
							local questData = GetSavedVarsQuestDataLocal(dialog.data.questId)
							if not questData then cr:AddSystemMessage(GetString(IMMERSIVE_QUESTS_ABANDON_WRITING_ERROR)) return end
							
							IMMERSIVE_QUESTS_VARS.immersiveQuestData[dialog.data.questId] = nil
							QUEST_JOURNAL_KEYBOARD:RefreshDetails()
							questId = nil

							ImmersiveQuestsQuestPopupBackdropQuestIdEditBox:SetText(nil)
                        end,
        },
        
        [2] =
        {
            text =      SI_DIALOG_CANCEL,
        }
    }
})

function ImmersiveQuestsAbandonWritingQuest()
	if questId and type(questId) == "number" and questId > 0 then 
		ZO_Dialogs_ShowPlatformDialog("ABANDON_IMM_QUEST_PROGRESS", {questId = questId}, {mainTextParams = {GetQuestName(questId)}})
	end
end