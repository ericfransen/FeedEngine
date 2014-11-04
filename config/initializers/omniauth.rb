Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :twitter, 'e29FqsMgJxZiQMX2vy7VEvnza', 'Whd5Elhu9TLPjhFPKpkYEO9z1a4hghnj9wHWAcfQcjrxsqbnOp'
  else
    provider :twitter, 'jpachkf9nkUmZJD93pzAWqIOn', '6ARBasFb020lxJGlDCijtoG1hw2XBHUBEgCsY8h2kJi65OXlqx'
  end
end
