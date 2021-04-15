local path = minetest.get_modpath("experience")
function file_check(file_name)
	local file_found=io.open(file_name, "r")
	if file_found==nil then
		file_found=false
	else
		file_found=true
	end
	return file_found
end
minetest.register_on_joinplayer(function(player)
	if file_check(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze") == true then
	else
		file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze", "w")
		file:write("0")
		file:close()
	end
	if file_check(minetest.get_worldpath().."/"..player:get_player_name().."_experience_silver") == true then
	else
		file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_silver", "w")
		file:write("0")
		file:close()
	end
end)
dofile(path.."/Xp.lua")