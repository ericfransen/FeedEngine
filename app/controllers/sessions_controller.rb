class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to goals_path, notice: "You successfully logged in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Thanks for logging out!'
  end

  def failure
    redirect_to root_path, notice: 'Sorry, login failed!'
  end
end
