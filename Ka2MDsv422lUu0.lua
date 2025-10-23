local betavalue = true

local users = {
    ["PavelDIPF"] = { t = "u" },
    ["twisted_k1d"] = { t = "b1" },

    ["Shape_38"] = { t = "l", e = "01.01.2026" },
    ["OrangeDeveloperr"] = { t = "l", e = "01.01.2026" },

    ["haz400mn"] = { t = "b", c = "2.1" },
    ["DimaSuper30"] = { t = "b", c = "2.8" },
}

if betavalue then
    for name, data in pairs(users) do
        if data.t == "b" then continue end
        data.t = "u"
    end
else
    for name, data in pairs(users) do
        if data.t == "b" then continue end
        if data.t == "b1" then
            data.t = "l"
            data.c = "01.01.2025"
        end
    end
end

return users

--[[
o1 = owner
b1 = beta
b = banned
l = limited
u = unlimited

c = cause
t = type
e = expire
--]]
