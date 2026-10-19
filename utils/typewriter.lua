-- Typewriter
function typewrite(str)
    for char in string.gmatch(str, ".") do
        io.write(char)
        io.flush()
        os.execute("sleep " .. tostring(0.01))
    end
    print()
end

function slow_typewrite(str)
    for char in string.gmatch(str, ".") do
        io.write(char)
        io.flush()
        os.execute("sleep " .. tostring(0.05))
    end
    print()
end

function fast_typewrite(str)
    for char in string.gmatch(str, ".") do
        io.write(char)
        io.flush()
        os.execute("sleep " .. tostring(0.005))
    end
    print()
end