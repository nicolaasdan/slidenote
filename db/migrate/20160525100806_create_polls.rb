class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :answer
      t.text :feedback

      t.timestamps null: false
    end
  end
end
