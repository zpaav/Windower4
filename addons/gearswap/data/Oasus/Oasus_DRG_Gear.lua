-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Default','Trishula', 'ShiningOne')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	
    gear.da_jse_back = 		{name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.stp_jse_back =		{name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	-- stardiver
	gear.wsd_jse_back = 	{name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	-- drakes
	gear.crit_jse_back = 	{name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.breathe_back = 	{name="Brigantia's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.fc_back = 			{name="Brigantia's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.jump_back = 		{name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
		
	update_combat_form()
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}
	sets.precast.JA['Angon'] = {ammo="Angon",hands="Ptero. Fin. G. +3"} 
	
	sets.precast.JA['Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- hands="Vish. Fin. Gaunt. +3", 
		 body="Ptero. Mail +3", hands="Vis. Fng. Gaunt. +2",ring1="Petrov Ring",rring="Niqmaddu Ring",
		back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Vishap Greaves +3"}
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- hands="Vish. Fin. Gaunt. +3", 
		 body="Ptero. Mail +3", hands="Vis. Fng. Gaunt. +2",ring1="Petrov Ring",rring="Niqmaddu Ring",
		back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Vishap Greaves +3"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- hands="Vish. Fin. Gaunt. +3",
		body="Ptero. Mail +3", hands="Vis. Fng. Gaunt. +2",ring1="Petrov Ring",rring="Niqmaddu Ring",
		back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Vishap Greaves +3"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- hands="Vish. Fin. Gaunt. +3", 
		 body="Ptero. Mail +3", hands="Vis. Fng. Gaunt. +2",ring1="Petrov Ring",rring="Niqmaddu Ring",
		back=gear.stp_jse_back, waist="Ioskeha Belt +1", legs="Ptero. Brais +3",feet="Vishap Greaves +3"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {
		head="Vishap Armet +3", lear="Pratik Earring",
		hands="Pel. Vambraces +1",
		feet="Ptero. Greaves +3"}
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"} 
	sets.precast.JA['Deep Breathing'] = {head="Ptero. Armet +3"}
	sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
	sets.precast.JA['Steady Wing'] = {
		--neck="Chanoix's Gorget", lear="Lancer's Earring",rear="Anastasi Earring",
		-- hands="Despair Fin. Gauntlets",
		body="Emicho Haubert +1",
		back="Updraft Mantle", legs="Vishap Brais +3", feet="Ptero. Greaves +3"}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {
		-- lear="Lancer's Earring", rear="Anastasi Earring",
		head="Ptero. Armet +3", neck="Lancer's Torque", 
		body=gear.acro_body_breathe, hands=gear.acro_hands_breathe,		
		-- waist="Glassblower's Belt",
		back="Updraft Mantle",  legs="Vishap Brais +3", feet="Ptero. Greaves +3"}
	sets.precast.JA['Smiting Breath'] =  {	
		-- lear="Lancer's Earring", rear="Anastasi Earring",
		head="Ptero. Armet +3", neck="Lancer's Torque", 
		body=gear.acro_body_breathe, hands=gear.acro_hands_breathe,	
		-- waist="Glassblower's Belt",
		back="Updraft Mantle", legs=gear.acro_legs_breathe, feet=gear.acro_feet_breathe}
	
	sets.HealingBreath = {
		-- lear="Lancer's Earring", rear="Anastasi Earring",
		head="Ptero. Armet +3", neck="Lancer's Torque", 
		body=gear.acro_body_breathe, hands=gear.acro_hands_breathe,
		-- waist="Glassblower's Belt",
		back="Updraft Mantle", legs="Vishap Brais +3", feet="Ptero. Greaves +3"}
	
	sets.SmitingBreath = {	
		-- lear="Lancer's Earring", rear="Anastasi Earring",
		head="Ptero. Armet +3", neck="Lancer's Torque",
		body=gear.acro_body_breathe, hands=gear.acro_hands_breathe,		
		--waist="Glassblower's Belt",
		back="Updraft Mantle", legs=gear.acro_legs_breathe, feet=gear.acro_feet_breathe}
	
	-- Fast cast sets for spells	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1", neck="Orunmila's Torque", ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Lebeche Ring", ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Founder's Hose", feet="Carmine Greaves +1"}
		
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",}--waist="Gishdubar Sash" hands="Buremte Gloves",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",}--waist="Gishdubar Sash" hands="Buremte Gloves",
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Tempus Fugit",legs="Founder's Hose",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +3"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +2",ring1="Rajas Ring",ring2="Flamma Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Ginsen"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Ginsen"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Ptero. Armet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- Valorous Mail STR ACC DA 
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +2", ring1="Regal Ring",rring="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"})
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
		head="Ptero. Armet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +2", ring1="Regal Ring",rring="Niqmaddu Ring",
		
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Ptero. Armet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- Dagon Breast. Valorous Mail STR ACC DA
		body="Flamma Korazin +2", hands="Sulev. Gauntlets +2", ring1="Regal Ring",rring="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"})
		
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +2", ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Pelt. Cuissots +1",feet="Flam. Gambieras +2"})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Dragoon Collar +2
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",	
		-- Dagon Breastplate
		body="Emicho Haubert +1",hands="Flam. Manopolas +2",ring1="Begrudging Ring",ring2="Niqmaddu Ring",	
		--  Valorous Greaves STR +15, Acc/Atk +20, Crit Dmg +4
		back=gear.crit_jse_back,waist="Ioskeha Belt +1", legs="Pelt. Cuissots +1",feet="Sulev. Leggings +2"})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS['Drakesbane'], {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS['Drakesbane'], {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS['Drakesbane'], {})
	
	sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Path A 
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Sherida Earring", rear="Ishvara Earring",
		body="Emicho Haubert +1", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		--
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Geirskogul'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
		-- Path A 
		head="Lustratio Cap +1", neck="Fotia Gorget",lear="Sherida Earring", rear="Ishvara Earring",
		body="Emicho Haubert +1", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Geirskogul'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Path A
		head="Lustratio Cap +1", neck="Fotia Gorget",lear="Sherida Earring", rear="Ishvara Earring",
		body="Emicho Haubert +1", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Geirskogul'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Knobkierrie",
		-- Path A
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Sherida Earring", rear="Ishvara Earring",
		body="Emicho Haubert +1", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Brutal Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS["Camlann's Torment"].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Brutal Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3",lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Cessance Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3",lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS["Camlann's Torment"].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Knobkierrie",   
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Cessance Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3",lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})

	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Moonshade Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3",lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Moonshade Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Moonshade Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3", lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})
	sets.precast.WS['Sonic Thrust'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget",lear="Sherida Earring", rear="Moonshade Earring",
		body="Sulevia's Plate. +2", hands="Ptero. Fin. G. +3",lring="Regal Ring", rring="Niqmaddu Ring",
		-- Vishap Brais +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Vishap Brais +3", feet="Sulev. Leggings +2"})

	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {ammo="Pemphredo Tathlum",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", lear="Digni. Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Flam. Manopolas +2",lring="Stikini Ring", rring="Flamma Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"})
	sets.precast.WS['Leg Sweep'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Pemphredo Tathlum",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", lear="Digni. Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Flam. Manopolas +2", lring="Stikini Ring", rring="Flamma Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"})
	sets.precast.WS['Leg Sweep'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Pemphredo Tathlum",
		head="Flam. Zucchetto +2", neck="Sanctity Necklace", lear="Digni. Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Flam. Manopolas +2",lring="Stikini Ring", rring="Flamma Ring",
		back=gear.wsd_jse_back, waist="Eschan Stone", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"})
	sets.precast.WS['Leg Sweep'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Pemphredo Tathlum",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", lear="Digni. Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Flam. Manopolas +2",lring="Stikini Ring", rring="Flamma Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"})
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Sulevia's Mask +2",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Sulevia's Mask +2",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--head="Frenzy Sallet"
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Weapons sets
	sets.weapons.Default = {main="Shining One", sub="Utu Grip"}
	sets.weapons.Trishula = {main="Trishula", sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One", sub="Utu Grip"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Moonshade Earring",ear2="Brutal Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring"}
	sets.DayMaxTPWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring"}
	sets.AccDayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Pelt. Plackart +1", hands=gear.acro_hands_stp, ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		-- neck="Combatant Torque
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Sherida Earring",ear2="Cessance Earring",
		body="Pelt. Plackart +1", hands=gear.acro_hands_stp, ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar", ear1="Sherida Earring",ear2="Cessance Earring",
		body="Pelt. Plackart +1",hands=gear.acro_hands_stp,ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Sherida Earring",ear2="Cessance Earring",
		body="Pelt. Plackart +1", hands="Flam. Manopolas +2", ring1="Regal Ring", ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Sherida Earring",ear2="Cessance Earring",
		body="Pelt. Plackart +1", hands=gear.acro_hands_stp, ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
	sets.engaged.PDT = {
		ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	sets.engaged.Acc.PDT = {ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    sets.engaged.FullAcc.PDT = {ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    sets.engaged.Fodder.PDT = {	ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	
	sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
    	
	-- Trishula
	sets.engaged.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +2", neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands=gear.acro_hands_stp, lring="Petrov Ring", rring="Niqmaddu Ring",
		-- gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Ptero. Brais +3", feet="Flam. Gambieras +2"}
    sets.engaged.Trishula.SomeAcc = {ammo="Ginsen",
		-- Combatant's Torque
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Sherida Earring",ear2="Cessance Earring",		
		-- Hjarrandi Breast. hands=gear.valorous_acc_hands,
		body="Pelt. Plackart +1",hands="Sulevia's Gauntlets +2",ring1="Flamma Ring", rring="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
	sets.engaged.Trishula.Acc = {ammo="Ginsen",
		-- Combatant's Torque
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Sherida Earring",ear2="Cessance Earring",		
		-- Hjarrandi Breast. hands=gear.valorous_acc_hands,
		body="Pelt. Plackart +1",hands="Sulevia's Gauntlets +2",ring1="Flamma Ring", rring="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Ptero. Brais +3", feet="Flam. Gambieras +2"}
    sets.engaged.Trishula.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Sherida Earring",ear2="Telos Earring",		
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1",hands="Flam. Manopolas +2", ring1="Flamma Ring", rring="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
    sets.engaged.Trishula.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1",hands=gear.acro_hands_stp, lring="Petrov Ring", rring="Niqmaddu Ring",
		-- gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}

    sets.engaged.Trishula.AM = {}
    sets.engaged.Trishula.AM.SomeAcc = {}
	sets.engaged.Trishula.AM.Acc = {}
    sets.engaged.Trishula.AM.FullAcc = {}
    sets.engaged.Trishula.AM.Fodder = {}
	
    sets.engaged.Trishula.PDT = {}
    sets.engaged.Trishula.SomeAcc.PDT = {}
	sets.engaged.Trishula.Acc.PDT= {}
    sets.engaged.Trishula.FullAcc.PDT= {}
    sets.engaged.Trishula.Fodder.PDT = {}
	
    sets.engaged.Trishula.AM.PDT = {}
    sets.engaged.Trishula.AM.SomeAcc.PDT = {}
	sets.engaged.Trishula.AM.Acc.PDT= {}
    sets.engaged.Trishula.AM.FullAcc.PDT= {}
    sets.engaged.Trishula.AM.Fodder.PDT = {}
	
	-- Ryunohige
	sets.engaged.Ryunohige = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Ryunohige.SomeAcc = {ammo="Ginsen",
		-- neck="Combatant Torque
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.stp_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
	sets.engaged.Ryunohige.Acc = {ammo="Ginsen",
		-- ear1="Tripudio Earring",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar", ear2="Cessance Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1",hands="Sulev. Gauntlets +2",ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Ryunohige.FullAcc = {ammo="Ginsen",
		-- ear1="Tripudio Earring",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear2="Cessance Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Flam. Manopolas +2", ring1="Regal Ring", ring2="Niqmaddu Ring",
		back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Ryunohige.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Rajas Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.Ryunohige.AM = {}
    sets.engaged.Ryunohige.AM.SomeAcc = {}
	sets.engaged.Ryunohige.AM.Acc = {}
    sets.engaged.Ryunohige.AM.FullAcc = {}
    sets.engaged.Ryunohige.AM.Fodder = {}
	
    sets.engaged.Ryunohige.PDT = {}
    sets.engaged.Ryunohige.SomeAcc.PDT = {}
	sets.engaged.Ryunohige.Acc.PDT= {}
    sets.engaged.Ryunohige.FullAcc.PDT= {}
    sets.engaged.Ryunohige.Fodder.PDT = {}
	
    sets.engaged.Ryunohige.AM.PDT = {}
    sets.engaged.Ryunohige.AM.SomeAcc.PDT = {}
	sets.engaged.Ryunohige.AM.Acc.PDT= {}
    sets.engaged.Ryunohige.AM.FullAcc.PDT= {}
    sets.engaged.Ryunohige.AM.Fodder.PDT = {}
	
	-- Rhongomiant
	sets.engaged.Rhongomiant = {ammo="Focal Orb",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		--  DBL attack legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Rhongomiant.SomeAcc = {ammo="Focal Orb",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		--  DBL attack legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	sets.engaged.Rhongomiant.Acc = {ammo="Focal Orb",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		--  DBL attack legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Rhongomiant.FullAcc = {ammo="Focal Orb",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		--  DBL attack legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Rhongomiant.Fodder = {ammo="Focal Orb",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Hjarrandi Breast.
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		--  DBL attack legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.Rhongomiant.AM = {}
    sets.engaged.Rhongomiant.AM.SomeAcc = {}
	sets.engaged.Rhongomiant.AM.Acc = {}
    sets.engaged.Rhongomiant.AM.FullAcc = {}
    sets.engaged.Rhongomiant.AM.Fodder = {}
	
    sets.engaged.Rhongomiant.PDT = {}
    sets.engaged.Rhongomiant.SomeAcc.PDT = {}
	sets.engaged.Rhongomiant.Acc.PDT= {}
    sets.engaged.Rhongomiant.FullAcc.PDT= {}
    sets.engaged.Rhongomiant.Fodder.PDT = {}
	
    sets.engaged.Rhongomiant.AM.PDT = {}
    sets.engaged.Rhongomiant.AM.SomeAcc.PDT = {}
	sets.engaged.Rhongomiant.AM.Acc.PDT= {}
    sets.engaged.Rhongomiant.AM.FullAcc.PDT= {}
    sets.engaged.Rhongomiant.AM.Fodder.PDT = {}
    
	-- Gungnir
	sets.engaged.Gungnir = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- gear.valorous_wsd_body
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		-- legs=gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Gungnir.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- gear.valorous_wsd_body
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		-- legs=gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	sets.engaged.Gungnir.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- gear.valorous_wsd_body
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		-- legs=gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Gungnir.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- gear.valorous_wsd_body
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		-- legs=gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Gungnir.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- gear.valorous_wsd_body
		body="Pelt. Plackart +1", hands="Sulev. Gauntlets +2", ring1="Petrov Ring",ring2="Niqmaddu Ring",
		-- legs=gear.valorous_stp_legs
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.Gungnir.AM = {}
    sets.engaged.Gungnir.AM.SomeAcc = {}
	sets.engaged.Gungnir.AM.Acc = {}
    sets.engaged.Gungnir.AM.FullAcc = {}
    sets.engaged.Gungnir.AM.Fodder = {}
	
    sets.engaged.Gungnir.PDT = {}
    sets.engaged.Gungnir.SomeAcc.PDT = {}
	sets.engaged.Gungnir.Acc.PDT= {}
    sets.engaged.Gungnir.FullAcc.PDT= {}
    sets.engaged.Gungnir.Fodder.PDT = {}
	
    sets.engaged.Gungnir.AM.PDT = {}
    sets.engaged.Gungnir.AM.SomeAcc.PDT = {}
	sets.engaged.Gungnir.AM.Acc.PDT= {}
    sets.engaged.Gungnir.AM.FullAcc.PDT= {}
    sets.engaged.Gungnir.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(4, 12)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'BLU' then
        set_macro_page(5, 12)
	elseif player.sub_job == 'NIN' then
        set_macro_page(2, 12)
	elseif player.sub_job == 'DNC' then
        set_macro_page(3, 12)
    else
        set_macro_page(1, 12)
    end
end