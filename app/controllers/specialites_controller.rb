class SpecialitesController < ApplicationController
  filter_resource_access
  def index
    @specialites = Specialite.with_permissions_to(:read)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @specialite.save
      flash[:notice] = "Successfully created specialite."
      redirect_to @specialite
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @specialite.update_attributes(params[:specialite])
      flash[:notice] = "Successfully updated specialite."
      redirect_to @specialite
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @specialite.destroy
    flash[:notice] = "Successfully destroyed specialite."
    redirect_to specialites_url
  end
end
