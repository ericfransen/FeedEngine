class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  private

  def user_params
    the_params = params.require(:user).permit(:phone_number, :time_to_text)
    the_params[:time_to_text] = (the_params[:time_to_text].to_i + 12).to_s
    the_params
  end
end
