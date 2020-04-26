class MicropostsController < ApplicationController
  before_action :verify_user, only: %i[new create]

  def new
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = 'Link created'
      redirect_to root_path
    else
      flash[:danger] = @micropost.errors.full_messages.first if @micropost.errors.any?
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
