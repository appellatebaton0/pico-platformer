
player = {
    x = 5, y = 4, sx = 4, sy = 4,

    _update = function(this)
        this.y += 1
    end,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
    end
}

exbox = {
    x = 1, y = 50, sx = 30, sy = 4,

    _draw = function(this)
        cbox(this.x, this.y, this.sx, this.sy, 7, 4)
    end
}


draw_call = {}
update_call = {}

function _init()
    draw_call  = {player, exbox}
    update_call ={player}
end

function _update()
    for i, object in pairs(update_call) do object:_update() end
end

function _draw()
    cls(0)
    
    for i, object in pairs(draw_call) do object:_draw() end
end
