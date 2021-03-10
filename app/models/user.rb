require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true 
  validates :email, uniqueness: true, presence: true
  validates :api_key, uniqueness: true, presence: true

  def generate_key
    self.api_key = SecureRandom.hex(12)
  end
end


