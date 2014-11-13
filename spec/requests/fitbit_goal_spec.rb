describe 'FitbitGoals Api' do
  it 'sends a list of goals' do
    FactoryGirl.create_list(:fitbit_goal, 1)

    get '/api/v1/fitbit_goals'

    expect(response).to be_success
    # json = JSON.parse(response.body)
    # expect(json.length).to eq(1)
  end
end
