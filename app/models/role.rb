class Role < ActiveRecord::Base

  attr_accessible :role_id, :project_id, :user_id

  belongs_to :user
  belongs_to :project

  ROLES = {1 => 'Customer', 2 => 'Project Manager', 3 => 'Tester', 4 => 'Developer'}

  # Print role name for a role object
  def print_role
    ROLES[self.role_id]
  end

end