class YoutubeApi
  BASE_URL = "https://www.googleapis.com/youtube/v3/videos?part=id%2C+snippet".freeze

  AUTH_KEY = ENV["YOUTUBE_API_KEY"]

  def self.get_video_data(video_id)
    options = { query: { id: video_id, key: AUTH_KEY } }
    response = HTTParty.get(BASE_URL, options)
    status = response.header.code
    return {} if !status.eql?("200") || response["items"].blank?

    {
      id: video_id,
      title: response["items"][0]["snippet"]["title"],
      description: response["items"][0]["snippet"]["description"]
    }
  end
end
