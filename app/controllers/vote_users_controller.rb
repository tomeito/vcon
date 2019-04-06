class VoteUsersController < ApplicationController

  def update
    if authenticate
      @current_user = current_user
      @current_user.voted_at = Time.now
      @current_user.save
      @vote = Vote.new(vote_user_id: "#{@current_user.id}", entry_user_id: "#{params[:entry_user_id]}")
      @vote.save
    end
  end

end
