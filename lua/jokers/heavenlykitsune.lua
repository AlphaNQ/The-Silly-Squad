SMODS.Joker {
    atlas = 'joker',
    key = 'kitsune',
	pos = { x = 2, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.SO() end,
    discovered = true,
    rarity = 3,
    cost = 10,
    config = { extra = { ace_num = 1, ace_denom = 8, fave_num = 1, fave_denom = 16 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_favour
        local ace_num, ace_denom = SMODS.get_probability_vars(card, card.ability.extra.ace_num, card.ability.extra.ace_denom)
        local fave_num, fave_denom = SMODS.get_probability_vars(card, card.ability.extra.fave_num, card.ability.extra.fave_denom)
        return { vars = { ace_num, ace_denom, fave_num, fave_denom } }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                -- Seal Application
                if scored_card:get_id() == 14 then
                    if SMODS.pseudorandom_probability(card, 'tss_kitsune', card.ability.extra.fave_num, card.ability.extra.fave_denom) then
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
                    if SMODS.pseudorandom_probability(card, 'tss_arcane', card.ability.extra.ace_num, card.ability.extra.ace_denom) then
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