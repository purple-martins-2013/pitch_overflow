class SessionsController < ApplicationController  
  def create_from_github
    puts "Hi"
   # Rails.logger.debug request.env["omniauth.auth"]
  end

  def failure_from_github
    flash[:error] = "Error logging in with GitHub. #{params[:message]}"
    redirect_to root_path
  end
end
