require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...

sum_revenue = Store.sum(:annual_revenue)

p sum_revenue

total_milly_stores = Store.where("annual_revenue > ?", 1000000).count

p total_milly_stores