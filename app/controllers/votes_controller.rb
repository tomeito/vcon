class VotesController < ApplicationController

  def create
    @vote_user = VoteUser.find_by(id: params[:vote][:vote_user_id])
    @entry_user = EntryUser.find_by(id: params[:vote][:entry_user_id])
    if authenticate
      if already_vote_today?(@vote_user, @entry_user.is_Mr)
        flash[:notice] = '本日はすでに投票済みです。明日も投票をよろしくお願いいたします！'
        redirect_back(fallback_location: root_path)
      end
      Vote.create(vote_user_id: @vote_user.id,
                  entry_user_id: @entry_user.id)
    end
  end

end
