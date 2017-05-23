--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]
TEAM_CITIZEN = DarkRP.createJob("Citoyen", {
    color = Color(35, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
		"models/player/Group01/male_06.mdl",
		"models/player/Group01/male_07.mdl",
		"models/player/Group01/male_08.mdl",
		"models/player/Group01/male_09.mdl",
		"models/player/Group02/male_02.mdl",
		"models/player/Group02/male_04.mdl",
		"models/player/Group02/male_06.mdl",
		"models/player/Group02/male_08.mdl"
    },
    description = [[Le citoyen actif est le membre d'une societe qui assume certaines responsabilites dans son environnement, bien que ce membre n'ait pas un rôle spécifique.]],
    weapons = {"weapon_fists", "weapon_arc_atmcard", "pocket"},
    command = "citizen",
    max = 0,
    salary = 15,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Citoyens"
})

TEAM_BAC = DarkRP.createJob("*VIP* BAC", {
    color = Color(51, 0, 255, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Infiltrez les gangs!]],
    weapons = {"keypad_cracker", "weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket", "weapon_arc_atmcard"},
    command = "bac",
    max = 2,
    salary = 65,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Protection civile",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end,
    customCheck = function(ply) return
        table.HasValue({"VIP"}, ply:GetNWString("usergroup"))
    end,
    CustomCheckFailMsg = "Ce metier est VIP! Désolé...",
})

