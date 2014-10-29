class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :todays_commits
      
      t.timestamps
    end
  end
end
