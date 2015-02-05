class User < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :posts
  has_many :comments
end
