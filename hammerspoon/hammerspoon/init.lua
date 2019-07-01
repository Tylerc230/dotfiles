local subHyper = {"cmd", "alt"}
local hyper = {"cmd", "alt", "ctrl"}
local superHyper = {"shift", "cmd", "alt", "ctrl"}

-- application launching 
hs.hotkey.bind(subHyper, 't', function()
  hs.application.launchOrFocus('Things3')
end)

hs.hotkey.bind(subHyper, 'v', function()
  hs.application.launchOrFocus('Xcode')
end)
hs.hotkey.bind(subHyper, 'z', function()
  hs.application.launchOrFocus('Simulator')
end)
hs.hotkey.bind(subHyper, 'a', function()
  hs.application.launchOrFocus('WorkSlack')
end)
--hs.hotkey.bind(hyper, 'z', function()
  --hs.application.launchOrFocus('Zeplin')
--end)
hs.hotkey.bind(subHyper, 'm', function()
  hs.application.launchOrFocus('Messages')
end)
hs.hotkey.bind(subHyper, 'c', function()
  hs.application.launchOrFocus('Google Chrome')
end)
hs.hotkey.bind(subHyper, 'n', function()
  hs.application.launchOrFocus('Notes')
end)

hs.hotkey.bind(hyper, 'b', function()
  wm("tiling::desktop --layout bsp")
end)
hs.hotkey.bind(superHyper, 'f', function()
  wm("tiling::desktop --layout monocle")
end)

hs.hotkey.bind(hyper, 'f', function()
  wm("tiling::window --toggle fullscreen")
end)

hs.hotkey.bind(hyper, "m", function()
  wm("tiling::desktop --mirror vertical")
end)

hs.hotkey.bind(hyper, 'g', function()
  wm("tiling::desktop --layout float")
end)

hs.hotkey.bind(hyper, 'd', function()
  wm("tiling::window --grid-layout 1:3:0:0:1:1")
end)

hs.hotkey.bind(hyper, 'e', function()
  wm("tiling::desktop --equalize")
end)

--focus
hs.hotkey.bind(hyper, "h", function()
  wm("tiling::window --focus west")
end)
hs.hotkey.bind(hyper, "j", function()
  wm("tiling::window --focus south")
end)
hs.hotkey.bind(hyper, "k", function()
  wm("tiling::window --focus north")
end)
hs.hotkey.bind(hyper, "l", function()
  wm("tiling::window --focus east")
end)


--moving windows
hs.hotkey.bind(hyper, 'x', function()
  wm('tiling::window --close')
  wm('tiling::window --focus prev')
end)
hs.hotkey.bind(superHyper , 'h', function()
  wm("tiling::window --warp west")
end)
hs.hotkey.bind(superHyper, "j", function()
  wm("tiling::window --warp south")
end)
hs.hotkey.bind(superHyper, "k", function()
  wm("tiling::window --warp north")
end)
hs.hotkey.bind(superHyper, "l", function()
  wm("tiling::window --warp east")
end)

hs.hotkey.bind(hyper, "LEFT", function()
  wm("tiling::window --send-to-monitor 2")
  wm("tiling::monitor -f 2")
end)

hs.hotkey.bind(hyper, "RIGHT", function()
  wm("tiling::window --send-to-monitor 1")
  wm("tiling::monitor -f 1")
end)


function wm(command)
  local output, status, type, rc = hs.execute("/usr/local/bin/chunkc "..command, false)
end

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
