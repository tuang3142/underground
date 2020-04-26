class MicropostsController < ApplicationController
  before_action :verify_user, only: %i[new create]

  before_action :verify_link, only: :create

  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = 'Link created'
      redirect_to root_path
    else
      msg = @micropost.errors.full_messages.first if @micropost.errors.any?
      flash[:danger] = msg
      render :new
    end
  end

  private

  def verify_user
    return unless current_user.nil?

    flash[:danger] = 'You must login to submit a link'
  end

  def verify_link
    @micropost = current_user.microposts.new
    link = micropost_params[:link]
    @data = YoutubeApi.get(link)
    return @data unless @data.blank?

    flash[:danger] = 'Video unavailable'
    render :new
  end

  def micropost_params
    params.require(:micropost).permit(micropost_attributes)
  end

  def micropost_attributes
    %i[link]
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
