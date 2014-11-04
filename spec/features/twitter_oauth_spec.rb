require "rails_helper"

RSpec.describe "Log in with Twitter", type: :feature do

  describe "user with valid information" do
    it "is successful" do
      visit root_path
      expect(page).to have_content "Log In"
      login
      expect(page).to have_content "You successfully logged in."
    end
  end

  describe "user with invalid information" do
    it "has authentication errors" do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      visit root_path
      click_link "Log In"
      expect(page).to have_content "Sorry, login failed!"
    end
  end
end
