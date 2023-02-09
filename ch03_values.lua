assert(1 == 1.0)
assert(0.2e3 == 200)
print(math.type(3))
print(math.type(3.0))
assert(0xff == 255)

print(math.type(1 + 1))
print(math.type(1.0 + 1.0))
print(math.type(1 + 1.0))
local a = 10
local b = 3
print(a / b)
print(a // b)
print(a % b)
assert(a % b == a - ((a // b) * b))
local x = math.pi
print(x - x % 0.01)
print(x - x % 0.001)

assert(true == true)
assert(true ~= false)
assert(1 < 2)
assert(3 > 2)
assert(2 >= 2)
assert(1 <= 2)

print(math.random(os.time()))

print(math.floor(3.3))
print(math.floor(-3.3))
print(math.ceil(3.3))
print(math.ceil(-3.3))
print(math.modf(3.3))
print(math.modf(-3.3))
print(math.floor(2^70))
local function round(num)
    local f = math.floor(num)
    if num == f then return f
    else return math.floor(num + 0.5)
    end
end
print(round(3.4999))
print(round(3.5))

print(math.maxinteger)
print(math.mininteger)
assert(math.maxinteger + 1 == math.mininteger)
assert(math.mininteger - 1 == math.maxinteger)
assert(-math.mininteger == math.mininteger)
assert(math.mininteger // -1 == math.mininteger)
assert(math.maxinteger == 0x7fffffffffffffff)
assert(math.mininteger == 0x8000000000000000)
print(-3 + 0.0)
assert(9007199254740992 + 0.0 == 9007199254740992)
assert(9007199254740993 + 0.0 ~= 9007199254740993)

-- Exercise
-- 3.4
assert(2^3^4 == 2^(3^4))
assert(2^-3^4 == 2^(-3^4))

-- 3.6
local function getVolumeOfRightCone(h, angle)
    local r = h * math.tan(math.rad(angle))
    return (math.pi * (r ^ 2) * h) / 3;
end

-- 3.7

-- https://github.com/0kk470/pil4/blob/master/chapter03/chapter03.lua
---练习3.7 利用函数 math.random 编写一个生成遵循正态分布（高斯分布）的伪随机数发生器
--Box–Muller
local function gaussian (average, variance)
    return  math.sqrt(-2 * variance * math.log(math.random())) *
            math.cos(2 * math.pi * math.random()) + average
end

--平均值
local function mean (t)
    local sum = 0
    for _, v in pairs(t) do
        sum = sum + v
    end
    return sum / #t
end

--标准差
local function std (t)
    local squares, avg = 0, mean(t)
    for _, v in pairs(t) do
        squares = squares + ((avg - v) ^ 2)
    end
    local variance = squares / #t
    return math.sqrt(variance)
end

--打印
local function showHistogram (t)
    local lo = math.ceil(math.min(table.unpack(t)))
    local hi = math.floor(math.max(table.unpack(t)))
    local hist, barScale = {}, 200
    for i = lo, hi do
        hist[i] = 0
        for k, v in pairs(t) do
            if math.ceil(v - 0.5) == i then
                hist[i] = hist[i] + 1
            end
        end
        local n = math.ceil(hist[i] / #t * barScale)
        io.write(i .. "\t" .. string.rep('=', n))
        print(" " .. hist[i])
    end
end

--测试
local function normalDistribution()
    math.randomseed(os.time())
    local t, average, variance = {}, 50, 10
    for i = 1, 1000 do
        table.insert(t, gaussian(average, variance))
    end
    print("Mean:", mean(t) .. ", expected " .. average)
    print("StdDev:", std(t) .. ", expected " .. math.sqrt(variance) .. "\n")
    showHistogram(t)
end

normalDistribution()

