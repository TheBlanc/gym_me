class User < ApplicationRecord
  has_secure_password

  validates :email, :password, presence: true
  validates :password, :password_confirmation, length: { in: 8..20 }

end
