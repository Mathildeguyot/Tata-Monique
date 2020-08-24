class ChangeDefaultValueForDoneforSubTask < ActiveRecord::Migration[6.0]
  def change
    change_column_default :subtasks, :done, false
  end
end
