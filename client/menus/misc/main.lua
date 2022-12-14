--#region Menu Registration

lib.registerMenu({
    id = 'berkie_menu_misc_options',
    title = 'Miscellaneous Options',
    position = MenuPosition,
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_main')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_misc_options'] = selected
    end,
    options = {
        {label = 'Teleport Options', args = {'berkie_menu_misc_options_teleport_options'}},
        {label = 'Development Tools', args = {'berkie_menu_misc_options_developer_options'}},
        {label = 'Connection Options', args = {'berkie_menu_misc_options_connection_options'}}
    }
}, function(_, _, args)
    if string.match(args[1], 'berkie_menu') then
        if args[1] == 'berkie_menu_misc_options_teleport_options' then
            SetupTeleportOptions()
        end
        lib.showMenu(args[1], MenuIndexes[args[1]])
    end
end)

--#endregion Menu Registration