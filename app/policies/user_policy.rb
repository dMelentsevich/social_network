class UserPolicy < BasePolicy
  def edit?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin? || record.id == user.id
  end
end
