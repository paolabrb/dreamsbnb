class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    @user.save
    redirect_to user_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:photo, :nickname)
  end
end
