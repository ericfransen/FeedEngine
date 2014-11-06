class FitbitController < ApplicationController
  def save
    current_user.add_oauth_account(request.env['omniauth.auth'])
    redirect_to goals_path
  end
end
