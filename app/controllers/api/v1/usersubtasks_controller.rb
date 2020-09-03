class Api::V1::UsersubtasksController < Api::V1::BaseController
  before_action :set_usersubtask, only: [:show, :update]

  def show
  end

  def update
    if @usersubtask.update(usersubtasks_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_usersubtask
    @usersubtask = Usersubtask.find(params[:id])
    authorize @usersubtask

  end

  def usersubtasks_params
    params.require(:usersubtask).permit(:done)
  end

  def render_error
    render json: { errors: @usersubtask.errors.full_messages },
      status: :unprocessable_entity
  end
end
