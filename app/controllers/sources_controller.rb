class SourcesController < ApplicationController
  filter_resource_access
  def index
    @sources = Source.with_permissions_to(:read)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @source.save
      flash[:notice] = "Successfully created source."
      redirect_to @source
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @source.update_attributes(params[:source])
      flash[:notice] = "Successfully updated source."
      redirect_to @source
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @source.destroy
    flash[:notice] = "Successfully destroyed source."
    redirect_to sources_url
  end
end
