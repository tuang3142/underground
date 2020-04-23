class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  validates :password, length: { minimum: 6 }

  # before_save :downcase_email

  has_secure_password

  private

  # def downcase_email
  #   byebug
  #   self.email.downcase!
  # end
  # also need to validate password format
end
