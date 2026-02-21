return {
    descriptions = {
        Back = {},
        Blind = {
            bl_tss_student = {
                name = "L'élève fainéant",
                text = {
                    "Toutes les cartes Aces",
                    "perdent leurs bonus"
                }
            }
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_tss_bankroll = {
                name = "Financer",
                text = {
                    "{C:attention}Une fois par Manche:",
                    "pari une moitié de ton {C:money}$$${} {C:inactive}[#1#]{},",
                    "{C:green}gagner le double en tour{} {C:inactive}[#2#]{} ou",
                    "{C:red}doubler jetons nécessaire"
                }
            },
            j_tss_bnop = {
                name = "Cannine Occulte",
                text = {
                    "Les Aces acquise donne",
                    "{X:mult,C:white}X#1#{} Multi, gagnez {X:mult,C:white}X#2#{} Multi",
                    "toutes les {C:attention}#3#{} {C:inactive}[#4#]{} Aces",
                    "{C:inactive}(Actuellement: Multi {X:mult,C:white}X#5#{C:inactive})"
                }
            },
            j_tss_bribery = {
                name = "Corruption",
                text = {
                    "payer {C:money}$#1#{} pour",
                    "passer blinde",
                }
            },
            j_tss_bubble = {
                name = "gomme à mâcher",
                text = {
                    "Multi {X:mult,C:white}X#1#{} par {C:attention}abonné{}",
					"sur le compte {C:blue}BlueSky{} d'{C:burn}Alpha{}",
                    "{C:inactive}(Actuellement: Multi {X:mult,C:white}X#2#{C:inactive})",
					caption.."*te fait exploser dans me rêves*"
                }
            },
            j_tss_ferret = {
                name = "Dame Furet",
                text = {
                    "Multi {X:mult,C:white}X#1#{} si la main",
                    "jouée contient une {C:attention}Couleur{}"
                }
            },
            j_tss_flame = {
                name = "Flame Royale",
                text = {
                    '{C:green}#1# chance(s) sur #2#{} de', 
                    "{C:burn,E:1}brûler{} les cartes lorsqu'elles",
                    "marquent des points"
                }
            },
            j_tss_foxxo = {
                name = "Renard Rapide",
                text = {
                    'Crée une carte {C:tarot}Tarot{} {E:1}"random"{}',
                    "quand {C:attention}la main la moins aquise{} est jouée",
                    "{C:inactive}(Selon la place disponible){}",
                    caption.."Le plus sournois du royaume des animaux ;3c"
                }
            },
            j_tss_giggles = {
                name = "Giggles",
                text = {
                    ""
                },
                unlock = {
                    "ERR 404: Carte introuvable",
                }
            },
            j_tss_goblin = {
                name = "Lutin Tactics",
                text = {
                    {
                        "Multi {X:mult,C:white}X#1#{} pour",
                        "chaque {C:money}$#2#{}",
                        "{C:inactive}(Actuellement: Multi {X:mult,C:white}X#3#{C:inactive})"
                    }, {
                        "Perde {C:money}$#2#{} quand déclenché",
                        "Carte est {C:red}détruit{} si",
                        "à court d'argent",
                    }
                }
            },
            j_tss_helix = {
                name = "Helix",
                text = {
                    ""
                },
                unlock = {
                    "ERR 404: Carte introuvable",
                }
            },
            j_tss_kitsune = {
                name = "Goupil des Cieux",
                text = {
                    "{C:green}#1# chance(s) sur #2#{} de changer",
                    "les cartes acquise en Ace", 
                    "{C:green}#3# chance(s) sur #4#{} de donner", 
                    "les Aces acquise la {C:purple,E:1}Faveur de Faux{}" --1 in 8, 1 in 16
                }
            },
            j_tss_mtceleste = {
                name = "Le mont. Celeste",
                text = {
                    "Pendant que ce Joker",
                    "est actif, faire apparaître",
                    "des {C:red}fraises{} sur l'écran,",
                    "donnant divers effets.",
                    "{C:inactive}(Actuellement: Multi. {X:mult,C:white}X#1#{C:inactive})"
                },
                unlock = {
                    "ERR 404: Carte introuvable",
                }
            },
            j_tss_mykra = {
                name = "MYKRA",
                text = {
                    ""
                },
                unlock = {
                    "ERR 404: Carte introuvable",
                }
            },
            j_tss_roulette = {
                name = "Roulette",
                text = {
                    "Chance aléatoire d'agir",
                    "comme {C:red}Flame Royale{}, {C:planet}Goupil des Cieux{},",
                    "{C:purple}Cannine Occulte{}, ou {C:attention}Renard Rapide{}"
                }
            },
            j_tss_shanks = {
                name = {
                    "Hamuel's 518",
                    "Jarrets de Jambon",
                },
                text = {
                    {
                        "{C:green}#1# chance(s) sur #2#{} de",
                        "{C:crit}COUP CRITIQUE{} quand une carte",
                        "marque des points"
                    }, {
                        "{C:crit}COUP CRITIQUE{}:",
                        "{X:chips,C:white}X#3#{} Jetons | {X:mult,C:white}X#4#{} Multi"
                    }
                }
            }
        },
        Other = {
            tss_berry_n = {
                name = "Fraise",
                text = {
                    "Multi {X:mult,C:white}X0.5{} pour",
                    "Le mont. Celeste"
                }
            },
            tss_berry_w = {
                name = "Fraise Ailée",
                text = {
                    "{C:attention}+1{} main"
                }
            },
            tss_berry_g = {
                name = "Fraise Dorée",
                text = {
                    "Multi {X:mult,C:white}X1{} pour",
                    "Le mont. Celeste"
                }
            },
            tss_berry_wg = {
                name = {
                    "Fraise d'Or",
                    "Ailée"
                },
                text = {
                    "{C:attention}+2{} mains"
                }
            },
            tss_berry_m = {
                name = "Fraise Lunaire",
                text = {
                    "Ajoute {C:dark_edition}Négatif{} à",
                    "un Joker aléatoire"
                }
            },
            tss_burned_seal = {
                name = 'Brûler',
                text = {
                    '{C:blue}#1#{} Jetons | Multi {X:mult,C:white}X#2#{}',
                    "Détruite après qu'elle",
                    'soit jouée {C:attention}#3#{} {C:inactive}[#4#]{} fois'
                }
            },
            tss_favour_seal = {
                name = "Faveur du Faux",
                text = {
                    'Déclenche à nouveau cette',
                    'carte {C:attention}#1#{} fois{}' -- 5 fois
                }
            }
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {
            c_tss_burning_love = "Amour Brûlant"
        },
        collabs = {},
        dictionary = {
            k_burn = "Bruler!",
            k_char = "Braiser!",
            k_crit = "COUP CRITIQUE!",
            k_kiss = "*Chu~!*",
            k_poof = "*Poof!*",
            tss_credits_label = "Crédits",
            tss_credits_developer = "Développé Par:",
            tss_credits_assistant = "Assistante Programmeur:",
            tss_credits_specialthanks = "remerciements particuliers:",
            tss_joker_bribe = "SOUDOYER"
        },
        high_scores = {},
        labels = {
            tss_burned_seal = "Seau Brûlant",
            tss_favour_seal = "Seau de Faveur",
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {},
        v_text = {
            ch_c_tss_hearts_only = { "Le jeu ne peut contenir {C:red}que{} des cartes de la couleur {C:hearts}Cœur{}." },
        },
    }
}
