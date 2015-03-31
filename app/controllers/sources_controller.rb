class SourcesController < ApplicationController
  load_and_authorize_resource

  def edit; end
  def new; end
  def show; end

  def index
    @sources = @sources.by_name
    respond_to do |format|
      format.html
      format.json do
        sources = @sources.with_name(params[:q])
        render json: sources.map(&:id_and_name)
      end
    end
  end

  def create
    if @source.save
      redirect_to sources_url,
                  notice: "Source '#{@source}' créée avec succès."
    else
      render :new
    end
  end

  def update
    if @source.update_attributes(source_params)
      redirect_to sources_url,
                  notice: "Source '#{@source}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @source.destroy
    redirect_to sources_url,
                notice: "Source '#{@source}' détruite avec succès."
  end

  private

  def source_params
    params.require(:source).permit(:name, :nature, :url)
  end
end
