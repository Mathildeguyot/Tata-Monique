class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  def index
    @tasks = policy_scope(Task)
    @user = current_user
    @tasks = @user.tasks
    @active_task = @tasks.select { |task| !Usertask.find_by(user: current_user, task: task).done }.first

    # @subtasks = Subtask.all
  end

  # def show
  #   @subtasks = Subtask.all
  # end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :organization)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
