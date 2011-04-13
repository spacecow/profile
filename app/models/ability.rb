class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index,:show], Project
    can :show, Page
    can :create, User
    can [:password,:download], Paper

    if user
      if user.role?(:member)
        can :update, User, :id => user.id
        can :show, User
      end
      if user.role?(:mini_admin)
        can [:show,:index,:update], User
        can :index, Page
        can [:show,:index,:admin], Project
        can [:show,:index], Setting
      end
      if user.role? :admin
        can [:show,:index,:update,:destroy,:edit_roles,:update_roles], User
        can [:show,:index,:create,:update,:destroy], [Project,Page]
        can :admin, Project
        can [:destroy], [Paper, Picture]
        can [:show,:index,:new,:create,:edit,:update,:destroy], Setting
      end
      if user.role? :god
        can :manage, :all
      end
    end
  end
end
