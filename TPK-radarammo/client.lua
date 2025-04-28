--  ____   ___  _   _ _____   _____ ___  _   _  ____ _   _   _____ _   _ ___ ____  
-- |  _ \ / _ \| \ | |_   _| |_   _/ _ \| | | |/ ___| | | | |_   _| | | |_ _/ ___| 
-- | | | | | | |  \| | | |     | || | | | | | | |   | |_| |   | | | |_| || |\___ \ 
-- | |_| | |_| | |\  | | |     | || |_| | |_| | |___|  _  |   | | |  _  || | ___) |
-- |____/ \___/|_| \_| |_|     |_| \___/ \___/ \____|_| |_|   |_| |_| |_|___|____/ 
-- Documantation: EN https://tentypeeek.gitbook.io/undv/script/radar-and-ammo | CZ https://tentypeeek.gitbook.io/undv/cz/script/tpk-radar-and-ammo

CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()

        if Config.HideRadarOnFoot then
            if IsPedInAnyVehicle(ped, false) then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        end

        if Config.HideAmmo then
            DisplayAmmoThisFrame(false)
        end

        if Config.HideStreetNames then
            BeginTextCommandDisplayHelp("STRING")
            EndTextCommandDisplayHelp(0, 0, 0, -1)
        end

        if Config.HideHealthArmor then
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(8)
            HideHudComponentThisFrame(9)
            HideHudComponentThisFrame(6)
            HideHudComponentThisFrame(1)
            HideHudComponentThisFrame(2)
            HideHudComponentThisFrame(3)
            HideHudComponentThisFrame(4)
            HideHudComponentThisFrame(13)
            HideHudComponentThisFrame(22)
            HideHudComponentThisFrame(20)
            HideHudComponentThisFrame(21)
        end

        if Config.HideCash then
            HideHudComponentThisFrame(3)
            HideHudComponentThisFrame(4)
            HideHudComponentThisFrame(13)
        end

        if Config.HideWeaponInfo then
            HideHudComponentThisFrame(22)
        end
    end
end)
