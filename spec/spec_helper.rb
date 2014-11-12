require 'webmock/rspec'
require 'JSON'

WebMock.disable_net_connect!(allow_localhost: true)

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
    stub_request(:get, "https://api.github.com/users//events?client_id=16d9d7f931c5eb4f19c3&client_secret=f78406d4b6d5a4e3abf9921e0aad80a4faaf8d5d")
                                                              .with(:headers => {'Accept'=>'*/*',
                                                                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                                                                'User-Agent'=>'Faraday v0.9.0'})
                                                              .to_return(:status => 200, :body => body, :headers => {})
  end
end
