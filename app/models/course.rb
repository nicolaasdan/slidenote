class Course < ActiveRecord::Base
  has_many :slides, dependent: :destroy

end
