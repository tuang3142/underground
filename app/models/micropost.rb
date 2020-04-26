class Micropost < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates :link, presence: true
end
