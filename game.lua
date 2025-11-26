
player = {
    x = 5, y = 4, sx = 4, sy = 4,
    layer = 1, gravity = 0.15,
    vel = {x=0,y=0},

    control = function(this)

        dir = 0
        if btn(0) then dir = -1 end
        if btn(1) then dir = 1 end

        if btn(2) and this.on_floor then this.vel.y -= 3 end

        this.vel.x = dir
    end,

    _update = function(this)
        this.on_floor = this.vel.y == 0

        -- Apply gravity
        this.vel.y += this.gravity

        this:control()

        next = offset(this, this.vel.x, this.vel.y)
        --next = offset(next, 0, this.vel.y)

        this.vel.x = next.x - this.x
        this.vel.y = next.y - this.y
        
        this.x = next.x this.y = next.y

    end,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
        if collides(this) then cbox(this.x, this.y, this.sx, this.sy, 3, 4) end
    
        print(offset(this, 0, 1).y, 4, 4, 7)
        print(this.vel.x..","..this.vel.y, 40, 4, 7)
    end
}

exbox = {
    x = 1, y = 50, sx = 30, sy = 4,
    layer = 2,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
    end
}

exbox2 = {
    x = 30, y = 40, sx = 30, sy = 40,
    layer = 2,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
    end
}


draw_call = {}
update_call = {}

function _init()
    draw_call  = {player, exbox, exbox2}
    update_call ={player}
    collisions = {player, exbox, exbox2}
end

function _update()
    for i, object in pairs(update_call) do object:_update() end
end

function _draw()
    cls(0)
    
    for i, object in pairs(draw_call) do object:_draw() end
end
