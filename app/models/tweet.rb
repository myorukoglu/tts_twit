class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_tags
  has_many :tags, through: :tweet_tags

  validates :message, presence: true
  validates :message, length: {maximum: 280, too_long: "A tweet is only 140 max. Everybody knows that!"}


  def add_tags
    message_arr = Array.new  #holds each word of our tweet

    #fill the array with words from the tweet
    message_arr = message.split(" ")

    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        tag = Tag.find_by(:phrase => word)
        #if you can't find the tag
        if tag == nil
          tag = Tag.create(phrase: word)
        end
        TweetTag.create(tweet_id: id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end  
    end
    update(message: message_arr.join(" "))
  end
end
