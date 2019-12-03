module TweetsHelper
  def get_tagged(tweet)
    message_arr = Array.new  #holds each word of our tweet

    message_arr = tweet.message.split(" ")

    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        tag = Tag.find_by(:phrase => word)
        #if you can't find the tag
        if tag == nil
          tag = Tag.create(phrase: word)
        end
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end  
    end
    tweet.update(message: message_arr.join(" "))
    return tweet
  end
end