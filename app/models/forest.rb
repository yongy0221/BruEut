class Forest < ActiveRecord::Base
  has_many :fcomments, :dependent => :destroy
end
