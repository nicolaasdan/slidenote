class Note < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :slide

  validates :comment, presence: true, length: { minimum: 1, maximum: 140 }

  def score
  	self.get_upvotes - self.get_downvotes
  end

end
