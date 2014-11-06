class GoodreadsController < ApplicationController
  # def new
  #   # oauth_data = GoodreadsApi.new.request_url
  #   # current_user.add_goodreads(oauth_data)
  #
  #   redirect_to GoodreadsApi.new.request_url
  # end

  def create
    current_user.add_oauth_account(request.env['omniauth.auth'])

    redirect_to goals_path
  end
end
