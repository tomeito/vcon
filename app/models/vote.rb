class Vote < ApplicationRecord
  belongs_to :vote_user
  belongs_to :entry_user

end
