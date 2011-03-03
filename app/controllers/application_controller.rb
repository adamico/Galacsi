# encoding: utf-8
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Vous n'êtes pas authorisé à voir cette page, veuillez vous connecter!"
    flash[:error] = exception.message
    redirect_to new_user_session_path
  end

  before_filter :find_expired_fiches
  before_filter :find_pages

  private

  def find_expired_fiches
    @expired_fiches = Fiche.expired
  end

  def find_pages
    @pages_without_home = Page.without_home
  end
end
