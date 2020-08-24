class Document < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Familial", "Professional", "Health", "Habitation"]

  validates :category, presence: true
  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not included in the list" }
end
