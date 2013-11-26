class Ability
  include CanCan::Ability

  # user is currently logged in user
  def initialize(user, project=nil)

    can :manage, :all if (admin = user.class == Administrator)

    # Role and Project based authentication
    if project && !admin
      if Project.find(project).role_for_user(user) == 'Project Manager'
        can :read, Project
        can :update, Project
        can :manage, ProjectManagement
        can :read, RequirementsDocument
        can :manage, UseCase
      end
    end

  end
end