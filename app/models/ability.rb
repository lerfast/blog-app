# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # usuario invitado (no logueado)
    
    if user.role == 'admin'
      can :manage, :all # El admin puede hacer todo
    else
      can :read, :all # Todos los usuarios pueden leer cualquier cosa
      can [:create, :update, :destroy], Post, author_id: user.id
      can [:create, :update, :destroy], Comment, user_id: user.id
      # Los usuarios pueden crear, actualizar y eliminar sus propios posts y comentarios
    end
  end
end
