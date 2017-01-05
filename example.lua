
require "datagenerator"

-- Create the class and set max_length and min_length (which is optional)
r = DataGenerator.new{ max_length=30, min_length=10}

-- Request an alphanumeric string
print(r:get_string())

-- Request a string with only numbers
print(r:get_numbers())

-- Request a string with only letters
print(r:get_letters())
