class User < ApplicationRecord
  has_many :tickets
  has_many :events, through: :tickets
  has_many :owned_events, foreign_key: "user_id", class_name: "Event"
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
