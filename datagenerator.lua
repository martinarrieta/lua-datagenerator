

local ALPHA_NUMERIC = {}
local NUMBERS = {}
local LETTERS = {}

-- Numbers
for i = 48,  57 do table.insert(ALPHA_NUMERIC, string.char(i)) end
-- Uppercase letters
for i = 65,  90 do table.insert(ALPHA_NUMERIC, string.char(i)) end
-- Lowercase letters
for i = 97, 122 do table.insert(ALPHA_NUMERIC, string.char(i)) end
-- Space
table.insert(ALPHA_NUMERIC, string.char(32))

-- Numbers
for i = 48,  57 do table.insert(NUMBERS, string.char(i)) end

-- Uppercase letters
for i = 65,  90 do table.insert(LETTERS, string.char(i)) end
-- Lowercase letters
for i = 97, 122 do table.insert(LETTERS, string.char(i)) end


DataGenerator = {}
DataGenerator.__index = DataGenerator

DEFAULT_MAX_LENGTH=30
debug=true
function DataGenerator.new (arg)
  local o = {}
  setmetatable(o,DataGenerator)
  opt = arg or {}
  o.max_length = opt.max_length or DEFAULT_MAX_LENGTH
  o.min_length = opt.min_length or nil
  o.length = opt.length or nil
  o.null_percent = opt.null_percent or 0
  math.randomseed( os.time() )

  return o
end

function DataGenerator:calculate_length()
  if self.min_length == nil then
    return self.max_length
  else
    return math.random(self.min_length,self.max_length)
  end
end

function DataGenerator:set_length(length)
  self.length = length or self:calculate_length()
end

function DataGenerator:get_char()
  if self.current_length > 0 then
    self.current_length = self.current_length - 1
    return self:get_char() .. self.data_type[math.random(1, #self.data_type)]
  else
    return ""
  end
end

function DataGenerator:return_null()
  if self.null_percent > 0 and math.random(1, 100) < self.null_percent then
    return true
  end
end

function DataGenerator:get_data_or_null(data_type)
  if self:return_null() then
    return nil
  else
    return self:get_data(data_type)
  end
end

function DataGenerator:get_data(data_type)
  if self.length == nil then
    self:set_length()
  end
  self.current_length = self.length
  self.data_type = data_type or self.data_type
  self.length = nil
  return self:get_char()
end

function DataGenerator:get_string()
  return self:get_data_or_null(ALPHA_NUMERIC)
end

function DataGenerator:get_numbers()
  return self:get_data_or_null(NUMBERS)
end

function DataGenerator:get_letters()
  return self:get_data_or_null(LETTERS)
end

function DataGenerator:get_email()
  if self:return_null() then
    return nil
  end

  local val = self:get_data(LETTERS)
  local at_char = math.floor(math.random(20, 30)*string.len(val)/100)
  return string.sub(val,at_char * -1) .. "@" .. string.sub(val,at_char + 1, string.len(val) - 4) .. ".com"
end
