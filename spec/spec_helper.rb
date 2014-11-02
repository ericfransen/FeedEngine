require 'webmock/rspec'
require 'JSON'

WebMock.disable_net_connect!(allow_localhost: true)

body = [{
  id: '1',
  type: 'PushEvent',
  created_at: Date.today
},

{
  id: '2',
  type: 'PushEvent',
  created_at: Date.today - 1
},

{ id: '3',
  type: 'PullRequestEvent',
  created_at: Date.today
}].to_json

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://api.github.com/users/dglunz/events").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
    to_return(:status => 200, :body => body, :headers => {})
  end
end
