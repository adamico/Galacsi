class DcisController < ApplicationController
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource

  before_filter :find_classes_therapeutiques, :only => [:new, :edit]

  def index
    respond_to do |format|
      @dcis = Dci.includes(:classifications, :specialites, fiches: [:distinction, :user]).order(sort_column + " " + sort_direction).page(params[:page])
      format.html
      format.js
      format.json do
        @dcis = Dci.includes(:classifications, :specialites, fiches: [:distinction, :user]).with_slug(params[:q])
        @dcis.reject! { |dci| dci.fiches.valide.empty? } unless current_user
        render json: @dcis.map(&:name_and_name)
      end
    end
  end

  def show
    # @dci is loaded in before_filter
  end

  def new
    @dci = Dci.new
  end

  def create
    @dci = Dci.new(params[:dci])
    if @dci.save
      flash[:notice] = "Successfully created dci."
      redirect_to @dci
    else
      render :action => 'new'
    end
  end

  def edit
    # @dci is loaded in before_filter
  end

  def update
    # @dci is loaded in before_filter
    if @dci.update_attributes(params[:dci])
      flash[:notice] = "Successfully updated dci."
      redirect_to @dci
    else
      render :action => 'edit'
    end
  end

  def destroy
    # @dci is loaded in before_filter
    @dci.destroy
    flash[:notice] = "Successfully destroyed dci."
    redirect_to dcis_url
  end

  private

  def find_classes_therapeutiques
    @classe_therapeutiques = ClasseTherapeutique.all
  end

  def sort_column
    Dci.column_names.include?(params[:sort]) ? params[:sort] : "slug"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
