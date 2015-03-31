class SpecialitesController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def new; end
  def show; end

  def index
    @specialites = @specialites.by_name
    respond_to do |format|
      format.html
      format.json do
        specialites = @specialites.with_name(params[:q])
        render json: specialites.map(&:id_and_name)
      end
    end
  end

  def create
    if @specialite.save
      redirect_to specialites_url,
                  notice: "Spécialité '#{@specialite}' créée avec succès."
    else
      render :new
    end
  end

  def update
    if @specialite.update_attributes(specialite_params)
      redirect_to specialites_url,
                  notice: "Spécialité '#{@specialite}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @specialite.destroy
    redirect_to specialites_url,
                notice: "Spécialité '#{@specialite}' mise à jour avec succès."
  end

  private

  def specialite_params
    params.require(:specialite).permit(:name)
  end
end
