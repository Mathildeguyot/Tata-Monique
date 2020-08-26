class Subtask < ApplicationRecord
  belongs_to :task
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
end
