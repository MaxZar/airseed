class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user_is_owner_or_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def user_is_owner_or_admin?
    record.user == user || (user.nil? ? false : user.admin?)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
