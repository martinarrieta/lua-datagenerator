# lua-datagenerator

This library is to generate different random values

# Examples


```lua
require "datagenerator"

-- Create the class and set max_length and min_length (which is optional)
r = DataGenerator.new{ max_length=30, min_length=10}

-- Request an alphanumeric string
print(r:get_string())

-- Request a string with only numbers
print(r:get_numbers())

-- Request a string with only letters
print(r:get_letters())
```


# Run the test

The test library that I have used for this was luaunit, here is an example about how to run the tests and what should be the output.

```
# lua5.3 test_datatypes.lua -v
Started on Thu Jan  5 09:56:43 2017
    TestDataGenerator.testLetters ... Ok
    TestDataGenerator.testNumbers ... Ok
    TestDataGenerator.testWithStrings ... Ok
    TestDataGenerator.testWithoutMinLength ... Ok
=========================================================
Ran 4 tests in 0.000 seconds, 4 successes, 0 failures
OK
```
