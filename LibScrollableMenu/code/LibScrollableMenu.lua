local lib = LibScrollableMenu
if not lib then return end

local MAJOR = lib.name


--------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------
--ZOs local speed-up/reference variables
local EM = GetEventManager() --EVENT_MANAGER
local tos = tostring
local sfor = string.format


--------------------------------------------------------------------
-- LSM library locals
--------------------------------------------------------------------
local constants = lib.constants
local entryTypeConstants = constants.entryTypes


local libUtil = lib.Util
local getControlData = libUtil.getControlData
local getValueOrCallback = libUtil.getValueOrCallback
local getContextMenuReference = libUtil.getContextMenuReference
local checkIfContextMenuOpenedButOtherControlWasClicked = libUtil.checkIfContextMenuOpenedButOtherControlWasClicked
local checkNextOnEntryMouseUpShouldExecute = libUtil.checkNextOnEntryMouseUpShouldExecute
local playSelectedSoundCheck = libUtil.playSelectedSoundCheck

local g_contextMenu


--------------------------------------------------------------------
-- For debugging and logging
--------------------------------------------------------------------
--Logging and debugging
local libDebug = lib.Debug
local debugPrefix = libDebug.prefix

local dlog = libDebug.DebugLog


--------------------------------------------------------------------
--SavedVariables
--------------------------------------------------------------------
local svConstants = lib.SVConstans
--local sv = lib.SV


--------------------------------------------------------------------
-- Local helper functions
--------------------------------------------------------------------
--Called from ZO_Menu's ShowMenu, if preventing the call via lib.preventLSMClosingZO_Menu == true is not enabled
--and called if the SCENE_MANAGER shows a scene
local function hideCurrentlyOpenedLSMAndContextMenu()
	local openMenu = lib.openMenu
	if openMenu and openMenu:IsDropdownVisible() then
		ClearCustomScrollableMenu()
		openMenu:HideDropdown()
	end
end


--Recursivley map the entries of a submenu and add them to the mapTable
--used for the callback "NewStatusUpdated" to provide the mapTable with the entries
local function doMapEntries(entryTable, mapTable, entryTableType)
	if libDebug.doDebug then dlog(libDebug.LSM_LOGTYPE_VERBOSE, 23) end
	if entryTableType == nil then
		-- If getValueOrCallback returns nil then return {}
		entryTable = getValueOrCallback(entryTable) or {}
	end

	for _, entry in pairs(entryTable) do
		if entry.entries then
			doMapEntries(entry.entries, mapTable)
		end

		if entry.callback then
			mapTable[entry] = entry
		end
	end
end

-- This function will create a map of all entries recursively. Useful when there are submenu entries
-- and you want to use them for comparing in the callbacks, NewStatusUpdated, CheckboxUpdated, RadioButtonUpdated
local function mapEntries(entryTable, mapTable, blank)
	if libDebug.doDebug then dlog(libDebug.LSM_LOGTYPE_VERBOSE, 24) end

	if blank ~= nil then
		entryTable = mapTable
		mapTable = blank
		blank = nil
	end

	local entryTableType, mapTableType = type(entryTable), type(mapTable)
	local entryTableToMap = entryTable
	if entryTableType == "function" then
		entryTableToMap = getValueOrCallback(entryTable)
		entryTableType = type(entryTableToMap)
	end

	assert(entryTableType == 'table' and mapTableType == 'table' , sfor("["..MAJOR..".MapEntries] tables expected, got %q = %s, %q = %s", "entryTable", tos(entryTableType), "mapTable", tos(mapTableType)))

	-- Splitting these up so the above is not done each iteration
	doMapEntries(entryTableToMap, mapTable, entryTableType)
end
lib.MapEntries = mapEntries
libUtil.MapEntries = mapEntries



------------------------------------------------------------------------------------------------------------------------
-- XML handler functions
------------------------------------------------------------------------------------------------------------------------

