-- Externals
require("utils.plr")
require("utils.npc")
require("utils.rooms")
require("utils.typewriter")

COMBAT_INIT = require("comp.combat")

-- Game variables
TURNS = 0

typewrite("Welcome to the game")
io.write("Please enter your name: ")
local cname = io.read()
NAME = cname

-- Game Menu
while true do

    TURNS = TURNS + 1

    typewrite("What would you like to do?")
    typewrite("1. Travel")
    typewrite("2. Check Stats")
    typewrite("3. Look Around")
    typewrite("0. Quit")

    io.write("Please enter your choice: ")
    local mchoice = tonumber(io.read("*l"))
    
    if mchoice then
        if mchoice == 1 then
            require("comp.travel")
        elseif mchoice == 2 then
            print("---------------------")
            typewrite("Player Stats:")
            typewrite("Name: " .. NAME)
            typewrite("HP: " .. HP .. "/" .. MAX_HP)
            typewrite("AT: " .. AT)
            typewrite("DF: " .. DF)
            typewrite("Current Room: " .. ROOM_CURRENT)
            typewrite("Weapon: " .. WEAPON)
            typewrite("Armor: " .. ARMOR)
            typewrite("Turns Played: " .. TURNS)
            typewrite("Money: " .. MONEY)
            print("---------------------")
        elseif mchoice == 3 then
            local rng = math.random(1,5)
            print("---------------------")
            typewrite("You are currently in: " .. ROOM_CURRENT)
            typewrite(ROOMS[ROOM_CURRENT].description)

            if rng == 1 or rng == 3 then
                if HP < MAX_HP then
                    typewrite("You heal back " .. math.floor((MAX_HP/2) + 0.5) .. " HP!")
                    HP = HP + math.floor((MAX_HP/2) + 0.5)
                    if HP > MAX_HP then
                        HP = MAX_HP
                    end
                else
                    typewrite("You rest.")
                end

            elseif rng == 2 then
                typewrite("You look around and find a small pouch of money!")
                MONEY = MONEY + 5

            elseif rng == 4 then
                typewrite("You look around and find a large pouch of money!")
                MONEY = MONEY + 10

            elseif rng == 5 then
                if ROOMS[ROOM_CURRENT].encounters then
                    if #ROOMS[ROOM_CURRENT].encounters > 0 then
                        typewrite("But wait... there is an evil guy here!")
                        print("---------------------")
                        COMBAT_INIT()
                    end
                else
                    typewrite("You feel as though you are unlucky, even though nothing happened.")
                end
            end

            print("---------------------")

        elseif mchoice == 0 then
            print("---------------------")
            typewrite("Thanks for playing!")
            print("---------------------")
            os.exit()
        else
            typewrite("Invalid choice. Please try again.")
        end
    else
        typewrite("Invalid input. Please enter a number.")
    end
end