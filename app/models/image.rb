class Image < ApplicationRecord
  belongs_to :entry_user

  def top_image?
    is_top_image
  end
end
