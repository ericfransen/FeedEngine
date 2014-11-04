class GithubGoalsController < ApplicationController
  def new
    @github_goal = current_user.github_goals.new
  end

  def create
    @github_goal = current_user.github_goals.create(github_goal_params)
    if @github_goal.save
      # redirect_to edit_github_goal_path(@github_goal)
      redirect_to goals_path
    else
      render :new
    end
  end

  def edit
    @github_goals = current_user.github_goals.find(params[:id])
    @github_goals.update_attributes(github_goal_params)
    redirect_to goals_path
  end

  def update
    @github_goal = current_user.github_goals.find(params[:id])
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
