class Feedback < ApplicationRecord
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
    # TwitterService.tweet!(self)
    puts "FROM DB, WOULD TWEET: #{self.text}"
  end

end
