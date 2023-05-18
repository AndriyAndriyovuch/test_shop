class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: %i[destroy]

  def destroy
    @product_order.destroy
    redirect_to orders_path
  end

  private

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end
end
