require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...

store3 = Store.new(name: 'Surrey', annual_revenue: 224000, mens_apparel: false, womens_apparel: true).save
store4 = Store.new(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false).save!
store5 = Store.new(name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true).save

@mens_stores = Store.where(mens_apparel: true, womens_apparel: false)

@mens_stores.each do |store|
  puts store.name
  puts store.annual_revenue
end

@womens_stores = Store.where("annual_revenue < ?", 1000000).where(mens_apparel: false, womens_apparel: true)

@womens_stores.each do |store|
  puts store.name
  puts store.annual_revenue
end