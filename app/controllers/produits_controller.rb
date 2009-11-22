class ProduitsController < ApplicationController
  def index
    @produits = Produit.all
  end
  
  def show
    @produit = Produit.find(params[:id])
  end
  
  def new
    @produit = Produit.new
  end
  
  def create
    @produit = Produit.new(params[:produit])
    if @produit.save
      flash[:notice] = "Successfully created produit."
      redirect_to @produit
    else
      render :action => 'new'
    end
  end
  
  def edit
    @produit = Produit.find(params[:id])
  end
  
  def update
    @produit = Produit.find(params[:id])
    if @produit.update_attributes(params[:produit])
      flash[:notice] = "Successfully updated produit."
      redirect_to @produit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @produit = Produit.find(params[:id])
    @produit.destroy
    flash[:notice] = "Successfully destroyed produit."
    redirect_to produits_url
  end
end
