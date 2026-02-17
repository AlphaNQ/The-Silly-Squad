SMODS.Joker{
    atlas = 'joker',
    key = 'giggles',
    pos = { x = 8, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Goob() end,
    discovered = false,
    unlocked = false,
    rarity = 2,
    cost = 6,
    config = { extra = {} }
}