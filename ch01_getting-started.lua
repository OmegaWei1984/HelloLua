print("hello world")

local function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

print("enter number:")
local num = io.read("*n")
print(fact(num))

print(math.pi / 4)

-- Types and Values
local types = {
    type(nil),
    type(true),
    type(10.4 * 3),
    type("hello lua"),
    type(io.stdin),
    type(print),
    type(type),
    type({}),
    type(type("X"))
}
for _, value in ipairs(types) do
    print(value)
end

-- Exercise
-- 1.1
local function fact2(n)
    if n < 0 then
        print("invalid number")
        return;
    end
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end
print(fact2(-1))

-- 1.5
print(type(nil) == nil)

-- 1.6
local function isBoolean(value)
    return value == true or value == false
end
assert(isBoolean(true))
assert(not isBoolean("true"))

-- 1.8
local function whoami()
    return arg[0] or ""
end
print(whoami())
