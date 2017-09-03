class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes
  has_many :posts
  has_many :partyposts
  has_many :partylikes
  has_many :partyjoins
  has_many :pointlesses
end
