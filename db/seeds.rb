# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

37.times do |num|
  user = User.create(
    :username => Faker::Creature::Cat.name + num.to_s, 
    :name => Faker::Name.name,
    :location => Faker::Nation.capital_city,
    :bio => Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    :email => Faker::Internet.unique.email, 
    :password => "asdfASDF1")
  10.times do
    message = "##{Faker::Creature::Cat.name} #{Faker::TvShows::DrWho.quote}"
    tweet = Tweet.create(:message => message[0..279], :user_id => user.id)
    tweet.add_tags
  end
end
#