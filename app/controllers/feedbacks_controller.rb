class FeedbacksController < ApplicationController
  def create
    fb_params = request.params[:feedback]
    TwitterService.tweet!("hey #{fb_params[:recipient_handle]}, here's some anon feedback for you >> \"#{fb_params[:text]}\"")
    # puts "WOULD TWEET THIS #{params[:feedback][:text]}"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
