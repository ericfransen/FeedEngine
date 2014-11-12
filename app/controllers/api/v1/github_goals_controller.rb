class Api::V1::GithubGoalsController < ApplicationController
  def index
    @github_goals = GithubGoal.all
    render json: @github_goals
  end

  def show
    @github_goal = GithubGoal.find(params[:id])
    render json: @github_goal
  end
end
