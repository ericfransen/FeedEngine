class AddIndexOnUserIdToOauthAccounts < ActiveRecord::Migration
  def change
    add_index :oauth_accounts, :user_id
  end
end
