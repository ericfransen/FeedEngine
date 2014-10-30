class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_pic, :string
  end
end
