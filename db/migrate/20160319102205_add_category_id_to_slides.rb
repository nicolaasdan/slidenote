class AddCategoryIdToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :category_id, :integer
  end
end
