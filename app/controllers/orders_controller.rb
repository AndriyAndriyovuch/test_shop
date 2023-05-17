class OrdersController < ApplicationController
  before_action :set_order, only: %i[index create set_product_order]
  before_action :set_product_order, only: %i[create]

  def index
    @products = @order.products

    render 'orders/cart'
  end

  def create
    check_balance

    @product_order.update(amount: @amount) if @product_order
    @order.product_orders.create(product_id: params[:product_id], amount: @amount).save if @product_order.nil?

    redirect_to products_path
  end

  def destroy
    @order = Order.last

    @order.products.each do |product|
      new_balance = product.balance - @order.product_orders.find_by(product_id: product.id).amount
      product.update(balance: new_balance)
    end

    @order.destroy

    redirect_to products_path
  end

  private

  def set_order
    @order = Order.last.present? ? Order.last : Order.create
  end

  def set_product_order
    @product_order = @order.product_orders.find_by(product_id: params[:product_id])
  end

  def check_balance
    product = Product.find(params[:product_id])

    total_amount = params[:amount].to_i
    total_amount += @product_order.amount if @product_order

    @amount = total_amount <= product.balance ? total_amount : product.balance
  end
end
