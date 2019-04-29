class VoteUsersController < ApplicationController

  def update
    @current_user = VoteUser.find_by(id: params[:id])
    if authenticate
      @vote = Vote.new(vote_user_id: "#{@current_user.id}",
                       entry_user_id: "#{params[:entry_user_id]}")
      if already_vote_today? @current_user
        flash[:notice] = '本日はすでに投票済みです。明日も投票をよろしくお願いいたします！'
        redirect_back(fallback_location: root_path)
      end
      @vote.save
    else
      flash[:notice] = '投票するにはログインが必要です。'
      redirect_to root_path
    end
  end


end
