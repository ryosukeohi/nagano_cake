class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    user = Admin.find_by(email: session_params[:email])#まず、送られてきたメースアドレスでユーザーを検索する

      if admin&.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:admin_id] = admin.id#認証に成功した場合に、セッションにuser_idを格納しています。

      redirect_to admin_sign_path, notice: 'ログインしました'

      else
      render :new
      end
  end

  def destroy
    reset_session
    redirect_to admin_sign_in_path, notice: 'ログアウトしました。'
  end

  protected
  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    admin_sign_in_path
  end
end
