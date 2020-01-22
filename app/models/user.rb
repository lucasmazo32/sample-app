class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true
  has_secure_password
  SPACE = /\s/.freeze
  validates :password, length: { minimum: 6 }, format: { without: SPACE }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end