--Called from XML at e.g. the collapsible header's editbox, and other controls
--Used for event handlers like OnMouseUp and OnChanged etc.
function lib.XML.OnXMLControlEventHandler(owningWindowFunctionName, refVar, ...)
	--d(debugPrefix .. "lib.XML.OnXMLControlEventHandler - owningWindowFunctionName: " .. tos(owningWindowFunctionName))
	if refVar == nil or owningWindowFunctionName == nil then return end

	local owningWindow = refVar:GetOwningWindow()
	local owningWindowObject = (owningWindow ~= nil and owningWindow.object) or nil
	if owningWindowObject ~= nil then
		local owningFunctionNameType = type(owningWindowFunctionName)
		if owningFunctionNameType == "string" and type(owningWindowObject[owningWindowFunctionName]) == "function"  then
			owningWindowObject[owningWindowFunctionName](owningWindowObject, ...)
		elseif owningFunctionNameType == "function" then
			owningWindowFunctionName(owningWindowObject, ...)
		end
	end
end


--XML OnClick handler for checkbox and radiobuttons
function lib.XML.XMLButtonOnInitialize(control, entryType)
	--Which XML button control's handler was used, checkbox or radiobutton?
	local isCheckbox = entryType == entryTypeConstants.LSM_ENTRY_TYPE_CHECKBOX
	local isRadioButton = not isCheckbox and entryType == entryTypeConstants.LSM_ENTRY_TYPE_RADIOBUTTON

	control:GetParent():SetHandler('OnMouseUp', function(parent, buttonId, upInside, ...)
--d(debugPrefix .. "XML-OnMouseUp of parent-upInside: " ..tos(upInside) .. ", buttonId: " .. tos(buttonId))
		if upInside then
			if checkIfContextMenuOpenedButOtherControlWasClicked(control, parent.m_owner, buttonId) == true then return end
			if buttonId == MOUSE_BUTTON_INDEX_LEFT then
				if checkNextOnEntryMouseUpShouldExecute() then return end

				local data = getControlData(parent)
				playSelectedSoundCheck(parent.m_dropdownObject, data.entryType)

				local onClickedHandler = control:GetHandler('OnClicked')
				if onClickedHandler then
					onClickedHandler(control, buttonId)
				end

			elseif buttonId == MOUSE_BUTTON_INDEX_RIGHT then
				g_contextMenu = getContextMenuReference()

				local owner = parent.m_owner
				local data = getControlData(parent)
				local rightClickCallback = data.contextMenuCallback or data.rightClickCallback
				if rightClickCallback and not g_contextMenu.m_dropdownObject:IsOwnedByComboBox(owner) then
					if libDebug.doDebug then dlog(libDebug.LSM_LOGTYPE_VERBOSE, 173) end
					rightClickCallback(owner, parent, data)
				end
			end
		end
	end)

	if not isRadioButton then
		local originalClicked = control:GetHandler('OnClicked')
		control:SetHandler('OnClicked', function(p_control, buttonId, ignoreCallback, skipHiddenForReasonsCheck, ...)
			skipHiddenForReasonsCheck = skipHiddenForReasonsCheck or false
			if not skipHiddenForReasonsCheck then
				local parent = p_control:GetParent()
				local comboBox = parent.m_owner
				if checkIfContextMenuOpenedButOtherControlWasClicked(p_control, comboBox, buttonId) == true then return end
			end
			if checkNextOnEntryMouseUpShouldExecute() then return end

			if originalClicked then
				originalClicked(p_control, buttonId, ignoreCallback, ...)
			end
			p_control.checked = nil
		end)
	end
end

------------------------------------------------------------------------------------------------------------------------
-- Init
------------------------------------------------------------------------------------------------------------------------

