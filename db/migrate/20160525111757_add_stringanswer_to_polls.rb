class AddStringanswerToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :stringanswer, :string
  end
end
