local a = "hello"
print(#a)
print(a .. " wolrd")

print("aa\t''bb")
print('aa\t""bb')

local page = [[
<html>
<body>
    <h>hello world</h>
</body>
</html>
]]
print(page)

local b = 20 .. 22
print(type(b))
print("10" + 1)
print(type("10" + 1))
assert(tonumber("100101", 2) == 37)

local rep = string.rep("abc", 3)
print(rep)
local rev = string.reverse("abc")
print(rev)
local low = string.lower("ABC")
print(low)
local up = string.upper("abc")
print(up)
local s = "aabbcc"
print(string.sub(s, 2, -2))
print(s:sub(2, -2))
print(string.format("x = %d, y = %d", 10, 20))

-- Exercise
-- 4.1
local xml1 = [[
<![CDATA[
    Hello world
\]\]>
]]
print(xml1)
local xml2 = "<![CDATA[\n\tHello world\n]]>"
print(xml2)

-- 4.3
local function insert(str, position, add)
    if position < 0 then
        position = position % -#str
        position = position +  1 + #str
    elseif position > #str then
        position = position % #str
    end
    -- print(#str, position)
    -- print("pre", string.sub(str, 0, position - 1))
    -- print("suf", string.sub(str, position, #str))
    local pre = string.sub(str, 0, position - 1)
    local suf = string.sub(str, position, #str)
    return pre .. add .. suf
end
print(insert("hello world", 1, "start: "))
print(insert("hello wolrd", 7, "small "))
print(insert("hello world", -1, "!"))
print(insert("hello world", #"hello world", "!"))
print(insert("hello world", -21, "|"))

-- 4.5
local function remove(str, position, num)
    if position < 0 then
        position = position % -#str
        position = position +  1 + #str
    elseif position > #str then
        position = position % #str
    end
    local pre = str:sub(0, position - 1)
    local tmp = math.min(#str, position + num)
    local suf = str:sub(tmp, #str)
    return pre .. suf;
end
print(remove("hello world", 7, 4))

-- 4.7
local function isPalindrome(str)
    if (#str % 2) == 1 then
        return str:sub(0, (#str // 2)) == string.reverse(str:sub((#str // 2) + 2, #str))
    else
        return str:sub(0, #str / 2) == string.reverse(str:sub((#str / 2) + 1, #str))
    end
end
print(isPalindrome("abba"))
print(isPalindrome("abcba"))
print(isPalindrome("aaa"))
print(isPalindrome("a"))
print(isPalindrome("abc"))
