SMODS.Joker {
    atlas = "joker",
	key = "flame",
	pos = { x = 1, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Quake() end,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { burn_odds = 5 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_burned
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.burn_odds)
        return { vars = { numerator, denominator } }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
                if SMODS.pseudorandom_probability(card, 'tss_flame', 1, card.ability.extra.burn_odds) then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if not card.ability.tss_burned or not card.ability.tss_favour then
                        scored_card:set_seal("tss_burned")
                    end
	            end
                return {
                    message = localize('k_burn'),
                    colour = HEX('660000')
                }
            end
        end
    end
}