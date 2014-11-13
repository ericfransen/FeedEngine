class UsersController < ApplicationController

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to goals_path, notice: 'Thanks for signing up for text reminders'
    else
      render :edit
    end
  end

  private

  def user_params
    require(:user).permit(:phone_number)
  end
end
