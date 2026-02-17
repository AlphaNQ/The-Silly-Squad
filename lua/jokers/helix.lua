SMODS.Joker{
    atlas = 'joker',
    key = 'helix',
    pos = { x = 9, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Goob() end,
    discovered = false,
    unlocked = false,
    rarity = 1,
    cost = 4,
    config = { extra = {} }
}