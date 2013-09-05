class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, only: [:create, :upvote, :downvote]

  private

  def require_login
    return if current_user
    if request.xhr?
      render status: 302, :text => omniauth_path
    else
      redirect_to omniauth_path
    end
  end
end
