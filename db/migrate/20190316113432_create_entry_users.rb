class CreateEntryUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :entry_users do |t|
      t.string :name
      t.string :description
      t.text :comments
      t.string :twitter_url
      t.string :youtube_channel
      t.string :other_url

      t.timestamps
    end
  end
end
