class EntryUser < ApplicationRecord
  has_many :vote_users, through: :votes
  has_many :votes
  has_many :images

  def images
    images = []
    (0..3).each do |i|
      images.push image_path(i)
    end
    images
  end

  def top_image
    images[0]
  end

  def other_images
    images[1..-1]
  end

  private
  def image_path(num)
    name + "/" + (num + 1).to_s + ".jpg"
  end
end
