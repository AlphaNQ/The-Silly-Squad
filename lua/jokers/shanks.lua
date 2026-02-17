local bankroll = SMODS.Joker{
    atlas = 'joker',
    key = 'shanks',
    pos = { x = 2, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = false,
    unlocked = false,
    rarity = 3,
    cost = 7,
    config = { extra = { } }
}