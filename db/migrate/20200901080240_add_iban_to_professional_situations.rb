class AddIbanToProfessionalSituations < ActiveRecord::Migration[6.0]
  def change
    add_column :professional_situations, :iban, :string
  end
end
