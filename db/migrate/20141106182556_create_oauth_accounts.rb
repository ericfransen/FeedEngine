class CreateOauthAccounts < ActiveRecord::Migration
  def change
    create_table :oauth_accounts do |t|
      t.string :token
      t.string :secret
      t.string :provider
      t.integer :user_id

      t.timestamp
    end
  end
end
