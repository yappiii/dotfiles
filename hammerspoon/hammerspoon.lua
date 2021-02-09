-- author: Takatsugu Yoneya

-- -------------------------------------
--     ** window management **
-- -------------------------------------

local mash = {"alt", "cmd"}

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, 'Y', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	
	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)
hs.hotkey.bind(mash, 'U', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y + (max.h / 2)
	f.h = max.h / 2
	win:setFrame(f)
	win:setFrame(f)
end)
hs.hotkey.bind(mash, 'I', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y
	f.h = max.h / 2
	win:setFrame(f)
end)
hs.hotkey.bind(mash, 'O', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- change focus
hs.hotkey.bind(mash, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mash, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(mash, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mash, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)

-- change sound volume
hs.hotkey.bind(mash, '=', function() hs.itunes.volumeUp() end)
hs.hotkey.bind(mash, '-', function() hs.itunes.volumeDown() end)

-- multi monitor
hs.hotkey.bind(mash, "N", function()
  hs.grid.pushWindowNextScreen()
  hs.grid.maximizeWindow()
end)

hs.hotkey.bind(mash, "P", function()
  hs.grid.pushWindowPrevScreen()
  hs.grid.maximizeWindow()
end)

-- -------------------------------------
--        ** debug management **
-- -------------------------------------

function reloadConfig(files)
  local doReload = false
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

-- Well, sometimes auto-reload is not working, you know u.u
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)
hs.notify.show("Hammerspoon", "Notify", "Config loaded")
