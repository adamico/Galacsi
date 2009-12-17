# encoding:utf-8
class ProduitsController < ApplicationController
  filter_resource_access
  filter_resource_access :additional_collection => { :search => :index }
  #TODO créer une action pour montrer la liste des molécules non vérifiées depuis une certaine date

  def initialiser
    @produit.initialiser!
    flash[:notice] = "Le produit a été initialisé."
    redirect_to @produit
  end

  def valider
    @produit.valider!
    @produit.update_attribute :validation_date, Time.now.to_date
    flash[:notice] = "Le produit a été validé."
    redirect_to @produit
  end

  def invalider
    @produit.invalider!
    flash[:notice] = "Le produit a été mis en attente."
    redirect_to @produit
  end

  def maj_date
    @produit.update_attribute :validation_date, Time.now.to_date
    flash[:notice] = "La date de validation a été mise à jour avec succès."
    redirect_to @produit
  end

  def index
    @search = Produit.with_permissions_to(:read).search(params[:search])
    @produits = @search.all
  end
  
  def search
    @search = Produit.with_permissions_to(:read).search(params[:search])
    @produits = @search.all
  end


  def show
  end
  
  def new
  end
  
  def create
    if @produit.save
      flash[:notice] = "Le produit a été créé."
      redirect_to @produit
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @produit.update_attributes(params[:produit])
      flash[:notice] = "Le produit a été mis à jour."
      redirect_to @produit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @produit.destroy
    flash[:notice] = "Le produit a été détruit."
    redirect_to produits_url
  end
end
