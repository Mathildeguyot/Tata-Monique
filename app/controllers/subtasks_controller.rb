class SubtasksController < ApplicationController
  before_action :set_task, only: [:index]
  def index
    @subtasks = @task.subtasks
    @active_subtask = @subtasks.select{|subtask| !Usersubtask.find_by(user:current_user, subtask:subtask).done}.first
    @just_done_subtask = @subtasks.select{|subtask| Usersubtask.find_by(user:current_user, subtask:subtask).done}.last
  end

  # def edit
  # end

  # def update
  #   @document = Document.new(params_document)
  #   @document.user = current_user
  #   if @document.save
  #     redirect_to
  #   else
  #     render :new
  #   end
  # end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
