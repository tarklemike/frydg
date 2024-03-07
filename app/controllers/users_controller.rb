class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @recipes = Recipe.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :postcode, :image, :username)
  end
end
