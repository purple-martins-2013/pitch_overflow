Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :github, ENV['github_id'], ENV['github_secret']
  provider :github, '70a5ef133d8a8bc04375', '17c2065e516bc48cea8d42a1f9b5bf50f80858c3'
end
