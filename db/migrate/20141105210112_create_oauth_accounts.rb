class CreateOauthAccounts < ActiveRecord::Migration
  def change
    create_table :oauth_accounts do |t|
      t.string :oauth_accounts, :goodreads_token
      t.string :oauth_accounts, :goodreads_secret
      t.string :oauth_accounts, :github_token
      t.string :oauth_accounts, :github_secret
      t.string :oauth_accounts, :fitbit_token
      t.string :oauth_accounts, :fitbit_secret
      t.timestamps
    end
  end
end
