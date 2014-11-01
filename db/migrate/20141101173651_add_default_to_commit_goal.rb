class AddDefaultToCommitGoal < ActiveRecord::Migration
  def change
    change_column :github_goals, :commit_goal, :integer, default: 1
  end
end
