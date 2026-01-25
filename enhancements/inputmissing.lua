
SMODS.Enhancement {
    key = 'inputmissing',
    pos = { x = 1, y = 0 },
    config = {
        mult = 4,
        extra = {
            odds = 16,
            odds2 = 20,
            mult0 = 10,
            xmult0 = 2.2
        }
    },
    loc_txt = {
        name = 'Input Missing',
        text = {
            [1] = 'has no rank or suit,',
            [2] = 'Guaranteed {C:red}+2{} Mult,',
            [3] = '{C:green}1 in 16{} Chance to add {C:red}+10{} Mult to the score.',
            [4] = '{C:green}1 in 20{} Chance to Multiply the Mult by {X:mult,C:white}x2.2{}.'
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
        return {vars = {2}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_6e896235', 1, card.ability.extra.odds, 'j_blitzstv_inputmissing', false) then
                SMODS.calculate_effect({mult = 10}, card)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_954a9d6f', 1, card.ability.extra.odds2, 'j_blitzstv_inputmissing', false) then
                SMODS.calculate_effect({Xmult = 2.2}, card)
            end
        end
    end
}