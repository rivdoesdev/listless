# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#TODO: Move away from manually setting IDs, it breaks the way postgres does auto increment.
#INFO: http://stackoverflow.com/questions/11068800/rails-auto-assigning-id-that-already-exists

User.create!(name: "Kate", email: "kate@example.com", password: "password", birthday: "01/01/1980", phone_number: "5123006890", about_me: Faker::Lorem.paragraphs(2))
User.create!(name: "Matt", email: "matt@example.com", password: "password", birthday: "01/01/1981", phone_number: "5125551234", about_me: Faker::Lorem.paragraph)
User.create!(name: "Rob", email: "rob@example.com", password: "password", birthday: "01/01/1982", phone_number: "5124329876", about_me: Faker::Lorem.paragraph)
User.create!(name: "Ahkeem", email: "ahkeem@example.com", password: "password", birthday: "01/01/1983", phone_number: "5123453456", about_me: Faker::Lorem.paragraph)
User.create!(name: "Dane", email: "dane@example.com", password: "password", birthday: "01/01/1984", phone_number: "5128826789", about_me: Faker::Lorem.paragraph)
User.create!(name: "Justin", email: "justin@example.com", password: "password", birthday: "01/01/1985", phone_number: "5126329999", about_me: Faker::Lorem.paragraph)

list = List.create!(title: "Balance checking account", difficulty: "5", energy: "3", due_date: "10/01/2016", reward: "Using extra money for a drink with friends", user_id: 1, public: true)
Task.create!(list: list, title: "Gather all receipts", position: 1)
Task.create!(list: list, title: "Pull up account information online", position: 2)
task = Task.create!(list: list, title: "Match up transactions on account with receipt info", position: 3)
  Task.create!(parent_task_id: task.id, list: list, title: "Put aside reciepts that don't match", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Highlight any transactions that don't have receipts", position: 2)
Task.create!(list: list, title: "Search inbox for emailed receipts", position: 4)
Task.create!(list: list, title: "Call bank for any unaccounted for transactions", position: 5)

list = List.create!(title: "Give the dog a bath", difficulty: "4", energy: "4", due_date: "09/19/2016", reward: "A slice of leftover cake", user_id: 1, public: false)
Task.create!(list: list, title: "Play fetch to wear her out", position: 1)
Task.create!(list: list, title: "Gather the bath supplies", description: "Doggie shampoo, towel, hair dryer, treats", position: 2)
Task.create!(list: list, title: "Fill the bathtub with warm water", position: 3)
Task.create!(list: list, title: "Make sure to wash underneath her legs and her feet", description: "Remember to wash her head last - she HATES getting her head wet.", position: 4)
Task.create!(list: list, title: "Dry her off", description: "Drain the bathtub, dry her off with the towel in the bathtub, wrap her in the towel and take her out of the bathtub, use the hairdryer over the towel to warm her up.", position: 5)
Task.create!(list: list, title: "Put away the supplies", position: 6)

list = List.create!(title: "Clean the House", difficulty: "3", energy: "4", due_date: "09/01/2016", reward: "Netflix", user_id: 1, public: true)
Task.create!(list: list, title: "Clean the floors", description: "Sweep dirt into piles, vacuum the piles, Swiffer tiled areas.", position: 1)
Task.create!(list: list, title: "Clean bathrooms", description: "Wipe off mirrors, scrub toilets, clean bathroom", position: 2)
Task.create!(list: list, title: "Clean kitchen", description: "Wipe off counters, put appliances away.", position: 3)
Task.create!(list: list, title: "Do the dishes", description: "Collect dishes from around the house, rinse them, put in dishwasher, run dishwasher, put dishes away.", position: 4)
Task.create!(list: list, title: "Dust fans", description: "Get duster from closet, get step stool from garage, dust each blade, vacuum underneath if needed.", position: 5)

list = List.create!(title: "Send thank you notes for birthday presents", difficulty: "2", energy: "4", due_date: "09/15/2016", reward: "Get the cards off the table!", user_id: 1, public: false)
task = Task.create!(list: list, title: "Gather the notecards and pick a pen", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Notecards are on the table", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Pens are in the desk drawer", position: 2)
task = Task.create!(list: list, title: "Get the guest list off Facebook", position: 2)
  Task.create!(parent_task_id: task.id, list: list, title: "The title of the event was 'Birthday Party!!!'", position: 1)
Task.create!(list: list, title: "Write addresses on envelopes", position: 3)
task = Task.create!(list: list, title: "Stick on return labels", position: 4)
  Task.create!(parent_task_id: task.id, list: list, title: "Use up the rest of the kitten return labels", position: 1)
Task.create!(list: list, title: "Stick on stamps", position: 5)
task = Task.create!(list: list, title: "Write a note for each present", position: 6)
  Task.create!(parent_task_id: task.id, list: list, title: "The list of who gave what is a comment on the Facebook event page", position: 1)
Task.create!(list: list, title: "Put each card in its corresponding envelope as soon as it's been written", position: 7)
Task.create!(list: list, title: "Seal the envelopes", position: 8)
Task.create!(list: list, title: "Drop the sealed envelopes in the mailbox", position: 9)


list = List.create!(title: "Get a haircut", difficulty: "1", energy: "2", due_date: "10/01/2016", reward: "Feelin' fly", user_id: 1, public: true)
task = Task.create!(list: list, title: "Research nearby barber shops", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Look on Yelp", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Post on Facebook for referrals", position: 2)
  Task.create!(parent_task_id: task.id, list: list, title: "Look up reviews on Google", position: 3)
task = Task.create!(list: list, title: "Book an appointment", description: "Have availability ready", position: 2)
  Task.create!(parent_task_id: task.id, list: list, title: "Look on calendar for days/times that work best", position: 1)
  Task.create!(parent_task_id: task.id, list: list, title: "Call barber shop", position: 2)
  Task.create!(parent_task_id: task.id, list: list, title: "Write down appointment", position: 3)
  Task.create!(parent_task_id: task.id, list: list, title: "Update due date for reminder", position: 4)
