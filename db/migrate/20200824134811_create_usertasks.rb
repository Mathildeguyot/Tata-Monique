class CreateUsertasks < ActiveRecord::Migration[6.0]
  def change
    create_table :usertasks do |t|
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
