class Partypost < ApplicationRecord
    has_many :partylikes
    has_many :partyjoins
<<<<<<< HEAD
    has_many :partycomments
=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
    belongs_to :user
end
