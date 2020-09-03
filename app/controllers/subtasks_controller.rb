require 'json'
require 'open-uri'
URL = 'http://localhost:3000/api/v1/users/1/usersubtasks/4'

class SubtasksController < ApplicationController
  before_action :set_task, only: [:index]
  def index

    usersubtask_serialized = open(URL).read
    usersubtask = Usersubtask.find(URL[/\A*\/[0-9]$/][1..-1])
    usersubtask.done = JSON.parse(usersubtask_serialized)

    @subtasks = policy_scope(Subtask)
    @subtasks = @task.subtasks
    respond_to do |format|
      format.html
      format.json { render json: { html: render_to_string(partial: 'subtasks_panel', formats: :html) } }
    end

    @active_subtask = @subtasks.select { |subtask| !Usersubtask.find_by(user: current_user, subtask: subtask).done }.first
    @just_done_subtask = @subtasks.select { |subtask| Usersubtask.find_by(user: current_user, subtask: subtask).done }.last
  end

  def edit
    @subtask = Usersubtask.find_by(user: current_user, subtask: subtask)
  end

  def update
    Usersubtask.find_by(user: current_user, subtask: subtask).done = false
    redirect_to task_subtasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def subtask_params
    params.require(:subtask).permit(:name, :description, :deadline, :subtask_type, :document_type)
  end
end
