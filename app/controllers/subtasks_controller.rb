class SubtasksController < ApplicationController
  before_action :set_subtask, only:  :edit

  def index
    @subtasks = Subtask.all
  end

  def edit
  end

  def update
    @subtask.update(subtask_params)
    redirect_to task_subtask_path(@subtask)
  end

  private
  def subtask_params
    params.require(:subtask).permit(:name, :description, :deadline)
  end

  def set_subtask
    @subtask = Subtask.find(params[:id])
  end
end
