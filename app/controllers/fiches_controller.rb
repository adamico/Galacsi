# encoding: utf-8
class FichesController < ApplicationController

  load_and_authorize_resource :fiche

  def index
    @search = Fiche.search(params[:search])
    @fiches = @search.all(:include => [:distinction, :user, :dci])
    respond_to do |format|
      format.html
      format.csv { render :csv => @fiches}
    end
  end

  def search
    @search = Fiche.search(params[:search])
    @fiches = @search.all(:include => [:distinction, :dci])
    @fiches.reject! { |fiche| fiche.state != "valide" } unless current_user
  end

  def show
    @dci = @fiche.dci
  end

  def new
    @dci = Dci.find(params[:dci_id])
    @fiche = @dci.fiches.build
  end
  
  def create
    @dci = Dci.find(params[:dci_id])
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
    @fiche = Fiche.find(params[:id])
    @dci = @fiche.dci
  end
  
  def update
    @fiche = Fiche.find(params[:id])
    if @fiche.update_attributes(params[:fiche])
      flash[:notice] = "La fiche a été modifiée."
      redirect_to @fiche.dci
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @fiche = Fiche.find(params[:id])
    @fiche.destroy
    flash[:notice] = "La fiche a été détruite."
    redirect_to dci_url(@fiche.dci)
  end
  
end
