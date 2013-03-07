#encoding: utf-8
class ClasseTherapeutiquesController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  def index
    @classe_therapeutiques = ClasseTherapeutique.includes(:classifications).order(sort_column + " " + sort_direction).page(params[:page])
  end

  def show
  end

  def new
    @classe_therapeutique = ClasseTherapeutique.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    respond_to do |format|
      if @classe_therapeutique.save
        format.html { redirect_to classe_therapeutiques_url,
                      notice: "Successfully created classe therapeutique." }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @classe_therapeutique.update_attributes(params[:classe_therapeutique])
        format.html { redirect_to(@classe_therapeutique, notice: "Classe therapeutique: #{@classe_therapeutique.name} mise à jour.") }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @classe_therapeutique.destroy
    respond_to do |format|
      format.html {redirect_to classe_therapeutiques_url,
        notice: "Successfully destroyed classe therapeutique."}
      format.js
    end
  end

  private

  def sort_column
    ClasseTherapeutique.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
