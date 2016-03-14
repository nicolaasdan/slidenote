class AddCourseIdToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :course_id, :integer
  end
end
