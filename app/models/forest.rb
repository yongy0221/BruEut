class Forest < ActiveRecord::Base
  has_many :fcomments, :dependent => :destroy
<<<<<<< HEAD
  has_many :forestlikes
  has_many :forestdislikes

=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
end
