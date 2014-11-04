class User < ActiveRecord::Base
  validates :name, :twitter_pic, presence: true
  has_many :github_goals

  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_initialize_by(provider: auth_data["provider"], uid: auth_data['uid'])
    unless user.persisted? && user.name == auth_data['info']['uid']
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


end
