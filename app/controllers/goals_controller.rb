class GoalsController < ApplicationController

  def index
    @github_goals = GithubGoal.all
  end

end
