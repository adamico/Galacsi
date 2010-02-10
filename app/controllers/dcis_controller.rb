class DcisController < ApplicationController
  def index
    @dcis = Dci.all
  end
  
  def show
    @dci = Dci.find(params[:id])
  end
  
  def new
    @dci = Dci.new
  end
  
  def create
    @dci = Dci.new(params[:dci])
    if @dci.save
      flash[:notice] = "Successfully created dci."
      redirect_to @dci
    else
      render :action => 'new'
    end
  end
  
  def edit
    @dci = Dci.find(params[:id])
  end
  
  def update
    @dci = Dci.find(params[:id])
    if @dci.update_attributes(params[:dci])
      flash[:notice] = "Successfully updated dci."
      redirect_to @dci
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @dci = Dci.find(params[:id])
    @dci.destroy
    flash[:notice] = "Successfully destroyed dci."
    redirect_to dcis_url
  end
end
