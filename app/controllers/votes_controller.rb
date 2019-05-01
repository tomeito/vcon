class VotesController < ApplicationController

  def create
    redirect_to '/' and return if request.get?

    @vote_user ||= VoteUser.find(params[:vote][:vote_user_id])
    @entry_user ||= EntryUser.find(params[:vote][:entry_user_id])

    if params[:back]
      redirect_entry_user_index
    else
      vote = Vote.new(vote_params)
      if authenticate && verify_recaptcha(model: vote)
        if already_vote_today?(@vote_user, @entry_user.is_Mr)
          flash[:notice] = '本日はすでに投票済みです。明日も投票をよろしくお願いいたします！'
          redirect_entry_user_index and return
        end
        @vote = vote if vote.save
        render 'votes/posted'
      else
        flash.now[:notice] = 'reCAPTCHAを行ってください。'
        @vote = vote
        render 'votes/confirm'
      end
    end
  end

  def confirm
    redirect_back(fallback_location: '/') and return if request.get?
    @vote_user ||= VoteUser.find(params[:vote][:vote_user_id])
    @entry_user ||= EntryUser.find(params[:vote][:entry_user_id])
    if logged_in?
      @vote = Vote.new(vote_params)
      redirect_back(fallback_location: '/') if @vote.invalid?
    else
      flash[:notice] = '投票するにはログインが必要です。'
      redirect_back(fallback_location: '/')
    end
  end

  def posted
    redirect_to '/' and return if request.get?
    if @vote
      @vote_user = @vote.vote_user
      @entry_user = @vote.entry_user
    else
      flash[:notice] = "不正な操作が行われました"
      redirect_to "/"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:entry_user_id, :vote_user_id, :is_Mr)
  end

  def redirect_entry_user_index
    if @entry_user.is_Mr
      redirect_to '/mr'
    else
      redirect_to '/ms'
    end
  end
end
