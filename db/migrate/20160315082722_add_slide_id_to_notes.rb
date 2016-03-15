class AddSlideIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :slide_id, :integer
  end
end
