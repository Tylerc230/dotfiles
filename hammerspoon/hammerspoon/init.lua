hs.logger.defaultLogLevel="info"
local subHyper = {"cmd", "alt"}
local hyper = {"cmd", "alt", "ctrl"}
local superHyper = {"shift", "cmd", "alt", "ctrl"}
local logger = hs.logger.new("my_logger", "debug")

-- application launching 
hs.hotkey.bind(subHyper, 't', function()
  hs.application.launchOrFocus('Things3')
end)

hs.hotkey.bind(subHyper, 'v', function()
  hs.application.launchOrFocus('Xcode')
end)
hs.hotkey.bind(subHyper, 's', function()
  hs.application.launchOrFocus('Simulator')
end)
hs.hotkey.bind(subHyper, 'a', function()
  hs.application.launchOrFocus('WorkSlack')
  --hs.application.launchOrFocus('Slack')
end)
hs.hotkey.bind(subHyper, 'z', function()
  hs.application.launchOrFocus('Zeplin')
end)
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
  wm("space --layout bsp")
end)

hs.hotkey.bind(hyper, 'f', function()
  wm("window --toggle zoom-fullscreen")
end)

hs.hotkey.bind(hyper, "m", function()
  wm("space --mirror vertical")
end)

hs.hotkey.bind(hyper, 'g', function()
  wm("space --layout float")
end)

--focus
hs.hotkey.bind(hyper, "h", function()
  local rc = wm("window --focus west")
  if rc == 1 then
    wm("display --focus 2")
  end
  --check if this fails and then switch focus to monitor 2
end)
hs.hotkey.bind(hyper, "j", function()
  wm("window --focus south")
end)
hs.hotkey.bind(hyper, "k", function()
  wm("window --focus north")
end)
hs.hotkey.bind(hyper, "l", function()
  local rc = wm("window --focus east")
  if rc == 1 then
    wm("display --focus 1")
  end
end)


--moving windows
hs.hotkey.bind(hyper, 'x', function()
  wm('window --close')
  --wm('window --focus prev')
end)
hs.hotkey.bind(superHyper , 'h', function()
  wm("window --warp west")
end)
hs.hotkey.bind(superHyper, "j", function()
  wm("window --warp south")
end)
hs.hotkey.bind(superHyper, "k", function()
  wm("window --warp north")
end)
hs.hotkey.bind(superHyper, "l", function()
  wm("window --warp east")
end)

hs.hotkey.bind(hyper, "LEFT", function()
  wm("window --display 2")
  wm("display --focus 2")
end)

hs.hotkey.bind(hyper, "RIGHT", function()
  wm("window --display 1")
  wm("display --focus 1")
end)


function wm(command)
  --local output, status, type, rc = hs.execute("/usr/local/bin/chunkc "..command, false)
  local output, status, type, rc = hs.execute("/usr/local/bin/yabai -m "..command, false)
  logger.df("output %s status %s rc %s", output, tostring(status), rc)
  return rc
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
