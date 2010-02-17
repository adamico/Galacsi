class DecisionsController < ApplicationController
  def index
    @decisions = Decision.all
  end
  
  def show
    @decision = Decision.find(params[:id])
  end
  
  def new
    @decision = Decision.new
  end
  
  def create
    @decision = Decision.new(params[:decision])
    if @decision.save
      flash[:notice] = "Successfully created decision."
      redirect_to @decision
    else
      render :action => 'new'
    end
  end
  
  def edit
    @decision = Decision.find(params[:id])
  end
  
  def update
    @decision = Decision.find(params[:id])
    if @decision.update_attributes(params[:decision])
      flash[:notice] = "Successfully updated decision."
      redirect_to @decision
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @decision = Decision.find(params[:id])
    @decision.destroy
    flash[:notice] = "Successfully destroyed decision."
    redirect_to decisions_url
  end
end
