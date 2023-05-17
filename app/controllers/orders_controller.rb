class OrdersController < ApplicationController
  before_action :set_order, only: %i[index create]

  def index
    @products = @order.products

    render 'products/index'
  end

  def create
    @order.product_orders.create(product_id: params[:product_id]).save

    redirect_to products_path
  end

  private

  def set_order
    current_order = Order.find_by(user_id: session.id.to_s)
    @order = current_order.nil? ? Order.create(user_id: session.id.to_s) : current_order
  end
end
