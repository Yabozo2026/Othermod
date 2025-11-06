-- Skeleton for creating an object
-- code made so that the joker can add hands to the current amount
SMODS.ObjectType({
    key = "othe_Food", -- The prefix is not added automatically so it's recommended to add it yourself
    default = "j_ice_cream",
    cards = {
        j_gros_michel = true,
        j_egg = true,
        j_ice_cream = true,
        j_cavendish = true,
        j_turtle_bean = true,
        j_diet_cola = true,
        j_popcorn = true,
        j_ramen = true,
        j_selzer = true,
    },
})

SMODS.ObjectType({
    key = "othe_deck", -- The prefix is not added automatically so it's recommended to add it yourself
    default = "j_othe_red_deck_joker",
    cards = {
        j_othe_anaglyph_deck_joker = true,
        j_othe_black_deck_joker = true,
        j_othe_blue_deck_joker = true,
        j_othe_green_deck_joker = true,
        j_othe_red_deck_joker = true,
        j_othe_white_deck_joker = true,
        j_othe_painted_deck_joker = true,
        j_othe_zodiac_deck_joker = true,
        j_othe_magic_deck_joker = true,
        j_othe_ghost_deck_joker = true,
        j_othe_checkered_deck_joker = true,
    },
})

SMODS.ObjectType({
    key = "othe_challenge", -- The prefix is not added automatically so it's recommended to add it yourself
    default = "j_othe_chicken_joker",
    cards = {
        j_othe_chicken = true,
        j_othe_needle_joker = true,
        j_othe_bloodsucker = true,
        j_othe_shattered = true,
        j_othe_dmca = true,
    },
})

G.localization.misc.dictionary["k_winner"] = "You won"
G.localization.misc.dictionary["k_lose"] = "Too bad"

