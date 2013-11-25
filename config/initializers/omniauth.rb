Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_TOKEN'], ENV['GITHUB_SECRET']
end
