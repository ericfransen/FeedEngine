class AddCommitGoalToGithubGoal < ActiveRecord::Migration
  def change
    add_column :github_goals, :commit_goal, :integer
  end
end
