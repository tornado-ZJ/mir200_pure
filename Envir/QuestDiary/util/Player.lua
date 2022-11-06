Player = {}

---@param oldTitle title
---@param newTitle title
function Player.swapTitle(actor, oldTitle, newTitle)
    lib996:deprivetitle(actor, oldTitle.name)
    lib996:confertitle(actor, newTitle.name)
    if newTitle ~= {} then
        lib996:clearplayeffect(actor, oldTitle.effectid)
        lib996:playeffect(actor, newTitle.effectid, 0,0,0,0,0)
    end

end

return Player