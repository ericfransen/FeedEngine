class AddGoodreadsUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :goodreads_uid, :string
  end
end
