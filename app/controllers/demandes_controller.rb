#encoding: utf-8
class DemandesController < ApplicationController
  filter_resource_access
  def index
    @demandes = Demande.with_permissions_to(:read)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @demande.save
      flash[:notice] = "La demande a été enregistrée."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @demande.update_attributes(params[:demande])
      flash[:notice] = "Successfully updated demande."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @demande.destroy
    flash[:notice] = "Successfully destroyed demande."
    redirect_to root_path
  end
end
