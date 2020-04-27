class LikesController < ApplicationController
  before_action :micropost, only: :create

  before_action :like, only: :destroy

  def create
    if already_liked?
      flash[:notice] = 'Already liked'
    else
      @micropost.likes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Already unlike'
    else
      like.destroy
    end
    redirect_to root_path
  end

  private

  def micropost
    @micropost ||= Micropost.find(params[:micropost_id])
  end

  def like
    @like = micropost.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, micropost_id: micropost.id).exists?
  end
end
