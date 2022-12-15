class PagesController < ApplicationController
  def home
  end

  def search
    #binding.break
    #TwitterService.tweet!("hey @#{params[:recipient_handle]}, here's some anon feedback for you >> \"#{params[:text]}\"")
    puts "WOULD SEND TWEET #{params[:text]}"
  end
end
