GAMENAME = "Super Mario Bros. (W) [!]"
SAVESTATE = "start.state"

SCREENSIZEHAUTEUR = 224
SCREENSIZELONGUEUR = 256

buttons = {
	{nom = "P1 A"},
	{nom = "P1 B"},
	{nom = "P1 X"},
	{nom = "P1 Y"},
	{nom = "P1 Up"},
	{nom = "P1 Down"},
	{nom = "P1 Left"},
	{nom = "P1 Right"}
}

function getMarioPos()
	local mario = {} 
	mario.X = memory.readbyte(0x86) + memory.readbyte(0x6D)*0x100 + 4
	mario.Y = memory.readbyte(0x3B8)
	mario.x = memory.readbyte(0x217) 
	mario.y = memory.read_s16_le(0x3B8)
	return mario
end

function getMarioFacing()
	mariofacing = "none"
	mariofacingwhere = memory.readbyte(0x45)
	if mariofacingwhere == 2 then
		mariofacing = "left"
	else 
		mariofacing = "right"
	end
	return mariofacing
end

function drawinfo()
	local mario = getMarioPos()
	gui.drawBox(0, 0, 256, 40, "black", "white")
	gui.drawText(0, 4,"Mario posX : " .. mario.X .. " Mario posY : " .. mario.Y .. "\nMario goes to " .. getMarioFacing(), "black")
end

function drawmap()
	
end
function drawmario()
	local mario = getMarioPos()
	gui.drawRectangle(mario.x + 5, mario.Y + 10, 6, 6 * 2, "black", "blue")
end

while true do
	gui.clearGraphics()
	drawinfo(getMarioFacing())
	drawmario()
	emu.frameadvance()
end



--Y = 0 quand MposY = 176, 160 = 1 bloc, 144, 128, 112, 96, 80, 64, 48
-- screen size 256, 223