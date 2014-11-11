require 'rails_helper'

describe FitbitGoal, :type => :model do
  it {should belong_to :user }
end
