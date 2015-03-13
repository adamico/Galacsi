class FichesController < ApplicationController
  before_filter :find_fiches, :only => [:index, :search]
  before_filter :find_dci, :only => [:new, :create]
  load_and_authorize_resource :fiche

  def index
    respond_to do |format|
      format.html
      format.csv { render csv: @fiches }
    end
  end

  def search
    @q = Fiche.ransack(params[:q])
    @fiches = @q.result.includes(:distinction, :dci)
  end

  def show
    @dci = @fiche.dci
  end

  def new
    # @dci is loaded in before_filter
    @fiche = @dci.fiches.build
  end

  def create
    # @dci is loaded in before_filter
    @fiche = @dci.fiches.build(params[:fiche])
    @fiche.user = current_user
    if @fiche.save
      flash[:notice] = "La fiche a été créée."
      redirect_to @fiche.dci
    else
      render :action => 'new'
    end
  end

  def edit
    # @fiche is loaded in before_filter with load_and_authorize_resource :fiche
    @dci = @fiche.dci
  end

  def update
    # @fiche is loaded in before_filter with load_and_authorize_resource :fiche
    @dci = @fiche.dci
    if @fiche.update_attributes(params[:fiche])
      flash[:notice] = "La fiche a été modifiée."
      redirect_to @fiche.dci
    else
      render :action => 'edit'
    end
  end

  def destroy
    # @fiche is loaded in before_filter with load_and_authorize_resource :fiche
    @fiche.destroy
    flash[:notice] = "La fiche a été détruite."
    redirect_to dci_url(@fiche.dci)
  end

  private

  def find_fiches
    @q = Fiche.ransack(params[:q])
    @fiches = @q.result.includes(:distinction, :user, :dci)
  end

  def find_dci
    @dci = Dci.find(params[:dci_id])
  end
end
