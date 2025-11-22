function cbox(x, y, sx, sy, fill, outline)

    if fill != nil then
        rectfill(x, y, x + sx, y + sy, fill)
    else
        rectfill(x, y, x + sx, y + sy)
        
    end

    if outline != nil then
        rect(x, y, x + sx, y + sy, outline)
    end
end