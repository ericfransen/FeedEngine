class FitbitController < ApplicationController
  def create
    current_user.add_oauth_account(request.env['omniauth.auth'])
    fitbit_goal = FitbitGoal.new(user_id: current_user.id)
    fitbit_goal.save
    redirect_to goals_path
  end
end
