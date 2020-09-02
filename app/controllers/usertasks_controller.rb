class UsertasksController < ApplicationController
  before_action :set_usertask
  def update
    authorize @usertask
    @usertask.user = current_user

    if @usertask.save
      @usertask.done = true
      # @usertask.task.subtasks.last.usersubtasks.first.done = true
      @usertask.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def set_usertask
    @usertask = Usertask.find(params[:id])
  end
end
