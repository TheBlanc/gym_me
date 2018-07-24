class Event < ApplicationRecord
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tickets 
  has_many :users, through: :tickets
end
