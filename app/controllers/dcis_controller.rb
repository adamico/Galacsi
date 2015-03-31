class DcisController < ApplicationController
  before_filter :find_classes_therapeutiques, only: [:new, :edit]
  load_and_authorize_resource

  def edit; end
  def new; end
  def show; end

  def index
    @dcis = @dcis.by_name
    respond_to do |format|
      format.html do
        @dcis = @dcis.with_classes_and_specialites
      end
      format.json do
        dcis = @dcis.with_name(params[:q])
        render json: dcis.map(&:id_and_name)
      end
    end
  end

  def create
    if @dci.save
      redirect_to @dci, notice: "DCI '#{@dci}' créée avec succès."
    else
      render :new
    end
  end

  def update
    if @dci.update_attributes(dci_params)
      redirect_to @dci, notice: "DCI '#{@dci}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @dci.destroy
    redirect_to dcis_url, notice: "DCI '#{@dci}' détruite avec succès."
  end

  private

  def find_classes_therapeutiques
    @classe_therapeutiques = ClasseTherapeutique.all
  end

  def dci_params
    params.require(:dci).permit(:classe_therapeutique_ids, :commercial_names,
                                :name)
  end
end
