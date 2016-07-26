class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 50},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}, presence: true
end
