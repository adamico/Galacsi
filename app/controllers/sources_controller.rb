class SourcesController < ApplicationController
  load_and_authorize_resource

  def index
  end
  
  def names
    @sources = Source.all(:conditions => ["name LIKE ?", "%#{params[:term]}%"])
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
