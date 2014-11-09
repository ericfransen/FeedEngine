class GithubsController < ApplicationController
  def create
    current_user.add_oauth_account(request.env['omniauth.auth'])

    redirect_to new_github_goal_path, notice: 'Integration successful'
  end
end
