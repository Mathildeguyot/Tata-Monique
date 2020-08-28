class UsersubtasksController < ApplicationController
  before_action :set_usersubtask

  def update
    authorize @usersubtask
    document = Document.new(usersubtask_params[:document])
    document.user = @usersubtask.user
    # document.name = @usersubtask.subtask(:document_type)
    # document.category = @usersubtask.subtask(:document_type)
    if document.save!

      @usersubtask.done = true
      @usersubtask.save


      redirect_to task_subtasks_path(@usersubtask.subtask.task)

    end
  end

  private

  def set_usersubtask
    @usersubtask = Usersubtask.find(params[:id])
  end

  def usersubtask_params
    params.require(:usersubtask).permit(document: [:category, :name, :ref, :photo])
  end
end
