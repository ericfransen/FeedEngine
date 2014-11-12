describe 'GithubGoals Api' do
  FactoryGirl.create_list(:github_goal, 5)

  it 'sends a list of goals' do
    get '/api/v1/index'

    expect(response).to be_success
    json = JSON.parse(response.body)

    expect(json['github_goal'].length).to eq 5
  end
end
