
local ApplyTemplate = ApplyTemplateToControl

-----------------------------------------------------------
-- Attribute Bars
-----------------------------------------------------------

-- Templates
ApplyTemplate(ZO_PlayerAttribute, 'ALT_PlayerAttribute')

-- Disable Health Bar Unwavering Effect
-- esoui / ingame / unitattributevisualizer / modules / unwavering.lua
function ZO_UnitVisualizer_UnwaveringModule:InitializeBarValues ()
  return
end

-- Disable Health Bar Armor Effects
-- esoui / ingame / unitattributevisualizer / modules / armordamage.lua
function ZO_UnitVisualizer_ArmorDamage:InitializeBarValues ()
  return
end

-- Use Custom Template for Health Bar Shields
-- ingame / unitattributevisualizer / modules / powersield.lua
SecurePostHook(ZO_UnitVisualizer_PowerShieldModule, 'ShowOverlay', function(_, _, info) 
  ApplyTemplate(info.overlayControls[1], 'ALT_PowerShieldBar')
  ApplyTemplate(info.overlayControls[2], 'ALT_PowerShieldBar')
end)
