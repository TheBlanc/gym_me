class User < ApplicationRecord
  has_many :tickets
  has_many :events, through: :tickets
  has_many :owned_events, class_name: "Event", foreign_key: "creator"

  has_secure_password

  validates :email, :password, presence: true
  validates :password, :password_confirmation, length: { in: 8..20 }

end
