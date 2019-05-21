module VotesHelper
  def voted?(vote_user, is_mr)
    return true if Vote.where(created_at: Date.today.all_day).where(vote_user: vote_user).find_by(is_Mr: is_mr)
    false
  end

end
