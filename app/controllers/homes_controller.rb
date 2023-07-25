class HomesController < ApplicationController
  def top
  end
  def complete
    @products = current_user.cart.products
    @products.destroy_all
  end
end
