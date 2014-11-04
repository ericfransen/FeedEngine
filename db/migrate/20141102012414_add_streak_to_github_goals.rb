class AddStreakToGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :streak, :integer
  end
end
