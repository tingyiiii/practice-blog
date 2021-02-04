module SessionsHelper
  def current_user
    @user9487 ||= User.find_by(id: session[User::SessionKey])
  end

  def user_signed_in?
    current_user
  end
end