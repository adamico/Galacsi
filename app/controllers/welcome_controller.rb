class WelcomeController < ApplicationController
  def index
    @expired_fiches = Fiche.expired
  end

  def search
    params[:search] ||= {}
  end

  def admin
  end

  def about
  end

end
