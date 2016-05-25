class Poll < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :stringanswer
  validates :feedback, length: { maximum: 10000 }
end
