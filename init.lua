local function edit_file(path, f, arg)
	local text = ModTextFileGetContent( path )
	if text then
		ModTextFileSetContent( path, f( text, arg ) )
	end
end

local function patch(text)
	text = string.gsub( text, '%(test2 == true%) %(test3 > 2%)', '%(test2 == true%) or %(test3 > 2%)' )
	return text
end

edit_file( 'data/scripts/projectiles/bomb_detonator.lua', patch )
