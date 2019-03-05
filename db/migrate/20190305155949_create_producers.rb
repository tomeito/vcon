class CreateProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :url
      t.string :twitter_id
      t.text :comments

      t.timestamps
    end
  end
end
