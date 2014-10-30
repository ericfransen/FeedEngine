require "rails_helper"

RSpec.describe "Log in with Twitter", type: :feature do

  describe "user with valid information" do
    xit "is successful" do
      visit root_path
      expect(page).to have_content "Log In"
      mock_auth_hash
      click_link "Log In"
      expect(page).to have_content "You successfully logged in."
    end
  end

  describe "user with invalid information" do
    xit "has authentication errors" do
      auth_failure
      visit root_path
      click_link "Log In"
      expect(page).to have_content "Sorry, login failed!"
    end
  end
end
