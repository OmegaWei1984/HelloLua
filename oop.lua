Account = {balance = 0}
function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end
function Account:withdraw(v)
    self.balance = self.balance - v
end

local account1 = Account:new()
account1:withdraw(10)
print(account1.balance)

Account2 = Account:new()
Account2 = Account2:new{limit = 10}
function Account2:withdraw(v)
    if self.balance > Account2.limit then
        self.balance = self.balance - v
    else
        print("error")
    end
end
function Account2:getLimit()
    return self.limit
end
local account2 = Account2:new()
account2:withdraw(10)
print(account2.balance)

local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then return v end
    end
end

function CreateClass(...)
    local c = {}
    local parents = {...}
    setmetatable(c, {__index = function (t, k)
        local v = search(k, parents)
        t[k] = v
        return v
    end})
    c.__index = c
    function c:new(o)
        o = o or {}
        setmetatable(o, c)
        return o
    end
    return c
end

Named = {}
function Named:getname()
    return self.name
end
function Named:setname(n)
    self.name = n
end

NamedAccount = CreateClass(Account, Named)
local account3 = NamedAccount:new{name = "Paul"}
print(account3:getname())

function NewAccount(initialBalance)
    local self = {balance = initialBalance}
    local withdraw = function(v)
        self.balance = self.balance - v
    end
    local getBalance = function() return self.balance end
    return {
        withdraw = withdraw,
        getBalance = getBalance
    }
end
local account4 = NewAccount(15)
account4.withdraw(5)
print(account4:getBalance())

function NewAccount2(initialBalance)
    local self = {
        balance = initialBalance,
        LIM = 10
    }
    local extra = function ()
        if self.balance > self.LIM then
            return self.balance * 0.10
        else
            return 0
        end
    end
    local getBalance = function ()
        return self.balance + extra()
    end
    return {
        getBalance = getBalance
    }
end
local account5 = NewAccount2(20)
print(account5:getBalance())

function NewObject(value)
    return function (action, v)
        if action == "get" then return value
        elseif action == "set" then value = v
        else error("invalid action")
        end
    end
end
local d = NewObject(10)
print(d("get"))
d("set", 100)
print(d("get"))

-- dual representation
local balanceTable = {}
Account6 = {}
function Account6:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    balanceTable[o] = 100
    return o
end
function Account6:withdraw(v)
    balanceTable[self] = balanceTable[self] - v
end
function Account6:balance()
    return balanceTable[self]
end
local account6 = Account6:new()
account6:withdraw(10)
print(account6:balance())
