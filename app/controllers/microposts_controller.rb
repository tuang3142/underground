class MicropostsController < ApplicationController
  before_action :verify_user, only: %i[new create]

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

  def micropost_params
    params.require(:micropost).permit(micropost_attributes)
  end

  def micropost_attributes
    %i[link]
  end
end
