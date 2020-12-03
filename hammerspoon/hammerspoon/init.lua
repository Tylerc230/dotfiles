hs.logger.defaultLogLevel="info"
local subHyper = {"cmd", "alt"}
local hyper = {"cmd", "alt", "ctrl"}
local superHyper = {"shift", "cmd", "alt", "ctrl"}
local logger = hs.logger.new("my_logger", "debug")
hs.hints.showTitleThresh = 0
modal = hs.hotkey.modal.new(hyper, "w", "Enter Window Mode")
function modal:entered ()
  showWindowMode(true)
end
function modal:exited() 
  showWindowMode(false)
end

--Focus
modal:bind("","j", "", nil, function() 
  focus("south")
end, nil)
modal:bind("","k", "", nil, function() 
  focus("north")
end, nil)
modal:bind("","h", "", nil, function() 
  focus("west")
end, nil)
modal:bind("","l", "", nil, function() 
  focus("east")
end, nil)
modal:bind("","w", "", nil, function() 
  hs.hints.windowHints(nil, function()
  end, nil)
end, nil)
--Warp
modal:bind("shift","j", "", nil, function() 
  warp("south")
end, nil)
modal:bind("shift","k", "", nil, function() 
  warp("north")
end, nil)
modal:bind("shift","h", "", nil, function() 
  warp("west")
end, nil)
modal:bind("shift","l", "", nil, function() 
  warp("east")
end, nil)

modal:bind("","f", "", nil, function() 
  fullscreen()
end, nil)
modal:bind("","r", "", nil, function() 
  readingMode()
end, nil)
modal:bind("","LEFT", "", nil, function() 
  sendLeft()
end, nil)
modal:bind("","RIGHT", "", nil, function() 
  sendRight()
end, nil)
modal:bind("","x", "", nil, function() 
  closeWindow()
end, nil)
modal:bind("","m", "", nil, function() 
  wm("space --mirror vertical")
end, nil)
modal:bind("","t", "", nil, function() 
  wm("space --rotate 90")
end, nil)
modal:bind("","1", "", nil, function() 
  wm("display --focus 1")
end, nil)
modal:bind("","2", "", nil, function() 
  wm("display --focus 2")
end, nil)
modal:bind("", "escape", "Exit window mode", nil, function() modal:exit() end, nil)



 --application launching 
hs.hotkey.bind(subHyper, 't', function()
  hs.application.launchOrFocus('Things')
end)

hs.hotkey.bind(subHyper, 'v', function()
  hs.application.launchOrFocus('Xcode')
end)
hs.hotkey.bind(subHyper, 'b', function()
  hs.application.launchOrFocus('Parallels Desktop')
end)
hs.hotkey.bind(subHyper, 's', function()
  hs.application.launchOrFocus('Simulator')
end)
hs.hotkey.bind(subHyper, 'a', function()
  --hs.application.launchOrFocus('WorkSlack')
  hs.application.launchOrFocus('Slack')
end)
hs.hotkey.bind(subHyper, 'z', function()
  hs.application.launchOrFocus('Zeplin')
end)
hs.hotkey.bind(subHyper, 'p', function()
  hs.application.launchOrFocus('Spotify')
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

hs.hotkey.bind(hyper, 'f', function()
  fullscreen()
end)

hs.hotkey.bind(hyper, 'r', function()
  readingMode()
end)

hs.hotkey.bind(hyper, 'x', function()
  closeWindow()
end)

function focus(direction)
  local rc = wm("window --focus "..direction)
  if rc == 1 and direction == "west" then
    wm("display --focus 2")
  end
  if rc == 1 and direction == "east" then
    wm("display --focus 1")
  end
end

function fullscreen()
  wm("window --toggle zoom-fullscreen")
end

function warp(direction)
  wm("window --warp "..direction)
end

function closeWindow() 
  wm('window --close')
  wm('window --focus prev')
end

function showWindowMode(show)
  if show then
    hs.osascript.applescript("tell application \"HazeOver\" to set enabled to true")
    wm("config active_window_border_color 0xff61b2f7")
    wm("config normal_window_border_color 0xffffffff")
  else
    hs.osascript.applescript("tell application \"HazeOver\" to set enabled to false")
    wm("config active_window_border_color 0xffd58946")
    wm("config normal_window_border_color 0xff505050")
  end
end

function sendLeft() 
  wm("window --display 2")
  wm("display --focus 2")
end

function sendRight() 
  wm("window --display 1")
  wm("display --focus 1")
end

function readingMode()
  wm("window --toggle float")
  wm("window --grid 26:26:5:1:13:24")
end



function wm(command)
  local args =  split_string("-m "..command, " ")
  hs.task.new("/usr/local/bin/yabai", nil, args):start()
end

function split_string (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
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

hs.osascript.applescript("tell application \"HazeOver\" to set enabled to false")
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
