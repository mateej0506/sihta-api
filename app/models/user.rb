class User < ApplicationRecord
end

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :ime, presence: true
  validates :uloga, inclusion: { in: %w[sef konobar] }
end