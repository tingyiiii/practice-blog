class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    if u = User.login(params[:user])
      session[User::SessionKey] = u.id
      redirect_to root_path, notice: "成功登入"
    else
      redirect_to new_sessions_path, notice: "帳密錯誤"
    end
  end

  def destroy
    session[User::SessionKey] = nil
    redirect_to root_path, notice: '已登出！'
  end
end