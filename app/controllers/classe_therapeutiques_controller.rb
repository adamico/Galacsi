class ClasseTherapeutiquesController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def new; end
  def show; end

  def index
    @classe_therapeutiques = @classe_therapeutiques.by_name
  end

  def create
    if @classe_therapeutique.save
      redirect_to classe_therapeutiques_url,
                  notice: "Classe therapeutique créée avec succès."
    else
      render :new
    end
  end

  def update
    if @classe_therapeutique.update_attributes(classe_therapeutique_params)
      redirect_to classe_therapeutiques_url,
                  notice: "Classe therapeutique mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @classe_therapeutique.destroy
    redirect_to classe_therapeutiques_url,
                notice: "Classe therapeutique détruite avec succès."
  end

  def classe_therapeutique_params
    params.require(:classe_therapeutique).permit(:name)
  end
end
