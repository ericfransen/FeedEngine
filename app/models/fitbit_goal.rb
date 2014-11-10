class FitbitGoal < ActiveRecord::Base

  def fitbit_data
    config = { consumer_key: '2023634a6aee48178e73fe7c6fcb56c0',
               consumer_secret: '332af266f95641f1a7c4828b68865075',
               token: "24faf7389d088b724fe1e171e7e2f705",
               secret: "4df41ea864f1ed150c3c8c8b3757d4c4"
             }.to_json

    client = Fitgem::Client.new(config)
  end

end
