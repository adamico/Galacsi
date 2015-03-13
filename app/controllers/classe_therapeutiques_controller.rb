class ClasseTherapeutiquesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @classe_therapeutique.save
      flash[:notice] = "Successfully created classe therapeutique."
      redirect_to @classe_therapeutique
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @classe_therapeutique.update_attributes(params[:classe_therapeutique])
      flash[:notice] = "Successfully updated classe therapeutique."
      redirect_to @classe_therapeutique
    else
      render :action => 'edit'
    end
  end

  def destroy
    @classe_therapeutique.destroy
    flash[:notice] = "Successfully destroyed classe therapeutique."
    redirect_to classe_therapeutiques_url
  end
end
