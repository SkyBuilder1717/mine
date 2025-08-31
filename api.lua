local S = core.get_translator("mine")

function mine.register_mine(name, def)
    def.is_ground_content = def.is_ground_content or false
    def.groups = def.groups or {cracky = 1}
    def.description = def.description
    def.beep = def.beep or "mines_beep"
    def.seconds = def.seconds_to_explode or 1
    def.tnt = def.tnt or {radius = 2}
    if def.drawtype == "model" then
        def.drawtype = "mesh"
        def.mesh = def.mesh
        def.selection_box = def.selection_box
    elseif def.drawtype == "plantlike" then
        def.drawtype = "plantlike"
        def.selection_box = def.selection_box
    elseif def.drawtype == "custom" then
        def.drawtype = "nodebox"
        def.paramtype = "light"
        def.node_box = {
            type = "fixed",
            fixed = {
                {-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125},
                {-0.0625, -0.375, -0.0625, 0.0625, -0.3125, 0.0625},
            }
        }
    end
    def.after_place_node = function(pos, placer)
        local node = core.get_node(pos)
        local nmeta = core.get_meta(pos)
        local pname = placer:get_player_name()
        nmeta:set_string("owner", pname)
        nmeta:set_string("activated", "false")
        nmeta:set_string("infotext", core.registered_nodes[node.name].description.."\n"..S("(Owner: @1)", pname))
    end
    def.on_dig = function(pos, node, digger)
        local nmeta = core.get_meta(pos)
        
        if nmeta:get_string("activated") == "false" then
            return core.node_dig(pos, node, digger)
        end
    end
    def.on_timer = function(pos)
		local nmeta = core.get_meta(pos)
		local active = nmeta:get_string("activated")

        if (not active) or (active == "false") then
            return
        end
        core.remove_node(pos)
        tnt.boom(pos, def.tnt)
    end
    mine.registered_mines[name] = def
    core.register_node(name, def)
end

core.register_globalstep(function(dtime)
	for _, player in pairs(core.get_connected_players()) do
		local pos = player:get_pos()
		local node = core.get_node(pos)
		local nmeta = core.get_meta(pos)

		if mine.registered_mines[node.name] then
			local pname = player:get_player_name()
			local owner = nmeta:get_string("owner")
			local active = nmeta:get_string("activated")

			if owner and owner ~= pname then
				local def = core.registered_nodes[node.name]

				if active == "false" then
					nmeta:set_string("activated", "true")
					core.sound_play(def.beep, {pos = pos})
					core.get_node_timer(pos):start(1.0)
				end
			end
		end
	end
end)