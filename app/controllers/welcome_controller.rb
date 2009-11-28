class WelcomeController < ApplicationController
  def index
    params[:search] ||= {}
  end

end
