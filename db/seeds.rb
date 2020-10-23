# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Note.destroy_all

puts "Starting Seed"
puts "Seeding Users"

User.create(username: "jpark", first_name: "JoAnna", last_name: "Park", password: "12345")

puts "Seeding Notes"

Note.create(title: "First Note", content: Faker::ChuckNorris.fact, favorite: true, user_id: User.first.id)
Note.create(title: "Second Note", content: Faker::ChuckNorris.fact, favorite: false, user_id: User.first.id)
Note.create(title: "Third Note", content: Faker::ChuckNorris.fact, favorite: true, user_id: User.first.id)
Note.create(title: "Fourth Note", content: Faker::ChuckNorris.fact,favorite: false, user_id: User.first.id)
Note.create(title: "Fifth Note", content: Faker::ChuckNorris.fact, favorite: true, user_id: User.first.id)

puts "Complete!"