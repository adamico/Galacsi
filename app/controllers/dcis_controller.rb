class DcisController < ApplicationController

  load_and_authorize_resource

  def index
    params[:search] ||= {}
    @dcis = Dci.all
  end
  
  def search
    params[:search] ||= {}
    @search = Dci.search(params[:search])
    @dcis = @search.all.uniq
  end
  
  def show
    # @dci is loaded in before_filter
    if fiches_non_valide? && !@dci.fiches.non_valide.empty?
      @fiches = @dci.fiches.non_valide
    else
      @fiches = @dci.fiches.valide
    end
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
end
