local FC = FontChanger or {}
local LAM2 = LibAddonMenu2

FC.name = "FontChanger"
FC.version = "1.3.1"

local REGULAR_FONT = "FontChanger/Fonts/FCUI.slug"
local REGULAR_FONT_BOLD = "FontChanger/Fonts/FCUI_Bold.slug"
local NAMEPLATE_FONT = "FontChanger/Fonts/FCUI.slug"
local SCT_FONT = "FontChanger/Fonts/FCUI.slug"
local CHAT_FONT = "FontChanger/Fonts/FCChat.slug"
local BOOK_FONT = "FontChanger/Fonts/FCBook.slug"

function FC:SetUIFonts()
    for key,value  in zo_insecurePairs(_G) do
        if (key):find("^Zo") and type(value) == "userdata" and value.SetFont then
		   local font = {value:GetFontInfo()}
		   -- DEFAULT USED AS REGULAR/CHAT FONT -- 
           if (font[1] == "EsoUI/Common/Fonts/Univers57.slug") or (font[1] == "EsoUI/Common/Fonts/Univers57.ttf") or (font[1] == "EsoUI/Common/Fonts/Univers57.otf") or (font[1] == "$(MEDIUM_FONT)") then
            font[1] = REGULAR_FONT
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.menu_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   -- DEFAULT USED AS BOLD FONT --
           if (font[1] == "EsoUI/Common/Fonts/Univers67.slug") or (font[1] == "EsoUI/Common/Fonts/Univers67.ttf") or (font[1] == "EsoUI/Common/Fonts/Univers67.otf") or (font[1] == "$(BOLD_FONT)") then
            font[1] = REGULAR_FONT_BOLD
			-- Default Size: 0.9 --
            font[2] = font[2] * self.SV.menu_bold_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   -- DEFAULT USED AS ANTIQUE FONT --
           if (font[1] == "EsoUI/Common/Fonts/ProseAntiquePSMT.slug") or (font[1] == "EsoUI/Common/Fonts/ProseAntiquePSMT.ttf") or (font[1] == "EsoUI/Common/Fonts/ProseAntiquePSMT.otf") or (font[1] == "$(ANTIQUE_FONT)") then
            font[1] = BOOK_FONT
			-- Default Size: 0.9 --
            font[2] = font[2] * self.SV.book_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   	-- DEFAULT USED AS HANDWRITTEN FONT --
           if (font[1] == "EsoUI/Common/Fonts/Handwritten_Bold.slug") or (font[1] == "EsoUI/Common/Fonts/Handwritten_Bold.ttf") or (font[1] == "EsoUI/Common/Fonts/Handwritten_Bold.otf") or(font[1] == "$(HANDWRITTEN_FONT)") then
            font[1] = BOOK_FONT
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.book_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   -- DEFAULT USED AS STONE TABLET FONT --
           if (font[1] == "EsoUI/Common/Fonts/TrajanPro-Regular.slug") or (font[1] == "EsoUI/Common/Fonts/TrajanPro-Regular.ttf") or (font[1] == "EsoUI/Common/Fonts/TrajanPro-Regular.otf") or (font[1] == "$(STONE_TABLET_FONT)") then
            font[1] = BOOK_FONT
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.book_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   	-- DEFAULT USED AS GAMEPAD_LIGHT_FONT --
           if (font[1] == "EsoUI/Common/Fonts/FTN47.slug") or (font[1] == "EsoUI/Common/Fonts/FTN47.ttf") or (font[1] == "EsoUI/Common/Fonts/FTN47.otf") or (font[1] == "$(GAMEPAD_LIGHT_FONT)") then
            font[1] = REGULAR_FONT
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.menu_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   -- DEFAULT USED AS GAMEPAD_MEDIUM_FONT --
           if (font[1] == "EsoUI/Common/Fonts/FTN57.slug") or (font[1] == "EsoUI/Common/Fonts/FTN57.ttf") or (font[1] == "EsoUI/Common/Fonts/FTN57.otf") or (font[1] == "$(GAMEPAD_MEDIUM_FONT)") then
            font[1] = REGULAR_FONT
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.menu_font_scale
            value:SetFont(table.concat(font, "|"))
           end
		   -- DEFAULT USED AS GAMEPAD_BOLD_FONT --
           if (font[1] == "EsoUI/Common/Fonts/FTN87.slug") or (font[1] == "EsoUI/Common/Fonts/FTN87.ttf") or (font[1] == "EsoUI/Common/Fonts/FTN87.otf") or (font[1] == "$(GAMEPAD_BOLD_FONT)") then
            font[1] = REGULAR_FONT_BOLD
			-- Default Size: 1 --
            font[2] = font[2] * self.SV.menu_font_scale
            value:SetFont(table.concat(font, "|"))
           end
        end
    end
