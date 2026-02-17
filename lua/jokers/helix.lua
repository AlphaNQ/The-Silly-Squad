SMODS.Joker{
    atlas = 'joker',
    key = 'helix',
    pos = { x = 9, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = false,
    unlocked = false,
    rarity = 1,
    cost = 4,
    config = { extra = {} }
}