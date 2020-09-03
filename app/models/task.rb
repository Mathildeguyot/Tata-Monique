class Task < ApplicationRecord
  has_many :subtasks
  has_many :usertasks
  has_many :users, through: :usertasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :organization, presence: true

  def next_is_done?(user)
    tasks = Task.all
    task_index = tasks.index(self)
    next_task = tasks[task_index + 1]
    next_task.done_by_user?(user) if next_task
  end

  def done_by_user?(user)
    self.usertasks.find_by(user: user).done?
  end

  def user_task(user)
    Usertask.find_by(user: user, task: self)
  end

  def progress(user)
    total_subtasks = self.subtasks.count.to_f
    count = 0
    self.subtasks.each do |subtask|
      count += 1 if subtask.done_by_user?(user)
    end
    total_done = count.to_f
    percent = (total_done / total_subtasks)*100
  end
end
