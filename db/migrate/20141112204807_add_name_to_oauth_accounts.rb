class AddNameToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :name, :string
    remove_column :oauth_accounts, :email
  end
end
