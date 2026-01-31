
SMODS.Joker{ --LIDAR.
    key = "lidar",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'LIDAR.',
        ['text'] = {
            [1] = 'If any card scored with a {C:attention}Stone{} or {C:attention}Red{} Seal or {C:attention}Purple{} Seal.',
            [2] = 'Retrigger and creates two copies in the deck.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["blitzstv_blitzstv_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' 
            or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_stone"] == true or context.other_card.seal == "Purple" or context.other_card.seal == "Red") then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        message = "Copied Card to Hand!",
                        colour = G.C.GREEN,
                        extra = {
                            message = "Copied Card to Hand!",
                            colour = G.C.GREEN
                        }
                    }
                }
            end
        end
    end
}