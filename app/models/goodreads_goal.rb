class GoodreadsGoal < ActiveRecord::Base
  belongs_to :user

  #get the user id from goodreads for the user, then use that user id to locate
  #the all the other info unique to that user

  def get_user_id
    response = Faraday.get("https://www.goodreads.com/api/auth_user")
  end

end
