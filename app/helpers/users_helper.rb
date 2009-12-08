module UsersHelper
  #TODO refactor roles_checkbox helper method to haml
  def roles_checkbox
    roles = has_role?(:admin) ? Role.all : Role.all[1..-1]
    html = "<ul>"
    for role in roles
      html << '<li>'
      html << check_box_tag("user[role_ids][]", role.id, @user.roles.include?(role))
      html << label_tag("#{role.name}")
      html << '</li>'
    end
    html << "</ul>"
    html
  end
end
