class SessionsController < ApplicationController
  def create
    vote_user = VoteUser.find_or_create_from_twitter(request.env['omniauth.auth'])
    session[:user_id] = vote_user.uid
    flash[:notice] = 'ユーザ認証に成功しました。'
    redirect_back(fallback_location: '/')
  end

  def destroy
    reset_session
    flash[:notice] = 'ログアウトしました。'
    redirect_back(fallback_location: '/')
  end

  def failure
    redirect_to root_url, alert: "Authentication failed."
  end
end
