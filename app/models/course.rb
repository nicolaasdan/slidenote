class Course < ActiveRecord::Base
  has_many :slides, dependent: :destroy
  has_many :user_courses
  has_many :users, through: :user_courses

  cattr_accessor :current_user

  def available_categories
  	category_array = []
  	self.slides.each do |slide|
  	  unless slide.category.in?(category_array)
  	    category_array.push(slide.category)
  	  end
  	end
    return category_array
  end


end
