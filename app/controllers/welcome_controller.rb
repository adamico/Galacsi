class WelcomeController < ApplicationController
  def index
    @expired_fiches = Fiche.expired
  end

  def search
    params[:search] ||= {}
  end

  def admin
  end

end
