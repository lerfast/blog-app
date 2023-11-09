class Ability
    include CanCan::Ability
    def initialize(user)
      user ||= User.new
      if user.role == 'admin'
        can :manage, :all
      else
        can :read, :all
        can [:create, :update], Post, author_id: user.id
        can [:create, :update, :destroy], Comment, user_id: user.id
      end
    end
  end
  