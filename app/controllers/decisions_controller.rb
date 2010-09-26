class DecisionsController < ApplicationController
  load_and_authorize_resource :decision
  def index
    @decisions = Decision.all
  end
  
  def show
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
  end
  
  def update
    if @decision.update_attributes(params[:decision])
      flash[:notice] = "Successfully updated decision."
      redirect_to @decision
    elsegit@heroku.com:galacsi.git
      render :action => 'edit'
    end
  end
  
  def destroy
    @decision.destroy
    flash[:notice] = "Successfully destroyed decision."
    redirect_to decisions_url
  end
end
