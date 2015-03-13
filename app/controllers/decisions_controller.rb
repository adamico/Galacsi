class DecisionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @decision.save
      flash[:notice] = "Successfully created decision."
      redirect_to @decision
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @decision.update_attributes(params[:decision])
      flash[:notice] = "Successfully updated decision."
      redirect_to @decision
    else
      render :edit
    end
  end

  def destroy
    @decision.destroy
    flash[:notice] = "Successfully destroyed decision."
    redirect_to decisions_url
  end
end
