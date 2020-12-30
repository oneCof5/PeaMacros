local PeaMacros = CreateFrame("Frame", (...), UIParent)
PeaMacros:RegisterEvent("PLAYER_LOGIN")

-- Generic event handler
PeaMacros:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)

local class, currentSpec, SpecID, oldSpecID
local QUESTION_MARK = "INV_Misc_QuestionMark"

-- HELPER FUNCTIONS SECTION

-- Print Function
function PeaMacros:Print(msg)
	print("|cff7cfc00Pea|r|cffa9a9a9Macros|r: " .. msg)
end

-- update our spec info
function PeaMacros:UpdatePlayerSpecInfo()

	currentSpec = GetSpecialization()
	SpecID = GetSpecializationInfo(currentSpec)

end

-- set defaults
function PeaMacros:SetDefaults(reset)

	-- PeaMacrosDB is our per-character saved variable
	if not PeaMacrosDB or reset then

		if not PeaMacrosDB then
			PeaMacrosDB = {} -- establish empty table
		else
			table.wipe(PeaMacrosDB) -- on a reset wipe the existing table
		end

		PeaMacrosDB.InstallFlag = 0

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

-- Update the macros
function PeaMacros:SwapMacros()

	local ta = PeaMacrosDB.ClassMacros[SpecID] -- capture the new spec section
	local to = PeaMacrosDB.ClassMacros[oldSpecID] -- capture the prev spec section

	-- iterate over our DB
	for name,body in next, ta do

		-- check if the player already has a macro by this name
		local myMacroIndex = GetMacroIndexByName(name)

		if myMacroIndex ~= 0 then -- macro found with this name

			-- Save the macro text if different than our DB
			local myMacroBody = select(3,GetMacroInfo(myMacroIndex))

			if to[name] ~= myMacroBody then
				to[name] = myMacroBody
			end

			EditMacro(myMacroIndex, name, nil, body)

		else -- macro not found, so create it if there's room
			local _, numMacs = GetNumMacros()
			if numMacs >= 17 then
				self:Print("Negative, Ghostrider, the pattern is full.\nBad Top Gun references aside, we can't create any more character macros because you have too many.")
				do return end
			else
				CreateMacro(name, QUESTION_MARK, body, 1)
				self:Print("created ", name, " for you!")
			end
		end

		-- Update our DB
		for k,v in next, PeaMacrosDB.ClassMacros[oldSpecID] do
			PeaMacrosDB.ClassMacros[oldSpecID][k] = to[k]
		end

	end

	-- Update the Blizzard Macro Frame if needed
	if MacroFrame and MacroFrame:IsShown() then
		MacroFrame_Update()
	end

end

-- Clear Action Bar
function PeaMacros:ClearActionBar()
  for i=1,12 do
		if HasAction(i) then
    	PickupAction(i)
    	ClearCursor()
		end
  end
end

-- Populate ActionBar 1 with the current PeaMacros library items
function PeaMacros:PopulateActionBar()
	local t = PeaMacrosDB.ClassMacros[SpecID]
  for k,v in PeaMacros:SortTableByString(t) do
		local mi = GetMacroIndexByName(k)
		if mi ~= 0 then
			local aidx = tonumber(string.sub(k,9))
			if HasAction(aidx) then
	    	PickupAction(aidx)
	    	ClearCursor()
			end
	  	PickupMacro(mi)
			C_ActionBar.PutActionInSlot(aidx)
		end
  end
end

-- function to sort a string key table https://stackoverflow.com/questions/15706270/sort-a-table-in-lua
function PeaMacros:SortTableByString(t, order)
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


-- ON EVENT SECTION
function PeaMacros:PLAYER_SPECIALIZATION_CHANGED()
	-- this fires on a talent change or a specialization change

	self:UpdatePlayerSpecInfo()

	if SpecID ~= oldSpecID then
		self:SwapMacros() -- new spec, reload
		oldSpecID = SpecID -- save for later
	end

end

-- Initialization on PLAYER_LOGIN
function PeaMacros:PLAYER_LOGIN()

	-- Get the current character class and specialization
	class = select(2,UnitClass("player"))
	self:UpdatePlayerSpecInfo()
	oldSpecID = SpecID -- save for later

	-- Get saved variables
	self:SetDefaults()

	-- First time here?
	if PeaMacrosDB.InstallFlag == 0 then
		self:Print("Welcome! Creating initial class/spec macros.")
		self:SwapMacros()
		PeaMacrosDB.InstallFlag = 1
	end

	-- start watching for changes to specialization
	self:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")

	-- clean up unnecessary watch
	self:UnregisterEvent("PLAYER_LOGIN")
end

--SLASH COMMAND SECTION
SlashCmdList["PEAMACROS"] = function(arg)
	if arg == "reset" then
		PeaMacros:SetDefaults(true)
		PeaMacros:SwapMacros()
	elseif arg == "actionbar" then
		PeaMacros:PopulateActionBar()
	else
		PeaMacros:Print("Supported parameters with /pmac are:\nreset | To rebuild the class macros from defaults.\nactionbar | To populate ActionBar 1 with the current macro library (macro 1 to action bar slot 1).")
	end
end
SLASH_PEAMACROS1 = "/pmac"
