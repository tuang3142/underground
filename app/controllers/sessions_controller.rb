class SessionsController < ApplicationController
  def new; end

  def create
    email, password = login_params
    user = User.find_by(email: email)
    if user&.authenticate(password)
      flash[:success] = 'Login successfully. Welcome back!'
      redirect_to root
    else
      render :new
    end
  end

  def destroy; end

  private

  def login_params
    p = params.require(:session).permit(:email, :password)

    [p[:email], p[:password]]
  end
end
