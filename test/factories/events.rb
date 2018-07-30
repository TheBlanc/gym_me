FactoryBot.define do
  factory :event do
    title            'Test Event'
    activity_type    'Cardio'
    address          '100 King st. W'
    need_approval    false
    capacity         3
    time             Time.now + 100000000
    description      "Lets write some tests!"
  end
end
