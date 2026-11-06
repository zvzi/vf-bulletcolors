-- lol idk if u need the gamepasses for this script to work
-- TO cry / renzy / rolldgelato / other VF devs: hit up our best mans 3kay @tkkn if u dont like this script ok?
-- fully vibe coded cus im a loser but iused remote spy to figure this out
-- matcha supported IDK abt others

while not game:IsLoaded() do
    wait(0.5)
end

local function getRemote()
    local rs = game:GetService("ReplicatedStorage")
        or game:FindFirstChild("ReplicatedStorage")
        or game.ReplicatedStorage
    if not rs then return nil end
    return rs:FindFirstChild("MAINEVENT")
end

local mainEvent = getRemote()
while not mainEvent do
    print("waiting for MAINEVENT...")
    wait(1)
    mainEvent = getRemote()
end
print("found MAINEVENT:", mainEvent:GetFullName())

local colors = {
    "regular", "red", "blue", "pink", "white", "purple", "orange", "green", "rainbow",
    "aqua", "violet", "mush", "lightgreen", "lightblue", "christmas", "candy", "mint",
    "midnight", "coral", "ember", "ocean", "rose", "lemon"
}

local DELAY = 0.1
local looping = false
local START_KEY = 0x75 -- F6
local STOP_KEY = 0x76  -- F7

while true do
    if isrbxactive() then
        if iskeypressed(START_KEY) then
            looping = true
            print("cloop started")
            wait(0.3)
        elseif iskeypressed(STOP_KEY) then
            looping = false
            print("cloop stopped")
            wait(0.3)
        end
    end

    if looping then
        for i = 1, #colors do
            if iskeypressed(STOP_KEY) then
                looping = false
                print("cloop stopped")
                break
            end
            mainEvent:FireServer("BulletColors", colors[i])
            wait(DELAY)
        end
    else
        wait(0.05)
    end
end
