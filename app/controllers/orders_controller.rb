class OrdersController < ApplicationController
  before_action :check_order, only: %i[create]
  def index
    @products = Order.find_by(user_id: session.id.to_s).products
    render 'products/index'
  end

  def create
    @order.product_orders.create(product_id: params[:product_id]).save

    redirect_to products_path
  end


  private

  def check_order
    @order = Order.find_by(user_id: session.id.to_s)

    return Order.create(user_id: session.id) if @order.nil?
    @order
  end
end
