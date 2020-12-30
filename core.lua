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
function PeaMacros:PeaPrint(msg)
	print("|cffff00ffPeaMacros|r: " .. msg)
end

-- update our spec info
function PeaMacros:UpdatePlayerSpecInfo()

	currentSpec = GetSpecialization()
	SpecID = GetSpecializationInfo(currentSpec)

end

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
				PeaMacros:PeaPrint("Negative, Ghostrider, the pattern is full.\nCan't create any more character macros.")
				do return end
			else
				CreateMacro(name, QUESTION_MARK, body, 1)
				PeaMacros:PeaPrint("Created ", name, " for you!")
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

-- ON EVENT SECTION
function PeaMacros:PLAYER_SPECIALIZATION_CHANGED()
	-- this fires on a talent change or a specialization change

	PeaMacros:UpdatePlayerSpecInfo()

	if SpecID ~= oldSpecID then
		PeaMacros:SwapMacros() -- new spec, reload
		oldSpecID = SpecID -- save for later
	end

end

-- Initialization on PLAYER_LOGIN
function PeaMacros:PLAYER_LOGIN()

	-- Get the current character class and specialization
	class = select(2,UnitClass("player"))
	PeaMacros:UpdatePlayerSpecInfo()
	oldSpecID = SpecID -- save for later

	PeaMacros:SetDefaults()

	-- First time here?
	if PeaMacrosDB.InstallFlag == 0 then
		PeaMacros:PeaPrint("Welcome! Creating initial class/spec macros.")
		PeaMacros:SwapMacros()
		PeaMacrosDB.InstallFlag = 1
	end

	-- start watching for changes to specialization
	PeaMacros:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")

	-- clean up unnecessary watch
	PeaMacros:UnregisterEvent("PLAYER_LOGIN")
end

--SLASH COMMAND SECTION
SlashCmdList["PEAMACROS"] = function(arg)
	if arg == "reset" then
		PeaMacros:SetDefaults(true)
		PeaMacros:SwapMacros()
	else
		PeaMacros:PeaPrint("To reset macros, you must enter '/pmac reset'. ")
	end
end
SLASH_PEAMACROS1 = "/pmac"
