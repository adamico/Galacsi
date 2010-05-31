class DistinctionsController < ApplicationController
  load_and_authorize_resource
  def index
    @distinctions = Distinction.all
  end
  
  def show
  end
  
  def new
    @distinction = Distinction.new
  end
  
  def create
    @distinction = Distinction.new(params[:distinction])
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
