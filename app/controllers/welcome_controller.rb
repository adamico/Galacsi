class WelcomeController < ApplicationController
  def index
    params[:search] ||= {}
    @expired_fiches = Fiche.expired
  end

  def admin
  end

end
