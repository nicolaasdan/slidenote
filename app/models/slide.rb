class Slide < ActiveRecord::Base
  belongs_to :course
  has_many :notes
  mount_uploader :image, ImageUploader
end
