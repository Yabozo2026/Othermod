SMODS.Atlas({
    key = 'Decks',
    path = 'Decks.png',
    px = '71',
    py = '95'

})

SMODS.Back {
    key = "white",
    loc_txt = {
      name = 'White Deck',
      text = {'retriggers unmodified cards'                                        
            }
   },
    atlas = "Decks",
  pos = {x = 0, y = 0},
    config = {repetitions = 1},
    loc_vars = function(self, info_queue, card)
	return {vars = {self.config.repetitions}}
	end,
    calculate = function(self, card, context)
        if (context.repetition and context.cardarea == G.play) then
            if not (context.other_card.edition or (next(SMODS.get_enhancements(context.other_card)) and not context.other_card:get_seal())) then
                return {repetitions = self.config.repetitions}
            end
        end
end,
}

SMODS.Back {
    key = "genetically_modified",
    loc_txt = {
      name = 'Genetically Modified Deck',
      text = {'creates 2 {C:othe_rainbow}deck{} jokers'                                        
            }
   },
    atlas = "Decks",
  pos = {x = 0, y = 0},
    apply = function(card,self)
        G.E_MANAGER:add_event(Event({
        func = function()
        SMODS.add_card{ set = "othe_deck", area = G.jokers }
        SMODS.add_card{ set = "othe_deck", area = G.jokers }
          return true
            end}))
        end       
}