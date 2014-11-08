class AddDailyCommitstoGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :daily_commits, :integer
    add_column :github_goals, :progress, :integer 
  end
end
