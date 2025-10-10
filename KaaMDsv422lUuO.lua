local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/twistedk1d/CasualScript/refs/heads/main/libary/UI/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "[ 👾 ] Casual Script",
    Icon = 0,
    LoadingTitle = "[ 👾 ] Casual Script",
    LoadingSubtitle = "by DIPF Team",
    ShowText = "[ 👾 ] Casual Script",
    Theme = "DarkBlue",
    ToggleUIKeybind = "Y",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = true,

    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "CasualScripts"
    },

    Discord = {
        Enabled = true,
        Invite = "noinvitelink",
        RememberJoins = false
    },

    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }    
})

local Tab = Window:CreateTab("Info", "info")

Tab:CreateParagraph({
    Title = "✨ Добро пожаловать!",
    Content = [[

❓ Есть вопросы, баги или предложения?

💬 Напиши нам в Telegram бот: https://ссылка
- Ответим на ваши сообщения и поможем

🛠️ Скрипт создан командой 'Twistedk1d’s'
🎮 Скрипт предназначен для плейса: CasualStock [BETA]
📱 Наш ТГ-Канал: https://ссылка

🙏 Спасибо, что пользуетесь нашим скриптом! Желаем приятной игры!
    ]]
})

local scriptCode = game:HttpGet("https://raw.githubusercontent.com/twistedk1d/CasualScript/refs/heads/main/libary/changelog/logs.lua")
local func = loadstring(scriptCode)
local logs = func()

if type(logs) == "table" then
    logs = table.concat(logs, "\n")
elseif type(logs) ~= "string" then
    logs = tostring(logs)
end

local Paragraph = Tab:CreateParagraph({
    Title = "📝 Список Изменений",
    Content = logs  
})


local Tab = Window:CreateTab("ESP", "eye")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ItemsEsp = {}
local ActiveStores = {}
local ActiveHighlights = {}

