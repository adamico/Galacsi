#encoding: utf-8
class DemandesController < ApplicationController
  load_and_authorize_resource

  def index
    @demandes = Demande.all
  end
  
  def show
  end
  
  def new
    @demande = Demande.new
  end
  
  def create
    @demande = Demande.new(params[:demande])
    if verify_recaptcha(
      :model => @demande,
      :message => "Veuillez recopier les 2 mots dans le champ de vérification") && @demande.save
    #if @demande.save
      flash[:notice] = "La demande a été enregistrée."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @demande.update_attributes(params[:demande])
      flash[:notice] = "Successfully updated demande."
      redirect_to demandes_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @demande.destroy
    flash[:notice] = "Successfully destroyed demande."
    redirect_to demandes_path
  end
end
