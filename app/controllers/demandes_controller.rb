#encoding: utf-8
class DemandesController < ApplicationController
  def index
    @demandes = Demande.all
  end
  
  def show
    @demande = Demande.find(params[:id])
  end
  
  def new
    @demande = Demande.new
  end
  
  def create
    @demande = Demande.new(params[:demande])
    if @demande.save
      flash[:notice] = "La demande a été enregistrée."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @demande = Demande.find(params[:id])
  end
  
  def update
    @demande = Demande.find(params[:id])
    if @demande.update_attributes(params[:demande])
      flash[:notice] = "Successfully updated demande."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @demande = Demande.find(params[:id])
    @demande.destroy
    flash[:notice] = "Successfully destroyed demande."
    redirect_to root_path
  end
end
