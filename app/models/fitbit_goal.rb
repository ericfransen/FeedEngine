class FitbitGoal < ActiveRecord::Base

  belongs_to :user
  def fitbit_data
    config = { consumer_key: ENV['fitbit_key'],
               consumer_secret: ENV['fitbit_secret'],
               token: "#{self.user.oauth_accounts.find_by(provider: 'fitbit').token}",
               secret: "#{self.user.oauth_accounts.find_by(provider: 'fitbit').secret}",
               user_id: "#{self.user.oauth_accounts.find_by(provider: "fitbit").uid}"
             }
    response = Fitgem::Client.new(config)
  end

  def todays_activities
    fitbit_data.activities_on_date("today")
  end

  def daily_steps_goal
    todays_activities["goals"]["steps"]
  end

  def todays_steps
    todays_activities['summary']['steps']
  end

  def todays_distance
    todays_activities['summary']['distances'][0]['distance']
  end

  def progress
    if todays_steps > daily_steps_goal
      100
    else
      (todays_steps.to_f/daily_steps_goal.to_f) * 100
    end
  end

end
