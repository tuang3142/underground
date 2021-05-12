class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  # before_save :downcase_email

  # has_secure_password

  # def remember
  #   token = new_token
  #   update_attribute(:remember_digest, digest(token))
  # end

  # def forget
  #   update_attribute(:remember_digest, nil)
  # end

  # def authenticated?(remember_token)
  #   return false if remeber_token.nil?

  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end

  # private

  # def digest(string)
  #   cost = if ActiveModel::SecurePassword.min_cost
  #     BCrypt::Engine::MIN_COST
  #   else
  #     BCrypt::Engine.cost
  #   end
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # def new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def downcase_email
  #   email&.downcase!
  # end
end
