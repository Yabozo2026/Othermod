return {
    ["misc"] = {
		["dictionary"] = {
            ["k_winner"] = "You won",
			["k_lose"] = "Too bad",
            ["k_jonked"] = "+Joker",
            ["k_space_up"] = "+1 slot",
            ["k_rue"] = "+1 hand, +1 discard",
		},
	},
    ["descriptions"] = {
            ["Sleeve"] = {
			    ["sleeve_othe_white_sleeve"] = {
                    ["name"] = "White Sleeve",
                    ["text"] = G.localization.descriptions.Back["b_othe_white"].text
                },
                ["sleeve_othe_white_sleeve_white_alt"] = {
                ["name"] = "White Sleeve",
                ["text"] = {
                    "can now retrigger mostly", "unmodified jokers {c:inactive} currently bugged{}"
                },
                },
                ["sleeve_othe_genetically_modified_sleeve"] = {
                    ["name"] = "Genetically Modified Sleeve",
                    ["text"] = G.localization.descriptions.Back["b_othe_genetically_modified"].text
                },
        },
            ["Joker"] = {
            ["j_othe_purple_deck_joker"] = {
                ["name"] = "Purple Deck Joker",
				["text"] = {
					'{C:red}+2{} discards and {C:blue}+2{} hands',
                    'a powerful combination of {C:red}red{} and {C:blue}blue{}'
				},
            },
            ["j_othe_chartreuse_deck_joker"] = {
                ["name"] = "Chartreuse Deck Joker",
				["text"] = {
					'{C:money}+2${} for every remaining hand', '{C:money}+1${} for every remaining discard', '{C:money}+10{} interest cap ','An intresting combination of yellow and green'
                    
				},
            },
    },
            ["Enhanced"] = {
            ["m_othe_wrapped"] = {
                ["name"] = "Wrapped Card",
				["text"] = {
					'discarding {C:attention}#3#{} wrapped cards creates a {C:joker}Joker{}',
				},
            },
    },
},
}