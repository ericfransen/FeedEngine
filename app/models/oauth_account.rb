class OauthAccount < ActiveRecord::Base
  belongs_to :user

  def self.goodreads_key
      
  end
end
