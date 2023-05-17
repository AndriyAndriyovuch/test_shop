class OrdersController < ApplicationController
  before_action :set_order, only: %i[index create set_product_order]
  before_action :set_product_order, only: %i[create]

  def index
    @products = @order.products

    render 'orders/cart'
  end

  def create
    @product_order.update(amount: (@product_order.amount + params[:amount].to_i)) if @product_order.present?
    @order.product_orders.create(product_id: params[:product_id], amount: params[:amount]).save if @product_order.nil?

    redirect_to products_path
  end

  def destroy
    Order.find(params[:id]).destroy

    redirect_to products_path
  end

  private

  def set_order
    current_order = Order.find_by(user_id: session.id.to_s)
    @order = current_order.nil? ? Order.create(user_id: session.id.to_s) : current_order
  end

  def set_product_order
    @product_order = @order.product_orders.find_by(product_id: params[:product_id])
  end
end
