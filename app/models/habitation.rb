class Habitation < ApplicationRecord
  belongs_to :user

  validates :number, numericality: { only_integer: true }
  validates :street, presence: true
  validates :city, presence: true
  validates :zip_code, format: { with: /\A[a-zA-Z]+\z/, message: "format invalide" }
  validates :category, inclusion: { in: ["Propriétaire", "Locataire", "Sous-locataire", "En cité universitaire, résidence pour étudiant, foyer..."] }
  validates :rent, numericality: true
  validates :size, numericality: { only_integer: true }
  validates :furnished, presence: true
end
