class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  has_secure_password
end
