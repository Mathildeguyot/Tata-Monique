class AddZipCodeLocationtoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :zip_code_location, :string
  end
end
