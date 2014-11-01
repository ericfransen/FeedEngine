class RemoveUsernameConfirmationfromGithubGoals < ActiveRecord::Migration
  def change
    remove_column :github_goals, :username_confirmation
  end
end
