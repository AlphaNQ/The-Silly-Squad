-- Since we're doing this in 2 places, it's better to make a local function for this
local function set_roulette_card(card)
    -- Gets the random copy thingy
    local rand = pseudorandom_element({'j_tss_flame','j_tss_kitsune','j_tss_bnop','j_tss_foxxo'}, "tss_roulette")
    
    -- Sets the joker's variables to that of the target joker
    card.ability.extra = G.P_CENTERS[rand].config.extra

    -- Adds the rand value after, as to not get overwritten
    -- It's also being placed outside the extra table in case the copied joker has a variable also called rand
    card.ability.rand = rand
end

SMODS.Joker{
    atlas = 'joker',
    key = 'roulette',
    pos = { x = 5, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Xtra() end,
    discovered = true,
    rarity = 3,
    cost = 6,
    config = { rand = 'j_tss_flame' },

    loc_vars = function(self, info_queue, card)
        -- Display the info_queue of the current joker
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.rand]

        -- Lets you display the name of the current joker in the description as #1#
        return {vars = {localize({type = 'name_text', key = card.ability.rand, set = 'Joker'})}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            -- Sets the card's rand to a random listed card
            set_roulette_card(card)
            SMODS.calculate_effect({message=localize('k_reroll')},card) 
        end

        -- Run the calculate function of the other card
        return G.P_CENTERS[card.ability.rand]:calculate(card, context)
    end,

    set_ability = function(self, card, initial, delay_sprites)
        -- Set the card to a random listed card when created (so it doesn't always start as j_tss_flame)
        set_roulette_card(card)
    end
}