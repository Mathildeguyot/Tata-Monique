class ProfessionalSituation < ApplicationRecord
  belongs_to :user
  validates :income, presence: true
  validates :fiscal_number, format: { with: /^[0-9]{13}$/ }
  validates :contract, inclusion: { in: %w[CDI CDD stage freelance intermittent autoentrepreneur] }
  validates :status, inclusion: { in: %w[étudiant "en avitivité" "sans activité professionnelle"] }
  validetes :user, presence: true
end
