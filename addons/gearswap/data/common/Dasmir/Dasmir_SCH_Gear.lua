-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None', 'Default', 'DualClubs','Akademos','Khatvanga')

	gear.nuke_jse_back = {	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.FC_jse_back = 	{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Mag. Evasion+15',}}
	gear.Cure_jse_back = {	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Mag. Evasion+15',}}
	
	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Bishop's Sash"

	gear.obi_low_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	
	-- Additional local binds 
	-- * = ctrl
	-- @ = windows
	-- ! = alt
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	--send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('alias Myrkr input /ws "Myrkr" <me>')
	
		
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +1"} 

    -- Fast cast sets for spells
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
        head="Amalric Coif",neck="Voltsurge Torque", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
        --body="Zendik Robe",
		body="Acad. Gown +2", hands="Acad. Bracers +2",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Peda. Loafers +1"}
		
	sets.precast.FC.Arts = {feet="Acad. Loafers +2"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {body="Mallquis Saio +2",})--ear1="Barkaro. Earring"

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})-- main="Serenity",

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Doyen Pants"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {--ammo="Staunch Tathlum",
		head="Pixie Hairpin +1", neck="Sanctity Necklace", ear1="Loquacious Earring", ear2="Etiolation Earring",
		-- body="Amalric Doublet +1", hands="Regal Cuffs", 
		body="Acad. Gown +2", hands="Acad. Bracers +2", ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		-- waist="Yamabuki-no-Obi", 
		back="Fi Follet Cape +1", waist="Fucho-no-obi", legs="Peda. Pants +1",feet="Peda. Loafers +1"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})-- hands="Volte Bracers", waist="Chaac Belt"
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring",feet="Jhakri Pigaches +2"} --main="Akademos",
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1"} -- ring2="Archon Ring"

	-- Midcast
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
        head="Amalric Coif",neck="Voltsurge Torque", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
        --body="Zendik Robe",
		body="Acad. Gown +2", hands="Acad. Bracers +2",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Peda. Loafers +1"}
		
    sets.midcast.Cure = {main=gear.gada_healing_club, sub="Sors Shield", ammo="Hasty Pinion +1",
		-- neck="Incanter's Torque"
        head="Vanya Hood",neck="Colossus's Torque", ear1="Regal Earring",ear2="Novia Earring",
        body="Heka's Kalasiris",hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
		-- legs=gear.chironic_cure_legs feet="Vanya Clogs"
        back=gear.Cure_jse_back,waist="Luminary Sash", legs="Acad. Pants +2",feet="Peda. Loafers +1"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Enki Strap",ammo="Hasty Pinion +1",
		-- neck="Incanter's Torque"
        head="Vanya Hood",neck="Colossus's Torque", ear1="Regal Earring",ear2="Novia Earring",
        body="Heka's Kalasiris",hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
		--  legs=gear.chironic_cure_legs feet="Vanya Clogs"
        back=gear.Cure_jse_back, wwaist="Hachirin-no-Obi", legs="Lengo Pants",feet="Peda. Loafers +1"}
		
    sets.midcast.LightDayCure = {main=gear.gada_healing_club, sub="Sors Shield", ammo="Hasty Pinion +1",
		-- neck="Incanter's Torque"
        head="Vanya Hood", neck="Colossus's Torque", ear1="Regal Earring",ear2="Novia Earring",
        body="Heka's Kalasiris",hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
		-- legs=gear.chironic_cure_legs feet="Vanya Clogs"
        back=gear.Cure_jse_back, wwaist="Hachirin-no-Obi",legs="Lengo Pants",feet="Peda. Loafers +1"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring",}--waist="Gishdubar Sash" ring1="Kunaji Ring",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring",}--waist="Gishdubar Sash" ring1="Kunaji Ring",
	sets.Self_Refresh = {feet="Inspirited Boots"}-- back="Grapevine Cape"waist="Gishdubar Sash"
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		-- main="Oranyan", sub="Clemency Grip",
		-- neck="Debilis Medallion",
		head="Amalric Coif",neck="Colossus's Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		--body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",
		ring1="Ephedra Ring", ring2="Menelaus's Ring",		
		back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Peda. Loafers +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})-- main="Oranyan", sub="Clemency Grip"

	-- 500 Skill
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield", ammo="Savant's Treatise",
		head=gear.telchine_head_Duration,neck="Colossus's Torque",ear1="Andoaa Earring", ear2="Augment. Earring",
		body=gear.telchine_body_Duration,hands=gear.telchine_hands_Duration,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Fi Follet Cape",waist="Olympus Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.FC_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--  neck="Nodens Gorget", ear2="Earthcry Earring",legs="Shedir Seraweels"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {}) -- 
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", sub="Genmei Shield", head="Amalric Coif"})-- hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
        -- Acad. Gown +3
		body="Acad. Gown +2",hands="Acad. Bracers +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.Cure_jse_back,waist="Luminary Sash",legs="Acad. Pants +2",feet="Acad. Loafers +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +2", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
		body="Acad. Gown +2",hands="Acad. Bracers +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.Cure_jse_back,waist="Luminary Sash",legs="Acad. Pants +2",feet="Acad. Loafers +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.Cure_jse_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Cure_jse_back,})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +2",neck="Erra Pendant",ear1="Regal Earring", ear2="Malignance Earring",
		body="Acad. Gown +2",hands="Acad. Bracers +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.Cure_jse_back,waist="Luminary Sash",legs="Acad. Pants +2",feet="Acad. Loafers +2"}

	-- 300 INT
    sets.midcast.Kaustra = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
		-- ring2="Archon Ring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Freke Ring", ring1="Jhakri Ring",
		-- Yamabuki-no-Obi Acuity Belt +1
        back=gear.nuke_jse_back,waist="Acuity Belt",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.Kaustra.Resistant = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		--main="Akademos", sub="Niobid Strap",
		head="Pixie Hairpin +1", neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
		-- ring2="Archon Ring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Freke Ring", ring1="Jhakri Ring",
		-- Yamabuki-no-Obi Acuity Belt +1
        back=gear.nuke_jse_back,waist="Acuity Belt",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
        -- ring1="Evanescence Ring" ring2="Archon Ring",
		body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Stikini Ring",  ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs=gear.chironic_macc_legs,feet="Mallquis Clogs +2"}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
        -- ring1="Evanescence Ring" ring2="Archon Ring",
		 body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Stikini Ring",  ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs=gear.chironic_macc_legs,feet="Mallquis Clogs +2"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
        head="Acad. Mortar. +2",neck="Voltsurge Torque", ear1="Loquacious Earring",ear2="Malignance Earring",
        -- body="Zendik Robe",
		body="Acad. Gown +2",hands="Acad. Bracers +2",ring1="Kishar Ring",ring2="Prolix Ring",
		-- legs="Psycloth Lappas",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Peda. Loafers +1"}

    sets.midcast.Stun.Resistant = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
        head="Acad. Mortar. +2",neck="Voltsurge Torque", ear1="Regal Earring", ear2="Malignance Earring",
        -- body="Zendik Robe",
		body="Acad. Gown +2",hands="Acad. Bracers +2",ring1="Kishar Ring",ring2="Prolix Ring",
		-- legs="Psycloth Lappas",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Peda. Loafers +1"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Sanctity Necklace",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.midcast['Elemental Magic'].Proc = {main=Empty, sub=Empty,
		head="Jhakri Coronal +2", neck="Sanctity Necklace",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'],{
		main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		--main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
		--neck="Combatant's Torque",  ear1="Dedition Earring",ear2="Telos Earring",
		head="Mall. Chapeau +2", neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
        -- body="Amalric Doublet +1", body=gear.helios_body_occult,  hands=gear.helios_hands_Occult,
		body="Shamash Robe", hands="Mallquis Cuffs +2", ring1="Rajas Ring",ring2="Petrov Ring",
		--legs="Perdition Slops", feet=gear.helios_feet_occult
        back=gear.nuke_jse_back, waist="Oneiros Rope", legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",	
		head="Jhakri Coronal +2", neck="Saevus Pendant +1", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})

	sets.midcast.Helix = {main="Daybreak", sub="Ammurapi Shield",  ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1",ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.midcast.Helix.Resistant = {main="Daybreak", sub="Ammurapi Shield",  ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
	
	sets.midcast.Helix.Burst = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,
     	head="Jhakri Coronal +2", neck="Saevus Pendant +1", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
 
	sets.midcast.Impact = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2", neck="Saevus Pendant +1", ear1="Regal Earring", ear2="Malignance Earring",
        body="Shamash Robe",hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff", sub="Kaja Grip", -- ammo="Homiliary", sub="Oneiros Grip",
		--neck="Chrys. Torque",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
		body="Jhakri Robe +2", hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Jhakri Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Jhakri Pigaches +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Daybreak",sub="Genmei Shield", -- ammo="Homiliary",
        head="Befouled Crown", neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
        body="Shamash Robe", hands=gear.merlinic_refresh_hands, ring1="Defending Ring",ring2="Vocane Ring",
		-- waist="Flax Sash", 
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

    sets.idle.PDT = {main="Mafic Cudgel", sub="Genmei Shield",-- ammo="Staunch Tathlum",
		-- sub="Oneiros Grip",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
        body="Shamash Robe",hands="Jhakri Cuffs +2",ring1="Defending Ring",ring2="Vocane Ring",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {})--feet="Hippo. Socks +1"

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield", --ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
        body="Mallquis Saio +2", hands=gear.merlinic_refresh_hands, ring1="Defending Ring",ring2="Vocane Ring",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

    -- Defense sets
    sets.defense.PDT = {main="Mafic Cudgel", sub="Genmei Shield", --ammo="Staunch Tathlum",
        head="Mall. Chapeau +2",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Defending Ring",ring2="Vocane Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.defense.MDT = {main="Mafic Cudgel", sub="Genmei Shield", --ammo="Staunch Tathlum",
        head="Mall. Chapeau +2",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Defending Ring",ring2="Vocane Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel", sub="Genmei Shield", --ammo="Staunch Tathlum",
		--sub="Irenic Strap +1",
		--ear2="Sanare Earring",
        head="Mallquis Chapeau +2", neck="Warder's Charm +1", lear="Lugalbanda Earring", ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Defending Ring", ring2="Vocane Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Kaja Rod",sub="Genmei Shield", ammo="Hasty Pinion +1",
        head="Acad. Mortar. +2",neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
        body="Acad. Gown +2",hands="Acad. Bracers +2", ring1="Rajas Ring",ring2="Petrov Ring",
		--waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Acad. Pants +2",feet="Acad. Loafers +2"}
	
	sets.engaged.DW = {main="Kaja Rod",sub="Genmei Shield", ammo="Hasty Pinion +1",
        head="Acad. Mortar. +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Acad. Gown +2",hands="Acad. Bracers +2", ring1="Rajas Ring",ring2="Petrov Ring",
		--waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Acad. Pants +2",feet="Acad. Loafers +2"}
	
	sets.engaged.PDT = {main="Kaja Rod", sub="Genmei Shield", -- ammo="Staunch Tathlum",
		head="Acad. Mortar. +2",neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
        body="Acad. Gown +2",hands="Acad. Bracers +2", ring1="Defending Ring", ring2=gear.DarkRing,
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Acad. Pants +2",feet="Acad. Loafers +2"}

	sets.engaged.PDT.DW = {main="Kaja Rod", sub="Genmei Shield", -- ammo="Staunch Tathlum",
		head="Acad. Mortar. +2",neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
        body="Acad. Gown +2",hands="Acad. Bracers +2", ring1="Defending Ring", ring2=gear.DarkRing,
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Acad. Pants +2",feet="Acad. Loafers +2"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {
		-- ear1="Mendi. Earring",
		head="Pixie Hairpin +1", ear2="Evans Earring",
		--body="Zendik Robe",hands="Hieros Mittens", 
		ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",		
		back=gear.FC_jse_back,}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Acad. Pants +2"}
	sets.buff['Dark Arts'] = {body="Acad. Gown +2"} 

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Default = {main="Daybreak", sub="Genmei Shield"}
	sets.weapons.DualClub = {main="Daybreak", sub="Kaja Rod"}
	sets.weapons.Akademos = {main="Akademos",sub="Kaja Grip"}--Niobid Strap
	sets.weapons.Khatvanga = {}--main="Khatvanga",sub="Bloodrain Strap"
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(5, 9)
	elseif player.sub_job == 'BLM' then
		set_macro_page(3, 9)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 9)
	else
		set_macro_page(5, 9)
	end
end

function user_job_self_command(commandArgs, eventArgs)
	
end

	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
buff_spell_lists = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Combat'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}




