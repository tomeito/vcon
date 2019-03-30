class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :path
      t.references :entry_user, foreign_key: true

      t.timestamps
    end
  end
end
