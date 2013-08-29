module SessionsHelper
    def sign_in?
      session[:user_id]
    end
end
