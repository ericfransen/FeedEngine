class AddLongestStreaktoGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :longest_streak, :integer, :default => 0
  end
end
