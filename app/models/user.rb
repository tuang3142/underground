class User < ApplicationRecord
  attr_accessor :remember_token

  validates :password, presence: true, length: { minimum: 6 }

  validates :email, presence: true, uniqueness: true

  before_save :downcase_email

  has_secure_password

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    token = self.new_token
    update_attribute(:remember_digest, self.digest(token))
  end

  private

  def downcase_email
    email&.downcase!
  end
end
