class User < ActiveRecord::Base
  has_secure_password

  # Validations
  validates :username, presence: true, uniqueness: true
end
