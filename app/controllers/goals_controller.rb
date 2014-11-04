class GoalsController < ApplicationController
  def index
    if !current_user.github_goals.empty?
      @current_github_goal = current_user.github_goals.last.commit_goal
      @todays_commits = current_user.github_goals.last.daily_commit_count
      @current_streak = current_user.github_goals.last.streak
      @longest_streak = current_user.github_goals.last.longest_streak
      @daily_progress = current_user.github_goals.last.daily_progress
    end
      @github_goal = GithubGoal.find_by(user_id: current_user.id)

      @first_name = current_user.first_name
      @twitter_pic = current_user.high_res_profile
  end
end
