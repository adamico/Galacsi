class DecisionsController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def index; end
  def new; end
  def show; end

  def create
    if @decision.save
      redirect_to decisions_url,
                  notice: "Décision '#{@decision}' créee avec succès."
    else
      render :new
    end
  end

  def update
    if @decision.update_attributes(decision_params)
      redirect_to decisions_url,
                  notice: "Décision '#{@decision}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @decision.destroy
    redirect_to decisions_url,
                notice: "Décision '#{@decision}' détruite avec succès."
  end

  def decision_params
    params.require(:decision).permit(:name, :abbr, :description)
  end
end
