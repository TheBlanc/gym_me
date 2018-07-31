class PersonalMessage < ApplicationRecord
  # has_many relation, specifying the default sorting rule for personal_messages (the oldest one comes first)

  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true
end
