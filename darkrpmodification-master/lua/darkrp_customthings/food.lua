--[[---------------------------------------------------------------------------
DarkRP custom food
---------------------------------------------------------------------------

This file contains your custom food.
This file should also contain food from DarkRP that you edited.

THIS WILL ONLY LOAD IF HUNGERMOD IS ENABLED IN darkrp_config/disabled_defaults.lua.
IT IS DISABLED BY DEFAULT.

Note: If you want to edit a default DarkRP food, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the food item to this file and edit it.

The default food can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/hungermod/sh_init.lua#L33

Add food under the following line:
---------------------------------------------------------------------------]]
DarkRP.createFood("Pizza au fromage", {
    model = "models/cheesepizza01/cheesepizza01.mdl",
    energy = 100,
    price = 40
})

DarkRP.createFood("Pizza au pepperoni", {
    model = "models/peppizza02/peppizza02.mdl",
    energy = 100,
    price = 40
})

DarkRP.createFood("Hamburger", {
    model = "models/burgerplate01/burgerplate01.mdl",
    energy = 100,
    price = 45
})

DarkRP.createFood("Spaghetti", {
    model = "models/spaghettiandmeatballs01/spaghettiandmeatballs01.mdl",
    energy = 100,
    price = 35
})