class SessionsController < ApplicationController
  def new; end

  def create
    if user = authenticate_with_google
      log_in(user)
      redirect_to root_url
    else
      redirect_to login_url, alert: "Authentication failed"
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end

  private

  def authenticate_with_google
    if google_sign_in_id_token
      google_user = GoogleSignIn::Identity.new(google_sign_in_id_token)
      User.find_or_create_by(google_id: google_user.user_id, email: google_user.email_address)
    elsif google_sign_in_error
      logger.error "Google authentication error: #{google_sign_in_error}"
      nil
    end
  end

  def google_sign_in_id_token
    flash[:google_sign_in][:id_token] || flash[:google_sign_in]["id_token"]
  end

  def google_sign_in_error
    flash[:google_sign_in][:error] || flash[:google_sign_in]["error"]
  end
end
