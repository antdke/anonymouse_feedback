class FeedbacksController < ApplicationController
  def create
    fb_params = request.params[:feedback]
    Feedback.create(fb_params)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle)
  end
end
