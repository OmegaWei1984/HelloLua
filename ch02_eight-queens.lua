N = 8

local function isplaceok(a, n ,c)
    for i = 1, n - 1 do
        if (a[i] == c) or
            (a[i] - i == c - n) or
            (a[i] + i == c +n) then
            return false
        end
    end
    return true
end

local function printsolution(a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

local function addqueen(a, n)
    if n > N then
        printsolution(a)
    else
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                addqueen(a, n + 1)
            end
        end
    end
end

-- addqueen({}, 1)

-- Exercise
-- 2.2
-- https://www.cnblogs.com/zoey-liao/p/12271166.html
local function addqueen_(arr, a, n)
    if n > N then
        table.insert(arr, a)
    else
        for c = 1, N do
            local tmp = {}
            for k, v in pairs(a) do
                tmp[k] = v
            end
            tmp[n] = c
            addqueen_(arr, tmp, n + 1)
        end
    end
end

local posibles = {}
addqueen_(posibles, {}, 1)
for _, v in pairs(posibles) do
    local isok = true
    for i = 1, N do
        isok = isplaceok(v, i, v[i])
        if not isok then
            break
        end
    end
    if isok then
        printsolution(v)
    end
end
