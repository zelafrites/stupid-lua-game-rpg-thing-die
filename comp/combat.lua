return function()
    local eID = math.random(1, #ROOMS[ROOM_CURRENT].encounters)
    local enemy = NPCS[ROOMS[ROOM_CURRENT].encounters[eID]]
    local turn = 1

    -- Make sure enemy hp is maximum
    enemy.hp = enemy.max_hp

    local start_def = DF

    while enemy.hp ~= 0 do
        if turn == 1 then
            -- Player turn
            typewrite("What would you like to do?")
            typewrite("0. Check")
            typewrite("1. Attack")
            typewrite("2. Defend")

            io.write("Please enter your choice: ")
            local achoice = tonumber(io.read("*l"))
            
            if achoice then
                if achoice == 0 then
                    print("---------------------")
                    typewrite(enemy.description)
                    typewrite("The " .. enemy.name .. " has " .. enemy.hp .. "/" .. enemy.max_hp .. " HP left.")
                    typewrite("The " .. enemy.name .. " has " .. enemy.atk .. " AT and " .. enemy.def .. " DF.")
                    print("---------------------")

                elseif achoice == 1 then
                    local damage = AT - enemy.def
                    if damage <= 0 then
                        damage = 1
                    end
                    enemy.hp = enemy.hp - damage
                    if enemy.hp < 0 then
                        enemy.hp = 0
                    end
                    print("---------------------")
                    typewrite("You attack the " .. enemy.name .. " for " .. damage .. " damage!")
                    typewrite("The " .. enemy.name .. " has " .. enemy.hp .. "/" .. enemy.max_hp .. " HP left.")
                    print("---------------------")

                elseif achoice == 2 then
                    print("---------------------")
                    typewrite("You defend against the " .. enemy.name .. "'s attack.")
                    typewrite("Your DEF raised by 1!")
                    print("---------------------")
                    DF = DF + 1

                else
                    typewrite("Invalid choice. Please try again.")
                end
            else
                typewrite("Invalid input. Please enter a number.")
            end

            turn = 0
        else
            -- Enemy turn
            local damage = enemy.atk - DF
            if damage <= 0 then
                damage = 1
            end
            HP = HP - damage
            if HP < 0 then
                HP = 0
            end

            print("---------------------")
            typewrite("The " .. enemy.name .. " attacks you for " .. damage .. " damage!")
            typewrite("You have " .. HP .. "/" .. MAX_HP .. " HP left.")
            print("---------------------")

            turn = 1
        end

        if HP == 0 then
            print("---------------------")
            typewrite("You have been defeated by the " .. enemy.name .. "!")
            typewrite("Game Over.")

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
            os.exit()
        end
    end

    -- Reset player DEF to original value
    DF = start_def

    typewrite("You have defeated the " .. enemy.name .. "!")
    typewrite("You have gained " .. enemy.atk .. " money!")
    MONEY = MONEY + enemy.atk
end