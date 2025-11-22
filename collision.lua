
collisions = {}

-- Returns if two boxes are overlapping.
function overlap(box_a, box_b)
    a = {
        left = box_a.x,
        right = box_a.x + box_a.sx,
        top = box_a.y,
        bottom = box_a.y + box_a.sy
    }

    b = {
        left = box_b.x,
        right = box_b.x + box_b.sx,
        top = box_b.y,
        bottom = box_b.y + box_b.sy
    }

    if not (a.right >= a.left) then return false end
    if not (a.left <= b.right) then return false end
    if not (a.bottom >= b.top) then return false end
    if not (a.top <= b.bottom) then return false end

    return true
end

function collides(box)
    
end

-- Returns the box with the given offset ONLY IF there are no collisions in that direction.
function offset(box, by_x, by_y)
    next = {
        x = box.x + by_x, y = box.y + by_y,
        sx = box.sx, sy = box.sy
    }

    if collides(next) then return next end
    return box
end