require 'rails_helper'

RSpec.describe GoalsController, :type => :controller do

  it 'can get all the github goals' do
    5.times { GithubGoal.create }
    expect(GithubGoal.all.count).to eq 5
  end

end
