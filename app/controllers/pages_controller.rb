class PagesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      raise ActiveRecord::RecordNotFound, "Page non trouvée" if @page.nil?
    else
      @page = Page.find(params[:id])
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page '#{@page.title}' créée avec succès."
      redirect_to @page
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page '#{@page.title}' mise à jour avec succès."
      redirect_to @page
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page '#{@page.title}' détruite avec succès."
    redirect_to pages_url
  end
end
