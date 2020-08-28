class RemoveFieldRefFromTableDocument < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :ref, :string
  end
end
