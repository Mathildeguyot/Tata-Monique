class AddUserRefToUsertasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :usertasks, :user, null: false, foreign_key: true
  end
end
