


-- Settings menu

local ImmQuests = ImmersiveQuests
local addOnName = ImmQuests.name
local author = ImmQuests.author
local version = ImmQuests.version

-----
--LAM Panel
-----

local panelData = {
	type = "panel",
	name = GetString(IMMERSIVE_QUESTS_NAME),
	displayName = GetString(IMMERSIVE_QUESTS_NAME),
	author = author,
	version = version,
}

local checkboxVal = false
local optionsTable = {
	{
		type = "header",
		name = "|cc00001We are recruting Creative Writers!|r",
		width = "full",
	},

	{
		type = "description",
		title = "|cc0000Want to make ESO more immersive, reminiscent of TES3? Solve quests with lore-friendly journal directions, not just relying on compass or map waypoints. Join us as a Creative Writer for the Immersive Quest addon! Earn up to 400k gold per written quest and receive items, motifs, or custom homes and furniture as rewards for your contributions!|r",
		width = "full",
	},
	{
		type = "header",
		name = "|cff00ffVerify Directions & Provide Feedback|r",
		width = "full",
	},

	{
		type = "description",
		title = "|cff00ffYou have the opportunity to provide feedback on the accuracy and effectiveness of the quest directions. If you find any misleading information, you may be eligible for a bounty of up to 250,000 Gold, and the writers would also love to hear where they excelled.|r",
		width = "full",
	},


	{
		type = "header",
		name = "|cff8555Quests-Lines & Zones That Are Being Playtested|r",
		width = "full",
	},
	{
		type = "description",
		title = "|cff8555Malabal Tor - Reaper's March - Deshaan - Shadowfen - Eastmarch - Side Quests of Rift|r",
		width = "full",
	},
	{
		type = "divider",
		width = "full",
	},

	{
		type = "header",
		name = "|c3CB371Quests-Lines & Zones That Are Finished|r",
		width = "full",
	},
	{
		type = "description",
		title = "|c3CB371Tutorial - Soul Shriven in Coldharbour - Bal Foyen - Bleakrock Isle - Stonefalls - Khenarthi's Roost - Auridon - Grahtwood - Greenshade|r",
		width = "full",
	},


	{
		type = "header",
		type = "checkbox",
		name = "Writer Mode",
		getFunc = function() return IMMERSIVE_QUESTS_VARS.settings.writer end,
		setFunc = function(value) IMMERSIVE_QUESTS_VARS.settings.writer = value end,
		tooltip = "Select this to allow recording quest data",
		width = "full",
	},
	{
		type = "divider",
		width = "full",
	},
	{
		type = "button",
		name = "Join Discord Team",
		func = function()
				RequestOpenUnsafeURL("https://discord.gg/vumx2FAVGZ")
				end,
		tooltip = GetString(IMMERSIVE_QUESTS_DISCORD_TOOLTIP),
		width = "half",
	},
	{
		type = "button",
		name = "Direction Feedback",
		func = function()
				MAIN_MENU_KEYBOARD:ShowScene("mailSend") 
				MAIL_SEND.to:SetText("@OneSkyGod")
				MAIL_SEND.subject:SetText(GetString(IMMERSIVE_QUESTS_NAME))
			end,
			--Replace above function with this if you want to link it to the Discord instead (and replace Discord link with a valid one)
			--[[function()
				RequestOpenUnsafeURL("https://discord.gg/xxxxxxxxx")
			end]]
		tooltip = GetString(IMMERSIVE_QUESTS_BUTTON_TOOLTIP),
		width = "half",
	},
	{
		type = "button",
		name = "Tutorial for Contributors",
		func = function()
				RequestOpenUnsafeURL("https://www.youtube.com/watch?v=IvJWXWKPP-I")
				end,
		tooltip = GetString(IMMERSIVE_QUESTS_YOUTUBE_TOOLTIP),
		width = "half",
	},
	{
		type = "button",
		name = "Directions FlowChart",
		func = function()
				RequestOpenUnsafeURL("https://imgur.com/gallery/hb4KnWF")
				end,
		tooltip = GetString(IMMERSIVE_QUESTS_FLOWCHART),
		width = "half",
	},
	{
		type = "button",
		name = "List of Immersion Addons",
		func = function()
				RequestOpenUnsafeURL("https://forums.elderscrollsonline.com/en/discussion/574549/immersion-addons-and-settings-ultimate-list")
				end,
		tooltip = GetString(IMMERSIVE_QUESTS_ADDONS_TOOLTIP),
		width = "half",
	},
	{
		type = "header",
		name = "|c33ccccCreative Writers - Playtesters - Proofreaders:|r",
		width = "full",
	},
	{
		type = "description",
		title = "|c33ccccRosque - mouch30 - @ARKANOBOT - Johnyfreeman - @NaomiFriz - Chaos Blaze - IggyTheMad - kayreb -  westrany - BEASTESS - Kalindria - Tahir - Litinum - Szyler - Teaji  - OneSkyGod - @Carnassia - Darktalon - @Dagoth_Ur - TJ - WishPib - Sasquehanna - @Silmuriliam - charleevada - @thepandalore - @MatchedPython96 - Rheum - @ThatOneApple - @Tes96 - @derpy_mushroom - Kelinmiriel - AgrigemLeo - Quillfox - silverstarships - MSTie - ArealDisciple - Tornaad|r",
		width = "full",
	},
	{
		type = "divider",
		width = "full",
	},

	{
		type = "header",
		name = "|cff00ffBenefactors:|r",
		width = "full",
	},
	{
		type = "description",
		title = "Thanks to the following for supporting our team",
		text = "|cff00ffSena Hyeleth:Digital Artist - Futerko - @Carnassia - @Kitten620 - B O Y E T R O N Fugnus Hazard - Peach - Fa-fa - @deek268/legion - Gary90 -|r",
		width = "full",
	},
	{
		type = "divider",
		width = "full",
	},

}

function ImmQuests.LoadSettings()
	local LAM = LibAddonMenu2
	LAM:RegisterAddonPanel(addOnName, panelData)
	LAM:RegisterOptionControls(addOnName, optionsTable)
end