local config = SMODS.current_mod.config

SMODS.current_mod.config_tab = function()
    local card = Card( G.ROOM.T.x,G.ROOM.T.y,G.CARD_W*.75,G.CARD_H*.75,nil,G.P_CENTERS.j_tss_mtceleste ) 
    card.no_ui = true

    return {
        n = G.UIT.ROOT, config = { r = 0.1, align = "tm", padding = 0.2, colour = G.C.BLACK }, nodes = {
	        { n = G.UIT.C, config = { align = "cm", padding = 0.1 }, nodes = {
		        { n = G.UIT.O, config = { object = card } }
            } },
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
        }
    }
end

return {
	anim = {
		strawb = true
	}
}