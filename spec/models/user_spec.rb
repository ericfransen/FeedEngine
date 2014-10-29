require 'rails_helper'

describe User do

  it 'can see all of todays commits' do
    user = User.new(name: "121watts")
    expect(user.todays_shit).to eq 5
  end
end
