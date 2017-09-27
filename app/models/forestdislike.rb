class Forestdislike < ActiveRecord::Base
    belongs_to :user
    belongs_to :forest
end
