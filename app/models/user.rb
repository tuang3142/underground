class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
