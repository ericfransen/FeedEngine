require 'rails_helper'

describe GithubGoal, type: :model do
  it {should belong_to :user }

  

  let(:github_goal) { GithubGoal.create(username: 'dglunz')}

  it 'can retrieve push events' do
    push_events = github_goal.push_events
    push_events.each do |event|
      expect(event['type']).to eq('PushEvent')
    end
  end
end
