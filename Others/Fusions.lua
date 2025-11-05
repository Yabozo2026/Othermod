
SMODS.Joker {
	key = "purple_deck_joker",
    atlas = "purple_deck_joker",
	rarity = "fuse_fusion",
	cost = 16,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        ease_discard(2)
        ease_hands_played(2)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
        ease_discard(-2)
        ease_hands_played(-2)
end,
}
FusionJokers.fusions:add_fusion("j_othe_red_deck_joker", nil, false, "j_othe_blue_deck_joker", nil, false, "j_othe_purple_deck_joker", 6)
SMODS.Atlas {
    key = "purple_deck_joker",
    path = "purple_deck_joker.png",
    px = 71,
    py = 95
}


SMODS.Joker {
	key = "chartreuse_deck_joker",
    atlas = "chartreuse_deck_joker",
	rarity = "fuse_fusion",
	cost = 16,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 0) + 2
        G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 2
        G.GAME.interest_cap = G.GAME.interest_cap + 10
end,
   remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 0) - 2
        G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) - 2
        G.GAME.interest_cap = G.GAME.interest_cap - 10
end,
}
FusionJokers.fusions:add_fusion("j_othe_yellow_deck_joker", nil, false, "j_othe_green_deck_joker", nil, false, "j_othe_chartreuse_deck_joker", 8)
SMODS.Atlas {
    key = "chartreuse_deck_joker",
    path = "chartreuse_deck_joker.png",
    px = 71,
    py = 95
}