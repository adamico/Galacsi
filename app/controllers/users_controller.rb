class UsersController < ApplicationController
  filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true

  def index
    @users = User.all
  
    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @users }
    end
  end

  def new
    @user = User.new
  end
  

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
