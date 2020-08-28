class AddRefToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :ref, :string
  end
end
