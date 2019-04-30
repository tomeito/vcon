class AddColumnVotes < ActiveRecord::Migration[5.1]
  def up
    add_column :votes, :is_Mr, :boolean
  end
end
