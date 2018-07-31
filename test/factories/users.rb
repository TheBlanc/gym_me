FactoryBot.define do
  factory :user do
    first_name            'James'
    last_name             'Fitness'
    sequence(:email)      {|num| "user#{num}@example.com"}
    password              'passpass'
    password_confirmation 'passpass'
  end
end
