class GithubApiWorker
  include Sidekiq::Worker
  sidekiq_options retry: 2

  def perform(user_id)
    github_goal = GithubGoal.find_by(user_id: user_id)
    github_goal.daily_commits = github_goal.daily_commit_count
    github_goal.progress = github_goal.daily_progress
    github_goal.save
  end
end
