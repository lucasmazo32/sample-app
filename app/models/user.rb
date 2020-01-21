class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true
  has_secure_password
  SPACE = /\s/.freeze
  validates :password, length: { minimum: 6 }, format: { without: SPACE }
end