local StoreItems = {
    ["SportMaster"] = {
        Pants = {
            ["Чёрные Джоггеры 'Puma'"] = {Min = 0, Max = 1500},
            ["Чёрные Спортивные Штаны 'Adidas'"] = {Min = 0, Max = 2450},
            ["Спортивные Штаны 'Polo'"] = {Min = 0, Max = 1300},
            ["Спортивные Штаны 'Nike'"] = {Min = 0, Max = 1200},
        },
        Shirt = {
            ["Красная Футболка 'Demix'"] = {Min = 0, Max = 1000},
            ["Чёрная Спортивная Джинсовка 'Puma'"] = {Min = 0, Max = 2300},
            ["Белая Футболка 'Puma'"] = {Min = 0, Max = 1500},
            ["Чёрная Футболка 'Puma'"] = {Min = 0, Max = 1500},
            ["Чёрная Тренажёрная Куртка 'Nike'"] = {Min = 5000, Max = 5650},
        }
    },
    ["SmeshnieCeni"] = {
        Pants = {
            ["Черные порваные джинсы"] = {Min = 0, Max = 60}
        },
        Shirt = {
            [""] = {Min = 0, Max = 1},
        }
    },
    ["Balenciaga"] = {
        Pants = {
            ["Брюки 'Balenciaga'"] = {Min = 0, Max = 35000},
            ["Потрёпанные Штаны 'Balenciaga'"] = {Min = 0, Max = 20000},
        },
        Shirt = {
            ["Черный Свитер 'Balenciaga'"] = {Min = 0, Max = 20000},
            ["Красный Свитер 'Balenciaga'"] = {Min = 0, Max = 20000},
            ["Зеленый Свитер 'Balenciaga'"] = {Min = 0, Max = 20000},
        }
    },
    ["ChromeHearts"] = {
        Pants = {
            ["Голубые Джинсы 'Chrome Hearts'"] = {Min = 0, Max = 200000},
            ["Серые Джинсы 'Chrome Hearts'"] = {Min = 0, Max = 110000},
            ["Джинсы CROSS PINK 'Chrome Hearts'"] = {Min = 0, Max = 200000},
            ["Джинсы CROSS GREEN 'Chrome Hearts'"] = {Min = 0, Max = 210000},
            ["Джинсы CROSS RED 'Chrome Hearts'"] = {Min = 0, Max = 400000},
            ["Кожанные Джинсы 'Matty boy X Chrome Hearts'"] = {Min = 0, Max = 710000},
        },
        Shirt = {
            ["Коричневая Худи Horse Shoe 'Chrome Hearts'"] = {Min = 0, Max = 140000},
            ["Чёрная Худи 'Chrome Hearts'"] = {Min = 0, Max = 130000},
            ["Чёрная Худи Multi Color Cross 'Crome Hearts'"] = {Min = 0, Max = 155000},
            ["Цитрусовый Лонгслив Records 'Matty boy X Chrome Hearts'"] = {Min = 0, Max = 105000},
            ["Красный Лонгслив Chomper 'Matty boy X Chrome Hearts'"] = {Min = 0, Max = 65000},
            ["Бежевая Кофта Cemetery Cross Tire Tracks 'Chrome Hearts'"] = {Min = 0, Max = 130000},
        }
    },
    ["RickOwens"] = {
        Pants = {
            [""] = {Min = 0, Max = 1},
        },
        Shirt = {
            ["Голубая Зип Худи Jason 'Rick Owens'"] = {Min = 0, Max = 86500},
            ["Чёрная Футболка Pentagram 'Rick Owens'"] = {Min = 0, Max = 19200},
            ["Чёрная Футболка Poem 'Rick Owens'"] = {Min = 0, Max = 19200},
            ["Коричневая Худи Felpa 'Rick Owens'"] = {Min = 0, Max = 59000},
            ["Чёрная Футболка DRKSHDW 'Rick Owens'"] = {Min = 0, Max = 25000},
            ["Тёмно Коричневый Лонгслив 'Rick Owens X Champion'"] = {Min = 0, Max = 41000},
            ["Чёрное Худи Jason 'Rick Owens'"] = {Min = 0, Max = 60000},
            ["Чёрный Свитшот 'Rick Owens X Moncler'"] = {Min = 0, Max = 38000},
        }
    },
    ["Moncler"] = {
        Pants = {
            ["Штаны Genius 'Moncler'"] = {Min = 0, Max = 50000},
            ["Штаны Logo 'Moncler'"] = {Min = 0, Max = 49000},
            ["Штаны Shiny 'Moncler X Palm Angels'"] = {Min = 0, Max = 46000},
            ["Штаны 'Moncler X Palm Angels'"] = {Min = 0, Max = 53000},
            ["Штаны Midnight 'Moncler'"] = {Min = 0, Max = 43000},
        },
        Shirt = {
            ["Оранджевый Жёлет Tibb 'Moncler'"] = {Min = 0, Max = 110000},
            ["Красный Жёлет Down BORMES 'Moncler'"] = {Min = 0, Max = 80000},
            ["Пуховик Panelled 'Moncler'"] = {Min = 0, Max = 155000},
            ["Розовый Желет Ouse 'Moncler'"] = {Min = 0, Max = 80000},
        }
    },
    ["Adidas"] = {
        Pants = {
            ["Оранжевые Спортивные Штаны 'Adidas'"] = {Min = 0, Max = 4000},
            ["Чёрные Треники 'Adidas'"] = {Min = 0, Max = 4100},
            ["Чёрные Штаны Для Бега 'Adidas'"] = {Min = 0, Max = 4100},
            ["Серые Джинсы 'Adidas'"] = {Min = 0, Max = 4150},
        },
        Shirt = {
            ["Серая Спортивка White 'Adidas'"] = {Min = 0, Max = 25000},
            ["Баскетбольная Футболка 'Adidas'"] = {Min = 0, Max = 3850},
            ["Чёрная Футболка Red Logo 'Adidas'"] = {Min = 0, Max = 4100},
            ["Белое Поло Black 'Adidas'"] = {Min = 0, Max = 4050},
            ["Белая Футболка Pinstripe 'Adidas'"] = {Min = 0, Max = 2150},
            ["Синня Футболка Logo 'Adidas'"] = {Min = 0, Max = 3000},
            ["Темно Синяя Кофта Black 'Adidas'"] = {Min = 0, Max = 2600},
            ["Белая Футболка Tricolor Logo 'Adidas'"] = {Min = 0, Max = 10700},
            ["Розовая Кофта White 'Adidas'"] = {Min = 0, Max = 4300},
            ["Спортивка American 'Adidas'"] = {Min = 0, Max = 9300},
            ["Бордовая Кофта White 'Adidas'"] = {Min = 0, Max = 6800},
            ["Черная Футболка Orange 'Adidas'"] = {Min = 0, Max = 1000},
            ["Черная Футболка С Синимий Полосками 'Adidas'"] = {Min = 0, Max = 3100},
            ["Чёрная Спортивка Gold 'Adidas'"] = {Min = 0, Max = 6000},
            ["Красная Спортивка White 'Adidas'"] = {Min = 0, Max = 9000},
            ["Джерзи Real Madrid 'Adidas'"] = {Min = 0, Max = 5650},
            ["Лаймовая Кофта White 'Adidas'"] = {Min = 0, Max = 8900},
        }
    },
    ["Nike"] = {
        Pants = {
            ["Чёрные Штаны 'Nike'"] = {Min = 0, Max = 3500},
            ["Синие Штаны 'Nike'"] = {Min = 0, Max = 3500},
            ["Чёроные Джинсы 'Nike'"] = {Min = 0, Max = 2000},
            ["Серые Джинсы 'Nike'"] = {Min = 0, Max = 1000},
        },
        Shirt = {
            ["Тёмно-Синий Свитер 'Nike'"] = {Min = 0, Max = 4800},
            ["Тёмно-Синяя Худи 'Nike'"] = {Min = 0, Max = 4500},
            ["Чёрная Толстовка 'Nike'"] = {Min = 0, Max = 4500},
            ["Чёрный Худи 'Nike'"] = {Min = 0, Max = 4000},
            ["Голубой 'Nike Tech Fleece'"] = {Min = 0, Max = 3000},
        }
    }
}