TEAM_JUGE = DarkRP.createJob("Juge", {
    color = Color(5, 0, 255, 255),
    model = {"models/player/gman_high.mdl"},
    description = [[Vous jugez les criminels de la ville! Vous n'avez aucun controle sur les policiers, par contre, les grefiers sont vos subordonnés!]],
    weapons = {"weapon_fists", "stunstick", "pocket"},
    command = "juge",
    max = 1,
    salary = 125,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le juge est mort!")
    end
})

TEAM_PREFET = DarkRP.createJob("Préfet de police", {
    color = Color(5, 0, 255, 255),
    model = {"models/player/breen.mdl"},
    description = [[Vous etes le premier policier de France! Votre travail est aussi important que celui du maire! Vous supervisez tous les policiers de la ville! Vous avez un bureau à la mairie!]],
    weapons = {"weapon_fists", "m9k_deagle", "stunstick", "pocket"},
    command = "prefet",
    max = 1,
    salary = 125,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le préfet est mort!")
    end
})

TEAM_CHIEF = DarkRP.createJob("Commissaire de police", {
    color = Color(5, 0, 255, 255),
    model = {
        "models/portal2/patrol_02.mdl",
        "models/portal2/patrol_04.mdl",
        "models/portal2/patrol_05.mdl",
        "models/portal2/patrol_06.mdl",
        "models/portal2/patrol_07.mdl",
        "models/portal2/patrol_08.mdl",
        "models/portal2/patrol_09.mdl"
    },
    description = [[CECI EST UN TRAVAIL DE BUREAU! VOTRE BUREAU EST A LA MAIRIE! Le commisaire coordonne les policiers, il dirige le commissariat et c'est lui qui dirige les operations. Respectez le sous peine d'etre viré de la police.]],
    weapons = {"keypad_cracker", "weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket", "weapon_arc_atmcard"},
    command = "chief",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le commissaire est mort! La place est vacante!")
    end
})

TEAM_CAPITAINE = DarkRP.createJob("Capitaine de police", {
    color = Color(5, 0, 255, 255),
    model = {
        "models/player/santosrp/Male_02_santosrp.mdl",
        "models/player/santosrp/Male_04_santosrp.mdl",
        "models/player/santosrp/Male_05_santosrp.mdl",
        "models/player/santosrp/Male_06_santosrp.mdl",
        "models/player/santosrp/Male_07_santosrp.mdl",
        "models/player/santosrp/Male_08_santosrp.mdl",
        "models/player/santosrp/Male_09_santosrp.mdl"
    },
    description = [[Vous êtes la personne la plus gradé après le commissaire, vous faites passer les ordres au lieutenant qui lui ira sur les lieux! Vous êtes avec le commissaire les négociateurs!]],
    weapons = {"keypad_cracker", "weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket", "weapon_arc_atmcard"},
    command = "capitaine",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le capitaine est mort! La place est vacante!")
    end
})

TEAM_LIEUTENANT = DarkRP.createJob("Lieutenant de police", {
    color = Color(5, 0, 255, 255),
    model = {
        "models/player/santosrp/Male_02_santosrp.mdl",
        "models/player/santosrp/Male_04_santosrp.mdl",
        "models/player/santosrp/Male_05_santosrp.mdl",
        "models/player/santosrp/Male_06_santosrp.mdl",
        "models/player/santosrp/Male_07_santosrp.mdl",
        "models/player/santosrp/Male_08_santosrp.mdl",
        "models/player/santosrp/Male_09_santosrp.mdl"
    },
    description = [[Vous êtes la personne la plus gradé après le capitaine, vous faites passer les ordres au commandant!]],
    weapons = {"keypad_cracker", "weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket", "weapon_arc_atmcard"},
    command = "lieutenant",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le lieutenant est mort! La place est vacante!")
    end
})

TEAM_COMMANDANT = DarkRP.createJob("Commandant de police", {
    color = Color(5, 0, 255, 255),
    model = {
        "models/player/santosrp/Male_02_santosrp.mdl",
        "models/player/santosrp/Male_04_santosrp.mdl",
        "models/player/santosrp/Male_05_santosrp.mdl",
        "models/player/santosrp/Male_06_santosrp.mdl",
        "models/player/santosrp/Male_07_santosrp.mdl",
        "models/player/santosrp/Male_08_santosrp.mdl",
        "models/player/santosrp/Male_09_santosrp.mdl"
    },
    description = [[Vous êtes la personne la plus gradé après le lieutenant, Executez ses ordres]],
    weapons = {"keypad_cracker", "weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket", "weapon_arc_atmcard"},
    command = "commandant",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le commandant est mort! La place est vacante!")
    end
})

TEAM_POLICE = DarkRP.createJob("Brigadier de police", {
    color = Color(5, 0, 255, 255),
    model = {
        "models/player/nypd/male_02.mdl",
        "models/player/nypd/male_04.mdl",
        "models/player/nypd/male_05.mdl",
        "models/player/nypd/male_06.mdl",
        "models/player/nypd/male_07.mdl",
        "models/player/nypd/male_08.mdl",
        "models/player/nypd/male_09.mdl"
    },
    description = [[L'agent de police est un membre de la police, qu'il porte ou non l'uniforme et dont la fonction est de faire respecter la loi, de maintenir l'ordre et d'assurer la securite publique.]],
    weapons = {"weapon_stungun", "weapon_fists", "arrest_stick", "unarrest_stick", "m9k_m92beretta", "stunstick", "door_ram", "weaponchecker", "weapon_cuff_police", "pocket"},
    command = "police",
    max = 6,
    salary = 85,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
    ammo = {
        ["pistol"] = 150
    },
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})


TEAM_AVOCAT = DarkRP.createJob("Avocat", {
    color = Color(5, 0, 255, 255),
    model = {"models/humans/group02/player/tale_09.mdl"},
    description = [[L'avocat est un juriste dont la fonction traditionnelle est de conseiller et de defendre ses clients, personnes physiques ou morales, en justice, en plaidant pour faire valoir leurs interets et, plus generalement, pour les representer.]],
    weapons = {"weapon_fists", "pocket"},
    command = "avocat",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_MERCENAIRE = DarkRP.createJob("*VIP* Mercenaire", {
    color = Color(4, 255, 0, 255),
    model = {"models/player/guerilla.mdl"},
    description = [[Le mercenaire est un combattant de métier! Vendez vos services, tant dans le légal que dans l'illégal!]],
    weapons = {"weapon_fists", "pocket"},
    command = "mercenaire",
    max = 2,
    salary = 55,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Citoyens",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end,
    customCheck = function(ply) return
        table.HasValue({"VIP"}, ply:GetNWString("usergroup"))
    end,
    CustomCheckFailMsg = "Ce job est pour les VIP! Désolé...",
})

TEAM_TAG = DarkRP.createJob("Tueur à gage", {
    color = Color(4, 255, 0, 255),
    model = {"models/player/leet.mdl"},
    description = [[Le tueur a gage, élimine ses cibles dans l'ombre!]],
    weapons = {"weapon_fists", "pocket"},
    command = "tag",
    max = 1,
    salary = 30,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Citoyens",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_GUN = DarkRP.createJob("Vendeur d'armes", {
    color = Color(4, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Le vendeur d'armes, vend des armes! Obvious ;0]],
    weapons = {"weapon_fists", "pocket"},
    command = "gun",
    max = 2,
    salary = 30,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Citoyens",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_QUINCAILLERIE = DarkRP.createJob("Quincailler", {
    color = Color(4, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Le quincaillier, vend de la quincaillerie! Obvious ;0]],
    weapons = {"weapon_fists", "pocket"},
    command = "divers",
    max = 2,
    salary = 30,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Citoyens",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_MEDIC = DarkRP.createJob("Médecin", {
    color = Color(4, 255, 0, 255),
    model = {
        "models/player/Group03m/male_01.mdl",
        "models/player/Group03m/male_02.mdl",
        "models/player/Group03m/male_03.mdl"
    },
    description = [[Le médecin soigne les gens]],
    weapons = {"weapon_fists", "pocket"},
    command = "medic",
    max = 2,
    salary = 85,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	category = "Protection civile"
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_MAYOR = DarkRP.createJob("Président", {
    color = Color(35, 34, 85, 255),
    model = {"models/taggart/gallahan.mdl"},
    description = [[Vous dirigez la ville! Vous decidez de tout! Vous etes seul maitre à bord! Mais attention! Si vos subordonnés sont fatigués de vous... Bref, bonne chance!]],
    weapons = {"weapon_fists", "pocket", "weapon_arc_atmcard"},
    command = "mayor",
    max = 1,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
    category = "Protection civile",
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(15)
    end,
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "Le maire est mort!")
    end
})

TEAM_HACKER = DarkRP.createJob("Hacker", {
    color = Color(21, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Le hacker utilise ses compétence pour pénétrer les systèmes informatiques.]],
    weapons = {"weapon_fists", "weapon_arc_atmhack", "weapon_arc_atmcard", "pocket"},
    command = "hacker",
    max = 2,
    salary = 35,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_HOBO = DarkRP.createJob("SDF", {
    color = Color(21, 255, 0, 255),
    model = {"models/player/corpse1.mdl"},
    description = [[Vous avez perdu toutes vos économies, maisons etc...]],
    weapons = {"weapon_fists", "weapon_arc_atmcard", "pocket", "weapon_bugbait"},
    command = "hobo",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_BANK = DarkRP.createJob("Banquier", {
    color = Color(21, 255, 0, 255),
    model = {"models/player/hostage/hostage_02.mdl"},
    description = [[Occupez vous des printers!]],
    weapons = {"weapon_arc_atmcard", "pocket", "weapon_fists"},
    command = "bank",
    max = 2,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_THIEF = DarkRP.createJob("Voleur", {
    color = Color(21, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Entrez dans les maisons par effraction et volez y de quoi faire votre bonheur!]],
    weapons = {"weapon_fists", "keypad_cracker", "lockpick", "pickpocket", "weapon_arc_atmcard", "pocket"},
    command = "thief",
    max = 2,
    salary = 5,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_PSYCHO = DarkRP.createJob("Psycopathe", {
    color = Color(21, 255, 0, 255),
    model = {
        "models/player/Group01/female_01.mdl",
        "models/player/Group01/female_02.mdl",
        "models/player/Group01/female_03.mdl",
        "models/player/Group01/female_04.mdl",
        "models/player/Group01/female_05.mdl",
        "models/player/Group01/female_06.mdl",
        "models/player/Group01/male_01.mdl",
        "models/player/Group01/male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/male_04.mdl",
        "models/player/Group01/male_05.mdl",
        "models/player/Group01/male_06.mdl",
        "models/player/Group01/male_07.mdl",
        "models/player/Group01/male_08.mdl",
        "models/player/Group01/male_09.mdl",
        "models/player/Group02/male_02.mdl",
        "models/player/Group02/male_04.mdl",
        "models/player/Group02/male_06.mdl",
        "models/player/Group02/male_08.mdl"
    },
    description = [[Tuez toutes vos proies dans des endroits discret et calmes! (sans temoins)]],
    weapons = {"weapon_fists", "lockpick", "weapon_arc_atmcard", "pocket"},
    command = "psycho",
    max = 2,
    salary = 65,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end,
    customCheck = function(ply) return
        table.HasValue({"VIP"}, ply:GetNWString("usergroup"))
    end,
    CustomCheckFailMsg = "Ce metier est VIP! Désolé...",
})

TEAM_BRAQUEUR = DarkRP.createJob("Braqueur", {
    color = Color(21, 255, 0, 255),
    model = {
        "models/player/pd2_chains_p.mdl",
        "models/player/pd2_dallas_p.mdl",
        "models/player/pd2_hoxton_p.mdl",
        "models/player/pd2_wolf_p.mdl"
    },
    description = [[Braquez la banque!]],
    weapons = {"weapon_fists", "lockpick", "weapon_arc_atmcard", "pocket"},
    command = "braquage",
    max = 4,
    salary = 65,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_GARDES = DarkRP.createJob("Garde de sécurité", {
    color = Color(21, 255, 0, 255),
    model = {
        "models/player/guard_pack/guard_01.mdl",
        "models/player/guard_pack/guard_02.mdl",
        "models/player/guard_pack/guard_03.mdl",
        "models/player/guard_pack/guard_04.mdl",
        "models/player/guard_pack/guard_05.mdl",
        "models/player/guard_pack/guard_06.mdl",
        "models/player/guard_pack/guard_07.mdl",
        "models/player/guard_pack/guard_08.mdl",
        "models/player/guard_pack/guard_09.mdl"
    },
    description = [[Protégez les gens! ]],
    weapons = {"weapon_fists", "stunstick", "weaponchecker", "weapon_arc_atmcard", "pocket"},
    command = "gardes",
    max = 2,
    salary = 65,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})

TEAM_COOK = DarkRP.createJob("Cuisinier", {
    color = Color(0, 255, 10, 255),
    model = {"models/player/mossman.mdl"},
    description = [[Vendez de la nourriture!]],
    weapons = {"weapon_fists", "pocket"},
    command = "cook",
    max = 2,
    salary = 65,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citoyens",
    PlayerDeath = function(ply, weapon, killer)
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "")
    end
})
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_POLICE] = true,
    [TEAM_CHIEF] = true,
    [TEAM_MAYOR] = true,
	[TEAM_CAPITAINE] = true,
	[TEAM_LIEUTENANT] = true,
	[TEAM_COMMANDANT] = true,
	[TEAM_JUGE] = true,
	[TEAM_PREFET] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_TAG)