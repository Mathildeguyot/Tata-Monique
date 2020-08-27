class AddDoneToUsertask < ActiveRecord::Migration[6.0]
  def change
    add_column :usertasks, :done, :boolean
  end
end
