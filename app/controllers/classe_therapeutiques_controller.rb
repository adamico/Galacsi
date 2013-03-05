#encoding: utf-8
class ClasseTherapeutiquesController < ApplicationController

  load_and_authorize_resource

  def index
    @classe_therapeutiques = ClasseTherapeutique.includes(:classifications).page(params[:page])
  end

  def stripped_names
    @theclasses = ClasseTherapeutique.where(:stripped_name =~ "%#{params[:term]}%")
    @theclasses.reject! { |ct| ct.classifications.empty?}
    @theclasses.reject! { |ct| ct.dcis.with_valid_fiches.empty?} unless current_user
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
end
