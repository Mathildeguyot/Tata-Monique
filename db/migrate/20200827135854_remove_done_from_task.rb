class RemoveDoneFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :done, :boolean
  end
end
