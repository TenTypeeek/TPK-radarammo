--  ____   ___  _   _ _____   _____ ___  _   _  ____ _   _   _____ _   _ ___ ____  
-- |  _ \ / _ \| \ | |_   _| |_   _/ _ \| | | |/ ___| | | | |_   _| | | |_ _/ ___| 
-- | | | | | | |  \| | | |     | || | | | | | | |   | |_| |   | | | |_| || |\___ \ 
-- | |_| | |_| | |\  | | |     | || |_| | |_| | |___|  _  |   | | |  _  || | ___) |
-- |____/ \___/|_| \_| |_|     |_| \___/ \___/ \____|_| |_|   |_| |_| |_|___|____/ 
-- Documantation: EN https://tentypeeek.gitbook.io/undv/script/radar-and-ammo | CZ https://tentypeeek.gitbook.io/undv/cz/script/tpk-radar-and-ammo

local resourceName = GetCurrentResourceName()
local localVersion = GetResourceMetadata(resourceName, 'version', 0)

CreateThread(function()
    Wait(500)

    if not localVersion then
        localVersion = "unknown"
    end

    print("^2Thank you for using TPK Radar & Ammo " .. localVersion .. "^7")

    if Config.EnableVersionCheck then
        PerformHttpRequest(Config.VersionCheckURL, function(statusCode, text, headers)
            if statusCode == 200 then
                local latestVersion = text:gsub("%s+", "")

                if localVersion ~= latestVersion then
                    print("^1[TPK Radar & Ammo] New version available! Latest: " .. latestVersion .. " (You: " .. localVersion .. ")^7")
                    print("^1[TPK Radar & Ammo] Download: https://github.com/TenTypeeek/TPK-radarammo^7")
                else
                    print("^2[TPK Radar & Ammo] You are using the latest version (" .. localVersion .. ")^7")
                end
            else
                print("^3[TPK Radar & Ammo] Version check failed! (HTTP " .. statusCode .. ")^7")
            end
        end, "GET", "", {})
    end
end)
