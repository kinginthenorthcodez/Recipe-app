class Ability
  # Add in CanCan's ability definition DSL
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :delete, Food, user: user
    can :delete, Recipe, user: 'user'
  end
end
