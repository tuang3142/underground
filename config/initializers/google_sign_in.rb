# config/initializers/google_sign_in.rb
Rails.application.configure do
  config.google_sign_in.client_id     = Figaro.env.google_sign_in["client_id"]
  config.google_sign_in.client_secret = Figaro.env.google_sign_in["client_secret"]
end
