class Post < ApplicationRecord
    has_many :likes
    has_many :joins
    belongs_to :user
end
