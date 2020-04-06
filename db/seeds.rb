# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

streetArray = ["#{rand(100..300)} King St. W", "#{rand(100..300)} Queen St. W", "#{rand(100..300)} College St. W", "#{rand(100..300)} Ossington St.", "#{rand(100..300)} St Clair Ave W", "#{rand(100..300)} Bathurst St."]
descriptionArray = [
  "‘I know that,’ said Professor McGonagall irritably. ‘But that’s no reason to lose our heads. People are being downright careless, out on the streets in broad daylight, not even dressed in Muggle clothes, swapping rumours.’",
  "Uncle Vernon stayed at home again. After burning all the letters, he got out a hammer and nails and boarded up the cracks around the front and back doors so no one could go out. He hummed ‘Tiptoe through the Tulips’ as he worked, and jumped at small noises.",
  "Then a sudden movement ahead of them made them almost drop the crate. Forgetting that they were already invisible, they shrank into the shadows, staring at the dark outlines of two people grappling with each other ten feet away. A lamp flared.",
  "‘Never,’ said Hagrid irritably, ‘try an’ get a straight answer out of a centaur. Ruddy star-gazers. Not interested in anythin’ closer’n the moon.’",
  "‘Wonder what it’s like to have a peaceful life,’ Ron sighed, as evening after evening they struggled through all the extra homework they were getting. Hermione had now started making revision timetables for Harry and Ron, too. It was driving them mad.",
  "‘Jus’ lookin’,’ he said, in a shifty voice that got their interest at once. ‘An’ what’re you lot up ter?’ He looked suddenly suspicious. ‘Yer not still lookin’ fer Nicolas Flamel, are yeh?’",
  "The rest of the team hung back to talk to each other as usual at the end of practice, but Harry headed straight back to the Gryffindor common room, where he found Ron and Hermione playing chess. Chess was the only thing Hermione ever lost at, something Harry and Ron thought was very good for her."
  "‘The Mirror will be moved to a new home tomorrow, Harry, and I ask you not to go looking for it again. If you ever do run across it, you will now be prepared. It does not do to dwell on dreams and forget to live, remember that. Now, why don’t you put that admirable Cloak back on and get off to bed?’",
  "There he was, reflected in it, white and scared-looking, and there, reflected behind him, were at least ten others. Harry looked over his shoulder – but, still, no one was there. Or were they all invisible, too? Was he in fact in a room full of invisible people and this mirror’s trick was that it reflected them, invisible or not?",
  "When Harry finally left the table, he was laden down with a stack of things out of the crackers, including a pack of nonexplodable, luminous balloons, a grow-your-own-warts kit and his own new wizard chess set. The white mice had disappeared and Harry had a nasty feeling they were going to end up as Mrs Norris’ Christmas dinner."
]
10.times do |n|
  u = User.new
  u.email = FFaker::Internet.email
  u.password = "passpass"
  u.first_name = FFaker::Name.first_name
  u.last_name = FFaker::Name.first_name
  u.fitness_level = rand(1..3)
  u.location = streetArray.sample
  u.gender = ["Male", "Female"].sample
  u.description = descriptionArray.sample
  u.matching = true
  u.time_of_day = ['Morning', 'Afternoon', 'Evening', 'Twilight'].sample
  u.day = Date::DAYNAMES.sample
  u.age = rand(100)
  u.activity_goal = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample
  u.availability = []
  options = ["mon_morn", "mon_aft", "mon_eve", "tues_morn", "tues_aft", "tues_eve", "wed_morn", "wed_aft", "wed_eve", "thurs_morn", "thurs_aft", "thurs_eve", "fri_morn", "fri_aft", "fri_eve", "sat_morn", "sat_aft", "sat_eve", "sun_morn", "sun_aft", "sun_eve"]
  13.times do
    day = options.sample
    u.availability << day unless u.availability.include?(day)
  end
  u.save
end

5.times do |n|
  e = Event.new

  e.title = FFaker::Sport.name
  e.address = ["#{rand(500)} King St. W", "#{rand(500)} Yonge St.", "#{rand(400)} Queen St. E, Toronto, ON, Canada"].sample
  e.description = FFaker::CheesyLingo.sentence
  e.capacity = rand(10)
  e.activity_type = ["Yoga/Pilates", "Resistence Training", "Cardio", "Recreation"].sample

  e.user_id = (n+1)
  e.time = Time.now + 1000000
  e.persistence = false
  e.end_date = Time.now + 100000000000

  if e.activity_type == "Yoga/Pilates"
    e.activity_icon = "lotus-position.svg"
  elsif e.activity_type == "Resistence Training"
    e.activity_icon = "dumbbell.svg"
  elsif e.activity_type == "Cardio"
    e.activity_icon = "athletics.svg"
  else e.activity_type == "Recreation"
    e.activity_icon = "american-football.svg"
  end

  e.save!
end


5.times do |n|
  t = Ticket.new
  t.user_id = (5-n)
  t.event_id = (n+1)
  t.save!
  t.event.capacity -= 1
end
