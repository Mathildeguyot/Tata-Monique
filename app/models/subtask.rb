class Subtask < ApplicationRecord
  belongs_to :task
  has_many :usersubtasks
  has_many :users, through: :usersubtasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  def next_is_done?
    subtasks = Subtask.all
    subtask_index = subtasks.index(self)
    next_subtask = subtasks[subtask_index + 1]
    next_subtask.done if next_subtask
  end
end
