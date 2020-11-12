# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

descriptionArray = [
  "‘I know that,’ said Professor McGonagall irritably. ‘But thats no reason to lose our heads. People are being downright careless, out on the streets in broad daylight, not even dressed in Muggle clothes, swapping rumours.’",
  "Uncle Vernon stayed at home again. After burning all the letters, he got out a hammer and nails and boarded up the cracks around the front and back doors so no one could go out. He hummed ‘Tiptoe through the Tulips’ as he worked, and jumped at small noises.",
  "Then a sudden movement ahead of them made them almost drop the crate. Forgetting that they were already invisible, they shrank into the shadows, staring at the dark outlines of two people grappling with each other ten feet away. A lamp flared.",
  "‘Never,’ said Hagrid irritably, ‘try an get a straight answer out of a centaur. Ruddy star-gazers. Not interested in anythin closern the moon.’",
  "‘Wonder what it’s like to have a peaceful life,’ Ron sighed, as evening after evening they struggled through all the extra homework they were getting. Hermione had now started making revision timetables for Harry and Ron, too. It was driving them mad.",
  "‘Jus lookin’ he said, in a shifty voice that got their interest at once. ‘An whatre you lot up ter?’ He looked suddenly suspicious. ‘Yer not still lookin fer Nicolas Flamel, are yeh?’",
  "The rest of the team hung back to talk to each other as usual at the end of practice, but Harry headed straight back to the Gryffindor common room, where he found Ron and Hermione playing chess. Chess was the only thing Hermione ever lost at, something Harry and Ron thought was very good for her.",
  "‘The Mirror will be moved to a new home tomorrow, Harry, and I ask you not to go looking for it again. If you ever do run across it, you will now be prepared. It does not do to dwell on dreams and forget to live, remember that. Now, why don’t you put that admirable Cloak back on and get off to bed?’",
  "There he was, reflected in it, white and scared-looking, and there, reflected behind him, were at least ten others. Harry looked over his shoulder – but, still, no one was there. Or were they all invisible, too? Was he in fact in a room full of invisible people and this mirror’s trick was that it reflected them, invisible or not?",
  "When Harry finally left the table, he was laden down with a stack of things out of the crackers, including a pack of nonexplodable, luminous balloons, a grow-your-own-warts kit and his own new wizard chess set. The white mice had disappeared and Harry had a nasty feeling they were going to end up as Mrs Norris’ Christmas dinner."
]
20.times do |n|
  u = User.new
  streetArray = ["#{rand(100..300)} King St. W, Toronto", "#{rand(100..300)} Queen St. W, Toronto", "#{rand(100..300)} College St. W, Toronto", "#{rand(100..300)} Ossington St, Toronto", "#{rand(100..300)} St Clair Ave W, Toronto", "#{rand(100..300)} Bathurst St, Toronto"]
  u.email = FFaker::Internet.email
  u.password = "passpass"
  u.first_name = FFaker::Name.first_name
  u.last_name = FFaker::Name.first_name
  u.fitness_level = rand(1..3)
  u.location = streetArray.sample
  u.gender = ["Male", "Male", "Male", "Male", "Male", "Female", "Female", "Female", "Female", "Female", "Non-Binary"].sample
  u.description = descriptionArray.sample
  u.matching = true
  u.age = rand(100)
  u.activity_goal = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  u.availability = []
  options = ["mon_morn", "mon_aft", "mon_eve", "tues_morn", "tues_aft", "tues_eve", "wed_morn", "wed_aft", "wed_eve", "thurs_morn", "thurs_aft", "thurs_eve", "fri_morn", "fri_aft", "fri_eve", "sat_morn", "sat_aft", "sat_eve", "sun_morn", "sun_aft", "sun_eve"]
  15.times do
    day = options.sample
    u.availability << day unless u.availability.include?(day)
  end
  u.save
end

yogaActivityArray = ["Yoga in the park", "Pilates in the park", "Meditation class", "Acro yoga", "Strength yoga"]
resistenceActivityArray = ["Bootcamp park workout", "Kettlebell class", "Leg Day!", "Upper body circuit"]
cardioActivityArray = ["Jump rope", "Run in the park", "Run to the lake", "Team jog", "Quick 5k", "Sprints at the football field", "Hill running"]
recreationActivityArray = ["Slacklining", "Volleyball", "Parkour", "Taekwondo", "Mountain Bike", "Bike Ride", "Frisbee", "Tennis", "Ball Hockey", "Basketball"]

