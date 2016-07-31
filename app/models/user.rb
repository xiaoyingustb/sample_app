class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 50},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}, presence: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost:cost)
  end
end
