#encoding: utf-8
class SpecialitesController < ApplicationController
  load_and_authorize_resource

  def index
    @specialites = Specialite.includes(:dcis).order(:slug).page(params[:page])
    respond_to do |format|
      format.html
      format.js
      format.json do
        @specialites = Specialite.with_slug(params[:q])
        @specialites.reject! { |sp| sp.dcis.with_valid_fiches.empty? } unless current_user
        render json: @specialites.map(&:name_and_name)
      end
    end
  end

  def show
  end

  def new
  end

  def create
    if @specialite.save
      redirect_to specialites_path, notice: "Spécialité créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @specialite.update_attributes(params[:specialite])
        format.html {redirect_to specialites_path, notice: "Spécialité: #{@specialite.name} mise à jour."}
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

  def destroy
    @specialite.destroy
    respond_to do |format|
      format.html {redirect_to specialites_url, notice: "Spécialité détruite avec succès."}
      format.js
    end
  end
end
