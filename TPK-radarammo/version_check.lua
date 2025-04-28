--  ____   ___  _   _ _____   _____ ___  _   _  ____ _   _   _____ _   _ ___ ____  
-- |  _ \ / _ \| \ | |_   _| |_   _/ _ \| | | |/ ___| | | | |_   _| | | |_ _/ ___| 
-- | | | | | | |  \| | | |     | || | | | | | | |   | |_| |   | | | |_| || |\___ \ 
-- | |_| | |_| | |\  | | |     | || |_| | |_| | |___|  _  |   | | |  _  || | ___) |
-- |____/ \___/|_| \_| |_|     |_| \___/ \___/ \____|_| |_|   |_| |_| |_|___|____/ 
-- Documantation: EN https://tentypeeek.gitbook.io/undv/script/radar-and-ammo | CZ https://tentypeeek.gitbook.io/undv/cz/script/tpk-radar-and-ammo

CreateThread(function()
    Wait(500)

    print("^2Thank you for using TPK Radar & Ammo " .. Config.Version .. "^7")

    if Config.EnableVersionCheck then
        PerformHttpRequest(Config.VersionCheckURL, function(statusCode, text, headers)
            if statusCode == 200 then
                local latestVersion = text:gsub("%s+", "")

                if Config.Version ~= latestVersion then
                    print("^1[TPK Radar & Ammo] A new version is available! Latest version: " .. latestVersion .. " (You are using: " .. Config.Version .. ")^7")
                    print("^1[TPK Radar & Ammo] Download the latest version here: https://github.com/YourGitHubUsername/YourRepoName^7")
                else
                    print("^2[TPK Radar & Ammo] You are using the latest version (" .. Config.Version .. ")^7")
                end
            else
                print("^3[TPK Radar & Ammo] Version check failed! (HTTP status: " .. statusCode .. ")^7")
            end
        end, "GET", "", {})
    end
end)
