class Task < ApplicationRecord
  has_many :subtasks
  has_many :usertasks
  has_many :users, through: :usertasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :organization, presence: true


end
