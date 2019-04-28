class Vote < ApplicationRecord
  belongs_to :vote_user
  belongs_to :entry_user

  def already_vote_today?(vote_user)
    return true if Vote.where(vote_user_id: vote_user.id,
                              created_at: Time.now.midnight..
                                         (Time.now.midnight + 1.day))

    false
  end
end
