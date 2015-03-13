class SourcesController < ApplicationController
  load_and_authorize_resource

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

  def show
  end

  def new
  end

  def create
    if @source.save
      flash[:notice] = "Successfully created source."
      redirect_to @source
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @source.update_attributes(params[:source])
      flash[:notice] = "Successfully updated source."
      redirect_to @source
    else
      render :edit
    end
  end

  def destroy
    @source.destroy
    flash[:notice] = "Successfully destroyed source."
    redirect_to sources_url
  end
end
