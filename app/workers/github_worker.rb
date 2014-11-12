class GithubWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id)
    github_goal = GithubGoal.find_by(user_id: user_id)
    github_goal.progress = github_goal.daily_progress
    github_goal.commit_count = github_goal.daily_commit_count
    github_goal.save
  end
end
