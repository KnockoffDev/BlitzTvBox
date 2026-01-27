
SMODS.Joker{ --Commercial Break
    key = "commercialbreak",
    config = {
        extra = {
            Mult = 0,
            XMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Commercial Break',
        ['text'] = {
            [1] = '{C:red}+2{} Mult After every {C:attention}Shop{} passed,',
            [2] = '{C:red}+3{} Mult every {C:attention}Shop Reroll{} Bought,',
            [3] = '{X:mult,C:white}x0.25{} Mult Every {C:spectral}Spectral{} card used. .',
            [4] = '{C:inactive}[Currently {}{C:red}+#1#{}{C:inactive} and {}{X:red,C:white}x#2#{}{C:inactive} Mult]{}'
        },
        ['unlock'] = {
            [1] = 'Beat a run with 12 Blinds skipped.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult, card.ability.extra.XMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.Mult,
                extra = {
                    Xmult = card.ability.extra.XMult
                }
            }
        end
        if context.ending_shop  then
            return {
                func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 2
                    return true
                end
            }
        end
        if context.reroll_shop  then
            return {
                func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 3
                    return true
                end
            }
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' then
                return {
                    func = function()
                        card.ability.extra.XMult = (card.ability.extra.XMult) + 0.25
                        return true
                    end,
                    message = "Ghastly!"
                }
            end
        end
    end,
    check_for_unlock = function(self,args)
        if args.type == "win" then
            local count = 0
            return G.GAME.skips > to_big(12)
        end
        return false
    end
}