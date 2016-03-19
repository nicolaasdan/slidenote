class Note < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :slide

  def score
  	self.get_upvotes - self.get_downvotes
  end

end
