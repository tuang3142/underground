class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Account created. Welcome!'
      redirect_to root_path
    else
      flash[:danger] = @user&.errors.full_messages.first
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(user_attributes)
  end

  def user_attributes
    %i[email password]
  end
end
