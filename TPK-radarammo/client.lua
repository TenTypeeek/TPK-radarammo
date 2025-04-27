CreateThread(function()
    while true do
        Wait(0)

        DisplayAmmoThisFrame(false)

        BeginTextCommandDisplayHelp("STRING")
        EndTextCommandDisplayHelp(0, 0, 0, -1)

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end
end)
