SMODS.Joker {
    atlas = "joker",
    key = "ferret",
    pos = { x = 6, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Goob() end,
    rarity = 1,
    cost = 4,
    config = { extra = { xmult = 4, type = 'Flush' } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.xmult
            }
        end
    end
}