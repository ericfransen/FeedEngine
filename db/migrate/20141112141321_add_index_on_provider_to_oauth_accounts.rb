class AddIndexOnProviderToOauthAccounts < ActiveRecord::Migration
  def change
    add_index :oauth_accounts, :provider
  end
end
