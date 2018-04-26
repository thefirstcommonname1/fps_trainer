function love.load()
  width = 1280
  height = 720
  r = 10
  love.window.setMode(width, height, {
    resizable = false,
    vsync = true
  })
  x = love.math.random(r/2,width)
  y = love.math.random(r/2,height)
  timeStart = love.timer.getTime()
  score = 0
end

function love.update()
  posx = love.mouse.getX()
  posy = love.mouse.getY()
  timeEnd = love.timer.getTime()
  if timeEnd - timeStart > 10.1 then
    love.event.quit()
  end
end

function love.mousepressed()
  if posy > (y - r) and posy < (y + r) then
    if posx < (x + r) and posx > (x - r) then
      x = love.math.random(r/2,width)
      y = love.math.random(r/2,height)
      score = score + 1
    end
  end
end
function love.draw()
  love.graphics.circle("fill", x, y, r)
  love.graphics.print(score,width/2,4)
  love.graphics.print(string.format("%.1f",timeEnd - timeStart),width-30,4)
end
