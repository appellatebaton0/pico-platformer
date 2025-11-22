
player = {
    x = 5, y = 4, sx = 4, sy = 4,
    layer = 1,

    _update = function(this)
        this.y = offset(this, 0, 1).y
        --this.y += 1
    end,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
        if collides(this) then cbox(this.x, this.y, this.sx, this.sy, 3, 4) end
    
        print(offset(this, 0, 1).y, 4, 4, 7)
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
    x = 1, y = 100, sx = 30, sy = 4,
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
