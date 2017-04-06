require 'faker'

# Create member
    member = User.create(
    name: "member",
    email: "member@example.com",
    password: "password"
  )


# Create Users
5.times do
  user = User.create(
    name:  Faker::Name.name,
    email:  Faker::Internet.email,
    password: "password"
  )
end
users = User.all


# Create Items
  10.times do
    Item.create!(
      user: users.sample,
      name: Faker::Lorem.sentence
    )
  end

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Item.count} items created"
