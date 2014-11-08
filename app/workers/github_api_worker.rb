class GithubApiWorker
  include Sidekiq::Worker

  def perform(user_id)
    GithubGoal.find_by(user_id: user_id).daily_commit_count
  end
end
