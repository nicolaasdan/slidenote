class Slide < ActiveRecord::Base
  belongs_to :course
  mount_uploader :image, ImageUploader
end
