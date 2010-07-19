class SpecialitesController < ApplicationController
  load_and_authorize_resource

  def index
    @specialites = Specialite.all(:include => :dcis, :order => "LOWER(name) ASC")
  end
  
  def names
    @thespecialites = Specialite.all(:conditions => ["name LIKE ?", "%#{params[:term]}%"])
    @thespecialites.reject! { |spec| spec.dcis.with_valid_fiches.empty? } unless current_user
  end

  def show
  end
  
  def new
  end
  
  def create
    if @specialite.save
      flash[:notice] = "Successfully created specialite."
      redirect_to @specialite
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @specialite.update_attributes(params[:specialite])
      flash[:notice] = "Successfully updated specialite."
      redirect_to @specialite
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @specialite.destroy
    flash[:notice] = "Successfully destroyed specialite."
    redirect_to specialites_url
  end
end
