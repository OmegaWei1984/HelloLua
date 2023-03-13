local t = {}
assert(getmetatable(t) == nil)

local t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)
t1.foo = "foo"
assert(getmetatable(t) == t1)
assert(t.foo == nil)
assert(t1.foo ~= nil)

local mt = {}
Set = {}
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
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
function Set.intersection(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end
function Set.toString(set)
    local l = {}
    for key in pairs(set) do
        l[#l + 1] = tostring(key)
    end
    return "{"..table.concat(l, ", ").."}"
end
mt.__add = Set.union

local s1 = Set.new({1, 2, 3, 4, 5})
local s2 = Set.new({1, 3, 5, 7})
local s3 = s1 + s2
print(Set.toString(s3))
