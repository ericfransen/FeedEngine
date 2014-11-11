class ChangeOauthAccountsUidToStrings < ActiveRecord::Migration
  def change
    change_column :oauth_accounts, :uid, :string
  end
end
