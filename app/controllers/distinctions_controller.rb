class DistinctionsController < ApplicationController
  def index
    @distinctions = Distinction.all
  end
  
  def show
    @distinction = Distinction.find(params[:id])
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
    @distinction = Distinction.find(params[:id])
  end
  
  def update
    @distinction = Distinction.find(params[:id])
    if @distinction.update_attributes(params[:distinction])
      flash[:notice] = "Successfully updated distinction."
      redirect_to distinctions_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @distinction = Distinction.find(params[:id])
    @distinction.destroy
    flash[:notice] = "Successfully destroyed distinction."
    redirect_to distinctions_url
  end
end