SMODS.Joker {
    key = 'red_deck_joker',
    loc_txt = {
      name = 'Red Deck Joker',
      text = {'{C:red}+2{} discards but {C:blue}-1{} hand'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = false,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        ease_discard(2)
        ease_hands_played(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        ease_discard(-2)
        ease_hands_played(1)
end,

atlas = "red_deck_joker"
}
SMODS.Atlas {
    key = "red_deck_joker",
    path = "red_deck_joker.png",
    px = 71,
    py = 95
}


SMODS.Joker {
    key = 'yellow_deck_joker',
    loc_txt = {
      name = 'Yellow Deck Joker',
      text = {'increases interest cap by,{C:money}5{}'},

},
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 9,
   discovered = true,
   add_to_deck = function(self, card, from_debuff)
   G.GAME.interest_cap = G.GAME.interest_cap + 5
   end,
   remove_from_deck = function(self, card, from_debuff)
    G.GAME.interest_cap = G.GAME.interest_cap - 5
   end,


atlas = "yellow_deck_joker"
}
SMODS.Atlas {
    key = "yellow_deck_joker",
    path = "yellow_deck_joker.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'green_deck_joker',
    loc_txt = {
      name = 'Green Deck Joker',
      text = {'{C:money}+1${} for every remaining hand and discard'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 7,
   discovered = true,
   add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 0) + 1
        G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 1
end,
   remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand - 1
        G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard - 1
end,
atlas = "green_deck_joker"
}
SMODS.Atlas {
    key = "green_deck_joker",
    path = "green_deck_joker.png",
    px = 71,
    py = 95
}


SMODS.Joker {
    key = 'blue_deck_joker',
    loc_txt = {
      name = 'Blue Deck Joker',
      text = {'{C:blue}+2{} hands but {C:red}-1{} discard'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        ease_hands_played(2)
        ease_discard(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_hands_played(-2)
        ease_discard(1)
end,

atlas = "blue_deck_joker"
}
SMODS.Atlas {
    key = "blue_deck_joker",
    path = "blue_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'black_deck_joker',
    loc_txt = {
      name = 'Black Deck Joker',
      text = {'{C:attention}+3{} joker slots but', '{C:blue}-1{} hand and {C:red}-1{} discard'}
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
        ease_discard(-1)
        ease_hands_played(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        G.jokers.config.card_limit = G.jokers.config.card_limit - 3
        ease_discard(1)
        ease_hands_played(1)
end,
atlas = "black_deck_joker"
}
SMODS.Atlas {
    key = "black_deck_joker",
    path = "black_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'white_deck_joker',
    loc_txt = {
      name = 'white Deck Joker',
      text = {'{C:green}#2#/#3#{} chance to retrigger unmodified cards'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
   config = {extra = {odds = 3, repetitions = 1}},
   loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'white')
		return {vars = {card.ability.extra.repetitions,numerator, denominator}}
	end,
    calculate = function(self, card, context)
        if (context.repetition and context.cardarea == G.play) then
            if not (context.other_card.edition or (next(SMODS.get_enhancements(context.other_card)) and not context.other_card:get_seal())) then
                if SMODS.pseudorandom_probability(card, 'white_deck_joker', 1, card.ability.extra.odds) then
                return {repetitions = card.ability.extra.repetitions}
            end
        end
    end
end,

atlas = "white_deck_joker"
}
SMODS.Atlas {
    key = "white_deck_joker",
    path = "white_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'painted_deck_joker',
    loc_txt = {
      name = 'Painted Deck Joker',
      text = {'increases hand size by {C:attention}3{}', 'but removes a joker slot'}
   },
   rarity = 1,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.hand.config.card_limit = G.hand.config.card_limit + 3
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand.config.card_limit = G.hand.config.card_limit - 3
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1

end,
    
atlas = "painted_deck_joker"
}
SMODS.Atlas {
    key = "painted_deck_joker",
    path = "painted_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'zodiac_deck_joker',
    loc_txt = {
      name = 'Zodiac Deck Joker',
      text = {'Planets and Tarots appear {C:attention}2X{} more frequently'}
   },
   rarity = 1,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.tarot_rate = G.GAME.tarot_rate*2
        G.GAME.planet_rate = G.GAME.planet_rate*2
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.tarot_rate = G.GAME.tarot_rate/2
        G.GAME.planet_rate = G.GAME.planet_rate/2
end,
    
atlas = "zodiac_deck_joker"
}
SMODS.Atlas {
    key = "zodiac_deck_joker",
    path = "zodiac_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'magic_deck_joker',
    loc_txt = {
      name = 'Magic Deck Joker',
      text = {'after exiting shop create a {C:tarot}fool{} card'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        local card_type = 'Tarot'
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
             local fool = SMODS.create_card {key = "c_fool", no_edition = true}
             fool:add_to_deck()
            G.consumeables:emplace(fool)
        end
end,
atlas = "magic_deck_joker"
}
SMODS.Atlas {
    key = "magic_deck_joker",
    path = "magic_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'anaglyph_deck_joker',
    loc_txt = {
      name = 'Anaglyph Deck Joker',
      text = {'after clearing a {C:attention}Blind{} there is a {C:green}#1# in #2#{} chance', 'to gain a {C:attention}Double Tag{}'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   loc_vars = function(self, info_queue, card)
    return {vars = {G.GAME.probabilities.normal*1,2}}
end,
   discovered = true,
    calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
        if pseudorandom ('anaglyph_deck_joker') < G.GAME.probabilities.normal*1/2 then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end
end,
atlas = "anaglyph_deck_joker"
}
SMODS.Atlas {
    key = "anaglyph_deck_joker",
    path = "anaglyph_deck_joker.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'magic_deck_joker',
    loc_txt = {
      name = 'Magic Deck Joker',
      text = {'get {C:tarot,T:c_fool}#1#{} after exiting shop'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
   config = {consumables = {'c_fool', 'c_fool'}},
   loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize { type = 'name_text', key = card.ability.consumables[1], set = 'Tarot' }
            }
        }
    end,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
           G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in ipairs(card.ability.consumables) do
                    SMODS.add_card({ key = v })
                end
                return true
            end
        }))
    end
end,
atlas = "magic_deck_joker"
}
SMODS.Atlas {
    key = "magic_deck_joker",
    path = "magic_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'checkered_deck_joker',
    loc_txt = {
      name = 'Checkered Deck Joker',
      text = {'creates {C:tarot}sun{} card and {C:tarot}world{} card after leaving shop'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
   config = {consumables = {'c_sun', 'c_world'}},
   loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize { type = 'name_text', key = card.ability.consumables[1], set = 'Tarot' },
                localize { type = 'name_text', key = card.ability.consumables[2], set = 'Tarot' },
            }
        }
    end,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
           G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in ipairs(card.ability.consumables) do
                    SMODS.add_card({ key = v })
                end
                return true
            end
        }))
end
end,
atlas = "checkered_deck_joker"
}
SMODS.Atlas {
    key = "checkered_deck_joker",
    path = "checkered_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'ghost_deck_joker',
    loc_txt = {
      name = 'Ghost Deck Joker',
      text = {'{C:green}#1# in #2#{} chance to get Spectral after exiting shop'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   config = { extra = { odds = 3 } },
   cost = 5,
   discovered = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'ghost_deck_joker')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            if SMODS.pseudorandom_probability(card, 'ghost_deck_joker', 1, card.ability.extra.odds) then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {
                        message = localize('k_plus_spectral'),
                        message_card = card,
                        func = function() -- This is for timing purposes, everything here runs after the message
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Spectral',
                                        key_append = 'ghost_deck_joker' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
            end
        end
    end,
atlas = "ghost_deck_joker"
}
SMODS.Atlas {
    key = "ghost_deck_joker",
    path = "ghost_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
  key = 'torture',
  loc_txt = {
      name = 'Torture',
      text = {'{C:mult}+3{} mult after beating a blind', 'currently {C:mult}+#1#{} mult'}
  },
  rarity = 3,
  pos = {
      x = 0,
      y = 0
  },
  cost = 7,
  config = {extra = {mult = 0, mult_mod = 3}},
  discovered = true,
   loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.mult_mod}
        }
    end,
  calculate = function(self, card, context)
      if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
      end

      if context.joker_main then
        return{
            mult = card.ability.extra.mult
        }
      end
  end,

  atlas = "torture"
}
SMODS.Atlas {
    key = "torture",
    path = "torture.png",
    px = 71,
    py = 95
}

  SMODS.Joker {
    key = 'rich_get_richer',
    loc_txt = {
        name = 'Rich Get Richer',
        text = {'{C:mult}+#1#{} Mult', 'if hand is played', 'with {C:money}$30{} or more'}

    },

    rarity = 2,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        mult = 30,
        money = 30
    },
    discovered = true,
    cost = 3,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {center.ability.mult, center.ability.money}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            if G.GAME.dollars > 30 then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {card.ability.mult}
                    },
                    mult_mod = card.ability.mult,
                    colour = G.C.MULT

                }
            end
        end
    end,
    atlas="rich_get_richer"
}
SMODS.Atlas {
    key = "rich_get_richer",
    path = "rich_get_richer.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'knurples',
    loc_txt = {
      name = 'Knurples',
      text = {'{C:blue}+40{} chips per hand'},

},
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   config = {
    extra = 40

   },
   cost = 9,
   discovered = true,
   loc_vars = function (self,info_queue,center)
        return {
            vars = {center.ability.extra}
        }
   end,
   calculate = function (self,card,context)
    if context.joker_main then
    if G.GAME.current_round.hands_left > 0 then
        return {
            message = localize{type='variable',key='a_chips',vars={G.GAME.current_round.hands_left*card.ability.extra}},
            chip_mod = G.GAME.current_round.hands_left*card.ability.extra
        }
    end
    end
   end,
atlas = 'knurples'
}
   SMODS.Atlas {
    key = "knurples",
    path = "knurples.png",
    px = 71,
    py = 95
   }


SMODS.Joker {
    key = 'joker?',
    loc_txt = {
      name = 'Joker?',
      text = {'{X:mult,C:white}X#1#{} mult, increases by {X:mult,C:white}X#2#{} per cleared blind',
              '{C:green}#3#/#4#{} chance to instantly lose the run',
              'at the end of the round, denominator decreases by 2'
            }
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   config = {extra = {odds = 100, Xmult = 1.75, Xmult_mod = 0.15}},
   cost = 5,
   discovered = true,
   loc_vars = function(self,info_queue,card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'joker?')
    return { vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_mod,numerator,denominator}}
   end,
   calculate = function(self,card,context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
        card.ability.extra.odds = card.ability.extra.odds - 2
    end
    if context.joker_main then
        if SMODS.pseudorandom_probability(card, 'joker?', 1, card.ability.extra.odds) and context.fix_probability then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 5
            ease_hands_played(-5)
            return
            {
                message = localize('k_lose')
            }
        else
            return
            {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
end,
atlas = "joker?"
}
SMODS.Atlas {
    key = "joker?",
    path = "JokerQ.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'needle_joker',
    loc_txt = {
      name = 'Needle Joker',
      text = {'sets your hands to 1, adds removed hands to your discards', 'when the round ends give money equal to remaining discards', 'can only be obtained from challenge joker'
            }
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   config = { extra = {og_hands = 0, dollars = 1}},
       loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
   cost = 5,
   discovered = true,
   add_to_deck = function(self, card, from_debuff)
        card.ability.extra.og_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.og_hands - 1
        ease_hands_played(-card.ability.extra.og_hands)
        ease_hands_played(1)
        ease_discard(card.ability.extra.og_hands - 1)
   end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = card.ability.extra.og_hands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.og_hands + 1
        ease_hands_played(card.ability.extra.og_hands)
        ease_hands_played(-1)
        ease_discard(-card.ability.extra.og_hands + 1)
end,
    calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.discards_left > 0 and
            G.GAME.current_round.discards_left * (card.ability.extra.dollars) or nil
    end,
    in_pool = function(self, args)
    return not args and args.source ~= "jud"
end,
  
atlas = "needle_joker"
}
SMODS.Atlas {
    key = "needle_joker",
    path = "needle_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'chicken',
    loc_txt = {
      name = 'Chicken',
      text = {'{C:green}#2# in #3#{} chance', 'to lay a {C:dark_edition}Negative{} perishable #1#'
            }
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   config = { extra = {joker = 'j_egg', odds = 3, og_money}},
       loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'chicken_joker')
        return {vars = {localize({key = card.ability.extra.joker, set = 'Joker', type = 'name_text'}),numerator,denominator}}
    end,
   cost = 5,
   discovered = true,
   calculate = function(self, card, context)
    if context.setting_blind then
        if SMODS.pseudorandom_probability(card, 'chicken_joker', 1, card.ability.extra.odds) then
        SMODS.add_card({key = card.ability.extra.joker, stickers = {'perishable'}, force_stickers = true, edition = 'e_negative'})
        end
   end
    in_pool = function(self, args)
    return not args and args.source ~= "jud"
    end
end,
atlas = "chicken"
}
SMODS.Atlas {
    key = "chicken",
    path = "Chicken.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'd20',
    loc_txt = {
      name = 'D20',
      text = {'gives {C:money}$#1# to $#2#{} when a {C:green}probability{} is triggered',
            }
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   config = { extra = {min = 1, max = 4}},
       loc_vars = function(self, info_queue, card)
        return {vars = {math.abs(card.ability.extra.min), card.ability.extra.max}}
    end,
   cost = 5,
   discovered = true,
   calculate = function(self, card, context)
    if context.pseudorandom_result and context.result then
        local money = pseudorandom(pseudoseed('d20'), card.ability.extra.min, card.ability.extra.max)
        ease_dollars(money)
    end
end,
atlas = "d20"
}
SMODS.Atlas {
    key = "d20",
    path = "d20.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'bribery',
    loc_txt = {
      name = 'Bribery',
      text = {'increases the apperance rate of rarer jokers', 'increases reroll cost by {C:money}#1#${}'
            }
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   config = { extra = {inflation = 5, rarity_boost = 3}},
       loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.inflation, card.ability.extra.rarity_boost}}
    end,
   cost = 5,
   discovered = true,
    add_to_deck  = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.inflation
                G.GAME.current_round.reroll_cost = math.max(0,
                G.GAME.current_round.reroll_cost + card.ability.extra.inflation)
                G.GAME.raritykey_mod = (G.GAME.raritykey_mod or 1) + card.ability.extra.rarity_boost
                return true
            end
        }))
   end,
   remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.inflation
                G.GAME.current_round.reroll_cost = math.max(0,
                G.GAME.current_round.reroll_cost - card.ability.extra.inflation)
                G.GAME.raritykey_mod = (G.GAME.raritykey_mod or 1) - card.ability.extra.rarity_boost
                return true
            end
        }))
   end,
   
atlas = "bribery"
}
SMODS.Atlas {
    key = "bribery",
    path = "bribery.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'challenge_joker',
    loc_txt = {
      name = 'Challenge Joker',
      text = {'Creates challenge jokers starting boss blinds'
            }
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 10,
   calculate = function (self,card,context)
    if context.setting_blind then
        SMODS.add_card{ set = "othe_challenge", area = G.jokers }
   end
end,
   atlas = "challenge_joker"
   }
SMODS.Atlas {
    key = "challenge_joker",
    path = "challenge_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "bloodsucker",
    loc_txt = {
      name = 'Bloodsucker',
      text = {'This Joker gains {X:mult,C:white} X#1# {} Mult',
                    'per scoring {C:attention}Enhanced card{} played,',
                    'removes card {C:attention}Enhancement',
                    '{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)',
                    'Also greatly decreases the appearance rate of jokers'
            }
   },
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 7,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult_gain = 0.25, Xmult = 1.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    add_to_deck = function(self, card, from_debuff)
    G.GAME.joker_rate = 0.25
end,
    remove_from_deck = function(self, card, from_debuff)
    G.GAME.joker_rate = 1
end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.vampired = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            return true
                        end
                    }))
                end
            end
            if #enhanced > 0 then
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    in_pool = function(self, args)
    return not args and args.source ~= "jud"
    end
    end,
atlas = "bloodsucker"
   }
