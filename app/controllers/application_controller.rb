class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_user!
    redirect_to new_sessions_path, notice: "請先登入會員！" unless user_signed_in?
  end
end
