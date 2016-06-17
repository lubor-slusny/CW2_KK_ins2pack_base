
SWEP.Sounds = {
	base_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 21/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 26/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
		{time = 40/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARD"},
		{time = 45/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
		{time = 64/30, sound = "CW_KK_INS2_DOI_SPRING_RATTLE"},
	},

	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	base_crawl = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
		{time = 22, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
	},

	base_fire_end = {
		-- { event AE_CL_CREATE_PARTICLE_BRASS 20 ""},
		{time = 13/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 14/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
		{time = 22/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARD"},
		-- { event AE_WPN_COCK 24 ""},
		{time = 26/30, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
	},

	base_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_DOI_SPRING_EMPTY"},
	},

	base_melee = {
		{time = 1/30, sound = "CW_KK_INS2_WW2_MELEE"},
	},

	base_reload_empty_clip = {
		-- { event AE_CL_CREATE_PARTICLE_BRASS 29 ""},
		{time = 19/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 27/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
		-- { event 46 115 ""},
		-- { event AE_WPN_RELOAD_OFFSCREEN 40 ""},
		{time = 37/33.4, sound = "CW_KK_INS2_DOI_SPRING_FETCHMAG"},
		{time = 64/33.4, sound = "CW_KK_INS2_DOI_SPRING_MAGIN"},
		{time = 80/33.4, sound = "CW_KK_INS2_DOI_SPRING_ROUNDSIN"},
		{time = 111/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARDSTRIPPERCLIP"},
		{time = 112/33.4, sound = "CW_KK_INS2_DOI_SPRING_STRIPPERCLIPEJECT"},
		{time = 119/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
	},

	base_reload_full_clip = {
		{time = 19/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 27/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
		-- { event 46 115 ""},
		-- { event AE_WPN_RELOAD_OFFSCREEN 40 ""},
		{time = 37/33.4, sound = "CW_KK_INS2_DOI_SPRING_FETCHMAG"},
		{time = 64/33.4, sound = "CW_KK_INS2_DOI_SPRING_MAGIN"},
		{time = 80/33.4, sound = "CW_KK_INS2_DOI_SPRING_ROUNDSIN"},
		{time = 111/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARDSTRIPPERCLIP"},
		{time = 112/33.4, sound = "CW_KK_INS2_DOI_SPRING_STRIPPERCLIPEJECT"},
		{time = 119/33.4, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
	},

	base_reload_start = {
		{time = 19/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 27/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
	},

	base_reload_start_empty = {
		-- { event AE_CL_CREATE_PARTICLE_BRASS 29 ""},
		{time = 19/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 27/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
	},

	base_reload_insert = {
		{time = 14/37.2, sound = "CW_KK_INS2_DOI_SPRING_BULLETIN"},
		-- { event 46 22 ""},
	},

	base_reload_end = {
		{time = 14/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARD"},
		{time = 21/33.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
	},

	iron_fire_end = {
		-- { event AE_CL_CREATE_PARTICLE_BRASS 18 ""},
		{time = 13/30.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTRELEASE"},
		{time = 16/30.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTBACK"},
		{time = 24/30.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTFORWARD"},
		-- { event AE_WPN_COCK 26 ""},
		{time = 27/30.5, sound = "CW_KK_INS2_DOI_SPRING_BOLTLATCH"},
	},

	iron_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_DOI_SPRING_EMPTY"},
	},

	base_draw_empty = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	base_holster_empty = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	base_crawl_empty = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
		{time = 22, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
	},

	base_melee_empty = {
		{time = 1/30, sound = "CW_KK_INS2_WW2_MELEE"},
	},
}