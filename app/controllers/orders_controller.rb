class OrdersController < ApplicationController
  before_action :set_order, only: %i[index create edit update set_product_order]
  before_action :set_product_order, only: %i[create]
  before_action :order_params, only: %i[update]

  def index
    @products = @order.products
    render 'order'
  end

  def create
    check_balance
    return if @amount.zero?

    @product_order&.update(amount: @amount)
    @order.product_orders.create(product_id: params[:product_id], amount: @amount).save if @product_order.nil?

    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Item is added to cart' }
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        sub_balance
        @order.destroy
        format.html { redirect_to products_path, notice: 'Order was successfully created.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    redirect_to products_path
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :address, :phone)
  end

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

    @amount = [total_amount, product.balance].min
  end

  def sub_balance
    @order.products.each do |product|
      new_balance = product.balance - @order.product_orders.find_by(product_id: product.id).amount
      product.update(balance: new_balance)
    end
  end
end
