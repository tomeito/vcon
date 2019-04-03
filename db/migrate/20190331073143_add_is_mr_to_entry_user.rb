class AddIsMrToEntryUser < ActiveRecord::Migration[5.1]
  def change
    add_column :entry_users, :is_Mr, :boolean, default: false, null: false
  end
end
