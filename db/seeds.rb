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
  u.first_name = "Testy"
  u.last_name = "#{n+1}erson"
  u.fitness_level = 2
  u.location = "10#{n+1} King St. W"
  u.gender = "Female"
  u.matching = true
  u.save

end

5.times do |n|
  e = Event.new
  e.title = "Event #{n+1}"
  e.address = "100 King St. W"
  e.description = "This is event #{n+1}"
  e.capacity = 2
  e.activity_type = "Cardio"
  e.user_id = (n+1)
  e.time = Time.now + 1000000
  e.persistence = false
  e.end_date = Time.now + 100000000000
  e.activity_type = ["Cardio", "Weight Lifting", "Boxing", "Yoga", "Cross Fit", "Swimming"].sample
  e.save!
end


5.times do |n|
  t = Ticket.new
  t.user_id = (5-n)
  t.event_id = (n+1)
  t.save!
  t.event.capacity -= 1
end
