if #ROOMS[ROOM_CURRENT].exits > 0 then

    print("---------------------")
    typewrite("You can go to: ")
    for i = 1, #ROOMS[ROOM_CURRENT].exits do
        typewrite("[ " .. i .. " ] " .. ROOMS[ROOM_CURRENT].exits[i])
    end
    print("---------------------")

    while true do

        io.write("Please enter your choice: ")
        local tchoice = tonumber(io.read("*l"))

        if tchoice then
            if tchoice >= 1 and tchoice <= #ROOMS[ROOM_CURRENT].exits then
                typewrite("You have chosen to go to room " .. ROOMS[ROOM_CURRENT].exits[tchoice] .. ".")
                ROOM_CURRENT = ROOMS[ROOM_CURRENT].exits[tchoice]
                if #ROOMS[ROOM_CURRENT].encounters > 0 then
                    print("---------------------")
                    typewrite("But wait... there is an evil guy here!")
                    print("---------------------")
                    COMBAT_INIT()
                end
                break
            else
                typewrite("Invalid choice. Please try again.")
            end
        else
            typewrite("Invalid input. Please enter a number.")
        end

    end

    print("---------------------")

else
    print("---------------------")
    typewrite("There are no exits from this room.")
    typewrite("You are forever stuck here.")
    typewrite(NAME .. " will return in Avengers: Doomsday.")
    print("---------------------")
    os.exit()
end