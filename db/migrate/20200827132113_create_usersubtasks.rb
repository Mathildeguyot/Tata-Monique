class CreateUsersubtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :usersubtasks do |t|
      t.boolean :done
      t.references :user, null: false, foreign_key: true
      t.references :subtask, null: false, foreign_key: true

      t.timestamps
    end
  end
end
