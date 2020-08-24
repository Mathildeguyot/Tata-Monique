class Health < ApplicationRecord
  belongs_to :user

  validates :ssn, format: { with: /^[12][0-9]{2}[0-1][0-9](2[AB]|[0-9]{2})[0-9]{3}[0-9]{3}[0-9]{2}$/x, message: "format invalide" }
  validates :social_security, presence: true
  validates :health_insurance, presence: true
end
