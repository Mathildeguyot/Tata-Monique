class AddDocumentTypeToSubtask < ActiveRecord::Migration[6.0]
  def change
    add_column :subtasks, :document_type, :string
  end
end
