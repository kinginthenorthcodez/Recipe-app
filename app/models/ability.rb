class Ability
  # Add in CanCan's ability definition DSL
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, Inventory
    return unless user.present? # additional permissions for logged in users

    can :manage, Inventory, user:
  end
end
