class DeleteUsernameFromGithubGoals < ActiveRecord::Migration
  def change
    remove_column :github_goals, :username
  end
end
