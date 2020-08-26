class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @subtasks = Subtask.all
  end
end
