class Micropost < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  has_many :likes, dependent: :destroy

  belongs_to :user

  validates :link, presence: true

  validate :link_must_be_available

  def title
    data[:title]
  end

  def description
    trim data[:description], 200
  end

  def video_id
    return if link.nil?

    get_id(link)
  end

  private

  def link_must_be_available
    return true unless data.blank?

    errors.add(:link, "unavailable")
    false
  end

  def data
    @data ||= YoutubeApi.get_video_data(get_id_from_link(link))
  end

  def trim(text, lim)
    return text unless text.length > lim

    text.slice(0, lim - 3) + "..."
  end

  def get_id_from_link(link)
    return if link.nil?

    id = link.gsub(/(>|<)/i, "").split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    return id if id[2].nil?

    id[2].split(/[^0-9a-z_\-]/i)[0]
  end
end
