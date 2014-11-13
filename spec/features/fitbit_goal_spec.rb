require 'rails_helper'

describe 'fitbit goals', :type => :feature do
  context 'authenticated user' do

    before(:each) do
      login
      visit goals_path
    end

    let!(:user) { User.find_by(email: 'bobgu@example.com') }
    let!(:oauth_account) { FactoryGirl.create(:oauth_account, user_id: user.id, provider: 'fitbit') }

    it 'is redirected to goals page' do
      click_link_or_button "FitBit Integration"
      expect(current_path).to eq auth_fitbit_callback_path
    end



  end
end
