class PagesController < ApplicationController
  def home
    #@feedbacks = Feedback.where(request.params[:feedback])
    @feedback = Feedback.last
  end
end
