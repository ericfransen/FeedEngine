describe "Users API" do
  it 'sends a list of users' do
    FactoryGirl.create_list(:user, 10)

    get '/api/v1/users'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(10)
  end

  it 'sends a single user' do
    user = FactoryGirl.create(:user, name: 'Tan Doan')

    get "/api/v1/users/#{user.id}"

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['name']).to eq('Tan Doan')
  end
end
