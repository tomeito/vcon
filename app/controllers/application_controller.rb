class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate

  protected

  def current_user
    return unless session[:user_id]
    @current_user ||= VoteUser.find_by(uid: session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to '/', alert: '投票するにはログインが必要です。ログインしてください'
  end

  def already_vote_today?(vote_user, is_mr)
    return true
    # if Vote.where(vote_user_id: vote_user.id,
    #                             created_at: Date.today.all_day,
    #                             is_Mr: is_mr)

    false
  end

  private

  def logged_in?
    !!session[:user_id]
  end

end
