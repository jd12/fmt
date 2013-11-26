module UserManagementsHelper

  # Print uniqe list of roles user has
  def print_roles_for_user(user)
    user.roles.uniq.map { |r| r.role_id }.uniq.map { |r| Role::ROLES[r] }.join(', ')
  end

end