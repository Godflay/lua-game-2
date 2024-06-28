function love.load()
    --assets table
    sprites = {}
    sprites.background = love.graphics.newImage('assets/background.png')
    sprites.bullet = love.graphics.newImage('assets/bullet.png')
    sprites.player = love.graphics.newImage('assets/player.png')
    sprites.zombie = love.graphics.newImage('assets/zombie.png')

    --player table
    player = {}
    --player position middle of the screen
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    player.speed = 180

    tempRotation = 0
end

function love.update(dt)
    --every frame that the key is pressed, increase x or y by 1
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    end

    tempRotation = tempRotation + 0.01
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)

    --refer to love.graphics.draw function on the wiki for all the params
    love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, sprites.player:getWidth() / 2, sprites.player:getHeight() / 2)
end

function playerMouseAngle()
    return math.atan2( player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end