local a = {}
a["x"] = 1
local b = a
b["x"] = 10
assert(a["x"] == 10)
assert(a.x == a["x"])
assert(a["y"] == nil)
local x = "x"
assert(a[x] == a["x"])
a[2.0] = 10
a[2.1] = 20
assert(a[2] == 10)
assert(a[2.100] == 20)

local one = "1"
local w = {x = 1, y = 2, one = "hello"}
w[1] = "test"
assert(w["1"] == nil)
assert(w["one"] == "hello")
assert(w[1] == "test")
local opnames = {["+"] = "add"}
local op = "+"
assert(opnames[op] == "add")

local c = {1, 2, 3, 4, 5}
c[#c] = nil
c[#c + 1] = 6
print(#c)
for _, v in ipairs(c) do
    print(v)
end
c[#c + 2] = 8
for _, v in ipairs(c) do
    print(v)
end
for i = 0, 7 do
    print(c[i])
end

local d = {1, 2, 3, 4}
table.insert(d, 5)
table.remove(d, 5)
table.remove(d, 5)
table.move(d, 1, 1, 2)

-- Exercise
-- 5.1
local sunday = "monday"
local monday = "sunday"
local t = {
    sunday = "monday",
    [sunday] = "monday",
}
print(t.sunday, t[sunday], t[t.sunday])

-- 5.4
local function polynomial(constants, variables)
    local sum = 0
    for i = 1, #constants do
        sum = sum + constants[i] * (variables ^ (i - 1))
    end
    return sum
end
local aSeq = {0, 1, 0, 1}
assert(polynomial(aSeq, 16) == 0x1010)

-- 5.7
local function tbaleInsert(table1, table2, pos)
    for i = 1, #table2 do
        table.insert(table1, pos + i - 1, table2[i])
    end
end
local t1 = {1, 2, 3}
local t2 = {4, 5}
tbaleInsert(t1, t2, 2)
for index, value in ipairs(t1) do
    print(value)
end
