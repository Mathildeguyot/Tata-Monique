class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_user, only: [:show, :update]

  def index
    @users = policy_scope(User)
  end

  def show
    # response.headers["Access-Control-Allow-Origin"] = "*"
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:health, :habitation, :professional_situation, :familial_situation, :usertasks, :usersubtasks, :first_name, :last_name, :phone_number, :birth_date, :ID_number, :nationality, :birth_location, :mail, :password, :username)
  end

  def render_error
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
end
