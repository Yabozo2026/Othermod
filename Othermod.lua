-- ```
Othermod = {}
Othermod_Mod = SMODS.current_mod
Othermod_Config = Othermod_Mod.config

if next(SMODS.find_mod("FusionJokers")) and Othermod_Config.OtherFusions == true then
    Othe_has_Fusion = true
else
	Othe_has_Fusion = false
end

SMODS.load_file("Others/Othermod_Jokers.lua")()
SMODS.load_file("Others/Backs.lua")()
SMODS.load_file("Others/Othermod_Tarots.lua")()
SMODS.load_file("Others/enhancements.lua")()
if Othe_has_Fusion == true then
SMODS.load_file("Others/Fusions.lua")()
end
if CardSleeves then
SMODS.load_file("Others/Sleeves.lua")()
end

Othermod_Mod.optional_features = function()
    return {
        retrigger_joker = true,
        quantum_enhancements = true
    }
end

loc_colour('pink')
G.ARGS.LOC_COLOURS['othermod_miracle'] = HEX("ff99dd")
G.ARGS.LOC_COLOURS['othemod_anti'] = HEX("a42d34")

SMODS.Rarity{
	key = "anti-Joker",
	default_weight = 0,
	badge_colour = HEX("a42d34"),
	pools = {["Joker"] = false},
	get_weight = function(self, weight, object_type)
			return weight
	end,
}

SMODS.Gradient {
    key = 'miracle_red',
    colours = {
        HEX("ff99dd"),
        G.C.RED,
    },
}

SMODS.Gradient {
    key = 'miracle_blue',
    colours = {
        HEX("ff99dd"),
        G.C.BLUE,
    },
}

SMODS.Gradient {
    key = 'miracle_green',
    colours = {
        HEX("ff99dd"),
        G.C.GREEN,
    },
}

SMODS.Gradient {
    key = 'miracle_rare',
    colours = {
        HEX("ff99dd"),
        G.C.RARITY.Rare
    },
}

SMODS.Gradient {
    key = 'miracle_legendary',
    colours = {
        HEX("ff99dd"),
        G.C.RARITY.Legendary
    },
}

SMODS.Gradient {
    key = 'miracle_tarot',
    colours = {
        HEX("ff99dd"),
        G.C.SECONDARY_SET.Tarot,
    },
}

SMODS.Gradient {
    key = 'miracle_planet',
    colours = {
        HEX("ff99dd"),
        G.C.SECONDARY_SET.Planet,
    },
}

SMODS.Gradient {
    key = 'miracle_spectral',
    colours = {
        HEX("ff99dd"),
        G.C.SECONDARY_SET.Spectral,
    },
}

SMODS.Gradient {
	key = 'rainbow',
	colours = {
        G.C.RED,
		G.C.FILTER,
		G.C.GOLD,
		G.C.GREEN,
		G.C.BLUE,
		G.C.PURPLE,
		HEX("ff99dd"),
	}
}



Othermod_Mod.config_tab = function()
	return {
		n = G.UIT.ROOT,
		config = { align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6 },
		nodes = {
			{ n = G.UIT.R, config = { align = "cl", padding = 0, minh = 0.1 }, nodes = {} },

			{
				n = G.UIT.R,
				config = { align = "cl", padding = 0 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cl", padding = 0.05 },
						nodes = {
							create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Other_Config, ref_value = "OtherFusions" },
						}
					},
					{
						n = G.UIT.C,
						config = { align = "c", padding = 0 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Other fusions", scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
						}
					},
				}
			},
        }
    }
end