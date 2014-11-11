 require 'faker'

 # Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


 # Create Lists
 10.times do
   List.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence
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

 User.first.update_attributes!(
   email: 'dysart.marc@gmail.com',
   password: 'helloworld'
 )
 User.first.confirm!

 puts "Seed finished"
 puts "#{User.count} Users created"
 puts "#{List.count} lists created"
 puts "#{Item.count} items created"
