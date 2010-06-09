# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :prepare_dci_fiches

  private

  def fiches_non_valide?
    if session[:fiches_non_valide_param]
      session[:fiches_non_valide_param] == "1"
    end
  end
  helper_method :fiches_non_valide?

  def prepare_dci_fiches
    session[:fiches_non_valide_param] = params[:fiches_non_valide] if params[:fiches_non_valide]
  end

  protected

  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to root_url
  end
end
