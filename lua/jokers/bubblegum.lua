if not next(SMODS.find_mod("ellejokers")) then return end

SMODS.Joker{
    atlas = 'joker',
    key = 'bubble',
    pos = { x = 9, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Xtra() end,
    unlocked = false,
    rarity = 4,
    cost = 20,
    config = { extra = { xmult_mod = 0.2 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult_mod * alpha_bsky_count } }
	end,

    calculate = function(self, card, context)
        if context.end_of_round then alpha_update_follower_count() end
        if context.joker_main then
            if card.ability.extra.xmult ~= 1 then
                return {
                    Xmult = alpha_bsky_count * card.ability.extra.xmult_mod
                }
            end
        end
    end
}