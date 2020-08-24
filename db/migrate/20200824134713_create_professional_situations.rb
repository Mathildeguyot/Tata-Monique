class CreateProfessionalSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_situations do |t|
      t.integer :income
      t.string :occupation
      t.string :fiscal_number
      t.string :contract
      t.string :company_name
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
