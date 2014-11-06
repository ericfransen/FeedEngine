class AddTokenSecretProviderToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :token, :string
    add_column :oauth_accounts, :secret, :string
    add_column :oauth_accounts, :provider, :string
    add_column :oauth_accounts, :user_id, :integer
  end
end
