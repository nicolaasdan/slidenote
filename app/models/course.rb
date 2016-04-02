class Course < ActiveRecord::Base
  has_many :slides, dependent: :destroy
  has_many :user_courses
  has_many :users, through: :user_courses

  cattr_accessor :current_user


end
