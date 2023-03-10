local arr1 = {1, 2, 3, 4}
local function maximum(arr)
    local index = 1
    local value = arr[1]
    for i = 1, #arr do
        if arr[i] > value then
            value = arr[i]
            index = i
        end
    end
    return index, value
end
local mi, mv = maximum(arr1)
assert(mi == 4 and mv == 4)

local function add(...)
    local sum = 0
    for key, value in pairs{...} do
        sum = sum + value
    end
    return sum
end
assert(add(1, 3, 5, 7) == 16)
print(table.unpack{10, 20, 30})
local v1, v2 = table.unpack{10, 20, 30}
assert((v1 == 10) and (v2 == 20))
print(string.find("hello", "ll"))
local funcStrFind = string.find
local params = {"hello", "ll"}
assert(funcStrFind(table.unpack(params)) == string.find("hello", "ll"))
