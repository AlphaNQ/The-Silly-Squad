SMODS.Joker {
    atlas = 'joker',
    key = 'kitsune',
	pos = { x = 2, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.SO)
	end end,
    discovered = true,
    rarity = 3,
    cost = 8,
    config = { extra = { ace_odds = 8, fave_odds = 16 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_favour
        local ace_num, ace_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.ace_odds)
        local fave_num, fave_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.fave_odds)
        return { vars = { ace_num, ace_denom, fave_num, fave_denom } }
    end,
    
    calculate = function(self, card, context)
        -- Ace Conversion
        if context.before and context.cardarea == G.jokers then
            for k, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() ~= 14 and SMODS.pseudorandom_probability(card, 'tss_kitsune', 1, card.ability.extra.ace_odds) then
                    SMODS.change_base(scored_card, nil, 'Ace')
                    scored_card:juice_up(0.3,0.4)
                    SMODS.calculate_effect( { message = localize('k_poof'), colour = G.C.SECONDARY_SET.Planet }, card )
                end
            end
        end
        -- Seal Application
        if context.after and context.cardarea == G.jokers then
            for k, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() == 14 and SMODS.pseudorandom_probability(card, 'tss_kitsune', 1, card.ability.extra.fave_odds) then
                    scored_card:set_seal("tss_favour")
                    SMODS.calculate_effect( { message = localize('k_kiss'), colour = G.C.SECONDARY_SET.Planet }, card )        
                end
            end
        end
    end
}