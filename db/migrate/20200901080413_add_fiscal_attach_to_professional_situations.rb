class AddFiscalAttachToProfessionalSituations < ActiveRecord::Migration[6.0]
  def change
    add_column :professional_situations, :fiscal_attach, :boolean
  end
end
