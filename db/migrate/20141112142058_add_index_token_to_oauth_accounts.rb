class AddIndexTokenToOauthAccounts < ActiveRecord::Migration
  def change
    add_index :oauth_accounts, :token
  end
end
