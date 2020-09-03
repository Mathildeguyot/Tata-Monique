require 'json'
require 'open-uri'

class SubtasksController < ApplicationController
  before_action :set_task, only: [:index]
  def index

    @user = current_user

    url = "https://tatamonique.live/api/v1/users/#{@user.id}/usersubtasks/#{Usersubtask.all.order(:id)[3].id}"

    usersubtask_serialized = open(url).read
    usersubtask = Usersubtask.find(Usersubtask.all.order(:id)[3].id)
    usersubtask.done = JSON.parse(usersubtask_serialized)["done"]

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
