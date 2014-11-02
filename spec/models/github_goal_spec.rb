require 'rails_helper'

describe GithubGoal, type: :model do
  it {should belong_to :user }



  let!(:github_goal) { GithubGoal.create(username: 'dglunz', commit_goal: 1, streak: 2)}

  it 'can retrieve push events' do
    push_events = github_goal.push_events
    push_events.each do |event|
      expect(event['type']).to eq('PushEvent')
    end
  end

  it 'can retrieve push events for today' do
    daily_events = github_goal.daily_events
    daily_events.each do |event|
      expect(event['id']).to eq('1')
      expect(event['id']).to_not eq('2')
    end
  end

  it 'can retrieve the daily commit count' do
    expect(github_goal.daily_commit_count).to eq(1)
  end

  it 'can check their daily commit goal' do
    github_goals = GithubGoal.check_daily_goal
    expect(github_goals.last.streak).to eq(3)
  end

  xit 'can caculate daily goal streak' do
    expect(github_goal.streak_count).to eq(3)
  end


end
