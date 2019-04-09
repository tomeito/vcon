class EntryUser < ApplicationRecord
  has_many :vote_users, through: :votes
  has_many :votes
  has_many :images

  def top_image
    Image.where(entry_user_id: self.id).find_by(is_top_image: true)
  end

  def other_images
    Image.where(entry_user_id: self.id).where(is_top_image: false)
  end
end