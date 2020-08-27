class RemoveDoneFromSubtask < ActiveRecord::Migration[6.0]
  def change
    remove_column :subtasks, :done, :boolean
  end
end
