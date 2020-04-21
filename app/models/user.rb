class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    byebug
    self.email.downcase!
  end
end
