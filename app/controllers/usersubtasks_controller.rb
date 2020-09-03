class UsersubtasksController < ApplicationController
  before_action :set_usersubtask

  BOULOT_DOCS = ["RIB", "fiche_paie"]
  MIF_DOCS = ["IDENTITE"]
  SANTE_DOCS = ["fiche_soin"]
  CASA_CAT = ["contrat_location", "attestation_loyer"]

  def update
    authorize @usersubtask
    # if @usersubtask.subtask == @usersubtask.subtask.task.subtasks.last
    #   @usersubtask.subtask.task.usertasks.first.update(done:true)
    #   redirect_to tasks_path
    # else
      document = Document.new(usersubtask_params[:document])
      document.user = @usersubtask.user
      # attributes document name thanks to the subtask
      document.name = @usersubtask.subtask.document_type

      # extract name of document without .extension
      document.name = document.name.scan(/.*(?=\.)/).join

      if BOULOT_DOCS.include?(document.name)
        document.category = "Le boulot"
      elsif MIF_DOCS.include?(document.name)
        document.category = "La mif"
      elsif SANTE_DOCS.include?(document.name)
        document.category = "La santé"
      else
        document.category = "La casa"
      end

      if document.save!
        @usersubtask.done = true
        @usersubtask.save
        redirect_to task_subtasks_path(@usersubtask.subtask.task)
      end

    # end
  end

  private

  def set_usersubtask
    @usersubtask = Usersubtask.find(params[:id])
  end

  def usersubtask_params
    params.require(:usersubtask).permit(document: [:photo])
  end
end
