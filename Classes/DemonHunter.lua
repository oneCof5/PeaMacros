function PeaMacros:DefaultMacros_DEMONHUNTER()
	local macroLib = {
		[577] = { -- Havoc
      ["PeaMacro01"] = "#showtooltip\n/use [mod:CTRL]Spectral Sight;[mod:SHIFT,@mouseover,harm,nodead][mod:SHIFT]Throw Glaive;Fel Rush",
			["PeaMacro02"] = "#showtooltip\n/use [mod:CTRL,@mouseover,harm,nodead][mod:CTRL,@focus,harm,nodead][]Imprison;[mod:SHIFT,@mouseover,harm,nodead][mod:SHIFT,@focus,harm,nodead][]Consume Magic;Shear",
      ["PeaMacro03"] = "#showtooltip\n/use [mod:SHIFT]Blade Dance;[@mouseover,harm,nodead][]Chaos Strike",
      ["PeaMacro04"] = "#showtooltip\n/use Eye Beam\n/use 13\n/use 14",
      ["PeaMacro05"] = "#showtooltip\n/use [@player][mod:ALT,@cursor] Metamorphosis",
      ["PeaMacro06"] = "#showtooltip\n/use [mod:CTRL]Immolation;[mod:SHIFT]Vengeful Retreat;Chaos Nova",
			["PeaMacro07"] = "#showtooltip\n/use [@mouseover,harm,nodead][] Disrupt",
      ["PeaMacro08"] = "#showtooltip\n",
      ["PeaMacro09"] = "#showtooltip\n",
      ["PeaMacro10"] = "#showtooltip\n",
      ["PeaMacro11"] = "#showtooltip\n/use Darkness",
      ["PeaMacro12"] = "#showtooltip\n/use Blur",
		},
		[581] = { -- Vengeance
      ["PeaMacro01"] = "#showtooltip\n/use [mod:CTRL]Spectral Sight;[mod:SHIFT,@mouseover,harm,nodead][mod:SHIFT]Throw Glaive;[mod:ALT,@cursor][]Infernal Strike",
      ["PeaMacro02"] = "#showtooltip\n/use [mod:CTRL,@mouseover,harm,nodead][mod:CTRL,@focus,harm,nodead][]Imprison;[mod:SHIFT,@mouseover,harm,nodead][mod:SHIFT,@focus,harm,nodead][]Consume Magic;Shear",
      ["PeaMacro03"] = "#showtooltip\n/use [talent:3/3,mod:SHIFT]Soul Cleave;[talent:3/3]Spirit Bomb; Soul Cleave\n/use 13\n/use 14",
      ["PeaMacro04"] = "#showtooltip\n/use Fel Devastation\n/use 13\n/use 14",
      ["PeaMacro05"] = "#showtooltip\n/use [@player][mod:ALT,@cursor] Metamorphosis",
      ["PeaMacro06"] = "#showtooltip\n/use [mod:SHIFT,mod:CTRL,@cursor][mod:SHIFT,@player]Sigil of Flame;Immolation Aura",
      ["PeaMacro07"] = "#showtooltip\n/use [mod:SHIFT,mod:CTRL][mod:SHIFT,@player]Sigil of Misery;[mod:CTRL]Sigil of Silence;[@mouseover,harm,nodead][] Disrupt",
      ["PeaMacro08"] = "#showtooltip\n",
      ["PeaMacro09"] = "#showtooltip\n",
      ["PeaMacro10"] = "#showtooltip\n",
      ["PeaMacro11"] = "#showtooltip\n/use [mod:SHIFT]Arcane Torrent;Demon Spikes",
      ["PeaMacro12"] = "#showtooltip\n/use [@mouseover,harm,nodead][@foucs,harm,nodead][]Fiery Brand",
		},
		[1456] = { -- Unassigned
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
