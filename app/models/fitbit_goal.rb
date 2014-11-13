class FitbitGoal < ActiveRecord::Base

  belongs_to :user
  def fitbit_data
    config = { consumer_key: '2023634a6aee48178e73fe7c6fcb56c0',
               consumer_secret: '332af266f95641f1a7c4828b68865075',
               token: "24faf7389d088b724fe1e171e7e2f705",
               secret: "4df41ea864f1ed150c3c8c8b3757d4c4",
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
