class GithubGoalsController < ApplicationController
  def new
    @github_goal = GithubGoal.new
  end

  def create
    @github_goal = GithubGoal.new(github_goal_params)
    if @github_goal.save
      redirect_to edit_github_goal_path(@github_goal)
    else
      render :new
    end
  end

  private

  def github_goal_params
    params.require(:github_goal).permit(:username)
  end
end
