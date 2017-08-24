class Pointless < ActiveRecord::Base
  has_many :pcomments, :dependent => :destroy
  has_many :pluids, :dependent => :destroy
  has_many :pdluids, :dependent => :destroy
end
