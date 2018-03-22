local hyper = {"cmd", "alt", "ctrl"}

-- application launching 
hs.hotkey.bind(hyper, 't', function()
  hs.application.launchOrFocus('Things3')
end)

hs.hotkey.bind(hyper, 'x', function()
  hs.application.launchOrFocus('Xcode')
end)
hs.hotkey.bind(hyper, 'h', function()
  hs.application.launchOrFocus('Finder')
end)
hs.hotkey.bind(hyper, 's', function()
  hs.application.launchOrFocus('Slack')
end)
hs.hotkey.bind(hyper, 'z', function()
  hs.application.launchOrFocus('Zeplin')
end)
hs.hotkey.bind(hyper, 'm', function()
  hs.application.launchOrFocus('Messages')
end)
hs.hotkey.bind(hyper, 'c', function()
  hs.application.launchOrFocus('Google Chrome')
end)
-- window movement
hs.hotkey.bind(hyper, "LEFT", function()
  local win = hs.window.focusedWindow()
  moveWindowLeft(win)
  fullscreen(win)
end, nil, function()
  local win = hs.window.focusedWindow()
  fillLeft(win)
end)

hs.hotkey.bind(hyper, "RIGHT", function()
  local win = hs.window.focusedWindow()
  moveWindowRight(win)
  fullscreen(win)
end)

hs.hotkey.bind(hyper, "F", function()
  local win = hs.window.focusedWindow()
  fullscreen(win)
end)

function moveWindowLeft(window)
  window:moveOneScreenWest()
end

function moveWindowRight(window)
  window:moveOneScreenEast()
end

function fullscreen(window)
  fillPercent(window, 1.0, 1.0)
end

function fillLeft(window)
  fillPercent(window, .5, 1.0)
end

function fillPercent(window, w, h)
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * w
  f.h = max.h * h
  window:setFrame(f)
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
