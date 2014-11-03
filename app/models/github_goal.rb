class GithubGoal < ActiveRecord::Base
  belongs_to :user

  def get_the_json
    response =  Faraday.get("https://api.github.com/users/dglunz/events")
    JSON.parse(response.body)
  end

  def push_events
    get_the_json.select { |event| event["type"] == "PushEvent" }
  end

  def daily_events
    push_events.select { |event| Date.parse(event["created_at"]) == Date.today }
  end

  def daily_commit_count
    daily_events.inject(0) { |sum, event| sum + event["payload"]["commits"].count }
  end

  def start_date
    Date.today # this gets called the day they sign up
  end

  def self.check_daily_goal
    self.all.each do |github_goal|
      if github_goal.daily_commit_count >= github_goal.commit_goal
        github_goal.streak += 1
      else
        github_goal.streak = 0
      end
      # we may need to call github_goal.save here....not sure
    end
  end
end
