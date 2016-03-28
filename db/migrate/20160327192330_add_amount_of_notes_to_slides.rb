class AddAmountOfNotesToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :amount_of_notes, :integer
  end
end
