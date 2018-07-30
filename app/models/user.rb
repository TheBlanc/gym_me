class User < ApplicationRecord
  has_many :tickets
  has_many :events, through: :tickets
  has_many :owned_events, foreign_key: "user_id", class_name: "Event"

  has_many :comment

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# dependent destory allows you to call User.destroy and delete all chat rooms own by user
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
# active_storage module for giving users avatar photos
  has_one_attached :avatar

  def name
    email.split('@')[0]
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    end
  end
end
