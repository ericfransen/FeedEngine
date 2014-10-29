class GithubGoalsController < ApplicationController
  def new
    @github_goal = GithubGoal.new
  end
end
