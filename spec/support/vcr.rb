require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = { :record => :new_episodes }
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true

  sparams = %w[
    YOUTUBE_API_KEY
    GOOGLE_CLIENT_ID
    GOOGLE_CLIENT_SECRET
  ]
  sparams.each do |env_name|
    config.filter_sensitive_data(env_name) do
      URI.encode_www_form_component ENV[env_name]
    end
  end
end
