G.localization.misc.dictionary["k_jonked"] = "+Joker"
G.localization.misc.dictionary["k_space_up"] = "+1 slot"
G.localization.misc.dictionary["k_rue"] = "+1 hand, +1 discard"

-- Skeleton for creating an object
function randomly_redeem_voucher(no_random_please) -- xD
    -- local voucher_key = time==0 and "v_voucher_bulk" or get_next_voucher_key(true)
    -- time=1
    local voucher_key = no_random_please or get_next_voucher_key(true)
    local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
    G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})
    card:start_materialize()
    G.play:emplace(card)
    card.cost=0
    card.shop_voucher=false
    local current_round_voucher=G.GAME.current_round.voucher
    card:redeem()
    G.GAME.current_round.voucher=current_round_voucher -- keep the shop voucher unchanged since the voucher bulk may be from voucher pack or other non-shop source
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        --blockable = false,
        --blocking = false,
        delay =  0,
        func = function() 
            card:start_dissolve()
            return true
        end}))   
end

function randomly_create_joker(jokers_to_create,tag,message,extra)
    extra=extra or {}
    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
    G.E_MANAGER:add_event(Event({
        func = function() 
            for i = 1, jokers_to_create do
                local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,false)
                end
                G.jokers:emplace(card)
                card:start_materialize()
                G.GAME.joker_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'jokers',nil,nil,nil,{message = localize("k_jonked")})
                end
            end
            return true
        end}))   
end

SMODS.Atlas({
    key = 'potions',
    path = 'potions.png',
    px = '71',
    py = '95'

})
-- Borrowed from betmma
    -- function Card:redeem() -- use redeem instead of apply to run because redeem happens before modification of used_vouchers


SMODS.ConsumableType {
    key = 'potion',
    shop_rate = 8,
    collection_rows = { 4,4 },
    primary_colour = G.C.CHIPS,
    secondary_colour = G.C.MULT,
    loc_txt = {
        collection = 'Potion',
        name = 'Potion',
        label = 'Potion',
    }
}

SMODS.Consumable {
    key = 'blue_and_red',
    loc_txt = {
        name = 'Blue And Red',
        text = {'{C:green}#1#/#2#{} chance for {C:blue}+1{} hand and {C:red}+1{} discard'
        },
    },
    set = 'potion',
    atlas = "potions",
   pos = {x = 0, y = 0},
    discovered = true,
    config = { extra = {odds = 8}},
    cost = 4,
    rate = 1,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'blue_and_red')
    return { vars = {numerator,denominator}}
    end,
    use = function(self,card,area)
        if SMODS.pseudorandom_probability(card, 'blue_and_red', 1, card.ability.extra.odds) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
            ease_discard(1)
            ease_hands_played(1)
            return{
                message = localize("k_rue")
            }
    end
end,
}

SMODS.Consumable {
    key = 'backpack_brandy',
    loc_txt = {
        name = 'Backpack Brandy',
        text = {'{C:green}#1# in #2#{} chance for {C:attention}+1{} hand size and {C:attention}+1{} joker slot'
        },
    },
    set = 'potion',
    atlas = "potions",
   pos = {x = 1, y = 0},
    discovered = true,
    cost = 4,
    rate = 1,
    config = { extra = {odds = 10}},
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'backpack_brandy')
    return { vars = {numerator,denominator}}
    end,
    use = function(self,card,area)

        if SMODS.pseudorandom_probability(card, 'backpack_brandy', 1, card.ability.extra.odds) then
            G.hand.config.card_limit = G.hand.config.card_limit + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
end,
}
SMODS.Consumable {
    key = 'midas_mix',
    loc_txt = {
        name = 'Midas Mix',
        text = {'{C:green}#1# in #2#{} chance to double your money (no limit)'
        },
    },
    set = 'potion',
   atlas = "potions",
   pos = {x = 2, y = 0},
    discovered = true,
    cost = 2,
    rate = 2,
    config = { extra = {odds = 7}},
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'midas_mix')
    return { vars = {numerator,denominator}}
    end,
    use = function(self,card,area)
        if SMODS.pseudorandom_probability(card, 'midas_mix', 1, card.ability.extra.odds) then
        G.GAME.dollars = G.GAME.dollars * 2
    end
end,
}

SMODS.Consumable {
    key = 'voucher_vodka',
    loc_txt = {
        name = 'Voucher Vodka',
        text = {'{C:green}#1# in #2#{} chance to get a voucher, can give up to 5'
        },
    },
    set = 'potion',
    atlas = "potions",
   pos = {x = 3, y = 0},
    discovered = true,
    cost = 4,
    config = { extra = {odds = 10}},
    rate = 0.8,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'voucher_vodka')
    return { vars = {numerator,denominator}}
    end,
    use = function(self,card,area)
        local Card_redeem_ref = Card.redeem
        for i = 1,5 do
            if SMODS.pseudorandom_probability(card, 'voucher_vodka', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end}))
            end
    end
end,
}

SMODS.Consumable {
    key = 'joker_juice',
    loc_txt = {
        name = 'Joker Juice',
        text = {'{C:green}#1# in #2#{} chance to get a foil joker', '{C:green}#1# in #3#{} chance to get a holo joker', '{C:green}#1# in #4#{} chance to get a polychrome joker', '{C:green}#1# in #5#{} chance to either get a negative'
        },
    },
    set = 'potion',
   atlas = "potions",
   pos = {x = 4, y = 0},
    discovered = true,
    cost = 7,
    rate = 1.5,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {1,2,4,8,16}}
    end,
    use = function(self,card,area)
        local Card_redeem_ref = Card.redeem
        if pseudorandom ('joker_juice') < 1/2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={foil=true}})
                    return true
                end})) 
            elseif pseudorandom ('joker_juice') < 1/4 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={holo=true}})
                    return true
                end}))
            elseif pseudorandom ('joker_juice') < 1/8 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={polychrome=true}})
                    return true
                end}))
            elseif pseudorandom('joker_juice') < 1/16 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={negative=true}})
                    return true
                end}))
            end
        end,
        
    }



----------------------------------------------
------------MOD CODE END----------------------