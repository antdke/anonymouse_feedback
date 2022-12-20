class Feedback < ApplicationRecord
  after_create :send_tweet

  validates :recipient_handle, :text, presence: true
  validates :recipient_handle, length: {maximum: 15}
  validates :text, length: {maximum: 250}

  def send_tweet
    puts "Sending Tweet!"
    # TwitterService.tweet!(self)
    puts "FROM DB, WOULD TWEET: #{self.text}"
  end

end
