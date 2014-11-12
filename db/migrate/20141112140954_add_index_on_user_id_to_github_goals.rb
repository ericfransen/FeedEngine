class AddIndexOnUserIdToGithubGoals < ActiveRecord::Migration
  def change
    add_index :github_goals, :user_id
  end
end