SMODS.Atlas {
    key = "bloodsucker",
    path = "bloodsucker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'shattered',
    loc_txt = {
      name = 'Shattered',
      text = {'Retriggers and {C:attention}breaks{} glass cards'}
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
   config = {extra = {repetitions = 1}},
   loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.repetitions}}
	end,
    calculate = function(self, card, context)
        if (context.repetition and context.cardarea == G.play) then
            if SMODS.has_enhancement(context.other_card, 'm_glass') then
                return {repetitions = card.ability.extra.repetitions, remove = true}
            end
        end
    in_pool = function(self, args)
    return not args and args.source ~= "jud"
    end
end,
atlas = "shattered"
}
SMODS.Atlas {
    key = "shattered",
    path = "shattered.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'dmca',
    loc_txt = {
      name = 'DMCA',
      text = {'At the start of the blind sell joker to the left', 'for {C:money}x#3#{} its sell value + {C:money}#1#${} (the cards sold)', 'if the total is worth {C:money}#4#${} or more then', 'it increases the sell value multiplier by #5#'}
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
   config = {extra = {price = 0, value_mod = 1, sell_mult = 1, value_max = 3, sell_mod = 0.5}},
   loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.price, card.ability.extra.value_mod, card.ability.extra.sell_mult, card.ability.extra.value_max, card.ability.extra.sell_mod}}
	end,
    calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local sold_card = G.jokers.cards[my_pos - 1]
                sold_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        -- See note about SMODS Scaling Manipulation on the wiki
                        local money = card.ability.extra.price + (sold_card.sell_cost * card.ability.extra.sell_mult)
                        card.ability.extra.price = card.ability.extra.price + card.ability.extra.value_mod
                        if money >= card.ability.extra.value_max then
                            card.ability.extra.sell_mult = card.ability.extra.sell_mult + card.ability.extra.sell_mod
                            card.ability.extra.value_max = card.ability.extra.value_max * 2
                        end
                        card:juice_up(0.8, 0.8)
                        sold_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        ease_dollars(money)
                        return true
                end
                }))
        end
        end
