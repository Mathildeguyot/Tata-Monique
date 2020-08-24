class FamilialSituation < ApplicationRecord
  belongs_to :user
  validates :children, presence: true
  validates :relationship, inclusion: { in: %w[célibataire marié pacsé "en concubinage"] }
  validates :user, presence: true
end
