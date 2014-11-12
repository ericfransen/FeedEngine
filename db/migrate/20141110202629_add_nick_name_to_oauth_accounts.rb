class AddNickNameToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :nickname, :string
  end
end
