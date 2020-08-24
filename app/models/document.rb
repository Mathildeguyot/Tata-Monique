class Document < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :name, presence: true

end
