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

    end
  end
end
