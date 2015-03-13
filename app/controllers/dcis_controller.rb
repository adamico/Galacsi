class DcisController < ApplicationController
  load_and_authorize_resource

  before_filter :find_classes_therapeutiques, :only => [:new, :edit]

  def index
    @dcis = @dcis.includes(
      :classifications,
      :specialites,
      :fiches => [:distinction, :user])
    respond_to do |format|
      format.html
      format.json do
        dcis = @dcis.with_name(params[:q])
        render json: dcis.map(&:id_and_name)
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
end
