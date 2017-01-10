luaunit = require('luaunit')
require "datagenerator"

TestDataGenerator = {} --class
  function TestDataGenerator:testWithStrings()
    max_length = 30
    min_length = 10

    r = DataGenerator.new{ max_length=max_length, min_length=min_length}
    string1 = r:get_string()
    luaunit.assertEquals( string.len(string1) >= min_length, true )
    luaunit.assertEquals( string.len(string1) <= max_length, true )
  end

  function TestDataGenerator:testWithoutMinLength()
    max_length = 30
    min_length = nil

    r = DataGenerator.new{ max_length=max_length, min_length=min_length}
    string1 = r:get_string()
    luaunit.assertEquals( string.len(string1) == max_length, true )
  end

  function TestDataGenerator:testNumbers()
    max_length = 30

    r = DataGenerator.new{ max_length=max_length }
    string1 = r:get_numbers()
    luaunit.assertNotEquals( tonumber(string1), nil )
  end


  function TestDataGenerator:testLetters()
    max_length = 40

    r = DataGenerator.new{ max_length=max_length}
    string1 = r:get_letters()
    luaunit.assertEquals( string.match(string1, "%d"), nil )
  end

  function TestDataGenerator:testDefaultValues()

    r = DataGenerator.new()
    string1 = r:get_letters()
    luaunit.assertEquals( string.len(string1) == 30, true )
  end


  function TestDataGenerator:testEmail()
    max_length = 30
    r = DataGenerator.new{ max_length=max_length}
    string1 = r:get_email()
    luaunit.assertEquals( string.match(string1, "[A-Za-z0-9]+@[A-Za-z0-9]+%.[A-Za-z0-9]+"), string1 )
  end


  function TestDataGenerator:testNullPercent()
    r = DataGenerator.new{ null_percent=100 }
    string1 = r:get_email()
    luaunit.assertEquals( string1, nil)
    r.null_percent = 0
    string2 = r:get_email()
    luaunit.assertNotEquals( string2, nil)
  end

-- class TestDataGenerator

os.exit( luaunit.LuaUnit.run() )
