class VotesController < ApplicationController

  def create
    @vote_user = VoteUser.find(params[:vote][:vote_user_id])
    @entry_user = EntryUser.find(params[:vote][:entry_user_id])

    if params[:back]
      if @entry_user.is_Mr
        redirect_to '/mr'
      else
        redirect_to '/ms'
      end
    else
      if verify_recaptcha(model: @vote)
        if already_vote_today?(@vote_user, @entry_user.is_Mr)
          flash[:notice] = '本日はすでに投票済みです。明日も投票をよろしくお願いいたします！'
          redirect_back(fallback_location: '/') and return
        end
        Vote.create(vote_params)
      else
        flash.now[:notice] = 'reCAPTCHAを行ってください。'
        render 'votes/confirm'
      end
    end
  end

  def confirm
    @vote_user = VoteUser.find(params[:vote][:vote_user_id])
    @entry_user = EntryUser.find(params[:vote][:entry_user_id])
    if logged_in?
      @vote = Vote.new(vote_params)
      redirect_back(fallback_location: "/") if @vote.invalid?
    else
      flash[:notice] = '投票するにはログインが必要です。'
      redirect_back(fallback_location: "/")
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:entry_user_id, :vote_user_id, :is_Mr)
  end

end
