class AdddefaultValueToStreakGithubGoals < ActiveRecord::Migration
  def change
    change_column :github_goals, :streak, :integer, :default => 0
  end
end
