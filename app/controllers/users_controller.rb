class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to users_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated profile."
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "L'utilisateur a été détruit."
    redirect_to users_url
  end

  private

  def user_params
    if current_user.admin?
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :role, :username)
    else
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :username)
    end
  end
end
