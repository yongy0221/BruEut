class Partypost < ApplicationRecord
    has_many :partylikes
    has_many :partyjoins
    belongs_to :user
end
