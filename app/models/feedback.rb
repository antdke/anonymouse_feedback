class Feedback < ApplicationRecord
  
  # logic
  # 1. user creates a feedback record
  # 2. tweet the "text" attribute of the feedback record, to the "recipient_handle" attribute

  
  # before_create :fart 

  # def fart
  #   puts "FARTING!!!!"
  # end
  
  
  after_create :send_tweet

  def send_tweet
    puts "Sending Tweet!"
    #insert Twitter API logic here
    TwitterService.tweet!("hey #{recipient_handle}, here's some anon feedback for you >> \"#{text}\"")
    # puts "HELLO FROM THE DB. HERE'S YOUR TEXT: #{self.text}"
  end

end
