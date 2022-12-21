class PagesController < ApplicationController
  def home
    @feedbacks = Feedback.all
  end
end
