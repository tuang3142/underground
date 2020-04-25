class User < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 }

  validates :email, presence: true, uniqueness: true

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
