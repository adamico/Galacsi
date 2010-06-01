# encoding: utf-8
# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def user_navlinks
    haml_tag :div, {:id => "user_nav"} do
      if current_user
        haml_tag :p do
          haml_concat("Bonjour, ")
          haml_tag :b do
            haml_concat(current_user.username)
          end
          haml_concat("(#{current_user.role})") if current_user.role == "admin"
        end
        haml_tag :p do
          haml_concat(link_to "Déconnection", destroy_user_session_path)
        end
      else
        haml_tag :p do
          haml_concat(link_to "Connection", new_user_session_path)
        end
      end
    end
  end
end
