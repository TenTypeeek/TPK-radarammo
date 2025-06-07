--  ____   ___  _   _ _____   _____ ___  _   _  ____ _   _   _____ _   _ ___ ____  
-- |  _ \ / _ \| \ | |_   _| |_   _/ _ \| | | |/ ___| | | | |_   _| | | |_ _/ ___| 
-- | | | | | | |  \| | | |     | || | | | | | | |   | |_| |   | | | |_| || |\___ \ 
-- | |_| | |_| | |\  | | |     | || |_| | |_| | |___|  _  |   | | |  _  || | ___) |
-- |____/ \___/|_| \_| |_|     |_| \___/ \___/ \____|_| |_|   |_| |_| |_|___|____/ 
-- Documentation: EN https://tentypeeek.gitbook.io/undv/script/radar-and-ammo | CZ https://tentypeeek.gitbook.io/undv/cz/script/tpk-radar-and-ammo

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()

        -- Hide radar on foot
        if Config.HideRadarOnFoot then
            DisplayRadar(IsPedInAnyVehicle(ped, false))
        end

        -- Hide weapon ammo HUD
        if Config.HideAmmo then
            DisplayAmmoThisFrame(false)
        end

        -- Hide street/location names
        if Config.HideStreetNames then
            BeginTextCommandDisplayHelp("STRING")
            EndTextCommandDisplayHelp(0, 0, 0, -1)
        end

        -- Hide HUD components
        if Config.HideHealthArmor then
            local components = {1, 2, 3, 4, 6, 7, 8, 9, 13, 20, 21, 22}
            for _, id in ipairs(components) do
                HideHudComponentThisFrame(id)
            end
        end

        if Config.HideCash then
            for _, id in ipairs({3, 4, 13}) do
                HideHudComponentThisFrame(id)
            end
        end

        if Config.HideWeaponInfo then
            HideHudComponentThisFrame(22)
        end
    end
end)
