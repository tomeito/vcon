class CreateVoteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_users do |t|
      t.string :uid
      t.string :name
      t.string :image_url
      t.datetime :voted_at

      t.timestamps
    end
  end
end
