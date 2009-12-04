class ProduitsController < ApplicationController
  filter_resource_access
  filter_resource_access :additional_member => { :validate => :update }

  #TODO créer une action pour montrer la liste des molécules non vérifiées depuis une certaine date

  def initialiser
    @produit.initialiser!
    flash[:notice] = "Le produit a été initialisé."
    redirect_to produits_path
  end

  def valider
    @produit.valider!
    flash[:notice] = "Le produit a été validé."
    redirect_to produits_path
  end

  def geler
    @produit.geler!
    flash[:notice] = "Le produit a été gélé."
    redirect_to produits_path
  end

  def index
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
