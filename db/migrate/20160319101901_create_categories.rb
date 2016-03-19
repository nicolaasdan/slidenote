class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :chapter

      t.timestamps null: false
    end
  end
end
