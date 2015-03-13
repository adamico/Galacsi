class DemandesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if verify_recaptcha(model: @demande, message: "Veuillez recopier les 2 mots dans le champ de vérification") && @demande.save
      flash[:notice] = "La demande a été enregistrée."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @demande.update_attributes(params[:demande])
      flash[:notice] = "Successfully updated demande."
      redirect_to demandes_path
    else
      render :edit
    end
  end

  def destroy
    @demande.destroy
    flash[:notice] = "Successfully destroyed demande."
    redirect_to demandes_path
  end
end
