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

User.create(username: "jpark", first_name: "JoAnna", last_name: "Park")
User.create(username: "jjenkins", first_name: "Jeff", last_name: "Jenkins")
User.create(username: "bbutterly", first_name: "Brian", last_name: "Butterly")
User.create(username: "aoie", first_name: "Austin", last_name: "Oie")
User.create(username: "rjafri", first_name: "Raza", last_name: "Jafri")
User.create(username: "nmoore", first_name: "Nick", last_name: "Moore")
User.create(username: "cpatron", first_name: "Charlie", last_name: "Patron")

puts "Seeding Notes"

Note.create(title: "First Note", content: Faker::ChuckNorris.fact, user_id: User.first.id)
Note.create(title: "Second Note", content: Faker::ChuckNorris.fact, user_id: User.first.id)
Note.create(title: "Third Note", content: Faker::ChuckNorris.fact, user_id: User.second.id)
Note.create(title: "Fourth Note", content: Faker::ChuckNorris.fact, user_id: User.third.id)
Note.create(title: "Fifth Note", content: Faker::ChuckNorris.fact, user_id: User.fourth.id)

puts "Complete!"