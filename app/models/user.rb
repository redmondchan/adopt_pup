class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :adoptions
  has_many :dogs, through: :adoptions
end
