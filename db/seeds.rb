# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  u = User.new
  u.email = "test#{n+1}@gmail.com"
  u.password = "passpass"
  u.save
end

5.times do |n|
  e = Event.new
  e.title = "Event #{n+1}"
  e.address = "100 King St. W"
  e.description = "This is event #{n+1}"
  e.capacity = 2
  e.user_id = (n+1)
  e.time = Time.now + 1000000
  e.save
end

e = Event.new
e.title = "Old Event"
e.address = "100 King St. W"
e.description = "This is an old event"
e.capacity = 2
e.user_id = 1
e.time = Time.now - 1000000
e.save


5.times do |n|
  t = Ticket.new
  t.user_id = (5-n)
  t.event_id = (n+1)
  t.save
  t.event.capacity -= 1
end
