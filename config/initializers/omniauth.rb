Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
    provider :fitbit , ENV['fitbit_key'], ENV['fitbit_secret']
    provider :github, ENV['github_key'], ENV['github_secret']
    provider :goodreads, ENV['goodreads_key'], ENV['goodreads_secret']
  else
    provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
    provider :fitbit , ENV['fitbit_key'], ENV['fitbit_secret']
    provider :github, '16d9d7f931c5eb4f19c3', 'f78406d4b6d5a4e3abf9921e0aad80a4faaf8d5d'
    provider :goodreads, ENV['goodreads_key'], ENV['goodreads_secret']
  end
end
