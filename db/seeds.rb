# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.populate(1000) do |user|
  user.name = 'Tan the maaaan'
  user.email = 'tan@example.com'
  user.phone_number = '8675309'
  user.provider = 'twitter'
  GithubGoal.populate(1) do |github_goal|
    github_goal.streak = 8
    github_goal.longest_streak = 14
    github_goal.user_id = user.id
  end
  FitbitGoal.populate(1) do |fitbit_goal|
    fitbit_goal.user_id = user.id
  end
  OauthAccount.populate(1) do |oauth_account|
    oauth_account.user_id = user.id
    oauth_account.token = '98234jkjafa9u8'
    oauth_account.provider = 'github'
    oauth_account.nickname = 'bobgu'
    oauth_account.uid = '1234'
  end
  OauthAccount.populate(1) do |oauth_account|
    oauth_account.user_id = user.id
  end
  puts "#{user.id}, #{user.name}"
end
