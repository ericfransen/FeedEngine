require 'rails_helper'

describe 'github goals', :type => :feature do
  context 'registered user' do

    before(:each) do
      visit goals_path
    end

    it 'can start a github goal' do
      click_link_or_button "Github Integration"
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
      expect(current_path).to eq(edit_github_goal_path(goals.first))
      expect(goals.first.username).to eq('dglunz')
    end
  end
end
