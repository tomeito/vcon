OmniAuth.config.full_host = 'https://virtual-con.toylabo.tech/'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET'], {:provider_ignores_state => true}
end