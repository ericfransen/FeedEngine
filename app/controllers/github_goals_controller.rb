class GithubGoalsController < ApplicationController
  def new
    @github_goal = GithubGoal.new
  end

  def edit
    @github_goal = GithubGoal.find(params[:id])
  end

  def create
    @github_goal = GithubGoal.new(github_goal_params)
    if @github_goal.save
      redirect_to edit_github_goal_path(@github_goal)
    else
      render :new
    end
  end

  def update
    @github_goal = GithubGoal.find(params[:id])
    if @github_goal.update(github_goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  private

  def github_goal_params
    params.require(:github_goal).permit(:username, :commit_goal)
  end
end
