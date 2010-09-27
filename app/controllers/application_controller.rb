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
end
