module LoginHelper
  # For more info on testing omniauth without faking: https://github.com/intridea/omniauth/wiki/Integration-Testing
  def login(user)
    if page && page.respond_to(:set_rack_session)
      page.set_rack_session(user_id: user.id)
    else
      request.env["rack.session"][:user_id] = user.id
    end
  end
end
