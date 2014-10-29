class GitHubGoal < ActiveRecord::Base
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
    Date.today # this only gets called when user starts goal
  end

  def streak_count

  end
end
