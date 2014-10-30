class AddUserIDtoGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :user_id, :integer
  end
end
