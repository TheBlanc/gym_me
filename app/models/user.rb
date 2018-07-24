class User < ApplicationRecord
<<<<<<< HEAD
  has_many :tickets
  has_many :events, through: :tickets
  has_many :owned_events, class_name: "Event", foreign_key: "creator"

  has_secure_password

  validates :email, :password, presence: true
  validates :password, :password_confirmation, length: { in: 8..20 }
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> 84a12332fde34048009673ddaf41d88a7de942f4

end
