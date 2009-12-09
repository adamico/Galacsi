module UsersHelper
  def roles_checkbox
    roles = has_role?(:admin) ? Role.all : Role.all[1..-1]
    haml_tag :ul do
      for role in roles
        haml_tag :li do
          haml_concat(check_box_tag("user[role_ids][]", role.id, @user.roles.include?(role)))
          haml_concat(label_tag("#{role.name}"))
        end#li
      end#for
    end#ul
  end
end
