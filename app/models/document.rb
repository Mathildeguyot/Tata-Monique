class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  CATEGORIES = ["La mif", "Le boulot", "La santé", "La casa"]

  validates :category, presence: true
  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not included in the list" }
end
