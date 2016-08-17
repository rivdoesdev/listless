# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Kate", email: "kate@example.com", password: "password")
User.create!(name: "Matt", email: "matt@example.com", password: "password")
User.create!(name: "Rob", email: "rob@example.com", password: "password")
User.create!(name: "Ahkeem", email: "ahkeem@example.com", password: "password")
User.create!(name: "Dane", email: "dane@example.com", password: "password")
User.create!(name: "Justin", email: "justin@example.com", password: "password")

List.create!(title: "Clean the House", difficulty: "3/5", energy: "4/5", due_date: "09/01/2016", reward: "Netflix", completed: false, user_id: 1, public: true)
Task.create!(title: "Clean the floors", description: "Sweep dirt into piles, vacuum the piles, Swiffer tiled areas.", position: 1, list_id: 1)
