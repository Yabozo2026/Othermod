SMODS.Atlas({
    key = 'enhancements',
    path = 'enhancements.png',
    px = '71',
    py = '95'

})

SMODS.Enhancement({
    key = "wrapped",
    atlas = "enhancements",
    pos = {x = 0, y = 0},
    config = {extra = {present_points = 5, present_points_loss = 1, present_points_reset = 5}},
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card, card.ability.extra.present_points_loss, (G.GAME.othe_present_points or 5), card.ability.extra.present_points_reset}
        }
    end,
    calculate = function (self,card,context)
        if context.discard and context.other_card == card then
            G.GAME.othe_present_points = (G.GAME.othe_present_points or 5) - card.ability.extra.present_points_loss
            if G.GAME.othe_present_points == 0 and edition then
                    SMODS.add_card({ set = 'Joker' })
                    G.GAME.othe_present_points = (G.GAME.othe_present_points or 0) + card.ability.extra.present_points_reset
            end
        end
    end,
}
)