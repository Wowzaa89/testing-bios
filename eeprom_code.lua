local invoke = component.invoke
local computer = computer or require('computer')

local gpu = component.list("gpu")()
local screen = component.list("screen")()

if not gpu or not screen then error("Screen/GPU not attached.") end
invoke(gpu, "bind", screen)

local resx, resy = invoke(gpu, "getResolution")
local startx = (resx / 2 - #text / 2) + 1
local starty = resy / 2

function Sleep(timeout)
  local deadline = computer.uptime() + timeout
  repeat
    computer.pullSignal(deadline - computer.uptime())
  until computer.uptime() >= deadline
end

invoke(gpu, "setBackground", 0x000000)
invoke(gpu, "setForeground", 0xffffff)
invoke(gpu, "fill", 1,1, resx,resy, " ")
invoke(gpu, "set", startx, starty, "Booting..")
