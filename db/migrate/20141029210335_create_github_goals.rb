class CreateGithubGoals < ActiveRecord::Migration
  def change
    create_table :github_goals do |t|
      t.string :username
      t.timestamps
    end
  end
end
