class RenamePathToUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :path, :url
  end
end
