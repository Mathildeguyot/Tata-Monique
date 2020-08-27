class AddSubtaskTypeToSubtask < ActiveRecord::Migration[6.0]
  def change
    add_column :subtasks, :subtask_type, :string
  end
end
