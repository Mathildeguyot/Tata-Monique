require 'json'
require 'open-uri'
# URL = 'http://localhost:3000/api/v1/users/1/usersubtasks/4'


class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  def index

    @user = current_user

    url = "http://localhost:3000/api/v1/users/#{@user.id}/usersubtasks/#{Usersubtask.all.order(:id)[3].id}"

    usersubtask_serialized = open(url).read
    usersubtask = Usersubtask.find(Usersubtask.all.order(:id)[3].id)
    usersubtask.done = JSON.parse(usersubtask_serialized)["done"]
    usersubtask.subtask.task.usertasks.first.update(done: usersubtask.done)
    @tasks = policy_scope(Task)

    @tasks = @user.tasks.order(:id)
    @active_task = @tasks.select { |task| !Usertask.find_by(user: current_user, task: task).done }.first

    # @subtasks = Subtask.all
  end

  # def show
  #   @subtasks = Subtask.all
  # end

  def fetch_tasks
    authorize Task.first
    @category = params[:category]
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: 'list_change', formats: :html, locals: { category: @category }) } }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :organization)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end


