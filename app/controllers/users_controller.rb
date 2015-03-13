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
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "L'utilisateur a été détruit."
    redirect_to users_url
  end
end
