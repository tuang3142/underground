require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = { :record => :new_episodes }
  sparams = %w[
    youtube_api_key
    google_auth_api_key
  ]
  sparams.each do |env_name|
    config.filter_sensitive_data(env_name) do |interaction|
      URI.encode_www_form_component(ENV[env_name])
    end
  end
end
