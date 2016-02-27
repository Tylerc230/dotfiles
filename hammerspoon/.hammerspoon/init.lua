hs.hotkey.bind({"cmd", "alt", "ctrl"}, "LEFT", function()
  local win = hs.window.focusedWindow()
  moveWindowLeft(win)
  fullscreen(win)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "RIGHT", function()
  local win = hs.window.focusedWindow()
  moveWindowRight(win)
  fullscreen(win)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
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
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
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