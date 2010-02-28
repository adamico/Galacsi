class ClasseTherapeutiquesController < ApplicationController
  def index
    @classe_therapeutiques = ClasseTherapeutique.all
  end
  
  def show
    @classe_therapeutique = ClasseTherapeutique.find(params[:id])
  end
  
  def new
    @classe_therapeutique = ClasseTherapeutique.new
  end
  
  def create
    @classe_therapeutique = ClasseTherapeutique.new(params[:classe_therapeutique])
    if @classe_therapeutique.save
      flash[:notice] = "Successfully created classe therapeutique."
      redirect_to @classe_therapeutique
    else
      render :action => 'new'
    end
  end
  
  def edit
    @classe_therapeutique = ClasseTherapeutique.find(params[:id])
  end
  
  def update
    @classe_therapeutique = ClasseTherapeutique.find(params[:id])
    if @classe_therapeutique.update_attributes(params[:classe_therapeutique])
      flash[:notice] = "Successfully updated classe therapeutique."
      redirect_to @classe_therapeutique
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @classe_therapeutique = ClasseTherapeutique.find(params[:id])
    @classe_therapeutique.destroy
    flash[:notice] = "Successfully destroyed classe therapeutique."
    redirect_to classe_therapeutiques_url
  end
end
