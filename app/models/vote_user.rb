class VoteUser < ApplicationRecord
  def find_or_create_from_twitter(auth)
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end
end
