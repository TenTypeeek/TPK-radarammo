CreateThread(function()
    Wait(500)
    print("^2Thank you for using TPK Radar & Ammo | Version: " .. Config.Version .. "^7")
end)

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