in_pool = function(self, args)
    return not args and args.source ~= "jud"
    end
end,
atlas = "dmca"
}
SMODS.Atlas {
    key = "dmca",
    path = "dmca.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'pagerson',
    loc_txt = {
      name = 'Pagerson',
      text = {'gives between {X:mult,C:white} X#1#{} to {X:mult,C:white}X#2#{} mult', 'increases by {X:mult,C:white} X#3#{} when playing, discarding or beating the round', 'this value increases by #6# after beating a boss blind and the minimum and maximum', 'values increases by a fifth of the maximum value', '{C:green}#4# in #5#{} chance to create a {C:spectral}soul{} card'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
    discovered = true,
    config = {extra = {Xmult_min = 1, Xmult_max = 1.5, Xmult_max_gain = 0.01, odds = 731, Xmult_max_gain_mod = 0.01}},
    loc_vars = function (self,info_queue,card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'pagerson')
        return{ vars = {card.ability.extra.Xmult_min, card.ability.extra.Xmult_max, card.ability.extra.Xmult_max_gain, numerator, denominator, card.ability.extra.Xmult_max_gain_mod}}
    end,
    calculate = function (self,card,context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'pagerson', 1, card.ability.extra.odds) then
                local card_type = 'Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local soul = SMODS.create_card {key = "c_soul", no_edition = true}
                soul:add_to_deck()
                G.consumeables:emplace(soul)
                return{
                    message = localize('k_winner')
                }
            end
        end
        if context.before or (context.end_of_round and context.main_eval) or context.pre_discard then
            card.ability.extra.Xmult_max = card.ability.extra.Xmult_max + card.ability.extra.Xmult_max_gain
        end
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            card.ability.extra.Xmult_max_gain = card.ability.extra.Xmult_max_gain + card.ability.extra.Xmult_max_gain_mod
            card.ability.extra.Xmult_max = card.ability.extra.Xmult_max + (card.ability.extra.Xmult_max - 1)/5
            card.ability.extra.Xmult_min = card.ability.extra.Xmult_min + (card.ability.extra.Xmult_max - 1)/5
        end
end,
atlas = "pagerson"
}
SMODS.Atlas {
    key = "pagerson",
    path = "Pagerson.png",
    px = 71,
    py = 95
}
