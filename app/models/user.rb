class User < ActiveRecord::Base
  validates :name, :twitter_pic, presence: true
  has_many :github_goals
  has_many :oauth_accounts

  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_initialize_by(provider: auth_data["provider"], uid: auth_data['uid'])
    unless user.persisted? && user.name == auth_data['info']['name']
      user.name        = auth_data['info']['name']
      user.email       = auth_data['info']['email']
      user.twitter_pic = auth_data['info']['image']
      user.save!
    end
    user
  end

  def high_res_profile
    twitter_pic.sub "_normal", ""
  end

  def first_name
    name.split(' ')[0]
  end

  def add_goodreads(data)
    oauth_account = OauthAccount.find_or_initialize_by(provider: data["provider"])
    unless oauth_account.persisted? && oauth_account.provider == data['provider']
      oauth_account.user_id = self.id
      oauth_account.token   = data['credentials']['token']
      oauth_account.secret  = data['credentials']['secret']
      oauth_account.save
    end
  end
end
