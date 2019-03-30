class EntryUser < ApplicationRecord
  has_many :vote_users, through: :votes
  has_many :votes
end
