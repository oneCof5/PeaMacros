PeaMacros = { }
local class, currentSpec, SpecID, oldSpecID
local QUESTION_MARK = "INV_Misc_QuestionMark"

local PMF = CreateFrame("Frame", (...), UIParent)
PMF:RegisterEvent("PLAYER_LOGIN")

PMF:SetScript("OnEvent", function(self, event, ...)
	print("Responding to ",event)
	PMF[event](self, ...)
end)

function PMF:PLAYER_LOGIN()
	-- Get the current character class
	class = select(2,UnitClass("player"))

	-- Get their current Specialization
	currentSpec = GetSpecialization()

	-- SpecializationID see the handy list via https://wow.gamepedia.com/SpecializationID
	SpecID = GetSpecializationInfo(currentSpec)
	oldSpecID = SpecID
	print("SpecID=",SpecID," and oldSpecID=",oldSpecID)

	-- Get saved variables
	PeaMacros:SetDefaults()

	-- start watching changes in macros and talent specs
	PMF:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	PMF:RegisterEvent("UPDATE_MACROS", "player")
	PMF:UnregisterEvent("PLAYER_LOGIN")

end

function PMF:PLAYER_SPECIALIZATION_CHANGED()
	-- check if we're still the same spec
	-- this fires when talents are changed in the spec

	currentSpec = GetSpecialization()
	SpecID = GetSpecializationInfo(currentSpec)
	print("SpecID=",SpecID," and oldSpecID=",oldSpecID)
	if SpecID ~= oldSpecID then
		PeaMacros:SwapMacros() -- new spec, reload
	end
	-- save for later
	oldSpecID = SpecID

end

function PMF:UPDATE_MACROS()
	-- check each local macro and update saved variables for this spec.
	-- this saves the user's personal preference over the default addon values
	for i=121,138 do
		local n, i, b = GetMacroInfo(i)
		if PeaMacrosDB.ClassMacros[SpecID][n] then
			PeaMacrosDB.ClassMacros[SpecID][n] = b
		end
	end
	-- To Do:  Add in a checker to see if each of the macros we expect is still here?
end

function PeaMacros:SetDefaults()

	if not PeaMacrosDB then
		PeaMacrosDB = {} -- establish empty table

		-- Build the starter macro bodies
		if (class == "WARRIOR") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_WARRIOR()

		elseif (class == "PALADIN") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_PALADIN()

		elseif (class == "HUNTER") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_HUNTER()

		elseif (class == "ROGUE") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_ROGUE()

		elseif (class == "PRIEST") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_PRIEST()

		elseif (class == "DEATHKNIGHT") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_DEATHKNIGHT()

		elseif (class == "SHAMAN") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_SHAMAN()

		elseif (class == "MAGE") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_MAGE()

		elseif (class == "WARLOCK") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_WARLOCK()

		elseif (class == "MONK") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_MONK()

		elseif (class == "DRUID") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_DRUID()

		elseif (class == "DEMONHUNTER") then
			PeaMacrosDB.ClassMacros = self:DefaultMacros_DEMONHUNTER()

		end

	end

end

-- helper function to sort the macro table
function PeaMacros:TableSort(t, order)
  -- collect the keys
  local keys = {}
  for k in pairs(t) do keys[#keys+1] = k end

  -- if order function given, sort by it by passing the table and keys a, b,
  -- otherwise just sort the keys
  if order then
      table.sort(keys, function(a,b) return order(t, a, b) end)
  else
      table.sort(keys)
  end

  -- return the iterator function
  local i = 0
  return function()
      i = i + 1
      if keys[i] then
          return keys[i], t[keys[i]]
      end
  end
end

function PeaMacros:SwapMacros()

	-- Update the macros
	for name,body in PeaMacros:TableSort(PeaMacrosDB.ClassMacros[SpecID]) do
		-- check if this macro exists
		local mexists = GetMacroIndexByName(name)
		if mexists ~= 0 then -- macro found with this name, edit the existing
			EditMacro(mexists, name, nil, body)
		else -- macro not found, so create it if there's room
			local _, numMacs = GetNumMacros()
			if numMacs >= 17 then
				print("You've got too many character macros, chief.")
				return
			else
				CreateMacro(name, QUESTION_MARK, body, 1)
				print("Created ", name, " for you!")
			end
		end

	end

	-- Update the Macro Panel if needed
	if MacroFrame and MacroFrame:IsShown() then
		MacroFrame_Update()
	end

end

-- Add SLASH COMMAND to reset to defaults
-- TO DO
