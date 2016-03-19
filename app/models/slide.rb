class Slide < ActiveRecord::Base
  belongs_to :course
  belongs_to :category
  has_many :notes
  mount_uploader :image, ImageUploader

end
