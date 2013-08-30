module LoginHelper
  def login(user)
    request.env["rack.session"][:user_id] = user.id
  end
end
