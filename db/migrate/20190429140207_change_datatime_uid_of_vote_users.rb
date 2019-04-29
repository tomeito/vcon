class ChangeDatatimeUidOfVoteUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :vote_users, :uid, :string
  end
end
