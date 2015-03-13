class SpecialitesController < ApplicationController
  load_and_authorize_resource

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

  def show
  end

  def new
  end

  def create
    if @specialite.save
      flash[:notice] = "Spécialité '#{@specialite}' créée avec succès."
      redirect_to @specialite
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @specialite.update_attributes(params[:specialite])
      flash[:notice] = "Spécialité '#{@specialite}' mise à jour avec succès."
      redirect_to @specialite
    else
      render :edit
    end
  end

  def destroy
    @specialite.destroy
    flash[:notice] = "Spécialité '#{@specialite}' détruite avec succès."
    redirect_to specialites_url
  end
end
