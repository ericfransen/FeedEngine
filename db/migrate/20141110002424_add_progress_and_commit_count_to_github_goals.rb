class AddProgressAndCommitCountToGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :commit_count, :integer
    add_column :github_goals, :progress, :float
  end
end
