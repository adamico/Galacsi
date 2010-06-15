# encoding: utf-8
class FichesController < ApplicationController

  load_and_authorize_resource :nested => :dci

  def index
    @search = Fiche.includes(:distinction, :user, :dci).search(params[:search])
    @fiches = @search.all
  end

  def initialiser
    @fiche.initialiser!
    flash[:notice] = "La fiche a été initialisée."
    redirect_to @fiche.dci
  end

  def valider
    @fiche.valider!
    @fiche.update_attribute :validation_date, Time.now.to_date
    flash[:notice] = "La fiche a été validée."
    redirect_to @fiche.dci
  end

  def invalider
    @fiche.invalider!
    flash[:notice] = "La fiche a été mise en attente."
    redirect_to @fiche.dci
  end

  def maj_date
    @fiche.update_attribute :validation_date, Time.now.to_date
    flash[:notice] = "La date de validation a été mise à jour avec succès."
    redirect_to @fiche.dci
  end

  def show
  end
  
  def new
  end
  
  def create
    @fiche.user = current_user
    if @fiche.save
      flash[:notice] = "La fiche a été créée."
      redirect_to @fiche.dci
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @fiche.update_attributes(params[:fiche])
      flash[:notice] = "La fiche a été modifiée."
      redirect_to @fiche.dci
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @fiche.destroy
    flash[:notice] = "La fiche a été détruite."
    redirect_to @dci
  end
  
end
