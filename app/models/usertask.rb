class Usertask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :done, default: false

  def next_is_done?
      tasks = Task.all
      task_index = tasks.index(self.task)
      next_task = tasks[task_index + 1]
      self.done if next_task
  end
end
