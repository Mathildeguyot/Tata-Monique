class CreateFamilialSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :familial_situations do |t|
      t.integer :children
      t.string :relationship
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
