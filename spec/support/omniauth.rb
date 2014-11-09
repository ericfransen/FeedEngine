def twitter_mock_auth
  OmniAuth.config.mock_auth[:twitter] =  OmniAuth::AuthHash.new({
        provider: 'twitter',
        uid: '123',
        info: {
          name: 'bob gu',
          email: 'bobgu@example.com',
          image: 'robert.png'
        },
        credentials: {
          token: 'mock_token',
          secret: 'mock_secret'
        }
      })
  OmniAuth.config.mock_auth[:github] =  OmniAuth::AuthHash.new({
        provider: 'github',
        uid: '123',
        info: {
          name: 'bob gu',
          email: 'bobgu@example.com',
          image: 'robert.png'
        },
        credentials: {
          token: 'mock_token'
        }
      })
end

def login
  visit root_path
  expect(page).to have_content("Log In")
  twitter_mock_auth
  click_link "Log In"
end
