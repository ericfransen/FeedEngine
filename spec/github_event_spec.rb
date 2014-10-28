require 'rails_helper'

describe 'connecting to github api' do

  it 'gets all the events for a user' do
    response = Faraday.get 'http://api.github.com/121watts/events'
    binding.pry
  end

end
