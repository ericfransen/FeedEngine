class GoalsController < ApplicationController

  def index
    if !current_user.github_goals.empty?
      @current_github_goal = current_user.github_goals.last.commit_goal
    end
    @first_name = current_user.first_name
    @twitter_pic = current_user.high_res_profile
  end



end
