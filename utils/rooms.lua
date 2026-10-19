ROOMS = {
    -- Street one
    ["Street 1"] = {
        description = "You are on a quiet street. The sun is shining.",
        exits = {"Street 2"}
    },

    -- Street two
    ["Street 2"] = {
        description = "You are on a busy street. Cars are honking.",
        encounters = {"Frog", "Pig"},
        exits = {"Street 1", "Street of Evilness"}
    },

    -- Street of evilness
    ["Street of Evilness"] = {
        description = "You are on a dark street. It feels so... evil.",
        exits = {}
    }
}