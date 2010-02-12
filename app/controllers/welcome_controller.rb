class WelcomeController < ApplicationController
  def index
    params[:search] ||= {}
    @expirees = Fiche.expired
  end

end
