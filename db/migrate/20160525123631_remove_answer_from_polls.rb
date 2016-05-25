class RemoveAnswerFromPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :answer, :integer
  end
end
