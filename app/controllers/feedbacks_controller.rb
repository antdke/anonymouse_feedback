class FeedbacksController < ApplicationController
  def create
    TwitterService.tweet!("hey #{params[:feedback][:recipient_handle]}, here's some anon feedback for you >> \"#{params[:feedback][:text]}\"")
    # puts "WOULD TWEET THIS #{params[:feedback][:text]}"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
