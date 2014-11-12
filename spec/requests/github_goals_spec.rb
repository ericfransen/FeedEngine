
describe "Github Goals API" do
  it 'sends a list of github goals' do
    FactoryGirl.create_list(:github_goal, 10)

    get '/api/v1/github_goals'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(10)
  end

  it 'sends a list of github goals' do
    github_goal = FactoryGirl.create(:github_goal, username: 'tan')

    get "/api/v1/github_goals/#{github_goal.id}"

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['username']).to eq('tan')
  end
end
