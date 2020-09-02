class HabitationsController < ApplicationController
  def edit
    @user = current_user
    @habitation = @user.habitation
    authorize @habitation
    authorize @user
  end

  def update
    @user = current_user
    @habitation = @user.habitation
    authorize @habitation
    authorize @user
    @habitation.update(habitation_params)
    redirect_to tasks_path(@user)
  end

  def habitation_params
    params.require(:habitation).permit(:number, :street, :city, :zip_code, :category, :rent, :size, :lease_start_date, :furnished)
  end
end
