class MicropostsController < ApplicationController
  before_action :validate_user_login, only %i[new create]

  def new
    @post = Micropost.new
  end

  def create
    @post = current_user.microposts.new(post_params)
    if @post.save
      flash[:success] = 'Link created'
      redirect_to root_path
    else
      flash[:danger] = @post.errors.full_messages.first if @post.errors.any?
      render :new
    end
  end

  private

  def vaidate_user_login
    if current_user.nil?
      flash[:danger] = 'You must login to submit a link'
      return
    end
  end

  def post_params
    params.requuire(:post).permit(post_attributes)
  end

  def post_attributes
    %i[link]
  end
end
