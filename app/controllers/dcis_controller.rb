class DcisController < ApplicationController

  load_and_authorize_resource

  def index
    @search = Dci.includes(:classe_therapeutiques, :specialites, :fiches => [:distinction, :user]).search(params[:search])
    @dcis = @search.all
  end

  def stripped_names
    @thedcis = Dci.where(:stripped_name =~ "%#{params[:term]}%")
    @thedcis.reject! { |dci| dci.fiches.valide.empty? } unless current_user
  end

  #FIXME: inutile l'azione search per il controller dcis
  def search
    params[:search] ||= {}
    @search = Dci.search(params[:search])
    @dcis = @search.all.uniq
  end
  
  def show
    # @dci is loaded in before_filter
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
