class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone_number, :string
    add_column :users, :ID_number, :string
    add_column :users, :nationality, :string
    add_column :users, :birth_location, :string
    add_column :users, :username, :string
  end
end
