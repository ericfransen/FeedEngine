require 'rails_helper'

describe 'github goals', :type => :feature do
  context 'registered user' do

    let!(:user) { User.where(email: 'bobgu@example.com').first_or_create }

    before(:each) do
      login
      visit goals_path
    end

    it 'can start a github goal' do
      click_link_or_button "GitHub Integration"
      expect(current_path).to eq new_github_goal_path
      expect(page).to have_selector(:link_or_button, 'Submit Username')
    end

    it 'can enter a username' do
      visit new_github_goal_path
      goals = GithubGoal.all
      expect(goals.count).to eq(0)
      fill_in('Username', with: 'dglunz')
      click_on('Submit Username')
      expect(goals.count).to eq(1)
      expect(goals.first.username).to eq('dglunz')
      expect(current_path).to eq(edit_github_goal_path(goals.first))
    end

    it 'can define daily commits in github goal' do
      visit new_github_goal_path
      fill_in('Username', with: 'dglunz')
      click_on('Submit Username')
      find('#github_goal_commit_goal').find(:xpath, 'option[4]').select_option
      click_on('Create Goal')
      goal = GithubGoal.first
      expect(goal.commit_goal).to eq(4)
      expect(current_path).to eq goals_path
    end

    it 'can see # of github goals' do
      visit new_github_goal_path
      fill_in('Username', with: 'dglunz')
      click_on('Submit Username')
      find('#github_goal_commit_goal').find(:xpath, 'option[8]').select_option
      click_on('Create Goal')
      expect(current_path).to eq goals_path
      expect(page).to have_content 8
    end
  end
end
