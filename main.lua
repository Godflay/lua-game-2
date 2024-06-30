function love.load()
    --assets table
    sprites = {}
    sprites.background = love.graphics.newImage('assets/background.png')
    sprites.bullet = love.graphics.newImage('assets/bullet.png')
    sprites.player = love.graphics.newImage('assets/player.png')
    sprites.zombie = love.graphics.newImage('assets/zombie.png')

    --zombies table will contain multiple zombies
    zombies = {}


    --player table
    player = {}
    --player position middle of the screen
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    player.speed = 180
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
end

function love.keypressed( key )
    if key == "space" then
        spawnZombie()
    end
end


function love.draw()
    love.graphics.draw(sprites.background, 0, 0)

    --refer to love.graphics.draw function on the wiki for all the params
    love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, sprites.player:getWidth() / 2, sprites.player:getHeight() / 2)

    --loop to go through a table every zombie it finds in the zombies table
    --z holds the current zombie the for loop is looking at, so we can get their x and y position
    for i,z in ipairs(zombies) do
        love.graphics.draw(sprites.zombie, z.x, z.y)
    end
end

function playerMouseAngle()
    return math.atan2( player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

function spawnZombie()
    ---this local zombie table will only contain 1 zombie
    local zombie = {}
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = math.random(0, love.graphics.getHeight())
    zombie.speed = 100
    --to add local table to the zombies table mentionned earlier
    table.insert(zombies, zombie)
end