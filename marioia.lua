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
	mario.x = memory.readbyte(0x86) + memory.readbyte(0x6D)*0x100 + 4
	mario.y = memory.readbyte(0x3B8)
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
	gui.drawText(0, 4,"Mario posX : " .. mario.x .. " Mario posY : " .. mario.y .. "\nMario goes to " .. getMarioFacing(), "black")
end

while true do
	gui.clearGraphics()
	drawinfo(getMarioFacing())
	emu.frameadvance()
end

--Y = 0 quand MposY = 176, 160 = 1 bloc, 144, 128, 112, 96, 80, 64, 48
-- screen size 256, 223