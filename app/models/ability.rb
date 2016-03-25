class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
      when 'moderator'
        can :manage, Order
        can :manage, Review
        can :manage, Question
        can :read, ActiveAdmin::Page, :name => "Dashboard"
      when 'admin'
        can :manage, :all

    end
  end
end