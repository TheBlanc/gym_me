class Event < ApplicationRecord
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tickets
  has_many :users, through: :tickets
  has_many :comments
  validate :date_not_in_past


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, :address, :time, :description, :activity_type, presence: true



  def date_not_in_past
    if self.time && self.time < DateTime.current
      errors.add(:time, "Date can't be in the past")
    end
  end

end
