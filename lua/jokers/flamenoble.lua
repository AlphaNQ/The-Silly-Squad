SMODS.Joker {
    atlas = "joker",
	key = "flame",
	pos = { x = 1, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Quake)
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.SO)
	end end,
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
        if context.after and context.cardarea == G.jokers then
            local trigger = false
            for k, scored_card in ipairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, 'tss_flame', 1, card.ability.extra.burn_odds) then
                    trigger = true
                    scored_card:set_seal("tss_burned")
	            end
            end
            if trigger then
                trigger = false
                return {
                    message = localize('k_burn'),
                    colour = HEX('660000')
                }
            end
        end
    end
}