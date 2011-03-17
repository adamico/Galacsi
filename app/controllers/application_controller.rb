# encoding: utf-8
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :find_expired_fiches
  before_filter :find_pages
  before_filter :find_dcis_with_recent_fiches

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Vous n'êtes pas authorisé à voir cette page, veuillez vous connecter!"
    flash[:error] = exception.message
    redirect_to new_user_session_path
  end

  private

  def find_expired_fiches
    @expired_fiches = Fiche.expired
  end

  def find_pages
    @pages_without_home = Page.without_home
  end

  def find_dcis_with_recent_fiches
    @dcis_with_recent_fiches = Dci.with_recent_fiches
  end
end
