FactoryBot.define do
  factory :comment do
    user
    event
    body    "This is a comment."
  end
end
