class DistinctionsController < ApplicationController
  filter_resource_access
  def index
    @distinctions = Distinction.with_permissions_to(:read)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @distinction.save
      flash[:notice] = "Successfully created distinction."
      redirect_to distinctions_url
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @distinction.update_attributes(params[:distinction])
      flash[:notice] = "Successfully updated distinction."
      redirect_to distinctions_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @distinction.destroy
    flash[:notice] = "Successfully destroyed distinction."
    redirect_to distinctions_url
  end
end
