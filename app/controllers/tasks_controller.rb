class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  def index
    @tasks = Task.all
    @subtasks = Subtask.all
  end

  def show
    @subtask.task = @task
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :organization)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
