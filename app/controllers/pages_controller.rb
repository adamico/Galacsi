class PagesController < ApplicationController
  before_action :load_page, only: :show
  load_and_authorize_resource

  def edit; end
  def index; end
  def new; end
  def show; end

  def create
    if @page.save
      redirect_to pages_url,
                  notice: "Page '#{@page}' créée avec succès."
    else
      render :new
    end
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to pages_url,
                  notice: "Page '#{@page}' mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url,
                notice: "Page '#{@page}' détruite avec succès."
  end

  private

  def find_page
    begin
      @page = if params[:permalink]
                Page.find_by_permalink(params[:permalink])
              else
                Page.find(params[:id])
              end
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end

  def page_params
    params.require(:page).permit(:content, :permalink, :title)
  end
end
