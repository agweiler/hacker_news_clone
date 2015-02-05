class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_votes

  def tally
    tally = 0
    comment_votes.each do |vote|
      tally += vote.value
    end
    return tally
  end
end
