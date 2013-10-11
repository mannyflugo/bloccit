# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  u.skip_confirmation!
  u.save

  rand(5..12).times do
    p = u.posts.create(
      title: Faker::Lorem.words(rand(1..10)).join(""),
      body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
    p.update_attribute(:created_at, Time.now - rand(600..31536000))

    rand(3..7).times do
    p.comments.create(body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
    end   

  end
end
u = User.first
u.skip_confirmation!
#u.update_attributes(email: 'mannyflugo@gmail.com', password: 'helloworld', password_confirmation: 'helloworld')
u.update_column("email", "mannyflugo@gmail.com")
u.update_attribute("password", "helloworld")

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
