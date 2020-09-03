class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show]

  def index
    @users = policy_scope(User)
  end

  def show
    # response.headers["Access-Control-Allow-Origin"] = "*"
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
