class ProduitsController < ApplicationController
  filter_resource_access

  filter_resource_access :additional_collection =>  [:nonvalidated, :index],
      :additional_member => {:validate => :update}

  def validate
    #@produit = Produit.find(params[:id])
    @produit.update_attribute :validation, 1
    flash[:notice] = "Successfully validated produit."
    redirect_to nonvalidated_produits_path
  end

  def nonvalidated
    @produits = Produit.all(:conditions => "validation = 0")
  end

  def index
    @produits = Produit.all(:conditions => "validation = 1")
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @produit.save
      flash[:notice] = "Successfully created produit."
      redirect_to @produit
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @produit.update_attributes(params[:produit])
      flash[:notice] = "Successfully updated produit."
      redirect_to @produit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @produit.destroy
    flash[:notice] = "Successfully destroyed produit."
    redirect_to produits_url
  end
end
