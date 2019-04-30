class VoteUser < ApplicationRecord
  has_many :entry_users, through: :votes
  has_many :votes
  def self.find_or_create_from_twitter(auth)
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    find_or_create_by(uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end

  def update_vote_date(user)
    user.voted_at = Time.now
    user.save
  end


end
