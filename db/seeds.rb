# Tables delete everytime you seed. So you must seed before running into the terminal

require 'faker'
City.destroy_all
User.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Gossip.destroy_all
TagGossip.destroy_all

# Seed for City
10.times do
  City.create(
    name: Faker::Games::Fallout.unique.location,
    zip_code: Faker::Address.unique.zip
  )
end


# Seed for User
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 8, to: 80),
    city_id: City.all.sample.id
  )
end

# Seed for Gossip
20.times do
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Movie.quote + ". " + Faker::Movies::StarWars.quote,
    user_id: User.all.sample.id
  )
end

# Seed for Tag
10.times do
  Tag.create!(
    title: Faker::Lorem.word
  )
end

30.times do
  TagGossip.create!(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end

20.times do
  PrivateMessage.create!(
    content: Faker::Movies::Lebowski.quote
  )
end