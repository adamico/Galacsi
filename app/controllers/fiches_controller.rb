class FichesController < ApplicationController
  before_filter :find_fiches, only: [:index, :search]
  before_filter :find_dci, only: [:new, :create]
  before_filter :build_fiche, only: [:new, :create]
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.csv { render csv: @fiches }
    end
  end

  def search
  end

  def show
    @dci = @fiche.dci
  end

  def new
  end

  def create
    @fiche.user = current_user
    if @fiche.save
      redirect_to @dci, notice: "La fiche a été créée avec succès."
    else
      render :new
    end
  end

  def edit
    @dci = @fiche.dci
  end

  def update
    @dci = @fiche.dci
    if @fiche.update_attributes(fiche_params)
      redirect_to dci_url(@fiche.dci),
                  notice: "La fiche a été mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @fiche.destroy
    redirect_to dci_url(@fiche.dci),
                notice: "La fiche a été détruite avec succès."
  end

  private

  def find_dci
    @dci = Dci.find(params[:dci_id])
  end

  def build_fiche
    the_params = fiche_params if params[:fiche].present?
    @fiche = @dci.fiches.build(the_params)
  end

  def find_fiches
    @q = Fiche.ransack(params[:q])
    @fiches = @q.result.with_distinction_and_dci
  end

  def fiche_params
    params.require(:fiche).permit(:alternative_names, :arg_autre, :articles,
                                  :biodisponibilite, :commentaire, :conditions,
                                  :de_choix, :decision_id, :distinction_id,
                                  :distinction_name, :dose_par_rapport_dmap,
                                  :dose_par_rapport_dp, :ei, :ei_theoriques,
                                  :has_poso_pedia, :liaison_pp,
                                  :metabolites_actifs, :passage_lait,
                                  :pic_lacte, :poso_pedia_des,
                                  :poso_pedia_dose, :published_at_event,
                                  :rapport_lp, :revalider_le,
                                  :risque_accumulation, :risque_dim_lactation,
                                  :state_event, :suivi, :surveillance, :thalf,
                                  :vol_dist)
  end
end
