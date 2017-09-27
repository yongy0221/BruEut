class Market < ActiveRecord::Base
  has_many :mcomments, :dependent => :destroy
  has_many :mluids, :dependent => :destroy
  has_many :mdluids, :dependent => :destroy
  belongs_to :user
end
