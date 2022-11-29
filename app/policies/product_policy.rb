class ProductPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def show?
    false
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
