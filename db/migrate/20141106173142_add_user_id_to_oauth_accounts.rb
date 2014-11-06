class AddUserIdToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :user_id, :integer
  end
end
