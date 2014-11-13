class UsersController < ApplicationController
  def edit
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to goals_path, notice: 'Thanks for signing up for text reminders'
    else
      notice: 'that is not valid input'
      render :edit
    end
  end

  private

  def user_params
    require(:user).permit(:phone_number)
  end
end
