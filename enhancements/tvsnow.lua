
SMODS.Enhancement {
    key = 'tvsnow',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 30,
        extra = {
            odds = 12,
            odds2 = 6,
            xchips0 = 2,
            chips0 = 11
        }
    },
    loc_txt = {
        name = 'Tv Snow',
        text = {
            [1] = 'has no rank or suit,',
            [2] = 'Guaranteed {C:blue}+4{} Chips,',
            [3] = '{C:green}1 in 6{} Chance to add {C:blue}+11{} Chips to the score.',
            [4] = '{C:green}1 in 12{} Chance to Multiply the Chips by {X:chips,C:white}x2{}.'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 6,
    loc_vars = function(self, info_queue, card)
        return {vars = {4}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_8641fb05', 1, card.ability.extra.odds, 'j_blitzstv_tvsnow', false) then
                SMODS.calculate_effect({x_chips = 2}, card)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_6e896235', 1, card.ability.extra.odds2, 'j_blitzstv_tvsnow', false) then
                SMODS.calculate_effect({chips = 11}, card)
            end
        end
    end
}