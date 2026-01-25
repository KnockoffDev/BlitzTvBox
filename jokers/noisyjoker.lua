
SMODS.Joker{ --Noisy Joker
    key = "noisyjoker",
    config = {
        extra = {
            noise_multx = 1,
            noise_chipx = 1,
            odds = 4,
            odds2 = 6,
            odds3 = 12
        }
    },
    loc_txt = {
        ['name'] = 'Noisy Joker',
        ['text'] = {
            [1] = 'Every blind selected, {C:green}1 in 4{} Chance to create {C:enhanced}Tv Snow{}, {C:green}1 in 6{} Chance to create {C:enhanced}Input Missing{}.',
            [2] = '{C:green}1 in 12{} Chance to create both {C:enhanced}Tv Snow{} and {C:enhanced}Input Missing{}.',
            [3] = 'For every {C:enhanced}Tv Snow{} and {C:enhanced}Input Missing{} Card in deck, Add {X:chips,C:white}X0.1{} and {X:mult,C:white}X0.15{}.',
            [4] = '{C:inactive}[Currently {}{X:mult,C:white}#1#{}, {X:chips,C:white}#2#{}{C:inactive}.]{}'
        },
        ['unlock'] = {
            [1] = 'Skip 8 Blinds in one run'
        }
    },
    pos = {
        x = 1,
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
    pools = { ["blitzstv_mycustom_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.blitzstv_Tv_Noise_static_Joker_CustomMod
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_blitzstv_tvsnow"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_blitzstv_tvsnow\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_blitzstv_inputmissing"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_blitzstv_inputmissing\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_blitzstv_noisyjoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_blitzstv_noisyjoker')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_blitzstv_noisyjoker')
        return {vars = {card.ability.extra.noise_multx, card.ability.extra.noise_chipx, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a0914718', 1, card.ability.extra.odds, 'j_blitzstv_noisyjoker', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_blitzstv_tvsnow
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_45bc8bc0', 1, card.ability.extra.odds2, 'j_blitzstv_noisyjoker', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_blitzstv_inputmissing
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_2_4f5e39e8', 1, card.ability.extra.odds3, 'j_blitzstv_noisyjoker', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_blitzstv_tvsnow
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_blitzstv_inputmissing
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.noise_chipx,
                extra = {
                    Xmult = card.ability.extra.noise_multx
                }
            }
        end
        if context.before and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.noise_chipx = (card.ability.extra.noise_chipx) + 0.1
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.noise_multx = (card.ability.extra.noise_multx) + 0.15
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end,
    check_for_unlock = function(self,args)
        if args.type == "win" then
            local count = 0
            return G.GAME.skips > to_big(8)
        end
        return false
    end
}