class User < ApplicationRecord
  has_secure_password

  enum role: ["user", "admin"]

  validates_uniqueness_of :username
  has_many :ideas
end
