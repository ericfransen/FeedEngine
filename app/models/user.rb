class User < ActiveRecord::Base
  has_many :github_goals
end
