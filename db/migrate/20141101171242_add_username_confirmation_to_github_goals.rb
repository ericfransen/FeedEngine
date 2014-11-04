class AddUsernameConfirmationToGithubGoals < ActiveRecord::Migration
  def change
    add_column :github_goals, :username_confirmation, :string
  end
end
