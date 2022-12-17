class FeedbacksController < ApplicationController
  def create
    Feedback.create(fb_params)
  end

  private

  def fb_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
