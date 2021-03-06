class SessionsController < ApplicationController

  def create_from_github
    omniauth = request.env["omniauth.auth"]
    @user = User.find_by_uid(omniauth["uid"]) || User.create_from_omniauth(omniauth)
    session[:user_id] = @user.id

    redirect_to root_path, :notice => "Welcome, #{@user.username}"  
  end

  def failure_from_github
    flash[:error] = "Error logging in with GitHub. #{params[:message]}"
    redirect_to root_path
  end


  def destroy
    session.clear
    redirect_to root_url, :notice => "Signed Out!"
  end

  def new
    redirect_to omniauth_path
  end

end
  
