local g = Global
local legion = Legion

g.data = {
    {
        name = 'Zones',
        entries = {
            {
                name = 'Vanilla',
                entries = {
                    {
                        name = 'Kalimdor',
                        entries = {
                            { name = 'Ashenvale' },
                            { name = 'Azshara' },
                            { name = 'Darkshore' },
                            { name = 'Darnassus' },
                            { name = 'Desolace' },
                            { name = 'Durotar' },
                            { name = 'Dustwallow Marsh' },
                            { name = 'Felwood' },
                            { name = 'Feralas' },
                            { name = 'Moonglade' },
                            { name = 'Mulgore' },
                            { name = 'Northern Barrens' },
                            { name = 'Orgrimmar' },
                            { name = 'Silithus' },
                            { name = 'Southern Barrens' },
                            { name = 'Stonetalon Mountains' },
                            { name = 'Teldrassil' },
                            { name = 'Thousand Needles' },
                            { name = 'Thunder Bluff' },
                            { name = "Un'goro Crater" },
                            { name = 'Winterspring' },
                        }
                    },
                    {
                        name = 'Eastern Kingdoms',
                        entries = {
                            { name = 'Arathi Highlands' },
                            { name = 'Badlands' },
                            { name = 'Blasted Lands' },
                            { name = 'Burning Steppes' },
                            { name = 'Deadwind Pass' },
                            { name = 'Dun Morogh' },
                            { name = 'Duskwood' },
                            { name = 'Eastern Plaguelands' },
                            { name = 'Elwynn Forest' },
                            { name = 'Hillsbrad Foothills' },
                            { name = 'The Hinterlands' },
                            { name = 'Ironforge' },
                            { name = 'Loch Modan' },
                            { name = 'Redridge Mountains' },
                            { name = 'Searing Gorge' },
                            { name = 'Silverpine Forest' },
                            { name = 'Stormwind City' },
                            { name = 'Stranglethorn Vale' },
                            { name = 'Swamp of Sorrows' },
                            { name = 'Tirisfal Glades' },
                            { name = 'Undercity' },
                            { name = 'Western Plaguelands' },
                            { name = 'Westfall' },
                            { name = 'Wetlands' },
                        }
                    },
                }
            },
            {
                name = 'The Burning Crusade',
                entries = {
                    { name = 'Azuremyst Isle' },
                    { name = "Blade's Edge Mountains" },
                    { name = 'Bloodmyst Isle' },
                    { name = 'Eversong Woods' },
                    { name = 'The Exodar' },
                    { name = 'Ghostlands' },
                    { name = 'Hellfire Peninsula' },
                    { name = "Isle of Quel'Danas" },
                    { name = 'Nagrand' },
                    { name = 'Netherstorm' },
                    { name = 'Shadowmoon Valley' },
                    { name = 'Shattrath City' },
                    { name = 'Silvermoon City' },
                    { name = 'Terokkar Forest' },
                    { name = 'Zangarmarsh' },
                }
            },
            {
                name = 'Wrath of the Lich King',
                entries = {
                    { name = 'Borean Tundra' },
                    { name = 'Crystalsong Forest' },
                    { name = 'Dalaran' },
                    { name = 'Dragonblight' },
                    {
                        name = 'Grizzly Hills',
                        songs = {
                            'ZoneMusic/GrizzlyHills/GH_Intro2Uni01'
                        }
                    },
                    { name = 'Howling Fjord' },
                    { name = 'Icecrown' },
                    { name = 'Sholazar Basin' },
                    { name = 'Storm Peaks' },
                    { name = 'Wintergrasp' },
                    { name = "Zul'Drak" },
                }
            },
            {
                name = 'Cataclysm',
                entries = {
                    { name = 'Deepholm' },
                    { name = 'Kezan' },
                    { name = 'The Lost Isles' },
                    { name = 'Mount Hyjal' },
                    { name = 'Ruins of Gilneas' },
                    { name = 'Tol Barad' },
                    { name = 'Twilight Highlands' },
                    { name = 'Uldum' },
                    {
                        name = "Vashj'ir",
                        entries = {
                            { name = 'Abyssal Depths' },
                            { name = "Kelp'thar Forest" },
                            { name = 'Shimmering Expanse' },
                        }
                    },
                }
            },
            {
                name = 'Mists of Pandaria',
                entries = {
                    { name = 'Dread Wastes' },
                    { name = 'Isle of Giants' },
                    { name = 'Isle of Thunder' },
                    { name = 'The Jade Forest' },
                    { name = 'Krasarang Wilds' },
                    { name = 'Kun-Lai Summit' },
                    { name = 'Timeless Isle' },
                    { name = 'Townlong Steppes' },
                    { name = 'Vale of Eternal Blossoms' },
                    { name = 'Valley of the Four Winds' },
                }
            },
            {
                name = 'Warlords of Draenor',
                entries = {
                    { name = 'Ashran' },
                    { name = 'Frostfire Ridge' },
                    { name = 'Gorgrond' },
                    { name = 'Nagrand' },
                    { name = 'Shadowmoon Valley' },
                    { name = 'Spires of Arak' },
                    { name = 'Talador' },
                    { name = 'Tanaan Jungle' },
                }
            },
            legion
        }
    },
    {
        name = 'Login Screens',
        songs = {
            'GlueScreenMusic/wow_main_theme',
            'GlueScreenMusic/bc_main_theme',
            'GlueScreenMusic/wotlk_main_title',
            'cataclysm/MUS_Shattering_UU01',
            'Pandaria/MUS_50_HeartofPandaria_01',
            'Draenor/MUS_60_ASiegeofWorlds_MainTitle',
            'legion/MUS_70_Kingdomswillburn_MainTitle',
        }
    }
}
