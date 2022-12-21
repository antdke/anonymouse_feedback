class FeedbacksController < ApplicationController
  def create
    feedback = Feedback.create(fb_params)
    session[:tweet_url] = feedback.tweet_url
    redirect_to root_path
  end

  private

  def fb_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
