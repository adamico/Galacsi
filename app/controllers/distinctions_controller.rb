class DistinctionsController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def index; end
  def new; end
  def show; end

  def create
    if @distinction.save
      redirect_to distinctions_url,
                  notice: "Distinction '#{@distinction}' créée avec succès."
    else
      render :new
    end
  end

  def update
    if @distinction.update_attributes(distinction_params)
      redirect_to distinctions_url,
                  notice: "Distinction '#{@distinction}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @distinction.destroy
    redirect_to distinctions_url,
                notice: "Distinction '#{@distinction}' détruite avec succès."
  end

  private

  def distinction_params
    params.require(:distinction).permit(:name)
  end
end
