require 'webmock/rspec'
require 'JSON'
require 'vcr'

# WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

WebMock.allow_net_connect!

body = [{
  id: '1',
  type: 'PushEvent',
  payload: {
    commits: ['poopin']
  },
  created_at: Date.today
},

{
  id: '2',
  type: 'PushEvent',
  payload: {
    commits: ['poopin']
  },
  created_at: Date.today - 1
},

{ id: '3',
  type: 'PullRequestEvent',
  payload: {
    commits: ['poopin']
  },
  created_at: Date.today
}].to_json

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://api.github.com/users/dglunz/events").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
    to_return(:status => 200, :body => body, :headers => {})
  end
end
