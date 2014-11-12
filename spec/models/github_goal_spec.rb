require 'rails_helper'
require 'github_api_helper'

describe GithubGoal, type: :model do
  it {should belong_to :user }


  let!(:user) { FactoryGirl.create(:user) }
  let!(:github_goal) { GithubGoal.create(username: 'dglunz', commit_goal: 1, streak: 2, longest_streak: 2, user_id: user.id)}
  let!(:oauth_account) { FactoryGirl.create(:oauth_account, user_id: user.id, provider: 'github')}

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
    expect(github_goals.last.longest_streak).to eq(3)
  end

  it "current streak is set to  0 when they don't reach their daily commit goal" do
    github_goal.commit_goal = 100
    github_goal.save
    github_goals = GithubGoal.check_daily_goal
    expect(github_goals.last.streak).to eq(0)


  end

  it 'can caculate the longest streak based on current streak' do
    github_goal.streak = 3
    github_goal.longest_streak = 5
    github_goal.save
    expect(github_goal.longest_streak).to eq(5)
    github_goals = GithubGoal.check_daily_goal
    github_goals = GithubGoal.check_daily_goal
    github_goals = GithubGoal.check_daily_goal
    expect(github_goals.last.longest_streak).to eq(6)
  end

end
