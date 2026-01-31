
SMODS.Joker{ --New Joker
    key = "newjoker",
    config = {
        extra = {
            odds = 100,
            dollars0 = 250
        }
    },
    loc_txt = {
        ['name'] = 'New Joker',
        ['text'] = {
            [1] = '{C:green}5 in 100{} Chance to win 250 Dollars on the Jokers.CC/{C:attention}Shop{} Promo code: {X:money,C:white}GIFT!{}',
            [2] = '{C:inactive}(Every card bought has a chance to give 250 Dollars){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["blitzstv_blitzstv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 5, card.ability.extra.odds, 'j_blitzstv_newjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_670afe9e', 5, card.ability.extra.odds, 'j_blitzstv_newjoker', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 250
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(250), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }