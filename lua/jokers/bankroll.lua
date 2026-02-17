local bankroll = SMODS.Joker{
    atlas = 'joker',
    key = 'bankroll',
    pos = { x = 0, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Goob() end,
    discovered = false,
    unlocked = false,
    rarity = 2,
    cost = 6,
    config = { extra = { attempted = false } }
}

bankroll.slime_active = {
	calculate = function(self, card)
		card.ability.extra.attempted = true
	end,
	can_use = function(self, card) return not card.ability.extra.attempted end,
	should_close = function(self, card) return true end
}