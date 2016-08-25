# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Kate", email: "kate@example.com", password: "password", birthday: "01/01/2000", phone_number: "5555555555", about_me: "Hello world!")
User.create!(name: "Matt", email: "matt@example.com", password: "password")
User.create!(name: "Rob", email: "rob@example.com", password: "password")
User.create!(name: "Ahkeem", email: "ahkeem@example.com", password: "password")
User.create!(name: "Dane", email: "dane@example.com", password: "password")
User.create!(name: "Justin", email: "justin@example.com", password: "password")

List.create!(title: "Clean the House", difficulty: "3/5", energy: "4/5", due_date: "09/01/2016", reward: "Netflix", user_id: 1, public: true)
Task.create!(title: "Clean the floors", description: "Sweep dirt into piles, vacuum the piles, Swiffer tiled areas.", position: 1, list_id: 1)
Task.create!(title: "Clean bathrooms", description: "Wipe off mirrors, scrub toilets, clean bathroom", position: 2, list_id: 1)
Task.create!(title: "Clean kitchen", description: "Wipe off counters, put appliances away.", position: 3, list_id: 1)
Task.create!(title: "Do the dishes", description: "Collect dishes from around the house, rinse them, put in dishwasher, run dishwasher, put dishes away.", position: 4, list_id: 1)
Task.create!(title: "Dust fans", description: "Get duster from closet, get step stool from garage, dust each blade, vacuum underneath if needed.", position: 5, list_id: 1)
