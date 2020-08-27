class Subtask < ApplicationRecord
  belongs_to :task
  has_many :usersubtasks
  has_many :users, through: :usersubtasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
end
