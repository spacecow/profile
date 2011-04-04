class Ability
  include CanCan::Ability

  def initialize(user)
    can [:show,:index], Project
    can :show, Page
    can :create, User

    if user
      if user.role?(:member)
        can :update, User, :id => user.id
        can :show, User
      end
      if user.role?(:mini_admin)
        can [:show,:index,:update], User
        can :index, [Project,Page]
      end
      if user.role? :admin
        can [:show,:index,:update,:destroy,:edit_roles,:update_roles], User
        can [:show,:index,:create,:update,:destroy], [Project,Page]
      end
      if user.role? :god
        can :manage, :all
      end
    end
  end
end
