class Micropost < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates :link, presence: true

  validate :video_must_be_available

  def title
    data[:title]
  end

  def description
    data[:description]
  end

  private

  def video_must_be_available
    return true unless data.blank?

    errors.add(:link, 'unavailable')
    false
  end

  def data
    @data ||= YoutubeApi.get(link)
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
