require 'rails_helper'

describe 'github goals', :type => :feature do
  context 'registered user' do
    it 'can start a github goal' do
      user = User.create(name: "Tan")
      visit goals_path
      click_on "Github Integration"
      expect(current_path).to eq new_github_goal_path
      expect(page).to have_content "Enter GitHub Username"
    end
  end
end
