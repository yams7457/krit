g = grid.connect()

function init()
  grid_dirty = true
  range = {}
  toggled = {}
  counter = {}
  brightness = {}
  for x = 1,16 do
    toggled[x] = {}
    brightness[x] = {}
    counter[x] = {}
    for y = 1,8 do
      toggled[x][y] = false
      brightness[x][y] = 15
    end
  end
  for i = 1,4 do
    range[i] = {x1 = 1, x2 = 1, held = 0}
  end
  clock.run(grid_redraw_clock)
end

function grid_redraw_clock()
  while true do
    clock.sleep(1/30)
    if grid_dirty then
      grid_redraw()
      grid_dirty = false
    end
  end
end

function grid_redraw()
  g:all(0)
  for y = 1,4 do
    for x = range[y].x1, range[y].x2 do
      g:led(x,y,2)
    end
  end
  for x = 1,16 do
      for y = 1,4 do
        if toggled[x][y] then
          g:led(x,y,12)
        end
      end
    end
  g:refresh()
end

function g.key(x,y,z)
  if z == 1 then
    counter[x][y] = clock.run(long_press,x,y)    
    range[y].held = range[y].held + 1
    local difference = range[y].x2 - range[y].x1
    local original = {x1 = range[y].x1, x2 = range[y].x2}
    if range[y].held == 2 then 
      range[y].x2 = x
    end
    if range[y].x2 < range[y].x1 then
      range[y].x2 = range[y].x1
    end
  elseif z == 0 then
        if range[y].held == 1 then
          if counter[x][y] then 
           clock.cancel(counter[x][y])
           short_press(x,y,z)
           end
        end   
     range[y].held = range[y].held - 1
  end
  grid_dirty = true
end

function rerun()
  norns.script.load(norns.state.script)
end

function short_press(x,y,z)
      if not toggled[x][y] then
          toggled[x][y] = true
          brightness[x][y] = 8
      elseif toggled [x][y] then
        toggled[x][y] = false
end
end

function long_press()
  print("PRESSED")
end
