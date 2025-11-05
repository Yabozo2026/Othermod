CardSleeves.Sleeve {
    key = "white_sleeve",
    atlas = "white_sleeve",
    pos = { x = 0, y = 0 },
    unlocked = false,
    discovered = false,
    unlock_condition = { deck = "b_othe_white", stake = "stake_green" },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_othe_white" then
            key = self.key .. "_white_alt"
            self.config = { repetitions_j = 1 }
            vars = (self.config.repetitions_j)
        else
            key = self.key
            self.config = { repetitions = 1 }
            vars = (self.config.repetitions)
        end
        return { key = key, vars = vars }
    end,
    calculate = function(self, card, context)
        if self.get_current_deck_key() == "b_othe_white" and context.retrigger_joker_check and joker ~= card then
                if not (context.other_card.edition) then
                    return {repetitions = self.config.repetitions_j}
                end
            end
        if not self.get_current_deck_key() == "b_othe_white" then
            if(context.repetition and context.cardarea == G.play) then
                if not (context.other_card.edition or (next(SMODS.get_enhancements(context.other_card)) and not context.other_card:get_seal())) then
                    return {repetitions = self.config.repetitions}
                end
            end
        end
end
}
SMODS.Atlas {
    key = "white_sleeve",
    path = "white_sleeve.png",
    px = 71,
    py = 95
}

CardSleeves.Sleeve {
    key = "genetically_modified_sleeve",
    atlas = "genetically_modified_sleeve",
    pos = { x = 0, y = 0 },
    unlocked = false,
    discovered = false,
    unlock_condition = { deck = "b_othe_genetically_modified", stake = "stake_green" },
    apply = function(self, sleeve, card)
        G.E_MANAGER:add_event(Event({
        func = function()
        SMODS.add_card{ set = "othe_deck", area = G.jokers }
        SMODS.add_card{ set = "othe_deck", area = G.jokers }
    return true
            end}))
        end
}
SMODS.Atlas {
    key = "genetically_modified_sleeve",
    path = "white_sleeve.png",
    px = 71,
    py = 95
}