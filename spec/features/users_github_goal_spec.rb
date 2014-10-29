describe 'github goals' do
  context 'registered user' do
    it 'can make a github goal' do
      user = User.create(name: "Tan")
      visit user_dashboard
      fill_in "GitHub Username", with: "121watts"
      click_on "Submit"
    end
  end
end
