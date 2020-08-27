class Task < ApplicationRecord
  has_many :subtasks
  has_many :usertasks
  has_many :users, through: :usertasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :organization, presence: true

  def next_is_done?
    tasks = Task.all
    task_index = tasks.index(self)
    next_task = tasks[task_index + 1]
    next_task.done if next_task
  end
end
