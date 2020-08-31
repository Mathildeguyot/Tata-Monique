class Subtask < ApplicationRecord
  belongs_to :task
  has_many :usersubtasks
  has_many :users, through: :usersubtasks
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  def next_is_done?(user)
    subtasks = Subtask.all
    subtask_index = subtasks.index(self)
    next_subtask = subtasks[subtask_index + 1]
    next_subtask.done_by_user?(user) if next_subtask
  end

  def done_by_user?(user)
    self.usersubtasks.find_by(user: user).done?
  end

  def user_subtask(user)
    Usersubtask.find_by(user: user, subtask: self)
  end

  def days_from_now(day, month, year)
    # TODO: return the age expressed in days given the day, month, and year of birth
    return (Date.new(year, month, day) - Date.today).to_i
  end
end
