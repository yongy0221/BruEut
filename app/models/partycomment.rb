class Partycomment < ApplicationRecord
    belongs_to :partypost
    belongs_to :user
  end
