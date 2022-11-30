class Feedback < ApplicationRecord
  
  # logic
  # 1. user creates a feedback record
  # 2. tweet the "text" attribute of the feedback record, to the "recipient_handle" attribute

  
  before_create :fart 

  def fart
    puts "FARTING!!!!"
  end
  
  
  after_create :send_tweet

  def send_tweet
    puts "Sending Tweet!"
    #insert Twitter API logic here
  end

end
