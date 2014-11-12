require 'rails_helper'

describe 'github goals', :type => :feature do
  context 'registered user' do



    before(:each) do
      login
      visit goals_path
    end

    let!(:user) { User.find_by(email: 'bobgu@example.com') }
    let!(:oauth_account) { FactoryGirl.create(:oauth_account, user_id: user.id, provider: 'github')}

    it 'can start a github goal' do
      click_link_or_button "GitHub Integration"
      expect(current_path).to eq new_github_goal_path
      expect(page).to have_selector(:link_or_button, 'Create Goal')
    end


    it 'can define daily commits in github goal' do
      goals = GithubGoal.all
      expect(goals.count).to eq(0)
      visit new_github_goal_path
      find('#github_goal_commit_goal').find(:xpath, 'option[4]').select_option
      click_on('Create Goal')
      goal = GithubGoal.first
      expect(goal.commit_goal).to eq(4)
      expect(goals.count).to eq(1)
      expect(current_path).to eq goals_path
    end

    it 'can see # of github goals' do
      visit new_github_goal_path
      find('#github_goal_commit_goal').find(:xpath, 'option[8]').select_option
      click_on('Create Goal')

      expect(current_path).to eq goals_path
      expect(page).to have_content 8
    end

    it 'can edit goal' do
      VCR.use_cassette('github_commit_goal') do
        goals = GithubGoal.all
        expect(goals.count).to eq(0)
        visit new_github_goal_path
        find('#github_goal_commit_goal').find(:xpath, 'option[4]').select_option
        click_on('Create Goal')
        goal = GithubGoal.first
        expect(goal.commit_goal).to eq(4)
        expect(goals.count).to eq(1)
        expect(current_path).to eq goals_path

        expect(page).to_not have_content('GitHub Integration')
        page.find('#sidebar').click_on('GitHub Settings')
        expect(current_path).to eq edit_github_goal_path(goal)

        find('#github_goal_commit_goal').find(:xpath, 'option[2]').select_option
        click_on('Create Goal')
        expect(current_path).to eq goals_path
        expect(user.github_goals.last.commit_goal).to eq 2
      end
    end
  end
end