5.times do |n|
  e = Event.new
  streetArray = ["#{rand(100..300)} King St. W, Toronto", "#{rand(100..300)} Queen St. W, Toronto", "#{rand(100..300)} College St. W, Toronto", "#{rand(100..300)} Ossington St, Toronto", "#{rand(100..300)} St Clair Ave W, Toronto", "#{rand(100..300)} Bathurst St, Toronto"]
  e.address = streetArray.sample
  e.description = FFaker::CheesyLingo.paragraph
  e.capacity = rand(6..15)
  e.activity_type = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  e.title = yogaActivityArray.sample if e.activity_type == "Yoga/Pilates"
  e.title = resistenceActivityArray.sample if e.activity_type == "Resistence Training"
  e.title = cardioActivityArray.sample if e.activity_type == "Cardio"
  e.title = recreationActivityArray.sample if e.activity_type == "Recreation"
  e.user_id = (n+1)
  e.time = Time.now + 10000000
  e.persistence = false
  e.end_date = Time.now + 1000000000
  e.save!
end
5.times do |n|
  e = Event.new
  streetArray = ["#{rand(100..300)} King St. W, Toronto", "#{rand(100..300)} Queen St. W, Toronto", "#{rand(100..300)} College St. W, Toronto", "#{rand(100..300)} Ossington St, Toronto", "#{rand(100..300)} St Clair Ave W, Toronto", "#{rand(100..300)} Bathurst St, Toronto"]
  e.address = streetArray.sample
  e.description = FFaker::CheesyLingo.paragraph
  e.capacity = rand(6..15)
  e.activity_type = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  e.title = yogaActivityArray.sample if e.activity_type == "Yoga/Pilates"
  e.title = resistenceActivityArray.sample if e.activity_type == "Resistence Training"
  e.title = cardioActivityArray.sample if e.activity_type == "Cardio"
  e.title = recreationActivityArray.sample if e.activity_type == "Recreation"
  e.user_id = (n+1)
  e.time = Time.now + 10545000
  e.persistence = false
  e.end_date = Time.now + 105450000
  e.save!
end
5.times do |n|
  e = Event.new
  streetArray = ["#{rand(100..300)} King St. W, Toronto", "#{rand(100..300)} Queen St. W, Toronto", "#{rand(100..300)} College St. W, Toronto", "#{rand(100..300)} Ossington St, Toronto", "#{rand(100..300)} St Clair Ave W, Toronto", "#{rand(100..300)} Bathurst St, Toronto"]
  e.address = streetArray.sample
  e.description = FFaker::CheesyLingo.paragraph
  e.capacity = rand(6..15)
  e.activity_type = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  e.title = yogaActivityArray.sample if e.activity_type == "Yoga/Pilates"
  e.title = resistenceActivityArray.sample if e.activity_type == "Resistence Training"
  e.title = cardioActivityArray.sample if e.activity_type == "Cardio"
  e.title = recreationActivityArray.sample if e.activity_type == "Recreation"
  e.user_id = (n+1)
  e.time = Time.now + 11045000
  e.persistence = false
  e.end_date = Time.now + 110450000
  e.save!
end
5.times do |n|
  e = Event.new
  streetArray = ["#{rand(100..300)} King St. W, Toronto", "#{rand(100..300)} Queen St. W, Toronto", "#{rand(100..300)} College St. W, Toronto", "#{rand(100..300)} Ossington St, Toronto", "#{rand(100..300)} St Clair Ave W, Toronto", "#{rand(100..300)} Bathurst St, Toronto"]
  e.title = FFaker::Sport.name
  e.address = streetArray.sample
  e.description = FFaker::CheesyLingo.paragraph
  e.capacity = rand(6..15)
  e.activity_type = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  e.title = yogaActivityArray.sample if e.activity_type == "Yoga/Pilates"
  e.title = resistenceActivityArray.sample if e.activity_type == "Resistence Training"
  e.title = cardioActivityArray.sample if e.activity_type == "Cardio"
  e.title = recreationActivityArray.sample if e.activity_type == "Recreation"
  e.user_id = (n+1)
  e.time = Time.now + 15045000
  e.persistence = false
  e.end_date = Time.now + 150450000
  e.save!
end

ticketArray = []
20.times do |x|
    5.times do
      t = Ticket.new
      t.user_id = rand(1..20)
      t.event_id = (x+1)
      userEventPair = [t.user_id, t.event_id]
      t.save unless ticketArray.include?(userEventPair)
      ticketArray << userEventPair
      t.event.capacity -= 1
    end
end
