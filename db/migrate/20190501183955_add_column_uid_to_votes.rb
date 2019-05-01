class AddColumnUidToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :vote_user_uid, :string
  end
end
