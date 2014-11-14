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

# Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!

 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!

 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save!

 puts "Seed finished"
 puts "#{User.count} Users created"
 puts "#{List.count} lists created"
 puts "#{Item.count} items created"
