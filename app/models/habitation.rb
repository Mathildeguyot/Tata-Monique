class Habitation < ApplicationRecord
  belongs_to :user

  validates :number, numericality: { only_integer: true }
  validates :street, presence: true
  validates :city, presence: true
  validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5]))[0-9]{3}\z/, message: "format invalide" }
  validates :category, inclusion: { in: ["Propriétaire", "Locataire", "Colocataire", "Sous-locataire", "En cité universitaire, résidence pour étudiant, foyer..."] }
  validates :rent, numericality: true
  validates :size, numericality: { only_integer: true }
  validates :furnished, presence: true
end
