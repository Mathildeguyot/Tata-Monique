class SubtasksController < ApplicationController
  before_action :set_task, only: :index
  def index
    @subtasks = @task.subtasks
  end

  private
  def subtask_params
    params.require(:task).permit(:name, :description, :deadline)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
