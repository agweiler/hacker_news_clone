class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  def tally
    tally = 0
    post_votes.each do |vote|
      tally += vote.value
    end
    return tally
  end
end
