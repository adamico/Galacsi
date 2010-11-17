class WelcomeController < ApplicationController
  def index
    @expired_fiches = Fiche.expired
  end

  def admin
  end

  def about
  end

  def about
  end
end
