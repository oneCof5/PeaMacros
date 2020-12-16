function PeaMacros:DefaultMacros_ROGUE()
	local macroLib = {
		[259] = { -- Assassination
			["PeaMacro01"] = "#showtooltip\n/use [mod:CTRL]Instant Poison;[mod:SHIFT]Vanish;Stealth",
			["PeaMacro02"] = "#showtooltip\n/use [mod:SHIFT] Fan of Knives;Mutilate",
			["PeaMacro03"] = "#showtooltip\n/use [mod:SHIFT] Slice and Dice;Garrote",
			["PeaMacro04"] = "#showtooltip\n/use [mod:SHIFT]Shiv;Envenom",
			["PeaMacro05"] = "#showtooltip\n/use [mod:CTRL,@mouseover,nodead][mod:ALT,@focus,nodead][mod:SHIFT,@player][@target]Bag of Tricks(Racial)",
			["PeaMacro06"] = "#showtooltip\n#showtooltip\n/use [stealth]Cheap Shot\n/stopmacro [stealth]\n/use Kidney Shot",
			["PeaMacro07"] = "#showtooltip\n/use [@mouseover,harm,nodead][@focus,harm,nodead][]Kick",
			["PeaMacro08"] = "#showtooltip\n/use [@mouseover,harm,nodead][]Shadowstep",
			["PeaMacro09"] = "#showtooltip\n/use [@mouseover,help,nodead][@focus,help,nodead][@targettarget,help,nodead][]Tricks of the Trade",
			["PeaMacro10"] = "#showtooltip\n/use [mod:SHIFT] Grappling Hook;Sprint",
			["PeaMacro11"] = "#showtooltip\n/use Crimson Vial",
			["PeaMacro12"] = "#showtooltip\n/use Evasion",
		},
		[260] = { -- Outlaw
      ["PeaMacro01"] = "#showtooltip\n/use [mod:CTRL]Instant Poison;[mod:SHIFT]Vanish;Stealth",
      ["PeaMacro02"] = "#showtooltip\n/use [stealth] Slice and Dice\n/stopmacro [stealth]\n/use [mod:SHIFT] Blade Flurry;Sinister Strike",
      ["PeaMacro03"] = "#showtooltip\n/use [mod:SHIFT] Slice and Dice;Pistol Shot",
      ["PeaMacro04"] = "#showtooltip\n/use [mod:SHIFT]Between the Eyes;Dispatch",
      ["PeaMacro05"] = "#showtooltip\n/use [mod:CTRL,@mouseover,nodead][mod:ALT,@focus,nodead][mod:SHIFT,@player][@target]Bag of Tricks(Racial)",
      ["PeaMacro06"] = "#showtooltip\n#showtooltip\n/use [stealth]Cheap Shot\n/stopmacro [stealth]\n/use Kidney Shot",
      ["PeaMacro07"] = "#showtooltip\n/use [@mouseover,harm,nodead][@focus,harm,nodead][]Kick",
      ["PeaMacro08"] = "#showtooltip\n/use [mod:CTRL]Distract;[@mouseover,harm,nodead][]Shadowstep",
      ["PeaMacro09"] = "#showtooltip\n/use [mod:CTRL]Bag of Tricks;[@mouseover,help,nodead][@focus,help,nodead][@targettarget,help,nodead][]Tricks of the Trade",
      ["PeaMacro10"] = "#showtooltip\n/use [mod:SHIFT] Grappling Hook;Sprint",
      ["PeaMacro11"] = "#showtooltip\n/use Crimson Vial",
      ["PeaMacro12"] = "#showtooltip\n/use Evasion",
		},
		[261] = { --Subtlety
			["PeaMacro01"] = "#showtooltip\n/use [mod:CTRL]Instant Poison;[mod:SHIFT]Vanish;Stealth",
      ["PeaMacro02"] = "#showtooltip\n/use [mod:SHIFT]Shuriken Storm;[stealth]Shadowstrike;Backstab",
			["PeaMacro03"] = "#showtooltip\n/use [stealth]Symbols of Death\n/stopmacro[stealth]\n/use [mod:SHIFT] Slice and Dice;Rupture",
      ["PeaMacro04"] = "#showtooltip\n/use [mod:SHIFT]Black Powder;Eviscerate",
      ["PeaMacro05"] = "#showtooltip Shadow Dance\n/use [mod:SHIFT]Shadow Dance\n/use [mod:SHIFT]Shuriken Storm\n/use [mod:SHIFT]Symbols of Death\n/stopmacro [mod:SHIFT]\n/use Shadow Dance\n/use Shadowstrike\n/use Symbols of Death",
			["PeaMacro06"] = "#showtooltip\n#showtooltip\n/use [stealth]Cheap Shot\n/stopmacro [stealth]\n/use Kidney Shot",
			["PeaMacro07"] = "#showtooltip\n/use [@mouseover,harm,nodead][@focus,harm,nodead][]Kick",
			["PeaMacro08"] = "#showtooltip\n/use [@mouseover,harm,nodead][]Shadowstep",
			["PeaMacro09"] = "#showtooltip\n/use [@mouseover,help,nodead][@focus,help,nodead][@targettarget,help,nodead][]Tricks of the Trade",
      ["PeaMacro10"] = "#showtooltip\n/use [mod:SHIFT]Shadow Blades;Sprint",
			["PeaMacro11"] = "#showtooltip\n/use Crimson Vial",
			["PeaMacro12"] = "#showtooltip\n/use Evasion",
		},
		[1453] = { -- Unassigned
			["PeaMacro01"] = "#showtooltip\n",
			["PeaMacro02"] = "#showtooltip\n",
			["PeaMacro03"] = "#showtooltip\n",
			["PeaMacro04"] = "#showtooltip\n",
			["PeaMacro05"] = "#showtooltip\n",
			["PeaMacro06"] = "#showtooltip\n",
			["PeaMacro07"] = "#showtooltip\n",
			["PeaMacro08"] = "#showtooltip\n",
			["PeaMacro09"] = "#showtooltip\n",
			["PeaMacro10"] = "#showtooltip\n",
			["PeaMacro11"] = "#showtooltip\n",
			["PeaMacro12"] = "#showtooltip\n",
		},
	}
	return macroLib
end
