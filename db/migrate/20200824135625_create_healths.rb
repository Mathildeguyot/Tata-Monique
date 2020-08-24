class CreateHealths < ActiveRecord::Migration[6.0]
  def change
    create_table :healths do |t|
      t.string :ssn
      t.string :social_security
      t.string :health_insurance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
