class VoteUsersController < ApplicationController

  def update
    if authenticate
      @current_user = current_user
      update_vote_date @current_user
      @vote = Vote.new(vote_user_id: "#{@current_user.id}", entry_user_id: "#{params[:entry_user_id]}")
      @vote.save
    else
      redirect_to root_path
    end
  end


end
