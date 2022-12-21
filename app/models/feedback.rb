class Feedback < ApplicationRecord
  tweet_id = ""
  
  before_create :sanitize
  after_create :send_tweet

  validates :recipient_handle, :text, presence: true
  validates :recipient_handle, length: {in: 1..15}
  validates :text, length: {in: 1..250}

  def sanitize
    self.recipient_handle = self.recipient_handle.gsub("@", "")
  end
  
  
  def send_tweet
    puts "Sending Tweet!"
    tweet_id = TwitterService.tweet!(self)
    Feedback.find_by(text: self.text).update(tweet_id: tweet_id)
    #puts "FROM DB, WOULD TWEET: #{self.text}"
  end
  

end
