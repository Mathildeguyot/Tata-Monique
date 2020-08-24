class ChangeDefaultValueForDone < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :done, false
  end
end