local function AddHighlight(target, storeName, isRare)
    if ActiveHighlights[target] then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = isRare and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(0, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Adornee = target
    highlight.Parent = target
    ActiveHighlights[target] = highlight
end

local function UpdateItemsEsp()
    ItemsEsp = {}

    for storeName, enabled in pairs(ActiveStores) do
        if enabled then
            local storeItems = StoreItems[storeName]
            if storeItems then
                for type, items in pairs(storeItems) do
                    if type ~= "Color" and type ~= "Outline" then
                        ItemsEsp[type] = ItemsEsp[type] or {}
                        for name, range in pairs(items) do
                            ItemsEsp[type][name] = {
                                Min = range.Min,
                                Max = range.Max,
                                Store = storeName,
                                Rar = range.rar or false
                            }
                        end
                    end
                end
            end
        end
    end
end

local function RemoveUnusedHighlights(validTargets)
    for target, highlight in pairs(ActiveHighlights) do
        if not validTargets[target] then
            highlight:Destroy()
            ActiveHighlights[target] = nil
        end
    end
end

local function ExtractNumber(str)
    local num = str:gsub("%D", "")
    return tonumber(num)
end

local function ScanStores()
    local validTargets = {}

    local stores = workspace.World.Debris:FindFirstChild("Stores")
    if not stores then return end

    for i = 1, 24 do
        local store = stores:FindFirstChild("Store_"..i)
        if not store then continue end

        local placement = store:FindFirstChild("PlacementContainer")
        if not placement then continue end

        for _, container in pairs(placement:GetChildren()) do
            if not container:IsA("Model") then continue end

            local itemContainer = container:FindFirstChild("ItemContainer")
            local clothingTypeValue = container:FindFirstChild("ClothingType")
            if not itemContainer or not clothingTypeValue then continue end

            local clothingType = clothingTypeValue.Value

            for _, hanger in pairs(itemContainer:GetChildren()) do
                if hanger:IsA("Model") and hanger.Name:find("Hanger"..clothingType) then
                    local prompt = hanger:FindFirstChildWhichIsA("ProximityPrompt", true)
                    if prompt then
                        local itemName = prompt.ObjectText
                        local actionText = prompt.ActionText
                        local itemInfo = ItemsEsp[clothingType] and ItemsEsp[clothingType][itemName]
                        if itemInfo then
                            local price = ExtractNumber(actionText or "")
                            if price and price >= itemInfo.Min and price <= itemInfo.Max then
                                validTargets[hanger] = true
                                AddHighlight(hanger, itemInfo.Store, itemInfo.Rar)
                            end
                        end
                    end
                end
            end
        end
    end

    RemoveUnusedHighlights(validTargets)
end

task.spawn(function()
    while true do
        if next(ActiveStores) ~= nil then
            UpdateItemsEsp()
            ScanStores()
        end
        task.wait(5)
    end
end)

local Toggle1 = Tab:CreateToggle({
    Name = "🏃 СпортМастер",
    CurrentValue = false,
    Flag = "smesp",
    Callback = function(Value)
        ActiveStores["SportMaster"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local Toggle2 = Tab:CreateToggle({
    Name = "👕 Смешные Цены",
    CurrentValue = false,
    Flag = "scesp",
    Callback = function(Value)
        ActiveStores["SmeshnieCeni"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local Toggle3 = Tab:CreateToggle({
    Name = "🪙 Баленсиага",
    CurrentValue = false,
    Flag = "besp",
    Callback = function(Value)
        ActiveStores["Balenciaga"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local ToggleCH = Tab:CreateToggle({
    Name = "💎 Chrome Hearts",
    CurrentValue = false,
    Flag = "chesp",
    Callback = function(Value)
        ActiveStores["ChromeHearts"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local ToggleRO = Tab:CreateToggle({
    Name = "🖤 Rick Owens",
    CurrentValue = false,
    Flag = "roesp",
    Callback = function(Value)
        ActiveStores["RickOwens"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local ToggleMoncler = Tab:CreateToggle({
    Name = "🧥 Moncler",
    CurrentValue = false,
    Flag = "monesp",
    Callback = function(Value)
        ActiveStores["Moncler"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local ToggleAdidas = Tab:CreateToggle({
    Name = "🧥 Adidas",
    CurrentValue = false,
    Flag = "aesp",
    Callback = function(Value)
        ActiveStores["Adidas"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local ToggleNike = Tab:CreateToggle({
    Name = "🧥 Nike",
    CurrentValue = false,
    Flag = "nikeesp",
    Callback = function(Value)
        ActiveStores["Nike"] = Value
        UpdateItemsEsp()
        ScanStores()
    end,
})

local Tab = Window:CreateTab("Visuals", "palette")



local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Input = Tab:CreateInput({
    Name = "💰 Фейковые Рубли",
    CurrentValue = "",
    PlaceholderText = "100000",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
        local targetValue = tonumber(Text)
        if not targetValue then return end
        if targetValue < 0 then
            targetValue = 0
        elseif targetValue > 999999999999999999 then
            targetValue = 999999999999999999
        end

        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if not leaderstats or not leaderstats:FindFirstChild("Рубли") then return end

        local rubles = leaderstats["Рубли"]
        local startValue = rubles.Value
        local endValue = targetValue
        if startValue == endValue then return end

        local duration = 3
        local increasing = endValue > startValue
        local startTime = tick()

        local function easing(t)
            if increasing then
                return t^2
            else
                return 1 - (1 - t)^2
            end
        end

        task.spawn(function()
            while true do
                local elapsed = tick() - startTime
                local alpha = math.clamp(elapsed / duration, 0, 1)
                local easedAlpha = easing(alpha)
                local current = math.floor(startValue + (endValue - startValue) * easedAlpha)
                rubles.Value = current
                if alpha >= 1 then
                    rubles.Value = endValue
                    break
                end
                task.wait(0.01)
            end
        end)
    end,
})
