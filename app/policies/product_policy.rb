class ProductPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def update?
    user.admin? || !post.published?
  end

  def destroy?
    user.admin?
  end
end