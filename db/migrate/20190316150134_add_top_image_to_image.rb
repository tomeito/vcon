class AddTopImageToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :is_top_image, :boolean
  end
end
