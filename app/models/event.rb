class Event < ApplicationRecord
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tickets
  has_many :users, through: :tickets
  has_many :comments

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


end
