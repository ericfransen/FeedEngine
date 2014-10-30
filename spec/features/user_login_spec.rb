require 'rails_helper'

describe 'user' do
  it 'can login with the correct credentials' do
    login
    expect(page).to have_content('Goals Github Integration')  
  end
end
