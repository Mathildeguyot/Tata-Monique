class CreateHabitations < ActiveRecord::Migration[6.0]
  def change
    create_table :habitations do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :category
      t.float :rent
      t.integer :size
      t.date :lease_start_date
      t.boolean :furnished
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
