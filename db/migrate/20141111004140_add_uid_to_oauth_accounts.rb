class AddUidToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :uid, :integer
  end
end
