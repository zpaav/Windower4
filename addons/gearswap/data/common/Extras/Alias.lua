--[[Additional binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key]]
	

-- Global Alias
send_command('alias geodes exec geodes.txt')
send_command('alias key input /item "Forbidden Key" <stnpc>')

-- Casting Lots
send_command('alias la send @all tr lotall')
send_command('alias pa send @all tr passall')
send_command('alias l1 send @all lua load lottery')
send_command('alias l2 send @all lua unload lottery')
send_command('alias pool lua load treasurepool')
send_command('alias unpool lua load treasurepool')

-- Typos
send_command('alias logout input /logout')
send_command('alias sendpost input /sendpost')
send_command('alias deliverybox input /deliverybox')
send_command('alias hpa hp a')

-- Gearing from Slips
send_command('alias getslip exec '..player.name..'/get_slips.txt')
send_command('alias putslip exec '..player.name..'/put_slips.txt') 
send_command('alias getslips exec '..player.name..'/get_slips.txt')
send_command('alias putslips exec '..player.name..'/put_slips.txt') 

-- Get and Pull Gear Per Job
send_command('alias gear exec '..player.name..'/gear'..player.main_job..'.txt')
send_command('alias ungear gs equip naked;exec '..player.name..'/ungear'..player.main_job..'.txt')

-- PortPacker
send_command('alias store lua load enternity;wait 1;naked;wait 1;po store '..player.main_job)
send_command('alias unstore lua load enternity;po unpack '..player.main_job..';wait 20;lua unload enternity')

--Sparks
send_command('alias shields repeater command sparks buy acheron shield;wait 1;repeater delay 3;wait 1;wrepeater count 38;wait 1;repeater on')

-- Naked
send_command('alias naked gs equip naked')

-- Jobs
send_command('alias si send @all sneak')
send_command('alias rh1 send @cor gs rh enable; wait .5; ra <t>')
send_command('alias rh2 send @cor gs rh disable')
-- Embrava
send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
-- Kaustra
send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')
-- Pro/shell
send_command('alias pro input /ma "Accession" <me>;wait 1;input /ma "Shell V" <me>;wait 5;input /ma "Accession" <me>;wait 1;input /ma "Protect V" <me>;')

-- Crafting Related
send_command('alias crafting exec '..player.name..'/gear_craft.txt')
send_command('alias ucrafting exec '..player.name..'/ungear_craft.txt')
send_command('alias craft exec '..player.name..'/gear_craft.txt')
send_command('alias ucraft exec '..player.name..'/ungear_craft.txt')
send_command('alias crest exec craft/reset.txt')

-- Fast Follow 
send_command('alias fol send @others follow '..player.name..'')
send_command('alias ufol send @others exec unfollow.txt')


send_command('alias idleregen gs c set IdleMode Regen')
send_command('alias idlerefresh gs c set IdleMode refresh')
send_command('alias kite gs c toggle Kiting')
send_command('alias bolt send @cor boltersroll;wait 1;send @dnc chocobo jig ii;wait 1;send @brd Chocobo Mazurka')


-- Send all Target
-- everyone do action
send_command('alias sa send @all')
send_command('alias sac send @all gs c')
send_command('alias sae send @all exec')

-- everyone target
send_command('alias tar sat alltarget;wait 1;input /echo All Target')
-- everyone 
send_command('alias as sat allcommand')
send_command('alias ac sat allcommand')
send_command('alias allatt sat allattack')
send_command('alias ass sat alltarget;wait 1;sat allcommand assault')

send_command('alias off send @all /attackoff')
send_command('alias ta input /targetnpc')
send_command('alias at input /targetnpc; wait 1; input /attack <t>')

-- Pulling 
send_command('alias puller gs c toggle Kiting;wait 1;gs c ')
--send_command('alias ageo exec aniyah/geo.txt')
--send_command('alias tank input /ja "Pianissimo" <me>;wait 2;input /ma "Foe Sirvante" <p1>')


-- Binds
-- Follow
send_command('bind pageup fol')
send_command('bind pagedown ufol')
send_command('bind !pageup 	bolt')
	
send_command('bind numpad+ input /targetnpc;wait 1;sat alltarget')
send_command('bind ^numpad+ sat allattack')
send_command('bind @numpad+ sat allattack')
send_command('bind !numpad+ sat allattack')
send_command('bind ^@!numpad+ sat allattack')

send_command('bind numpad- off')


send_command('bind numpad9 send @brd /ma "Horde\'s Lullaby <tid>"')

--send_command('bind numpadEnter sat allattack')

-- Embrava
send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
-- Kaustra
send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')
-- Pro/shell
send_command('alias pro input /ma "Accession" <me>;wait 1;input /ma "Shell V" <me>;wait 5;input /ma "Accession" <me>;wait 1;input /ma "Protect V" <me>;')

-- Base Buffs
send_command('alias allbuffs send @all exec buffs/'..player.main_job..'_basebuffs.txt')
send_command('alias idlebuffs send @all exec buffs/'..player.main_job..'_idlebuffs.txt')

send_command('alias aoecorbuffs send @cor roller roll1 exp;wait 1;send @cor roller roll2 blm;wait 1;send @cor roller on')


