end

function FC:SetNameplateFont(style, size)
		--/script d(GetNameplateKeyboardFont())
  local Font, CurrentFontStyle
  local NewFontAndSize = (NAMEPLATE_FONT .. size)
  -- Gamepad Mode -- 
  if IsInGamepadPreferredMode() then
    CurrentFontAndSize, CurrentFontStyle = GetNameplateGamepadFont()
    if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
	  SetNameplateGamepadFont(NAMEPLATE_FONT .. "|" .. size .. "|", style)
    end
  -- Keyboard Mode --
  else
    CurrentFontAndSize, CurrentFontStyle = GetNameplateKeyboardFont()
    if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
      SetNameplateKeyboardFont(NAMEPLATE_FONT .. "|" .. size .. "|", style)
    end
  end
end

function FC:SetSCTFont(style, size)
  local CurrentFontAndSize, CurrentFontStyle
  local NewFontAndSize = (SCT_FONT .. size)
  -- Gamepad Mode -- 
  if IsInGamepadPreferredMode() then
    CurrentFontAndSize, CurrentFontStyle = GetSCTGamepadFont()
    if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
	  SetSCTGamepadFont(SCT_FONT .. "|" .. size .. "|", style)
    end
  -- Keyboard Mode --
  else
    CurrentFontAndSize, CurrentFontStyle = GetSCTKeyboardFont()
    if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
	  SetSCTKeyboardFont(SCT_FONT .. "|" .. size .. "|", style)
    end
  end
end

function FC:ChangeChatFonts()
		--/script d(ZoFontChat:GetFontInfo())
		--/script ZoFontChat:SetFont('FontChanger/Fonts/FontChanger_ChatFont.slug|24|shadow')
		local fontStyle = CHAT_FONT
		local fontSize = GetChatFontSize()
		local fontWeight = self.SV.chat_style
		local fontName = string.format("%s|$(KB_%s)|%s", fontStyle, fontSize, fontWeight)
	    -- Entry Box --
		ZoFontEditChat:SetFont(fontName)
		-- Chat Window --
		ZoFontChat:SetFont(fontName)
		-- Size --
        CHAT_SYSTEM:SetFontSize(CHAT_SYSTEM.GetFontSizeFromSetting())
end

function FC:SetDefaults()
  -- Set Defaults --
	if self.SV.menu_font_scale == nil then
		self.SV.menu_font_scale = self.SV.default_menu_font_scale
	end
	if self.SV.menu_bold_font_scale == nil then
		self.SV.menu_bold_font_scale = self.SV.default_menu_bold_font_scale
	end
	if self.SV.book_font_scale == nil then
		self.SV.book_font_scale = self.SV.default_book_font_scale
	end
	if self.SV.nameplate_size == nil then
		self.SV.nameplate_size = self.SV.default_nameplate_size
	end
	if self.SV.nameplate_style == nil then
		self.SV.nameplate_style = self.SV.default_nameplate_style
	end
	if self.SV.sct_size == nil then
		self.SV.sct_size = self.SV.default_sct_size
	end
	if self.SV.sct_style == nil then
		self.SV.sct_style = self.SV.default_sct_style
	end
	if self.SV.chat_style == nil then
		self.SV.chat_style = self.SV.default_chat_style
	end
end

function FC:SetupEvents(toggle)
  -- EVENT_ZONE_CHANGED --
  if toggle then
    EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_ACTIVATED,  function(...) self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size) end)
	EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_ACTIVATED,  function(...) self:SetSCTFont(self.SV.sct_style, self.SV.sct_size) end)
  else
    EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_PLAYER_ACTIVATED)
  end
end

