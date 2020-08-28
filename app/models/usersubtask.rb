class Usersubtask < ApplicationRecord
  belongs_to :user
  belongs_to :subtask
  has_many :documents, through: :users

  def next_is_done?
    subtasks = Subtask.all
    subtask_index = subtasks.index(self)
    next_subtask = subtasks[subtask_index + 1]
    next_subtask.done if next_subtask
  end
end
