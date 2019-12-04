# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create(:username => Faker::Creature::Cat.unique.name, :email => Faker::Internet.email, :password => "asdfASDF1")
  2.times do
    tweet = Tweet.create(:message =>  "#{Faker::TvShows::DrWho.quote} ##{Faker::Creature::Cat.name}", :user_id => user.id)
    tweet.add_tags
  end
end