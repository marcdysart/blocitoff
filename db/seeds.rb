 require 'faker'

 # Create Lists
 10.times do
   List.create!(
     title:  Faker::Lorem.sentence,
   )
 end
 lists = List.all

 # Create Items
 100.times do
   Item.create!(
     list: lists.sample,
     body: Faker::Lorem.sentence
   )
 end

 puts "Seed finished"
 puts "#{List.count} lists created"
 puts "#{Item.count} items created"
