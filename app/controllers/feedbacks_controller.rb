class FeedbacksController < ApplicationController
  def create
    #binding.break
    # TwitterService.tweet!("hey #{request.params[:recipient_handle]}, here's some anon feedback for you >> \"#{request.params[:text]}\"")
    puts "WOULD TWEET THIS #{params[:text]}"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
