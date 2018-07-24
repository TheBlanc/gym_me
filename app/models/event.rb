class Event < ApplicationRecord
  belongs_to :creating_user, foreign_key: 'creator', class_name: 'User'
  has_many :users, through: :tickets
end
