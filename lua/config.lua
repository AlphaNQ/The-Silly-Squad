local config = SMODS.current_mod.config

local function display_card(key)
	local card = Card(G.ROOM.T.x,G.ROOM.T.y,G.CARD_W*.75,G.CARD_H*.75,nil,G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
	card.no_ui = true
	card.states.drag.can = false
	return card
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT, config = { r = 0.1, align = "tm", padding = 0.2, colour = G.C.BLACK }, nodes = {
            { n = G.UIT.R, config = { r = 0.1, align = "cm", padding = 0.15, colour = G.C.L_BLACK }, nodes = {
		        { n = G.UIT.O, config = { object = display_card('j_tss_mtceleste') } },
                { n = G.UIT.C, config = { align = "cm", padding = 0.1 }, nodes = {
		            create_toggle( {
    	                label = "Berry Animation",
                        ref_table = config.anim,
	                    ref_value = "strawb",
                        info = {
                            "Animation for Mt. Celeste's Winged berry."
                        }
    		        } )
	            } }
            } }
        }
    }
end

return {
	anim = {
		strawb = true
	}
}