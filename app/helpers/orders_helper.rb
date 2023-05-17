module OrdersHelper
  def select_amount(product)
    @order.product_orders.find_by(product_id: product.id).amount
  end

  def select_sum(product)
    select_amount(product) * product.price
  end

  def total_sum
    result = 0
    @order.product_orders.map { |order| result += (order.amount * order.product.price) }

    result
  end
end
