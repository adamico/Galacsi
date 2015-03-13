class FichesController < ApplicationController
  before_filter :find_fiches, only: [:index, :search]
  before_filter :find_dci, only: [:new, :create]
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.csv { render csv: @fiches }
    end
  end

  def search
  end

  def show
    @dci = @fiche.dci
  end

  def new
    @fiche = @dci.fiches.build
  end

  def create
    @fiche = @dci.fiches.build(params[:fiche])
    @fiche.user = current_user
    if @fiche.save
      flash[:notice] = "La fiche a été créée."
      redirect_to @fiche.dci
    else
      render :new
    end
  end

  def edit
    @dci = @fiche.dci
  end

  def update
    @dci = @fiche.dci
    if @fiche.update_attributes(params[:fiche])
      flash[:notice] = "La fiche a été modifiée."
      redirect_to @fiche.dci
    else
      render :edit
    end
  end

  def destroy
    @fiche.destroy
    flash[:notice] = "La fiche a été détruite."
    redirect_to dci_url(@fiche.dci)
  end

  private

  def find_fiches
    @q = Fiche.ransack(params[:q])
    @fiches = @q.result.with_distinction_and_dci
  end

  def find_dci
    @dci = Dci.find(params[:dci_id])
  end
end