--Load of the addon/library starts
local function onAddonLoaded(event, name)
	if name:find("^ZO_") then return end
	EM:UnregisterForEvent(MAJOR, EVENT_ADD_ON_LOADED)

	--Debug logging
	libDebug.LoadLogger()
	libDebug = lib.Debug
	if libDebug.doDebug then dlog(libDebug.LSM_LOGTYPE_DEBUG, 174) end

	--SavedVariables
	lib.SV = ZO_SavedVars:NewAccountWide(svConstants.name, svConstants.version, svConstants.profile, svConstants.defaults)
	--sv = lib.SV

	--Create the ZO_ComboBox and the g_contextMenu object (lib.contextMenu) for the LSM contextmenus
	lib.CreateContextMenuObject()


	--------------------------------------------------------------------------------------------------------------------
	--Hooks & ZOs code changes
	--------------------------------------------------------------------------------------------------------------------
	--Register a scene manager callback for the SetInUIMode function so any menu opened/closed closes the context menus of LSM too
	SecurePostHook(SCENE_MANAGER, 'SetInUIMode', function(self, inUIMode, bypassHideSceneConfirmationReason)
		if not inUIMode then
			ClearCustomScrollableMenu()
		end
	end)

	--Register a scene manager callback for the Show function so any menu opened/closed closes the context menus of LSM too
	SecurePostHook(SCENE_MANAGER, 'Show', function(self, ...)
		hideCurrentlyOpenedLSMAndContextMenu()
	end)

	--ZO_Menu - ShowMenu hook: Hide LSM if a ZO_Menu menu opens
	ZO_PreHook("ShowMenu", function(owner, initialRefCount, menuType)
		if libDebug.doDebug then dlog(libDebug.LSM_LOGTYPE_VERBOSE, 175, tos(#ZO_Menu.items), tos(menuType)) end
		--Do not close on other menu types (only default menu type supported)
		if menuType ~= nil and menuType ~= MENU_TYPE_DEFAULT then return end

		--No entries in ZO_Menu -> nothign will be shown, abort here
		if next(ZO_Menu.items) == nil then
			return false
		end
		--Should the ZO_Menu not close any opened LSM? e.g. to show the textSearchHistory at the LSM text filter search box
		if lib.preventLSMClosingZO_Menu then
			lib.preventLSMClosingZO_Menu = nil
--d("[ShowMenu]preventLSMClosingZO_Menu: " ..tos(lib.preventLSMClosingZO_Menu))
			return
		end
		hideCurrentlyOpenedLSMAndContextMenu()
		return false
	end)


	--------------------------------------------------------------------------------------------------------------------
	--Slash commands
	--------------------------------------------------------------------------------------------------------------------
	SLASH_COMMANDS["/lsmdebug"] = function()
		libDebug.debugLoggingToggle("debug")
	end
	SLASH_COMMANDS["/lsmdebugverbose"] = function()
		libDebug.debugLoggingToggle("debugVerbose")
	end
end
EM:UnregisterForEvent(MAJOR, EVENT_ADD_ON_LOADED)
EM:RegisterForEvent(MAJOR, EVENT_ADD_ON_LOADED, onAddonLoaded)





------------------------------------------------------------------------------------------------------------------------
-- Notes | Changelog | TODO | UPCOMING FEATURES
------------------------------------------------------------------------------------------------------------------------

--[[
---------------------------------------------------------------
	NOTES
---------------------------------------------------------------



---------------------------------------------------------------
	CHANGELOG Current version: 2.35 - Updated 2025-04-06
---------------------------------------------------------------
Max error #: 2025_31

[KNOWN PROBLEMS]


[WORKING ON]

[Fixed]
-2025_6:	If multiSelection is enabled: LSM test Entry having a submenu AND a callback is selectable -> should not be the case
-2025_7:	If multiselection is enabled: LSM test Maximum number of selectable entries (maxNumSelections) is not working (maybe after submenus were opened)
-2025_8:	Removed globally leaking variables
-2025_9:	If multiSelection is disabled: Entries opening a submenu, having a callback, do not select the submenu entry anymore
-2025_12:   multiselection options added will properly pass in the whole options table as param to the callback function now
-2025_13:	ContextMenu: Clicked outside will close the contextmenu now first and leave the other LSM menus opened
-2025_14:   For multiselect: Replace PlaySound with LSM sound handler for selected entry
-2025_16:   ContextMenu: Clicking a checkbox in a context menu's submenu will close the contextmenu. LSM test, entry "Submenu entry 6" -> nested submenus -> Checkbox
-2025_15:   ContextMenu: If one opens a nested submenu of a nested submenu, the total context menu closes all of sudden? LSM test, entry "Submenu entry 6" -> nested submenus -> OnMouseEnter of the 2nd depth submenu closes all
-2025_17:   Clicking a button still plays the click sound even if options.selectedSoundDisabled was set to true
-2025_18:   ContextMenu: Clicking any non-contextmenu submenu entry below the context menu, will select the submenu entry and close the submenu (but it should only close the contextmenu)
-2025_19:   ContextMenu: Clicking a context menu entry where multiselection is enabled, but the clicked entry of the context menu is not above the LSM (in background) anymore, the context menu closes even though an entry was clicked
-2025_20:   ContextMenu: Clicking a context menu's submenu entry where multiselection is enabled, but the clicked entry of the context menu is not above the LSM (in background) anymore, the context menu closes even though an entry was clicked
-2025_21:   ContextMenu: If multiSelection is disabled in a contextmenu by default the list of the menu was always empty
-2025_22:   ContextMenu: Trying to show a context menu on another context menu will just clear and hide the contextmenu now
-2025_23:   ContextMenu: Clicking the reset button closes the contextmenu
-2025_24:   ContextMenu: If one opens a nested submenu of a nested submenu, and then onMouseEnter another context menu entry, the submenu stays opened
-2025_25:   If multiselection is enabled: Selecting a ZO_Menu context menu entry at the filter header context menu sets cntxTxtSearchEntryClicked = true, and if you directly click outside the combobox/dropdown, or at the dropdown's open/close main control afterwards, the dropdown does not close anymore
-2025_26:   Filter header: If the filter header filtered all items and we left click the "No search results" entry it will call the callback of another LSM control (looks like the last entry of m_sortedItems of that combobox) all of sudden?
-2025_27: 	ContextMenu: Opening an LSM contextMenu, after another was used before, does use some options of the before opened LSM contextMenu then (e.g. the filter header) -> Reset of all options on each contextMenu open
-2025_28: 	ContextMenu: API function RunCustomScrollableMenuItemsCallback is not respecting the parameter fromParentMenu
-2025_29	ContextMenu: Opening a contextmenu on another control, while another LSM was opened, cleared the contextMenu entries
-2025_30:   ContextMenu: Opening a contextmenu sometimes does not change the maximum width of the entries properly


[Added]
-2025_10:	If multiselection is enabled: Submenus with a selection can show the submenu arrow colored differently. option.multiSelectSubmenuSelectedArrowColor defines the color to use (default is white)
-2025_11:	If multiselection is not enabled: Submenus can show the submenu arrow colored differently. option.submenuArrowColor defines the color to use (default is white)

[Changed]
-2025_5:	Split up into several files

[Removed]


---------------------------------------------------------------
TODO - To check (future versions)
---------------------------------------------------------------
	1. Make Options update same style like updateDataValues does for entries
	2. Attention: zo_comboBox_base_hideDropdown(self) in self:HideDropdown() does NOT close the main dropdown if right clicked! Only for a left click... See ZO_ComboBox:HideDropdownInternal()
	3. verify submenu anchors. Small adjustments not easily seen on small laptop monitor
	- fired on handlers dropdown_OnShow dropdown_OnHide
	4. If header is enabled and the filter is enabled, you right clicked the editbox of the filter header, and choose an entry: Next left click outside does not close the opened dropdown)

---------------------------------------------------------------
UPCOMING FEATURES  - What could be added in the future?
---------------------------------------------------------------
	1. Sort headers for the dropdown (ascending/descending) (maybe: allowing custom sort functions too)
	2. LibCustomMenu and ZO_Menu replacement (currently postponed, see code at branch LSM v2.4) due to several problems with ZO_Menu (e.g. zo_callLater used by addons during context menu addition) and chat, and other problems
]]