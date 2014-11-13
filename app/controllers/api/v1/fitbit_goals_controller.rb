class Api::V1::FitbitGoalsController < ApplicationController
  def index
    @fitbit_goals = FitbitGoal.all
    render json: @fitbit_goals
  end

  def show
    @fitbit_goal = FitbitGoal.find(params[:id])
    render json: @fitbit_goal
  end
end