function FC:Initialise()

	local manager = GetAddOnManager()

	for i = 1, manager:GetNumAddOns() do
	local name, _, _, _, _, state = manager:GetAddOnInfo(i)
	if name == self.name then
		self.version = manager:GetAddOnVersion(i)
		end
	end
  
	-- Load Saved Variables --
	self.SV = ZO_SavedVars:NewAccountWide("FontChangerSettings", self.version, "Settings", self.defaults)
	
	-- Run Functions --
	self:SetupEvents(true)
	self:SetUIFonts()
	self:SetDefaults()
	self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size)
	self:SetSCTFont(self.SV.sct_style, self.SV.sct_size)
	self:ChangeChatFonts()
end

function FC.OnLoad(event, addonName)
	if addonName ~= FC.name then return end
	EVENT_MANAGER:UnregisterForEvent(FC.name, EVENT_ADD_ON_LOADED, FC.OnLoad)
	FC:InitialiseAddonMenu()
	FC:Initialise()
	if PerfectPixel then
		FC.OverWrite()
	end
end

EVENT_MANAGER:RegisterForEvent(FC.name, EVENT_ADD_ON_LOADED, FC.OnLoad)


-- Compatibility functions --


function FC.OverWrite()
--/script if (_G["PP"] ~= nil) then d("pp is exposed") end
--/script if PerfectPixel.PTS["@Antisenil"]["$AccountWide"].Compass.toggle then d("jup") else d("nope") end
--		local account = GetDisplayName('player')
--		local world = GetWorldName()
--		local compasstoggle = PerfectPixel.world.account["$AccountWide"].Compass.toggle
--		if compasstoggle then 
			local sizecompass = 26 * FC.SV.menu_bold_font_scale
			local font = REGULAR_FONT_BOLD .. "|" .. sizecompass .. "|soft-shadow-thick"
			COMPASS.container:SetCardinalDirection(GetString(SI_COMPASS_NORTH_ABBREVIATION),	font, CARDINAL_DIRECTION_NORTH)
			COMPASS.container:SetCardinalDirection(GetString(SI_COMPASS_EAST_ABBREVIATION),		font, CARDINAL_DIRECTION_EAST)
			COMPASS.container:SetCardinalDirection(GetString(SI_COMPASS_WEST_ABBREVIATION),		font, CARDINAL_DIRECTION_WEST)
			COMPASS.container:SetCardinalDirection(GetString(SI_COMPASS_SOUTH_ABBREVIATION),	font, CARDINAL_DIRECTION_SOUTH)
--		end
--		if PerfectPixel.world.account["$AccountWide"].KeybindStrip.toggle then
			local t = {KEYBIND_STRIP_STANDARD_STYLE, KEYBIND_STRIP_CHAMPION_KEYBOARD_STYLE}
			local sizekbsd = 25 * FC.SV.menu_bold_font_scale
			local sizekbsk = 20 * FC.SV.menu_font_scale
			for _, keybindStrip in ipairs(t) do
				keybindStrip.nameFont				= REGULAR_FONT_BOLD .. "|" .. sizekbsd .. "|outline"
				keybindStrip.keyFont				= REGULAR_FONT .. "|" .. sizekbsk
				keybindStrip.resizeToFitPadding		= 20
				keybindStrip.leftAnchorOffset		= 10
				keybindStrip.centerAnchorOffset		= 0
				keybindStrip.rightAnchorOffset		= -10
			end
--		end
end


 function FC.OverwritePPFont(control, --[[Font]] font, size, outline, --[[Alpha]] a, --[[Color]] c_r, c_g, c_b, c_a, --[[StyleColor]] sc_r, sc_g, sc_b, sc_a)
	if font then
		if font == PP.f.u57 then
			control:SetFont(string.format("%s|%s|%s", REGULAR_FONT, size, outline))
		end
		if font == PP.f.u67 then
			control:SetFont(string.format("%s|%s|%s", REGULAR_FONT_BOLD, size, outline)) --bold
		end
	end
	if a then
		control:SetAlpha(a)
	end
	if c_r and c_g and c_b and c_a then
		control:SetColor(c_r/255, c_g/255, c_b/255, c_a)
	end
	if sc_r and sc_g and sc_b and sc_a then
		control:SetStyleColor(sc_r/255, sc_g/255, sc_b/255, sc_a)
	end
end


ZO_PreHook(PP, "Font", function (...) FC.OverwritePPFont(control, --[[Font]] font, size, outline, --[[Alpha]] a, --[[Color]] c_r, c_g, c_b, c_a, --[[StyleColor]] sc_r, sc_g, sc_b, sc_a) return true end)