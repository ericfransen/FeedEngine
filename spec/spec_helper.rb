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

body = [{"id"=>"1",
  "type"=>"PushEvent",
  "actor"=>
   {"id"=>7582765,
    "login"=>"121watts",
    "gravatar_id"=>"",
    "url"=>"https://api.github.com/users/121watts",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7582765?"},
  "repo"=>
   {"id"=>25877143, "name"=>"ericfransen/successive_life", "url"=>"https://api.github.com/repos/ericfransen/successive_life"},
  "payload"=>
   {"push_id"=>499137559,
    "size"=>1,
    "distinct_size"=>1,
    "ref"=>"refs/heads/master",
    "head"=>"55460598519b9ee7d04167249530208e3a67b6e3",
    "before"=>"61c4f473f7f40329f1bc0f261ee8d32fabaf3591",
    "commits"=>
     [{"sha"=>"55460598519b9ee7d04167249530208e3a67b6e3",
       "author"=>{"email"=>"andrew.watkinz@gmail.com", "name"=>"Danny Glunz"},
       "message"=>"adds production secrets for github",
       "distinct"=>true,
       "url"=>"https://api.github.com/repos/ericfransen/successive_life/commits/55460598519b9ee7d04167249530208e3a67b6e3"}]},
  "public"=>true,
  "created_at"=> Date.today },

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
           stub_request(:get, "https://api.github.com/users//events?client_id=3141e58259d7f0e89442&client_secret=215abd7d8c44e5055202b28215ea27f59be7206b").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
         to_return(:status => 200, :body => body, :headers => {})
  end
end
