Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :twitter, 'e29FqsMgJxZiQMX2vy7VEvnza', 'Whd5Elhu9TLPjhFPKpkYEO9z1a4hghnj9wHWAcfQcjrxsqbnOp'
    provider :fitbit , '2023634a6aee48178e73fe7c6fcb56c0', '332af266f95641f1a7c4828b68865075'
  else
    provider :twitter, 'jpachkf9nkUmZJD93pzAWqIOn', '6ARBasFb020lxJGlDCijtoG1hw2XBHUBEgCsY8h2kJi65OXlqx'
    provider :fitbit , '2023634a6aee48178e73fe7c6fcb56c0', '332af266f95641f1a7c4828b68865075'
  end

  provider :goodreads, ENV['goodreads_key'], ENV['goodreads_secret']

end
