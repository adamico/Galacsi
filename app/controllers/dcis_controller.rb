class DcisController < ApplicationController
  #TODO créer une action pour montrer la liste des molécules non vérifiées depuis une certaine date
  filter_resource_access
  filter_resource_access :additional_collection => {:search => :index}

  def index
    @dcis = Dci.with_permissions_to(:read)
  end
  
  def search
    @search = Dci.with_permissions_to(:read).search(params[:search])
    @dcis = @search.all
  end
  
  def show
    # @dci is loaded in before_filter
  end
  
  def new
    # @dci is created in before_filter
  end
  
  def create
    # @dci is created in before_filter
    if @dci.save
      flash[:notice] = "Successfully created dci."
      redirect_to @dci
    else
      render :action => 'new'
    end
  end
  
  def edit
    # @dci is loaded in before_filter
  end
  
  def update
    # @dci is loaded in before_filter
    if @dci.update_attributes(params[:dci])
      flash[:notice] = "Successfully updated dci."
      redirect_to @dci
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    # @dci is loaded in before_filter
    @dci.destroy
    flash[:notice] = "Successfully destroyed dci."
    redirect_to dcis_url
  end

  protected

end
