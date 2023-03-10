local t = {}
assert(getmetatable(t) == nil)

local t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)
t1.foo = "foo"
assert(getmetatable(t) == t1)
assert(t.foo == nil)
assert(t1.foo ~= nil)

Set = {}
function Set.new(l)
    local set = {}
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end
function Set.union(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end
