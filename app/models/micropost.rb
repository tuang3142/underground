class Micropost < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates :link, presence: true

  validate :link_must_be_available

  def title
    data[:title]
  end

  def description
    trim data[:description]
  end

  private

  def link_must_be_available
    return true unless data.blank?

    errors.add(:link, 'unavailable')
    false
  end

  def data
    @data ||= YoutubeApi.get get_id(link)
  end

  def trim(text)
    return text unless text.length > 700

    text.slice(0, 697) + '...'
  end

  def get_id(link)
    id = link.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    return id if id[2].nil?

    id[2].split(/[^0-9a-z_\-]/i)[0]
  end
end

class YoutubeApi
  BASE_URL = 'https://www.googleapis.com/youtube/v3/videos?part=id%2C+snippet'.freeze

  AUTH_KEY = Figaro.env.youtube_api_key

  def self.get(video_id)
    options = { query: { id: video_id, key: AUTH_KEY } }
    response = HTTParty.get(BASE_URL, options)
    status = response.header.code
    return {} if !status.eql?('200') || response['items'].blank?

    {
      title: response['items'][0]['snippet']['title'],
      description: response['items'][0]['snippet']['description']
    }
  end
end
