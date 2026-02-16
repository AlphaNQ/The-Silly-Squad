SMODS.Joker {
    atlas = 'joker',
    key = 'kitsune',
	pos = { x = 2, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.SO() end,
    discovered = true,
    rarity = 3,
    cost = 10,
    config = { extra = { ace_odds = 8, fave_odds = 16 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_favour
        local ace_num, ace_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.ace_odds)
        local fave_num, fave_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.fave_odds)
        return { vars = { ace_num, ace_denom, fave_num, fave_denom } }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                -- Seal Application
                if scored_card:get_id() == 14 then
                    if SMODS.pseudorandom_probability(card, 'tss_kitsune', 1, card.ability.extra.fave_odds) then
                        if not card.ability.tss_favour or not card.ability.tss_burned then
                            scored_card:set_seal("tss_favour")              --Applies Kit's Favor
                        end
                        return {
                            message = localize('k_kiss'),                   --Shows message under Joker
                            colour = G.C.SECONDARY_SET.Planet
                        }
                    end
                -- Ace Conversion
                else
                    if SMODS.pseudorandom_probability(card, 'tss_kitsune', 1, card.ability.extra.ace_odds) then
                        SMODS.change_base(scored_card, nil, 'Ace')          --Turns card into Ace   
                        return {
                            message = localize('k_poof'),                   --Shows message under Joker
                            colour = G.C.SECONDARY_SET.Planet
                        }
                    end
                end
            end
        end
    end
}