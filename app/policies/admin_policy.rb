class AdminPolicy < ApplicationPolicy

  # Only admin with full access can create another admin
  def new?
    user.full_access?
  end
  
  def destroy?
    user.full_access?
  end

  class Scope < Scope
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
