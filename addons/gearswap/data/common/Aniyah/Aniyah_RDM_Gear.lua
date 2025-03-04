function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	-- Mandau Almace Sequence 
	state.Weapons:options('None','Naegling','DualWeapons','DualWeaponsAcc','DualEvisceration','DualClubs','DualAeolian','DualProcDaggers','EnspellOnly')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = 		{name="Ghostfyre Cape",	 augments={'Enfb.mag. skill +8','Enha.mag. skill +10','Mag. Acc.+3',}}
	gear.Macc_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.nuke_jse_back = 	{name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.FC_jse_back =		{name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','Spell interruption rate down-10%',}}
	
	gear.dw_jse_back = 		{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}			
	gear.stp_jse_back = 	{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.ws_jse_back = 			{name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	
	-- Waist Replacements
	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Ovate Rope"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Ovate Rope"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Ovate Rope"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind !pause gs c toggle AutoSubMode')
	
	send_command('alias imp input /ja "Parsimony" <me>;wait 1;input /ma "Impact" <stnpc>')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	-- RDM gets 30 FC from traits and up to 8 more from JP gifts. 80-38=42 
	sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion",
		--  lear="Enchntr. Earring +1",
		head="Atro. Chapeau +2", neck="Voltsurge Torque", lear="Malignance Earring", rear="Loquac. Earring",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		-- legs="Psycloth Lappas", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {head="Leth. Chappel +1"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {--ammo="Ginsen",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Petrov Ring", 
		back=gear.ws_jse_back, waist="Windbuffet Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau 
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves lring="Epaminodas's Ring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Petrov Ring",
		--  Taeon Tights
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {--ammo="Ginsen",
		-- Despair Helm Caro Necklace 
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
		-- Despair Mail Atrophy Gloves +3 lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Petrov Ring",
		-- Despair Trousers Despair Greaves
		back=gear.ws_jse_back, waist="Prosilio Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Regal Gem",
		--head="Carmine Mask +1", lear="Crematio Earring",
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Regal Earring", rear="Friomisi Earring",
		-- lring="Epaminodas's Ring", 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Archon Ring", rring="Shiva Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Carmine Greaves"}

	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs="Volte Hose", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem",
		--head="Ea Hat +1", 
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Melignance Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		body="Jhakri Robe +2", hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {main="Maxentius", sub="Ammurapi Shield",
		-- head="Ea Hat +1", 
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Melignance Earring", rear="Friomisi Earring",
		-- body="Seidr Cotehardie"
		body="Jhakri Robe +2",hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring",
		-- waist="Refoccilation Stone", legs="Ea Slops +1",
		back=gear.nuke_jse_back, legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion",
		head="Atro. Chapeau +2", beck="Voltsurge Torque", lear="Enchntr. Earring +1", rear="Loquac. Earring", 
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves"})

    sets.midcast.Cure = {main="Tamaxchi", sub="Thuellaic Ecu +1", ammo="Regal Gem",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Melic Torque", lear="Regal Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring 
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +2", feet="Carmine Greaves"}

    sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Clerisy Strap +1", ammo="Regal Gem",
		--head="Vanya Hood",
		head="Atro. Chapeau +2", neck="Melic Torque", lear="Regal Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs  feet="Kaykaus Boots"
		back=gear.Cure_jse_back, waist=gear.ElementalObi, legs="Atrophy Tights +2", feet="Carmine Greaves"}
	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Tamaxchi", sub="Thuellaic Ecu +1", ammo="Regal Gem",
		-- head="Vanya Hood", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Melic Torque", lear="Regal Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Cuffs Haoma's Ring Sirona's Ring
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back=gear.Cure_jse_back, waist=gear.ElementalObi, legs="Atrophy Tights +2", feet="Carmine Greaves"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",feet="Vanya Clogs"
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Grioavolr", sub="Clemency Grip"})--main="Oranyan",
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.Self_Healing = {
		neck="Phalaina Locket",ear1="Etiolation Earring",
		--hands="Buremte Gloves", ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Cure_Received = {
		neck="Phalaina Locket", 
		--hands="Buremte Gloves",ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"
	
	-- Duration
	sets.midcast['Enhancing Magic'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion",
		-- main="Pukulatmuj +1",
		-- Duelist's Torque +2  rear="Augment. Earring",
		head=gear.telchine_head_Duration, neck="Melic Torque", ear1="Andoaa Earring", 
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body=gear.telchine_body_Duration, hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs=gear.telchine_legs_Duration, feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion",
		--main="Pukulatmuj +1",		
		--Duelist's Torque +2 neck="Incanter's Torque", rear="Augment. Earring",
		head="Leth. Chappel +1", neck="Melic Torque", ear1="Andoaa Earring", 
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Lethargy Sayon +1", hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs="Leth. Fuseau +1", feet="Leth. Houseaux +1"}
	
	-- Phalanx Potency
	sets.midcast.Phalanx = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion",
		head=gear.taeon_head_Phalanx, neck="Melic Torque", ear1="Andoaa Earring", ear2="Gifted Earring", 
		-- Vitiation Tabard +3 Stikini Ring +1 Stikini Ring +1
		body=gear.telchine_body_Duration, hands=gear.taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs=gear.taeon_legs_Phalanx, feet=gear.taeon_feet_Phalanx}
		
	-- Enhancing Magic Skill set
	sets.midcast['Temper'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--neck="Incanter's Torque", Duelist's Torque +2  rear="Augment. Earring",
		head="Befouled Crown", neck="Melic Torque", ear1="Andoaa Earring",
		-- Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3 Olympus Sash
		back=gear.JSE_Cape,waist="Cascade Belt",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
	sets.midcast['Temper II'] = {main="Maxentius",  sub="Ammurapi Shield", ammo="Hasty Pinion",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		-- Duelist's Torque +2 ear2="Augment. Earring",
		head="Befouled Crown",neck="Melic Torque",ear1="Andoaa Earring", 
		-- Viti. Tabard +1 +3 Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3 Olympus Sash
		back=gear.JSE_Cape, waist="Cascade Belt",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = { body="Atrophy Tabard +2", hands="Atrophy Gloves +2",  legs="Leth. Fuseau +1"} -- head="Amalric Coif", back="Grapevine Cape",waist="Gishdubar Sash",
	sets.midcast.Aquaveil = {} -- head="Amalric Coif" hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {} -- neck="Nodens Gorget",waist="Siegel Sash",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {}--ring2="Sheltered Ring"
	sets.midcast.Shell = {}--ring2="Sheltered Ring"
	
	-- Enfeebling Magic
	-- Path F = Full Potency Gear
	sets.midcast['Enfeebling Magic'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem", --range="Kaja Bow", 
			-- Vitiation Chapeau +3 Duelist's Torque +3 neck="Incanter's Torque", 
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Malignance Earring", rear="Regal Earring", 
			--  body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Lethargy Sayon +1", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			--  legs=gear.chironic_macc_legs, Vitiation Boots +2
			back=gear.Macc_jse_back, waist="Ovate Rope", legs="Atrophy Tights +2", feet="Vitiation Boots +1"}
	
	-- Path A - Pure Macc No Potency
	sets.midcast['Enfeebling Magic'].Resistant = {main="Maxentius", sub="Ammurapi Shield", range="Kaja Bow",
			--  Duelist's Torque +3 Duelist's Torque +3 neck="Incanter's Torque",  
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Malignance Earring ", rear="Regal Earring", 
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +2", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			--  legs=gear.chironic_macc_legs,
			back=gear.Macc_jse_back, waist="Ovate Rope", legs="Atrophy Tights +2", feet="Vitiation Boots +1"}
	
	sets.midcast['Sleep'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Sleep II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Sleepga'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Silence'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Inundation'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Dispel'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Break'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Bind'] = sets.midcast['Enfeebling Magic'].Resistant
	
	-- Path C Int + Potency Gear
	-- Blind
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back})
	
	sets.midcast['Blind'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1", legs="Viti. Tights +1"})
	sets.midcast['Blind II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1", legs="Viti. Tights +1"})
	
	-- Path B MND + Potency Gear
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +2"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {body="Atrophy Tabard +2"})

	sets.midcast['Paralyze'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Paralyze II'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Addle'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Addle II'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Slow II'] = set_combine(sets.midcast.MndEnfeebles, {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast.MndEnfeebles, {head="Viti. Chapeau +1"})
	
	-- Path D Enfeebling Skill + Potency Gear
	-- Poison II
	sets.midcast['Poison'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Poison II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Poisonga'] = set_combine(sets.midcast['Enfeebling Magic'], {})
 
	-- Path E - Enfeebling Skill + MND + Potency
	sets.midcast['Distract'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Distract II'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract II'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle II'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle II'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	-- Path F - Seperated For AF
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})


	sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif", waist="Austerity Belt"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif", waist="Austerity Belt"}) 
    
	-- Divine Magic 
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	-- Elemental Magic 
	sets.midcast['Elemental Magic'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- gear.merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Malignance Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1  Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Austerity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Resistant = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- gear.merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Malignance Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Austerity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty, ammo="Regal Gem",
        -- gear.merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Malignance Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1  Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Austerity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- Duelist Torque +2
		head=empty, neck="Erra Pendant", lear="Malignance Earring", rear="Regal Earring",
		-- Regal Cuffs Stikini Ring +1 Stikini Ring +1
		body="Twilight Cloak", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Vitiation Boots +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Ammurapi Shield", ammo="Regal Gem", 
		head="Atrophy Chapeau +2", neck="Erra Pendant", lear="Malignance Earring", rear="Regal Earring",
		--body="Atrophy Tabard +3",hands="Leth. Gantherots +1",
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- legs="Psycloth Lappas", feet=gear.merlinic_nuke_feet
		back=gear.Macc_jse_back,waist="Ovate Rope", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield", ammo="Regal Gem", 
		head="Pixie Hairpin +1", neck="Erra Pendant", lear="Malignance Earring", rear="Regal Earring",
        -- Shango Robe 
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
        -- legs=gear.chironic_macc_legs, feet=gear.chironic_nuke_feet
		back=gear.Macc_jse_back, waist="Fucho-no-obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion",
		--sub="Clerisy Strap +1",
		head="Viti. Chapeau +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		--legs=gear.chironic_macc_legs, eet=gear.merlinic_aspir_feet}
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2",  feet="Aya. Gambieras +2"}
	sets.midcast.Stun.Resistant = {main="Maxentius",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- legs=gear.chironic_macc_legs,
		back=gear.Macc_jse_back,waist="Ovate Rope", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {-- ammo="Homiliary",
		main="Bolelabunga",sub="Genmei Shield",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {--ammo="Homiliary",
		main="Bolelabunga",sub="Ammurapi Shield",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.PDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.MDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.Weak = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back=gear.FC_jse_back,legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"
	
	-- Defense sets
	sets.defense.PDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
    sets.defense.MEVA = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genmei Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Volte Hose",feet="Aya. Gambieras +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Dagger = {main="Kaja Knife", sub="Ammurapi Shield"}
	sets.weapons.Sword = {main="Kaja Sword", sub="Ammurapi Shield"} 
	sets.weapons.Club = {main="Maxentius", sub="Ammurapi Shield"} 
	sets.weapons.DualWeapons = {main="Kaja Sword", sub="Pukulatmuj"}
 	sets.weapons.DualDagger = {main="Kaja Knife", sub="Maxentius"} -- Kaja Knife
	sets.weapons.DualClubs = {main="Maxentius", sub="Kaja Rod"}

	-- Weapons sets
	sets.weapons.Sword = {main="Naegling", sub="Genmei Shield"}
	sets.weapons.Mandau = {main="Mandau", sub="Genmei Shield"}
	sets.weapons.Sequence = {main="Sequence",sub="Genmei Shield"}
	sets.weapons.Almace = {main="Almace",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Kaja Knife"}
	sets.weapons.DualDagger = {main="Mandau", sub="Kaja Knife"}
	sets.weapons.DualClubs = {main="Maxentius", sub="Kaja Rod"}
	-- Sequence
	sets.weapons.DualAlmace = {main="Almace",sub="Naegling"}
	sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.Almace = {main="Almace",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Kaja Sword"}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Almace"}
	sets.weapons.DualEvisceration = {main="Kaja Knife",sub="Almace"}
	sets.weapons.DualAeolian = {main="Kaja Knife",sub="Maxentius"}
	sets.weapons.DualProcDaggers = {main="Blurred Knife +1",sub="Atoyac"}
	sets.weapons.EnspellOnly = {main="Norgish Dagger",sub="Aern Dagger",range="Kaja Bow",ammo="Beetle Arrow"}
	sets.weapons.DualClubs = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualBlackHalo = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualAlmace = {main="Almace",sub="Naegling"}
	sets.weapons.DualBow = {main="Naegling",sub="Kaja Knife",range="Kaja Bow"}
	sets.weapons.BowMacc = {range="Kaja Bow",ammo=empty}
	
    sets.buff.Sublimation = {} -- waist="Embla Sash"
    sets.buff.DTSublimation = {} -- waist="Embla Sash"

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	--	sets.engaged = {ammo="Ginsen",
	--	head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
	--	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring", ring2="Ilabrat Ring",
	--	back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.EnspellOnly = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- Dls. Torque +2 ear2="Hollow Earring",
		head="Umuthi Hat",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- Malignance Tabard
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ramuh Ring +1",
		-- Orpheus's Sash Malignance Tights 
		back=gear.dw_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2",feet="Malignance Boots"}
		
	sets.engaged.DW = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(5, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 3)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 3)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'WHM' then
		set_macro_page(4, 3)
	else
		set_macro_page(1, 3)
	end
end

function user_job_self_command(commandArgs, eventArgs)

end


buff_spell_lists = {
	Auto = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		--{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		--{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
}