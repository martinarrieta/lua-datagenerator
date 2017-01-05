
require "datagenerator"

r = DataGenerator.new{ max_length=30, min_length=10}
print(r:get_string())
print(r:get_numbers())
print(r:get_letters())
