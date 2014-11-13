class AddEmailToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :email, :string
  end
end
