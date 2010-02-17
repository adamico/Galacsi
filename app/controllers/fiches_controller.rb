# encoding: utf-8
class FichesController < ApplicationController
  filter_resource_access :nested_in => :dcis

  # provided by the default filter_resource_access before_filters
  #def load_dci
  #  @dci = Dci.find(params[:dci_id])
  #end
  #
  #def load_fiche
  #  @fiche = Fiche.find(params[:id])
  #end
  #
  #def new_fiche
  #  @fiche = @dci.fiches.new(params[:fiche])
  #end
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
  
  protected
  # provided by the default filter_resource_access before_filters
  #def load_dci
  #  @dci = Dci.find(params[:dci_id])
  #end
  #
  #def load_fiche
  #  @fiche = Fiche.find(params[:id])
  #end
  #
  #def new_fiche
  #  @fiche = @dci.fiches.new(params[:fiche])
  #end
end
