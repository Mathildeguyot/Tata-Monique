class UsersController < ApplicationController
  def edit
    @user = current_user
    authorize @user
    respond_to do |format|
      format.html
    end
    @habitation = @user.habitation
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    redirect_to_tasks_path
  end

  def user_params
    params.require(:user).permit(:health, :habitation, :professional_situation, :familial_situation, :usertasks, :usersubtasks, :first_name, :last_name, :phone_number, :birth_date, :ID_number, :nationality, :birth_location, :mail, :password, :username)
  end

end
