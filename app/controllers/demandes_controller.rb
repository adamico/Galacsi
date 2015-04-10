class DemandesController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def index; end
  def new; end
  def show; end

  def create
    if verify_recaptcha(model: @demande,
                        message: "Veuillez recopier les 2 mots dans le champ de
                                  vérification") && @demande.save
      redirect_to root_path, notice: "La demande a été enregistrée."
    else
      render :new
    end
  end

  def update
    if @demande.update_attributes(demande_params)
      redirect_to demandes_path,
                  notice: 'Votre demande a bien été prise en compte. Nous vous
                           en remercions.'
    else
      render :edit
    end
  end

  def destroy
    @demande.destroy
    redirect_to demandes_path,
                notice: 'Demande détruite avec succès.'
  end

  def demande_params
    params.require(:demande).permit(:contexte, :demandeur, :name, :nature)
  end
end
