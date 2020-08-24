class Task < ApplicationRecord
  has_many :subtasks
  validates :name, presence: true
  validates :description, presence: true
  validates :done, presence: true
  validates :deadline, presence: true
  validates :organization, presence: true, inclusion: { in: %w(CAF AMELI IMPOTS.GOUV)}
end
